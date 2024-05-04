<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityGallaryForm</title>
<link href="/style/communityGallaryFormStyle.css" rel="stylesheet">
<script src="/js/communityGallaryFormScript.js"></script>
<script>
	function newCommunityGallaryFormBtnClick() {
		
	    var sessionMid = '<%= session.getAttribute("mid") %>'
	
	    if (sessionMid === 'null') {
	    	alert('로그인이 필요한 서비스입니다.');
	    	location.href = '/main/loginForm.do';
	    } else {
	    	location.href = '/newCommunityGallaryForm.do';
	    }
	}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="communityGallaryFormTitle">
    	<img src="/image/CommunityTitleBackgroundImage.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">갤러리</p>
    </div>
    <div class="newCommunityGallaryBtnDiv">
		<input type="button" class="newCommunityGallaryBtn" value="새 글 쓰기" onClick="newCommunityGallaryFormBtnClick();">
	</div>
    <div class="communityGallaryFormContainer">
		<c:forEach var="imageboard" items="${requestScope.imageGallaryBoardList}" varStatus="status">
			<div class="communityGallaryFormBoard">
				<div class="communityGallaryImageDiv">
					<img src="/image/SoccerBall.jpg" class="communityGallaryImage">
				</div>
				<div class="communityGallarySubject">${imageboard.subject}</div>
				<div class="communityGallaryWriter">${imageboard.writer}</div>
				<div class="communityGallaryRegDate">${imageboard.reg_date}</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>