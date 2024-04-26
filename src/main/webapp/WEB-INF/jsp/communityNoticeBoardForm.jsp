<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityNoticeBoardForm</title>
<link href="/style/communityNoticeBoardFormStyle.css" rel="stylesheet">
<script src="/js/communityNoticeBoardFormScript.js"></script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="communityNoticeBoardFormTitle">
    	<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">공지사항</p>
    </div>
    <div class="communityNoticeBoardFormContainer">
		<div class="noticeboardListDiv" style="margin-bottom:20px;">
		<table class="noticeboardListTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse">
			<tr>
				<th style="width:50px;">번호</th>
				<th style="width:300px;">제목</th>
				<th style="width:80px;">글쓴이</th>
				<th style="width:100px;">조회수</th>
				<th style="width:100px;">등록일</th>
			</tr>
			<c:forEach var="noticeboard" items="${requestScope.noticeBoardList}" varStatus="status">
				<tr style="cursor:pointer">
					<td align="center">${requestScope.noticeBoardList.size() - status.index}</td>
					<td>
						${noticeboard.subject}
					</td>
					<td align="center">${noticeboard.writer}</td>
					<td align="center">${noticeboard.readcount}</td>
					<td align="center">${noticeboard.reg_date}</td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${empty noticeBoardList}">
			<br>
			<center>
				조건에 맞는 검색 결과가 없습니다.
			</center>
		</c:if>
	</div>
	</div>
</body>
</html>