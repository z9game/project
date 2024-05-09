<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecruitTeamBoardDetailForm</title>
<link href="/style/recruitTeamBoardDetailFormStyle.css" rel="stylesheet">
<script src="/js/recruitTeamBoardFormScript.js"></script>
</head>



<body>
	<%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recruitTeamBoardDetailFormTitle">
    	<img src="/image/RecruitTitleBackgroundImage.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">대회 일정</p>
    </div>
    
    
    
	<!-- 만약에 1개의 게시판 데이터가 없으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->

	<!-- 만약에 상세보기할 게시판 이 삭제가 되었으면-->
	<c:if test="${empty requestScope.list}">
		<script>
			alert("게시글이 삭제되었습니다.");
			location.replace("/recruitTeamBoardForm.do");
		</script>
	</c:if>



	<!-- 만약에 1개의 게시판 데이터가 있으면-->
	<!-- 만약에 HttpServletRequest 객체  "boardDTO" 라는 키값으로 저장된 놈이  null 이아니면 -->
	<!-- <참고> ModelAndView 객체의 addObject 메소드로 저장된 놈은
			HttpServletRequest 객체에도 저장된다.  -->
	<!-- 만약에 상세보기할 게시판이 있으면-->
	<c:if test="${!empty requestScope.list}">
	
		<center>
			<table align="center" bordercolor="gray" border=1 cellpadding=7
				style="border-collapse: collapse">
				<caption>[대회 일정 상세글 보기]</caption>
				
				<tr>
					<th bgColor="lightgray">제목</th>
					<!--------------------------------------------------- -->
					<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
					<!-- subject 라는 멤버변수 안의 데이터를 표현하기 -->
					<!-- 상세보기할 게시판의 제목 표현하기 -->
					<!--------------------------------------------------- -->
					<td>${requestScope.list.subject}</td>
				</tr>

				<tr>
	               <th bgColor="lightgray">지역</th>
	               <!--------------------------------------------------- -->
	               <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
	               <!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
	               <!-- 상세보기할 게시판의 조회수 표현하기 -->
	               <!--------------------------------------------------- -->
	               <td>${requestScope.list.region}</td>
	            </tr>
	            
	            <tr>
	               <th bgColor="lightgray">신청기간</th>
	               <!--------------------------------------------------- -->
	               <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
	               <!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
	               <!-- 상세보기할 게시판의 조회수 표현하기 -->
	               <!--------------------------------------------------- -->
	               <td>${requestScope.list.regist_start} ~ ${requestScope.list.regist_end}</td>
	            </tr>
	            
				
				<tr>
					<th bgColor="lightgray">내 용</th>
					<!--------------------------------------------------- -->
					<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
					<!-- content 라는 멤버변수 안의 데이터를 표현하기 -->
					<!-- 상세보기할 게시판의 내용 표현하기 -->
					<!--------------------------------------------------- -->
					<td><textarea name="content" class="content" rows="13"
							cols="40" maxlength="500" readonly>${requestScope.list.content}</textarea></td>
				</tr>
			</table>
		</center>

		<center>
			<!--------------------------------------------------- -->
			<!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
			<!--------------------------------------------------- -->
			<span style="cursor: pointer"
				onclick="location.href='/recruitTeamMemBoardForm.do'">
				[목록 화면으로] </span>
			<input type="button" value="수정/삭제" style="cursor:pointer" onclick="document.BoardUpDelForm.submit()" >
    
    	</c:if>
    	</center>
    
    
</body>
</html>