<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecruitHiredBoardForm</title>
<link href="/style/recruitHiredBoardFormStyle.css" rel="stylesheet">
<script src="/js/recruitHiredBoardFormScript.js"></script>

<script>
function goWaitingHiredList()
{
	var formObj = $("[name='waitingHiredList']");
	
	if (confirm("신청 하시겠습니까?") == false) {
		return;
	}
	
	$.ajax({
		url : "/goWaitingHiredList.do",
		type : "post",
		data : formObj.serialize(),
		success : function(json) {
			var result = json["result"];
			if (result == 1) {
				alert("신청이 완료되었습니다.");
			}
			else {
				alert("이미 신청한 팀입니다.");
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
    <div class="recruitHiredBoardFormTitle">
    	<img src="/image/RecruitTitleBackgroundImage.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">용병 모집</p>
    </div>
    
    
    
	<!-- 만약에 1개의 게시판 데이터가 없으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->

	<!-- 만약에 상세보기할 게시판 이 삭제가 되었으면-->
	<c:if test="${empty requestScope.hireddetailList}">
		<script>
			alert("게시글이 삭제되었습니다.");
			location.replace("/recruitHiredBoardForm.do");
		</script>
	</c:if>



	<!-- 만약에 1개의 게시판 데이터가 있으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이아니면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->
	<!-- 만약에 상세보기할 게시판이 있으면-->
	<c:if test="${!empty requestScope.hireddetailList}">
	
		<center>
			<table align="center" bordercolor="gray" border=1 cellpadding=7
				style="border-collapse: collapse">
				<caption>[용병 모집 상세글 보기]</caption>
				<tr>
					<th bgColor="lightgray">닉네임</th>
					<!--------------------------------------------------- -->
					<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
					<!-- nickname 이라는 멤버변수 안의 데이터를 표현하기 -->
					<!-- 상세보기할 게시판의 이름 표현하기 -->
					<!--------------------------------------------------- -->
					<td>${requestScope.hireddetailList.nickname}</td>
				</tr>
				<tr>
					<th bgColor="lightgray">제목</th>
					<!--------------------------------------------------- -->
					<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
					<!-- subject 라는 멤버변수 안의 데이터를 표현하기 -->
					<!-- 상세보기할 게시판의 제목 표현하기 -->
					<!--------------------------------------------------- -->
					<td>${requestScope.hireddetailList.title}</td>
				</tr>
				<tr>
					<th bgColor="lightgray">조회수</th>
					<!--------------------------------------------------- -->
					<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
					<!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
					<!-- 상세보기할 게시판의 조회수 표현하기 -->
					<!--------------------------------------------------- -->
					<td>${requestScope.hireddetailList.readcount}</td>
				</tr>
				
				<tr>
                  <th bgColor="lightgray">지역</th>
                  <!--------------------------------------------------- -->
                  <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
                  <!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
                  <!-- 상세보기할 게시판의 조회수 표현하기 -->
                  <!--------------------------------------------------- -->
                  <td>${requestScope.hireddetailList.sido_c} ${requestScope.hireddetailList.sigungu_c}</td>
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
                  <th bgColor="lightgray">포지션</th>
                  <!--------------------------------------------------- -->
                  <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
                  <!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
                  <!-- 상세보기할 게시판의 조회수 표현하기 -->
                  <!--------------------------------------------------- -->
                  <td>${requestScope.hireddetailList.pos}</td>
               </tr>
				
				<tr>
					<th bgColor="lightgray">내 용</th>
					<!--------------------------------------------------- -->
					<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
					<!-- content 라는 멤버변수 안의 데이터를 표현하기 -->
					<!-- 상세보기할 게시판의 내용 표현하기 -->
					<!--------------------------------------------------- -->
					<td><textarea name="content" class="content" rows="13"
							cols="40" maxlength="500" readonly>${requestScope.hireddetailList.content}</textarea></td>
				</tr>
			</table>
		</center>
		<center>
			<!--------------------------------------------------- -->
			<!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
			<!--------------------------------------------------- -->
			<c:if test="${not empty sessionScope.m_no}">
				<c:if test="${sessionScope.nickname ne requestScope.hireddetailList.nickname}">
	         	 	<input type="button" value="신청" style="cursor:pointer" onclick="goWaitingHiredList()" >
	         	</c:if>
	         </c:if>
			<span style="cursor: pointer"
				onclick="location.replace('/recruitHiredBoardForm.do')">
				[목록 화면으로] </span>
        	<c:if test="${sessionScope.nickname eq requestScope.hireddetailList.nickname}">
				<input type="button" value="수정/삭제" style="cursor:pointer" onclick="document.recruitHiredboardUpDelForm.submit()" >
			</c:if>
				
    	</c:if>
    	</center>
    	
    	
    	<!--------------------------------------------------------------------------->
		<!-- WAS에 "/recruitTeamMemBoardUpDelForm.do" 주소로 접속하기 위한 form 태그 선언하기 -->
		<!--------------------------------------------------------------------------->
		<form name="recruitHiredboardUpDelForm" action="/recruitHiredBoardUpDelForm.do" method="post">
		<!------------------------------------------------------------------------>
		<!-- 게시판 고유번호가 저장된 hidden 태그 선언하기 -->
		<!------------------------------------------------------------------------>
		<input type="hidden" name="recruitment_no"value="${requestScope.hireddetailList.recruitment_no}">
		</form>
    
    	<!-- 용병모집 게시물일때 신청버튼을 누르면 넘어갈 정보들 -->
		<form name="waitingHiredList">
			<input type="hidden" name="m_no"value="${sessionScope.m_no}">
			<input type="hidden" name="recruitment_no"value="${requestScope.hireddetailList.recruitment_no}">
		</form>
</body>
</html>