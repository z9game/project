<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link href="/style/headerStyle.css" rel="stylesheet">
<script src="/js/headerScript.js"></script>
</head>
<body>
	<header class="header">
    
		<div class="headerTitle">

			<a href="/main/mainForm.do"><!--  <img src="#" class="headerLogo"> -->
			</a>
		</div>
		<div class="headerMenu">

			<nav class="headerNav">
				<ul class="headerNavList">
					<li><a href="/main/mainForm.do">홈</a></li>

					<li class="nav-item"><a href="/matchingForm.do">매칭 찾기</a></li>
					<li class="nav-item"><a href="/recruitTeamMemBoardForm.do">모집</a>
						<!-- 하위 카테고리 -->
						<ul class="navInner">
							<li class="navInner-item"><a href="/recruitTeamMemBoardForm.do">팀/팀원</a></li>
							<li class="navInner-item"><a
								href="/recruitHiredBoardForm.do">용병</a></li>
							<li class="navInner-item"><a
								href="/recruitLessonBoardForm.do">레슨</a></li>
						</ul></li>
					<li class="nav-item"><a href="/stadiumRentForm.do">경기장</a> <!-- 하위 카테고리 -->
						<ul class="navInner">
							<li class="navInner-item"><a href="/stadiumRentForm.do">대관</a></li>
							<li class="navInner-item"><a href="/stadiumTransferForm.do">양도</a></li>
						</ul></li>
					<li class="nav-item"><a href="/communityNoticeBoardForm.do">커뮤니티</a>
						<!-- 하위 카테고리 -->
						<ul class="navInner">
							<li class="navInner-item"><a
								href="/communityNoticeBoardForm.do">공지사항</a></li>
							<li class="navInner-item"><a
								href="/communityFreeBoardForm.do">자유게시판</a></li>
							<li class="navInner-item"><a href="/communityGallaryForm.do">갤러리</a></li>
							<li class="navInner-item"><a
								href="/communityMarketplaceBoardForm.do">장터</a></li>
						</ul></li>
					<li class="nav-item"><a href="/tournamentBoardForm.do">대회</a>
						<!-- 하위 카테고리 -->
						<ul class="navInner">
							<li class="navInner-item"><a href="/tournamentBoardForm.do">대회일정</a></li>
						</ul></li>
					<li class="nav-item"><a href="/records/recordsRankingForm.do">기록실</a>
						<!-- 하위 카테고리 -->
						<ul class="navInner">
							<li class="navInner-item"><a href="/records/recordsRankingForm.do">랭킹</a></li>
							<li class="navInner-item"><a
								href="/records/recordsStatisticsForm.do">통계</a></li>
						</ul></li>
					<li class="nav-item"><a href="/main/customerServiceForm.do">고객센터</a>
					</li>
					<c:if test="${not empty sessionScope.mid}">
						<li class="auth-links">${sessionScope.nickname} 님 환영합니다!
							&nbsp;&nbsp;&nbsp;
						<c:if test="${sessionScope.mid!= 'admin'}">
						<a href="#">마이페이지</a>
						</c:if>
						<c:if test="${sessionScope.mid== 'admin'}">
						<a href="/adminForm.do">관리자페이지</a>
						</c:if>		 
							 <a href="/logoutProc.do">로그아웃</a>
						</li>
					</c:if>


					<c:if test="${empty sessionScope.mid}">
						<li class="auth-links"><a href="/main/loginForm.do">로그인</a> | <a
							href="/memberRegForm.do">회원가입</a></li>
					</c:if>

				</ul>
			</nav>
		</div>
		<div class="hd_bg"></div>
	</header>
</body>
</html>