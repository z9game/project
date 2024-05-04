<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityMarketplaceBoardForm</title>
<link href="/style/communityMarketplaceBoardFormStyle.css" rel="stylesheet">
<script src="/js/communityMarketplaceBoardFormScript.js"></script>
<script>
	function newCommunityMarketplaceBoardFormBtnClick() {
		
	    var sessionMid = '<%= session.getAttribute("mid") %>'
	
	    if (sessionMid === 'null') {
	    	alert('로그인이 필요한 서비스입니다.');
	    	location.href = '/main/loginForm.do';
	    } else {
	    	location.href = '/newCommunityMarketplaceForm.do';
	    }
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="communityMarketplaceBoardFormTitle">
    	<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">장터</p>
    </div>
    <div class="newCommunityMarketplaceBtnDiv">
		<input type="button" class="newCommunityGallaryBtn" value="새 글 쓰기" onClick="newCommunityMarketplaceBoardFormBtnClick();">
	</div>
    <div class="communityMarketplaceBoardFormContainer">
		<c:forEach var="imageboard" items="${requestScope.imageMarketBoardList}" varStatus="status">
			<div class="communityMarketplaceBoardFormBoard">
				<div class="communityMarketplaceBoardImageDiv" style="border-bottom:">
					<img src="/image/SoccerBall.jpg" class="communityMarketplaceBoardImage">
				</div>
				<div class="communityMarketplaceBoardSubject">${imageboard.subject}</div>
				<div class="communityMarketplaceBoardWriter">${imageboard.writer}</div>
				<div class="communityMarketplaceBoardRegDate">${imageboard.reg_date}</div>
				<div class="communityMarketplaceBoardReadcount">${imageboard.readcount}</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>