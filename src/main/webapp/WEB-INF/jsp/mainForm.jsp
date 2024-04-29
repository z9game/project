<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainForm</title>
<link href="/style/mainFormStyle.css" rel="stylesheet">
<script src="/js/mainFormScript.js"></script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="mainFormContainer">
		<div class="section" id="sectionMain">
			<div class="sectionMainText">안녕하세요<br>우리는 1조<br>축구 매칭 사이트 제작<br>병합완료<br>cjk Branch</div>
			<img src="/image/MainImage.jpg">
		</div>
		<div class="section" id="sectionStatistics">
		
		</div>
		<div class="section" id="sectionRanking">
		
		</div>
		<div class="section" id="sectionSchedule">
		
		</div>
		<div class="section" id="sectionMedia">
			<div>
				<strong>Gallary</strong>
			</div>
			<div class="sectionMediaGallaryContainer">
				<c:forEach var="imageboard" items="${requestScope.imageBoardList}" varStatus="status">
					<div class="sectionMediaGallaryFormBoard">
						<div class="sectionMediaGallaryImageDiv">
							<img src="/image/SoccerBall.jpg" class="sectionMediaGallaryImage">
						</div>
						<div class="sectionMediaGallarySubject">${imageboard.subject}</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>