<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityMarketplaceBoardForm</title>

<link href="/style/community/communityMarketplaceBoardFormStyle.css" rel="stylesheet">

<!-- 이전 경로에 js 파일이 없어 주석처리.
<script src="/js/community/communityMarketplaceBoardFormScript.js"></script>
-->

<script>
	// 전체, 팝니다, 무료나눔 선택 
	$(function(){
		$('.communityMarketplaceCategoryTabContent > div').hide();
		$('.communityMarketplaceCategoryTabNav a').click(function(){
			$('.communityMarketplaceCategoryTabContent > div').hide().filter(this.hash).fadeIn();
			$('.communityMarketplaceCategoryTabNav a').removeClass('active');
			$(this).addClass('active');
			return false;
		}).filter(':eq(0)').click();
	});

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
	
	<!-- 위 기존 코드 -->
	
	
	
	
	<div class="communityMarketplaceCategoryTab">
    	<ul class="communityMarketplaceCategoryTabNav">
    		<li><a href="#communityMarketplaceCategoryTabAll">전체</a></li>
    		<li><a href="#communityMarketplaceCategoryTabSell">팝니다</a></li>
    		<li><a href="#communityMarketplaceCategoryTabSharing">무료나눔</a></li>
    	</ul>	
   		
   		<div class="communityMarketplaceCategoryTabContent">
   			<div id="communityMarketplaceCategoryTabFAQ">
		    	<div class="communityMarketplaceFAQContainer">
		        	<div id="main-area">
		            	<div id="category-area">
		               
		            	</div>
		            	<div id="list-area">
		               
		            	</div>
		        	</div>
		    	</div>
			</div>
    	</div> <!-- end div class="customerServiceCategoryTabContent" -->
    </div> <!-- end div class="communityMarketplaceCategoryTab" -->
    
    <div id="communityMarketplaceCategoryTabQnA">
		<div class="communityMarketplaceQnAFormContainer">
			<div class="communityMarketplaceQnAFormBoard">
				communityMarketplaceCategoryTabQnA				
			</div>
		</div>	
	</div>
	
	
	
	
	<!-- 아래 기존 코드 -->
	
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