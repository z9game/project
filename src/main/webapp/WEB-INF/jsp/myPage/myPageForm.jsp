<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">
<link href="/style/myPage.css" rel="stylesheet">
<script src="/js/community/communityFreeBoardFormScript.js"></script>

<script>
	var cnt = 0;

	function allApprove(){
			if(cnt == 0)
			{
				$(".approve").prop("checked",true);
				cnt++;
				return;
			}
			if(cnt == 1)
			{
				$(".approve").prop("checked",false);
				cnt--;
				return;
			}
	}
	
	
	function regTeam(){
		
		var teamObj = $("[name='teamRegist']");
		
		var keywordObj = teamObj.find("[name='team_name']");
		
		var keyword = keywordObj.val();
		
		if(typeof(keyword1)!='string' ){keyword1=""; }
		    
		keyword1 = $.trim(keyword1);
		
		
		$.ajax({
			url : "/registTeamProc.do",
			type : "post",
			data : teamObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 1) {
					alert("팀 생성 완료");
					var modal = document.querySelector(".modalDiv_regTeam");
					modal.style.display = "none";
					location.reload();
				}
			},
			error : function() {
				alert("존재하는 팀이름입니다.");
			}
		});
		
	};
	
	
	function regTeamMem(){
			
		var regTeam = $("[name='waitingList']");
		
		if (confirm("정말 수락 하시겠습니까?") == false) {
			return;
		}
		
		$.ajax({
			url : "/regTeamMemberProc.do",
			type : "post",
			data : regTeam.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result > 0) {
					alert("수락 처리 되었습니다.");
					var modal = document.querySelector(".modalDiv_waiting");
					modal.style.display = "none";
					location.reload();
				}
			},
			error : function() {
				alert("수락중 오류가 발생했습니다.");
			}
		});
		
	};
	
	function refuseTeamMem(){
		
		var refuseTeam = $("[name='waitingList']");
		
		if (confirm("정말 거절 하시겠습니까?") == false) {
			return;
		}
		
		$.ajax({
			url : "/regTeamMemberProc.do",
			type : "post",
			data : refuseTeam.serialize(),
			success : function(json) {
				var result = json["refuse"];
				if (result == 0) {
					alert("거절 처리 되었습니다.");
					var modal = document.querySelector(".modalDiv_waiting");
					modal.style.display = "none";
					location.reload();
				}
			},
			error : function() {
				alert("거절중 오류가 발생했습니다.");
			}
		});
		
	};
	
	
	function modalOpen_waiting(){
		var modal = document.querySelector(".modalDiv_waiting");
		modal.style.display = "block";
	};
	
	function modalClose_waiting(){
		var modal = document.querySelector(".modalDiv_waiting");
		modal.style.display = "none";
	};
	
	function modalOpen_regTeam(){
		var modal = document.querySelector(".modalDiv_regTeam");
		modal.style.display = "block";
	};
	
	function modalClose_regTeam(){
		var modal = document.querySelector(".modalDiv_regTeam");
		modal.style.display = "none";
	};
	
	function modalOpen_myTeamInfo(){
		var modal = document.querySelector(".modalDiv_myTeamInfo");
		modal.style.display = "block";
	};
	
	function modalClose_myTeamInfo(){
		var modal = document.querySelector(".modalDiv_myTeamInfo");
		modal.style.display = "none";
	};
	
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>

	<div class="communityFreeBoardFormTitle">
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText">마이페이지</p>
	</div>
	<!-- ================================================================================================================= -->
	<!-- 내정보  / 팀명 클릭시 팀원리스트 상세보기-->
	<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
	<caption><b>내 정보</b></caption>
		<tr>
			<th>이름</th>
			<th>팀</th>
		</tr>
		<tr>
			<td>${requestScope.myInfo.name}</td>
			<c:if test="${empty requestScope.myInfo.team_name}">
				<td>없음</td>
			</c:if>
			
			<c:if test="${not empty requestScope.myInfo.team_name}">
				<td style="cursor:pointer" onClick = "modalOpen_myTeamInfo()">${requestScope.myInfo.team_name}</td>
			</c:if>
		</tr>
	</table>
	
	<div class="modalDiv_myTeamInfo" align="center"> 
		<div class="bg_modalDiv_myTeamInfo">
			<div class="modal_myTeamInfo">
				
				<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
				<caption><b>팀원 목록</b></caption>
					<tr>
						<th>이름</th>
						<th>지역</th>
						<th>나이</th>
					</tr>
					<c:forEach var="team" items="${requestScope.teamInfo}" varStatus="status">
						<tr>
							<c:if test="${requestScope.myInfo.team_master eq team.m_no}">
								<td align="center">${team.name}(팀장)</td>
							</c:if>
							<c:if test="${requestScope.myInfo.team_master ne team.m_no}">
								<td align="center">${team.name}</td>
							</c:if>
							
							<td align="center">${team.sido}</td>
							<td align="center">${team.age}</td>
						</tr>
					</c:forEach>
				</table>
				
			<button onclick="modalClose_myTeamInfo()">닫기</button>
			</div>
		</div>
	</div>

	
	<div style="height:25px;"></div>
	<!-- ================================================================================================================= -->
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
	<!-- ================================================================================================================= -->
	<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
	<caption><b>예약한 경기장</b></caption>
		<tr>
			<th>경기장명</th>
			<th>날짜</th>
			<th>시간</th>
		</tr>
		<c:forEach var="list" items="${requestScope.bookedStadium}" varStatus="status">
			<tr>
				<td align="center">${list.stadium_name}</td>
				<td align="center">${list.booking_date}</td>
				<td align="center">${list.time_range}</td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${empty requestScope.bookedStadium}">
			<center>
			<br><br>
			<b>예약한 경기장이 없습니다.</b>
			</center>
			<div style="height:10px;"></div>
	</c:if>
	
	
	
	<div style="height:25px;"></div>
	<!-- ================================================================================================================= -->
	<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
	<caption><b>다음 예정 경기</b></caption>
		<tr>
			<th>경기장명</th>
			<th>주소</th>
			<th>일시</th>
			<th>시간</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	
	<div style="height:30px;"></div>
	<!-- ================================================================================================================= -->
	<!-- 팀 수락 관련 -->
	<c:if test="${requestScope.myInfo.team_master eq requestScope.myInfo.m_no}">
		<c:if test="${requestScope.WaitingCnt > 0}">
	    	<center>
				<table style="border-collapse:collapse" border="1">
				<tr>
					<td class="waitingCheck" onclick="modalOpen_waiting()">
						팀모집 수락 대기인원이 있습니다.
					</td>
				</tr>
			</table>
			</center>
		</c:if>
	</c:if>
	
	
	<div class="modalDiv_waiting" align="center"> 
		<div class="bg_waiting">
			<div class="modal_waiting">
			<form name = "waitingList">
				<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
					<caption><b>수락대기중</b></caption>
					<tr>
						<th>이름</th>
						<th>나이</th>
						<th>지역</th>
						<th>선택</th>
					</tr>
					<c:forEach var="list" items="${requestScope.waitList}" varStatus="status">
						<tr>
							<td align="center">${list.name}</td>
							<td align="center">${list.age}</td>
							<td align="center">${list.sido}</td>
							<td align="center"><input type="checkbox" class="approve" name="m_no_A" value="${list.m_no}"></td>
						</tr>
					</c:forEach>
				</table>
			</form>
			<div style="height:8px;"></div>
			<button onclick="allApprove()">전체선택</button>
			<button onclick="regTeamMem()">수락</button>
			<button onclick="refuseTeamMem()">거절</button>
			<button onclick="modalClose_waiting()">취소</button>
			</div>
		</div>
	</div>
	
	<div style="height:30px;"></div>
	<!-- ================================================================================================================= -->
	<!-- 용병 관련 -->
	<c:if test="${requestScope.myInfo.team_master eq requestScope.myInfo.m_no}">
		<!-- 이곳에 용병대기 리스트 들어갈거임 --><c:if test="">
	    	<center>
				<table style="border-collapse:collapse" border="1">
				<tr>
					<td class="waitingCheck" onclick="">
						용병 수락 대기인원이 있습니다.
					</td>
				</tr>
			</table>
			</center>
		</c:if>
	</c:if>
	
	
	<div class="modalDiv_waiting" align="center"> 
		<div class="bg_waiting">
			<div class="modal_waiting">
			<form name = "waitingList">
				<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
					<caption><b>수락대기중</b></caption>
					<tr>
						<th>이름</th>
						<th>나이</th>
						<th>지역</th>
						<th>선택</th>
					</tr>
					<c:forEach var="list" items="${requestScope.waitList}" varStatus="status">
						<tr>
							<td align="center">${list.name}</td>
							<td align="center">${list.age}</td>
							<td align="center">${list.sido}</td>
							<td align="center"><input type="checkbox" class="approve" name="m_no_A" value="${list.m_no}"></td>
						</tr>
					</c:forEach>
				</table>
			</form>
			<div style="height:8px;"></div>
			<button onclick="">전체선택</button>
			<button onclick="">수락</button>
			<button onclick="">거절</button>
			<button onclick="">취소</button>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	<!-- ================================================================================================================= -->
	<!-- 레슨 관련 -->
	
	
	
	
	
	
	
	
	
	
	<!-- ================================================================================================================= -->
	<!-- 팀생성 관련 -->
	<c:if test="${empty requestScope.myInfo.team_name}">
    	<center>
			<input type="button" name="regTeam" value="팀생성" onclick="modalOpen_regTeam()">
		</center>
	</c:if>
	
	
	<div class="modalDiv_regTeam" align="center"> 
		<div class="bg_regTeam">
			<div class="modal_regTeam">
			<form name = "teamRegist">
				<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
					<tr>
						<th>팀명</th>
						<td>
							<input type="text" name="team_name" placeholder="팀명을 입력하세요">
							<input type="hidden" name="team_master" value="${sessionScope.m_no}">
						</td>
					</tr>
				</table>
			</form>
				<div style="height:8px;"></div>
				<button onclick="regTeam()()">생성</button>
				<button onclick="modalClose_regTeam()">취소</button>
			</div>
		</div>
	</div>
	
		<!-- ================================================================================================================= -->
	
	
	
	
	
	
	<div style="height:50px;"></div>

	
</body>
</html>