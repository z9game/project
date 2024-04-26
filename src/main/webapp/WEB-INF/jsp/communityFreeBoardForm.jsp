<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityFreeBoardForm</title>
<link href="/style/communityFreeBoardFormStyle.css" rel="stylesheet">
<script src="/js/communityFreeBoardFormScript.js"></script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="communityFreeBoardFormTitle">
    	<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">자유게시판</p>
    </div>
    <div class="communityFreeBoardFormContainer">
		<div class="newCommunityFreeBoardBtnDiv">
			<input type="button" class="newCommunityFreeBoardBtn" style="margin-top:50px;" value="새 글 쓰기" onClick="location.replace('/newCommunityFreeBoardForm.do')">
		</div>
		<table class="freeboardListTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin:0 auto; margin-top:10px; width:1000px;">
			<tr>
				<th style="width:50px;">번호</th>
				<th style="width:300px;">제목</th>
				<th style="width:80px;">글쓴이</th>
				<th style="width:100px;">조회수</th>
				<th style="width:100px;">등록일</th>
			</tr>
			<c:forEach var="freeboard" items="${requestScope.freeBoardList}" varStatus="status">
				<tr style="cursor:pointer">
					<td align="center">${requestScope.freeBoardList.size() - status.index}</td>
					<td>
						${freeboard.subject}
					</td>
					<td align="center">${freeboard.writer}</td>
					<td align="center">${freeboard.readcount}</td>
					<td align="center">${freeboard.reg_date}</td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${empty freeBoardList}">
			<br>
			<center>
				조건에 맞는 검색 결과가 없습니다.
			</center>
		</c:if>
	</div>
	</div>
</body>
</html>