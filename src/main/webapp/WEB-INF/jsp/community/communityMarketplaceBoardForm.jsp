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
	// jsp 페이지 탭명 수정시 아래 상수값들도 동일하게 바꾼다.
	const TAB_ALL = "전체";
	const TAB_SELL= "팝니다";
	const TAB_SHARING = "무료나눔";
	
	$(function() {
		
		$('.communityMarketplaceCategoryTabNav a').click(function() {
			
			$('.communityMarketplaceCategoryTabContent > div').hide().filter(this.hash).fadeIn();
			$('.communityMarketplaceCategoryTabNav a').removeClass('active');
			$(this).addClass('active');			
			
			var tabText = $(this).text().trim();
			
			if (tabText === TAB_ALL) {
				$('#communityMarketplaceCategoryTabFAQ').show().fadeIn();
			}
			else if (tabText === TAB_SELL) {
				$('#communityMarketplaceCategoryTabQnA').show().fadeIn();
			}
			else if (tabText === TAB_SHARING) {
				$('#communityMarketplaceCategoryTab3').show().fadeIn();				
			}
			
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
	
	
	<!-- [카테고리] 탭 -->
	<div class="communityMarketplaceCategoryTab">
    	<ul class="communityMarketplaceCategoryTabNav">
    		<li><a href="#communityMarketplaceCategoryTabAll">전체</a></li>
    		<li><a href="#communityMarketplaceCategoryTabSell">팝니다</a></li>
    		<li><a href="#communityMarketplaceCategoryTabSharing">무료나눔</a></li>
    	</ul>	
   		
   		<!-- [탭] 콘텐츠 -->
   		<div class="communityMarketplaceCategoryTabContent">   			
   			
   			
   			<div id="communityMarketplaceCategoryTabFAQ">
		    	<div class="communityMarketplaceFAQContainer">
		        	
		        	<!-- container1 -->
		        	container1
		        	<!-- 
		        	<div class="newCommunityMarketplaceBtnDiv">
						<input type="button" class="newCommunityGallaryBtn" value="새 글 쓰기" onClick="newCommunityMarketplaceBoardFormBtnClick();">
					</div>
					 -->

					<div class="communityMarketplaceSearch">
						<table border="1" bordercolor="black" style="border-collapse:collapse; margin: 0 auto; margin-top:25px; width:1000px;" cellpadding="7" align="center">
							<tr>
								<th>
									검&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;색
								</th>
								<td>
									<select name="searchType1">
										<option value="all">전체</option>
										<option value="writer">글작성자</option> 
										<option value="title">제목</option>
										<option value="content">내용</option>
										<!-- 추가적인 검색 조건을 샐렉트 박스에 추가 -->
									</select> 
									<input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" onkeyup="enterkey()">
									<input type="button" value="    검색    " onclick="search()"> 
								</td>
							</tr>
						</table>					
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
		        	<!-- end. container -->
		        	
		    	</div>
			</div>   
    
			<div id="communityMarketplaceCategoryTabQnA">
				<div class="communityMarketplaceQnAFormContainer">
			
					<!-- container2 -->
		        	container2
		        	<div class="newCommunityMarketplaceBtnDiv">
						<input type="button" class="newCommunityGallaryBtn" value="새 글 쓰기" onClick="newCommunityMarketplaceBoardFormBtnClick();">
					</div>

					<div class="communityMarketplaceSearch">
						<table border="1" bordercolor="black" style="border-collapse:collapse; margin: 0 auto; margin-top:25px; width:1000px;" cellpadding="7" align="center">
							<tr>
								<th>
									검&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;색
								</th>
								<td>
									<select name="searchType1">
										<option value="all">전체</option>
										<option value="writer">글작성자</option> 
										<option value="title">제목</option>
										<option value="content">내용</option>
										<!-- 추가적인 검색 조건을 샐렉트 박스에 추가 -->
									</select> 
									<input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" onkeyup="enterkey()">
									<input type="button" value="    검색    " onclick="search()"> 
								</td>
							</tr>
						</table>					
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
		        	<!-- end. container -->
					
				</div>	
			</div>
			
			<div id="communityMarketplaceCategoryTab3">
				<div class="communityMarketplaceQnAFormContainer">
			
					<!-- container3 -->
		        	container3
		        	<div class="newCommunityMarketplaceBtnDiv">
						<input type="button" class="newCommunityGallaryBtn" value="새 글 쓰기" onClick="newCommunityMarketplaceBoardFormBtnClick();">
					</div>

					<div class="communityMarketplaceSearch">
						<table border="1" bordercolor="black" style="border-collapse:collapse; margin: 0 auto; margin-top:25px; width:1000px;" cellpadding="7" align="center">
							<tr>
								<th>
									검&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;색
								</th>
								<td>
									<select name="searchType1">
										<option value="all">전체</option>
										<option value="writer">글작성자</option> 
										<option value="title">제목</option>
										<option value="content">내용</option>
										<!-- 추가적인 검색 조건을 샐렉트 박스에 추가 -->
									</select> 
									<input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" onkeyup="enterkey()">
									<input type="button" value="    검색    " onclick="search()"> 
								</td>
							</tr>
						</table>					
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
		        	<!-- end. container -->
					
				</div>	
			</div>
			
		
		</div>	<!-- 끝. [탭] 콘텐츠 -->
	 
	</div>	<!-- 끝. [카테고리] 탭 -->
	
	
</body>
</html>