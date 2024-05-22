<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecruitLessonBoardForm</title>
<link href="/style/recruitLessonBoardFormStyle.css" rel="stylesheet">
<script src="/js/recruitLessonBoardFormScript.js"></script>
<script>
function goWaitingLessonList()
{
	var formObj = $("[name='waitingLessonList']");
	
	if (confirm("신청 하시겠습니까?") == false) {
		return;
	}
	
	$.ajax({
		url : "/goWaitingLessonList.do",
		type : "post",
		data : formObj.serialize(),
		success : function(json) {
			var result = json["result"];
			if (result == 1) {
				alert("신청이 완료되었습니다.");
			}
			else {
				alert("이미 신청한 레슨입니다.");
			}
		},
		error : function() {
			alert("신청 실패! 관리자에게 문의 바랍니다.");
		}
	});
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recruitLessonBoardFormTitle">
    	<img src="/image/RecruitTitleBackgroundImage.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">레슨 모집</p>
    </div>
    
    
    
	<!-- 만약에 1개의 게시판 데이터가 없으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->

	<!-- 만약에 상세보기할 게시판 이 삭제가 되었으면-->
	<c:if test="${empty requestScope.lessondetailList}">
		<script>
			alert("게시글이 삭제되었습니다.");
			location.replace("/recruitLessonBoardForm.do");
		</script>
	</c:if>



	<!-- 만약에 1개의 게시판 데이터가 있으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이아니면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->
	<!-- 만약에 상세보기할 게시판이 있으면-->
	<c:if test="${!empty requestScope.lessondetailList}">
	
		<center>
			<table align="center" bordercolor="gray" border=1 cellpadding=7
				style="border-collapse: collapse">
				<caption>[레슨 모집 상세글 보기]</caption>
				<tr>
					<th bgColor="lightgray">닉네임</th>
					<!--------------------------------------------------- -->
					<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
					<!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
					<!-- 상세보기할 게시판의 이름 표현하기 -->
					<!--------------------------------------------------- -->
					<td>${requestScope.lessondetailList.nickname}</td>
				</tr>
				<tr>
					<th bgColor="lightgray">제목</th>
					<!--------------------------------------------------- -->
					<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
					<!-- subject 라는 멤버변수 안의 데이터를 표현하기 -->
					<!-- 상세보기할 게시판의 제목 표현하기 -->
					<!--------------------------------------------------- -->
					<td>${requestScope.lessondetailList.title}</td>
				</tr>
				<tr>
					<th bgColor="lightgray">조회수</th>
					<!--------------------------------------------------- -->
					<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
					<!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
					<!-- 상세보기할 게시판의 조회수 표현하기 -->
					<!--------------------------------------------------- -->
					<td>${requestScope.lessondetailList.readcount}</td>
				</tr>
				
				<tr>
                  <th bgColor="lightgray">지역</th>
                  <!--------------------------------------------------- -->
                  <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
                  <!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
                  <!-- 상세보기할 게시판의 조회수 표현하기 -->
                  <!--------------------------------------------------- -->
                  <td>${requestScope.lessondetailList.sido_c} ${requestScope.lessondetailList.sigungu_c}</td>
               </tr>
               
               <tr>
                  <th bgColor="lightgray">요일</th>
                  <!--------------------------------------------------- -->
                  <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
                  <!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
                  <!-- 상세보기할 게시판의 조회수 표현하기 -->
                  <!--------------------------------------------------- -->
                  <td>${requestScope.day}</td>
               </tr>
               
               <tr>
                  <th bgColor="lightgray">시간</th>
                  <!--------------------------------------------------- -->
                  <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
                  <!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
                  <!-- 상세보기할 게시판의 조회수 표현하기 -->
                  <!--------------------------------------------------- -->
                  <td>${requestScope.time}</td>
               </tr>
				
				<tr>
					<th bgColor="lightgray">비용</th>
					<!--------------------------------------------------- -->
					<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
					<!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
					<!-- 상세보기할 게시판의 조회수 표현하기 -->
					<!--------------------------------------------------- -->
					<td>${requestScope.lessondetailList.money}</td>
				</tr>
				<tr>
					<th bgColor="lightgray">내 용</th>
					<!--------------------------------------------------- -->
					<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
					<!-- content 라는 멤버변수 안의 데이터를 표현하기 -->
					<!-- 상세보기할 게시판의 내용 표현하기 -->
					<!--------------------------------------------------- -->
					<td><textarea name="content" class="content" rows="13"
							cols="40" maxlength="500" readonly>${requestScope.lessondetailList.content}</textarea></td>
				</tr>
			</table>
		</center>
	
		<center>
				<!--------------------------------------------------- -->
				<!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
				<!--------------------------------------------------- -->
				<c:if test="${not empty sessionScope.m_no}">
					<c:if test="${sessionScope.nickname ne requestScope.lessondetailList.nickname}">
		         	 	<input type="button" value="신청" style="cursor:pointer" onclick="goWaitingLessonList()" >
		         	</c:if>
	         	</c:if>
				<span style="cursor: pointer"
					onclick="location.replace('/recruitLessonBoardForm.do')">
					[목록 화면으로] </span>
	        	<c:if test="${sessionScope.nickname eq requestScope.lessondetailList.nickname}">
					<input type="button" value="수정/삭제" style="cursor:pointer" onclick="document.recruitLessonBoardUpDelForm.submit()" >
				</c:if>
	    
	    	</c:if>
	    </center>	
	    
	    
	    
    	<<!--------------------------------------------------------------------------->
		<!-- WAS에 "/recruitTeamMemBoardUpDelForm.do" 주소로 접속하기 위한 form 태그 선언하기 -->
		<!--------------------------------------------------------------------------->
		<form name="recruitLessonBoardUpDelForm" action="/recruitLessonBoardUpDelForm.do" method="post">
		<!------------------------------------------------------------------------>
		<!-- 게시판 고유번호가 저장된 hidden 태그 선언하기 -->
		<!------------------------------------------------------------------------>
		<input type="hidden" name="recruitment_no"value="${requestScope.lessondetailList.recruitment_no}">
		</form>
		
		<!-- 레슨모집 게시물일때 신청버튼을 누르면 넘어갈 정보들 -->
		<form name="waitingLessonList">
			<input type="hidden" name="writer" value="${requestScope.lessondetailList.m_no}">
			<input type="hidden" name="m_no" value="${sessionScope.m_no}">
			<input type="hidden" name="recruitment_no"value="${requestScope.lessondetailList.recruitment_no}">
		</form>
    
</body>
</html>