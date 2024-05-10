<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타디움 예약 시스템</title>
<link href="/style/community/communityNoticeBoardFormStyle.css"
	rel="stylesheet">
<script src="/js/community/communityNoticeBoardFormScript.js"></script>
<script>
	function checkReserveForm() {

		var formObj = $("[name='rentStadiumForm']");

		var sessionMid = '<%= session.getAttribute("mid") %>';
		
		 if (sessionMid == null || sessionMid.trim() === "") {
				alert('로그인이 필요한 서비스입니다.');
				location.href = '/main/loginForm.do';
				return;
			}

		$.ajax({
			url : "/rentStadiumProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				
				
				if(result ==3){
					
					alert("이미 예약되어있는 시간대입니다.");
					location.href = "#";
					
					
				} 
				
				else if (result == 1) {
					alert("이미 예약한 경기장이있습니다.");
					location.href = "/stadiumRentForm.do";
					
					
				}
				
				else {
					alert("예약 성공입니다.");
					location.href = "/stadiumRentForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}

	$(document).ready(function() {
	    $("#date").datepicker({
	        dateFormat: 'yy-mm-dd',
	        showOtherMonths: true,
	        showMonthAfterYear: true,
	        changeYear: true,
	        changeMonth: true,
	        showOn: "both",
	        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	        buttonImageOnly: true,
	        buttonText: "날짜 선택",
	        yearSuffix: "년",
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        showTime: false,
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        minDate: 0, // 오늘 이전 날짜 선택 불가능
	        beforeShowDay: function(date) {
	            // `date`는 현재 검사 중인 날짜 객체입니다.
	          var disabledDates = ${requestScope.fullRent};

     
	            
	            var dateString = $.datepicker.formatDate('yy-mm-dd', date);
	            
	            // 배열 `disabledDates`에 `dateString`이 포함되면 `false`를 반환하여 날짜를 비활성화합니다.
	            if (disabledDates.includes(dateString)) {
	                return [false];
	            }
	            
	            // 그 외 날짜는 기본적으로 활성화된 상태로 반환합니다.
	            return [true];
	        }
	    });

	    $('form').on('submit', function(e) {
	        var confirmSubmit = confirm('예약을 완료하시겠습니까?');
	        if (!confirmSubmit) {
	            e.preventDefault();
	        }
	    });
	});

</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText">스타디움 예약</p>
	</div>

	<c:if test="${empty requestScope.stadiumDTO}">
		<script>
			alert("경기장이 삭제됨.");
			location.replace("/stadiumRentForm.do");
		</script>
	</c:if>




	<c:if test="${!empty requestScope.stadiumDTO}">

		<table align="center" bordercolor="gray" border="1" cellpadding="7"
			style="border-collapse: collapse;">
			<caption>[경기장 상세글 보기]</caption>
			<tr>
				<th bgColor="lightgray">사진</th>
				<td><img src="/image/st.jpg"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">경기장이름</th>
				<td>${requestScope.stadiumDTO.stadium_name}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">지역</th>
				<td>${requestScope.stadiumDTO.sido_name}-${requestScope.stadiumDTO.sigungu_name}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">등록일</th>
				<td>${requestScope.stadiumDTO.reg_date}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">상태</th>
				<td>${requestScope.stadiumDTO.stadium_status}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">비 고</th>
				<td><textarea name="content" class="content" rows="13"
						cols="20" maxlength="50" readonly>${requestScope.stadiumDTO.content}</textarea></td>
			</tr>
		</table>
	</c:if>

	<form name="rentStadiumForm">

		<table align="center" border="1" bordercolor="gray" cellpadding="7"
			style="border-collapse: collapse; margin-top: 20px;">

			<caption>[스타디움 예약 상세]</caption>
			<tr>
				<th bgColor="lightgray">날짜</th>
				<td><input type="text" id="date" name="date"
					required="required"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">시간대</th>
				<td>

				<select name="time_slot" required="required">
				<option value="선택">선택</option>
						<c:forEach var="time" items="${timeDTO}">
							<option value="${time.time_no}">${time.time_range}</option>
						</c:forEach>

				</select>

				</td>
			</tr>

			<tr>
				<td colspan="2" style="text-align: center;"><input
					type="button" value="예약하기" onclick="checkReserveForm();"></td>
			</tr>
		</table>
		<input type="hidden" name="stadium_no"
			value="${requestScope.stadiumDTO.stadium_no}">
		
		<input type="hidden" name="m_no" value="<%= request.getSession().getAttribute("m_no") %>">
		
	</form>
	<center>
		<span style="cursor: pointer"
			onclick="location.replace('/stadiumRentForm.do')">[목록 화면으로]</span>
	</center>
</body>
</html>
