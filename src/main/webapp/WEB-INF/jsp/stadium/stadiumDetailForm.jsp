<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>스타디움 예약 시스템</title>
    <link href="/style/community/communityNoticeBoardFormStyle.css" rel="stylesheet">
    <script src="/js/community/communityNoticeBoardFormScript.js"></script>
    <script>
        $(document).ready(function() {
            $("#date").datepicker({
                dateFormat : "yy-mm-dd"
            });

            $('form').on('submit', function(e) {
                var confirmSubmit = confirm('예약을 완료하시겠습니까?');
                if (!confirmSubmit) {
                    e.preventDefault(); // 사용자가 취소를 선택하면 폼 제출 중지
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
		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collapse: collapse">
			<caption>[경기장 상세글 보기]</caption>
			<tr>
				<th bgColor="lightgray">사진</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td><img src="/image/st.jpg" ></td>
			</tr>
			<tr>
			
				<th bgColor="lightgray">경기장이름</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
				<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 이름 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.stadiumDTO.stadium_name}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">지역</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
				<!-- subject 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 제목 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.stadiumDTO.sido_name}-${requestScope.stadiumDTO.sigungu_name}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">등록일</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
				<!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 조회수 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.stadiumDTO.reg_date}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">상태</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
				<!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 조회수 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.stadiumDTO.stadium_status}</td>
			</tr>
			
			<tr>
				<th bgColor="lightgray">비 고</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
				<!-- content 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 내용 표현하기 -->
				<!--------------------------------------------------- -->
				<td><textarea name="content" class="content" rows="13"
						cols="20" maxlength="50" readonly>${requestScope.stadiumDTO.content}</textarea></td>
			</tr>
		</table>


	</c:if>










    <table align="center" border="1" bordercolor="gray" cellpadding="7" style="border-collapse: collapse">
        <form action="/reserve" method="post">
            <caption>[스타디움 예약 상세]</caption>
            <tr>
                <th bgColor="lightgray">날짜</th>
                <td><input type="text" id="date" name="date" required="required"></td>
            </tr>
            <tr>
                <th bgColor="lightgray">시작 시간</th>
                <td><input type="time" id="startTime" name="startTime" required="required"></td>
            </tr>
            <tr>
                <th bgColor="lightgray">종료 시간</th>
                <td><input type="time" id="endTime" name="endTime" required="required"></td>
            </tr>
            <tr>
                <th bgColor="lightgray">사용자 ID</th>
                <td><input type="text" id="userId" name="userId" required="required"></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" value="예약하기">
                </td>
            </tr>
        </form>
    </table>

    <center>
        <span style="cursor: pointer" onclick="location.replace('/stadiumRentForm.do')">[목록 화면으로]</span>
    </center>
</body>
</html>
