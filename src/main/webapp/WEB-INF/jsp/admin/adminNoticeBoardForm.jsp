<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityNoticeBoardForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css"
	rel="stylesheet">

<script src="/js/community/communityFreeBoardFormScript.js"></script>

<script>




$(document).ready(function() { 		
		$(".rowCntPerPage").val("10");
		checkDate();

   
});


function goNadminNticeboardDetailForm(b_no) {
	
	
	//----------------------------------
	// name='boardDetailForm' 을 간 form 태그 후손중에 
	// name='b_no' 가진 태그에 매개변수로 들어온 게시판의 고유번호를 
	// 삽입하기
	//----------------------------------
	
	//location.replace("/boardDetailForm.do?b_no=" + b_no);
	
	$("[name='adminNoticeboardDetailForm'] [name='b_no']").val(b_no); 
	
	//----------------------------------
	// name='boardDetailForm' 을 가진 
	// form 태그의 action 에 설정된 URL 주소로 WAS 접속해서 
	// 얻은 새 HTML 를 웹브라우저 열기.
	// 즉 화면 이동하기.
	//----------------------------------
	
	document.adminNoticeboardDetailForm.submit();
		
	
	//alert($("[name='boardDetailForm'] [name='b_no']").val());
		
}





function search(){

	//---------------------------------------------
	// 변수 boardSearchFormObj 선언하고 
	// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
	//---------------------------------------------
	 boardSearchFormObj = $("[name='adminNoticeBoardSearchForm']");

	 boardSearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val() );


	 alert(boardSearchFormObj.serialize());
    

    $.ajax({
    	//-------------------------------
		// WAS 로 접속할 주소 설정
		//-------------------------------
		url      : "/adminNoticeBoardForm.do"
		//-------------------------------
		// WAS 로 접속하는 방법 설정. get 또는 post
		//-------------------------------
		,type    : "post"
		
		,data    : boardSearchFormObj.serialize( )
		
	
        
        ,success : function(responseHtml) {
        	

            var obj = $(responseHtml);
  
            $(".communityNoticeBoardFormContainer").html(obj.filter(".communityNoticeBoardFormContainer").html());
			
            $(".pagingNos").html(obj.find(".pagingNos").html());

            
            
            
        }

       , error : function() {
        	
            alert("검색 실패! 관리자에게 문의 바랍니다.");
        } 
       
    });
		
}



function searchWithSort(sort) {
    // sort 값을 form의 sort 필드에 설정합니다.
    $("[name='adminNoticeBoardSearchForm']").find("[name='sort']").val(sort);
    // 폼을 서브밋하여 결과를 업데이트합니다.
    search();
}









function searchAll() {

	//---------------------------------------------
	// 변수 boardSearchFormObj 선언하고 
	// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
	//---------------------------------------------
	var boardSearchFormObj = $("[name='adminNoticeBoardSearchForm']");

	
	boardSearchFormObj.find(".selectPageNo").val("1")


	search();
    
}



//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// [페이지 번호]를 클릭하면 호출되는 함수 pageNoClick 선언하기 
// 쪼개서 보여주기.
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function pageNoClick( clickPageNo ){
	//alert(clickPageNo);
	//---------------------------------------------
	// name='selectPageNo' 를 가진 태그의 value 값에 
	// 매개변수로 들어오는 [클릭한 페이지 번호]를 저장하기
	// 즉 <input type="hidden" name="selectPageNo" value="1"> 태그에
	// value 값에 [클릭한 페이지 번호]를 저장하기
	//---------------------------------------------
	$("[name='adminNoticeBoardSearchForm']").find(".selectPageNo").val(clickPageNo)
	
	
	search()
	
}












function checkDate() {
	$(function() {
	    // minDatepicker 설정
	    $("#minDate").datepicker({
	        dateFormat: 'yy-mm-dd', // 날짜 형식 설정
	        showOtherMonths: true, // 다른 달의 날짜도 표시
	        showMonthAfterYear: true, // 년도 먼저, 월 나중에 표시
	        changeYear: true, // 년도 선택 가능
	        changeMonth: true, // 월 선택 가능
	        showOn: "both", // 아이콘과 텍스트로 달력 열기 가능
	        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 달력 이미지 추가
	        buttonImageOnly: true, // 아이콘 이미지만 표시
			
	        buttonText: "날짜 선택", // 버튼 텍스트 설정
	        yearSuffix: "년", // 연도 뒤에 붙는 텍스트 설정
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 월 이름 설정
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 요일 이름 설정
	        minDate: "-5Y", // 최소 날짜 설정
	        maxDate: 0, // 최대 날짜 설정
	        onClose: function(selectedDate) {
	            if (selectedDate) {
	                $("#maxDate").datepicker("option", "minDate", selectedDate);
	            } else {
	                // 사용자가 입력을 취소했을 때 maxDate의 minDate를 기본값으로 재설정
	                $("#maxDate").datepicker("option", "minDate", "-5Y");
	            }
	        }
	    });

	    // maxDatepicker 설정
	    $("#maxDate").datepicker({
	        dateFormat: 'yy-mm-dd', // 날짜 형식 설정
	        showOtherMonths: true, // 다른 달의 날짜도 표시
	        showMonthAfterYear: true, // 년도 먼저, 월 나중에 표시
	        changeYear: true, // 년도 선택 가능
	        changeMonth: true, // 월 선택 가능
	        showOn: "both", // 아이콘과 텍스트로 달력 열기 가능
	        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 달력 이미지 추가
	        buttonImageOnly: true, // 아이콘 이미지만 표시
	        buttonText: "날짜 선택", // 버튼 텍스트 설정
	        yearSuffix: "년", // 연도 뒤에 붙는 텍스트 설정
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 월 이름 설정
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 요일 이름 설정
	        minDate: "-5Y", // 최소 날짜 설정
	        maxDate: 0, // 최대 날짜 설정
	        onClose: function(selectedDate) {
	            if (selectedDate) {
	                $("#minDate").datepicker("option", "maxDate", selectedDate);
	            } else {
	                // 사용자가 입력을 취소했을 때 minDate의 maxDate를 오늘 날짜로 재설정
	                $("#minDate").datepicker("option", "maxDate", new Date());
	            }
	        }
	    });

	});

}






</script>








</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText">공지사항</p>
	</div>


	<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>



	<form name="adminNoticeBoardSearchForm" onsubmit="return false">

		<table align="center">
			<tr>
				<td>
					<table border="1" cellpadding="5" cellspacing="0"
						style="border-collapse: collapse" align="center">
						<caption>
							<b>[검색조건]</b>
						</caption>
						<tr>
							<th>키워드</th>

							<td><select name="searchType1">
									<option value="all">전체</option>
									<option value="content">내용</option>
									<option value="subject">제목</option>
									<!-- 추가적인 검색 조건을 샐렉트 박스에 추가 -->
							</select> <input type="text" name="keyword1" class="keyword1"> <select
								name="orand">
									<option value="or">or
									<option value="and">and
							</select> <input type="text" name="keyword2" class="keyword2"></td>
						<tr>
							<th>날짜검색</th>
							<td>최소<input type="text" name="minDate" id="minDate"
								readonly="readonly"> ~ 최대 <input type="text"
								name="maxDate" id="maxDate" readonly="readonly"></td>
						</tr>

					</table>
			</tr>

			<tr align="center">
				<td><input type="button" value="검색" class="searchBtn" onclick="search()">
					<input type="button" value="모두 검색" class="searchAllBtn" onclick="searchAll()">&nbsp;&nbsp;&nbsp;
					<input type="button" value="새글쓰기" 
					onclick="location.replace('/adminNoticeboardRegForm.do');">

				</td>
			</tr>
		</table>

		<input type="hidden" name="sort" class="sort"> <input
			type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">
	</form>








	<div class="communityNoticeBoardFormContainer">

		<div class="noticeboardListDiv" style="margin-bottom: 20px;">
			<table class="noticeboardListTable" cellpadding="7" border="1"
				bordercolor="gray" align="center" style="border-collapse: collapse">
				<tr>
					<th style="width: 50px;">번호</th>
					<th style="width: 300px;">제목</th>
					<th style="width: 80px;">글쓴이</th>
					<c:if
						test="${param.sort!='readcount asc' and param.sort!='readcount desc' }">
						<th width="80px" style="cursor: pointer"
							onclick="searchWithSort('readcount desc')">조회수</th>
					</c:if>
					<!--                      만약 파명 "sort" 의 파값이 'readcount desc' 면 -->
					<!--                      즉 정렬 의지가 'readcount desc' 면 -->
					<c:if test="${param.sort=='readcount desc'}">
						<th width="80px" style="cursor: pointer"
							onclick="searchWithSort('readcount asc')">조회수▼</th>
					</c:if>
					<!--                      만약 파명 "sort" 의 팍밧이 'readcount asc' 면 -->
					<!--                      즉 정렬 의지가 'readcount asc' 면 -->
					<c:if test="${ param.sort=='readcount asc' }">
						<th width="80px" style="cursor: pointer"
							onclick="searchWithSort('')">조회수▲</th>
					</c:if>

					<c:if
						test="${param.sort!='reg_date asc' and param.sort!='reg_date desc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('reg_date desc')">등록일</th>
					</c:if>

					<c:if test="${param.sort=='reg_date desc'}">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('reg_date asc')">등록일▼</th>
					</c:if>

					<c:if test="${param.sort=='reg_date asc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('')">등록일▲</th>
					</c:if>

				</tr>

				<c:forEach var="noticeboard" items="${requestScope.noticeBoardList}"
					varStatus="status">

					<tr style="cursor: pointer"
						onClick="goNadminNticeboardDetailForm(${noticeboard.b_no});">

						<td align="center">${requestScope.noticeBoardMap.begin_serialNo_desc - status.index}</td>
						<td>${noticeboard.subject}</td>
						<td align="center">${noticeboard.writer}</td>
						<td align="center">${noticeboard.readcount}</td>
						<td align="center">${noticeboard.reg_date}</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${empty noticeBoardList}">
				<br>
				<center>조건에 맞는 검색 결과가 없습니다.</center>
			</c:if>
		</div>
	</div>




	<center>

		<span class="pagingNos"> <span style="cursor: pointer"
			onClick="pageNoClick(1)">[처음]</span> <span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.noticeBoardMap.selectPageNo}-1)">[이전]</span>&nbsp;&nbsp;


			<c:forEach var="pageNo"
				begin="${requestScope.noticeBoardMap.begin_pageNo}"
				end="${requestScope.noticeBoardMap.end_pageNo}">

				<c:if test="${requestScope.noticeBoardMap.selectPageNo==pageNo}">
            ${pageNo}
         </c:if>

				<c:if test="${requestScope.noticeBoardMap.selectPageNo!=pageNo}">
					<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
				</c:if>
			</c:forEach>&nbsp;&nbsp; <span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.noticeBoardMap.selectPageNo}+1)">[다음]</span>
			<span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.noticeBoardMap.last_pageNo})">[마지막]</span>
			&nbsp;&nbsp;&nbsp;
			[${requestScope.noticeBoardListCnt}/${requestScope.noticeBoardListAllCnt}]개
			&nbsp;&nbsp;
		</span> <select name="rowCntPerPage" class="rowCntPerPage"
			onChange="search()">
			<option value="10">10
			<option value="15">15
			<option value="20">20
		</select>행보기 &nbsp;&nbsp;&nbsp;
	</center>



	<!-- 이 form 태그를 /boardDetailForm.do로 WAS로 접속하기 위해 선언한다. -->
	<form name="adminNoticeboardDetailForm"
		action="/adminNoticeboardDetailForm.do" method="post">
		<!-- 클릭한 행의 게시판 고유번호가 저장될 히든태그 선언 -->
		<input type="hidden" name="b_no">
	</form>
</body>
</html>