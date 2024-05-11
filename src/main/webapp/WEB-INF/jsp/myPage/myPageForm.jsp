<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">
<script src="/js/community/communityFreeBoardFormScript.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>

	<div class="communityFreeBoardFormTitle">
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText">마이페이지</p>
	</div>
	
	<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
	<caption><b>내 정보</b></caption>
		<tr>
			<th>이름</th>
			<th>팀</th>
		</tr>
		<tr>
			<td>${requestScope.myInfo.name}</td>
			<td>
				<c:if test="${empty requestScope.myInfo.team}">없음</c:if>
				<c:if test="${not empty requestScope.myInfo.team}">${requestScope.myInfo.team}</c:if>
			</td>
		</tr>
	</table>
	
	<div style="height:25px;"></div>
	
	<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
	<caption><b>내 기록</b></caption>
		<tr>
			<th>경기수</th>
			<th>승</th>
			<th>무</th>
			<th>패</th>
			<th>골</th>
			<th>도움</th>
		</tr>
		<tr>
			<td>${requestScope.myStat.games_played}</td>
			<td>${requestScope.myStat.wins}</td>
			<td>${requestScope.myStat.draws}</td>
			<td>${requestScope.myStat.losses}</td>
			<td>${requestScope.myStat.goals_for}</td>
			<td>${requestScope.myStat.goals_assist}</td>
		</tr>
	</table>
	<div style="height:25px;"></div>
	
	<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
	<caption><b>예약한 경기장</b></caption>
		<tr>
			<th>지역</th>
			<th>경기장명</th>
			<th>날짜</th>
			<th>시간</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	
	
	
	<div style="height:25px;"></div>
	
	<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
	<caption><b>다음 예정 경기</b></caption>
		<tr>
			<th>지역</th>
			<th>주소</th>
			<th>경기장명</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	
	
	
	
	<div style="height:50px;"></div>

	
</body>
</html>