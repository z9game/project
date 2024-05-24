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

	//전체선택
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
	
	//팀등록
	function regTeam(){
		
		var teamObj = $("[name='teamRegist']");
		
		var keywordObj = teamObj.find("[name='team_name']");
		
		var keyword = keywordObj.val();
		
		if(typeof(keyword)!='string' ){keyword=""; }
		    
		keyword = $.trim(keyword);
		
		if(new RegExp(/^[a-zA-Z가-힣0-9]{3,20}$/).test(keyword) == false)
		{
			alert("팀이름은 최소 3글자에서 20글자 사이어야합니다.")
			keyword="";
			return;		
		}
		
		
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
	
	//팀원수락
	function regTeamMem(){
			
		var regTeam = $("[name='waitingList']");
		
		if (confirm("정말 수락 하시겠습니까?") == false) {
			return;
		}
		
		$.ajax({
			url : "/regTeamMemberProc.do",
			type : "post",
			data : regTeam.serialize() + "&reg=1",
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
	
	//팀원거절
	function refuseTeamMem(){
		
		var refuseTeam = $("[name='waitingList']");
		
		if (confirm("정말 거절 하시겠습니까?") == false) {
			return;
		}
		
		$.ajax({
			url : "/regTeamMemberProc.do",
			type : "post",
			data : refuseTeam.serialize() + "&refuse=1",
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
	
	//매칭수락
	function matching(){
			
		var regMatch = $("[name='matchWaitingList']");
		
		if (confirm("정말 수락 하시겠습니까?") == false) {
			return;
		}
		alert(regMatch.serialize());
		$.ajax({
			url : "/matchingTeamProc.do",
			type : "post",
			data : regMatch.serialize(),
			success : function(json) {
				var result = json["approveMatch"];
				if (result > 0) {
					alert("수락 처리 되었습니다.");
					var modal = document.querySelector(".modalDiv_matching");
					modal.style.display = "none";
					location.reload();
				}
			},
			error : function() {
				alert("수락중 오류가 발생했습니다.");
			}
		});
		
	};
	
	
	//용병수락
	function regHired(){
			
		var regHired = $("[name='hiredWaitingList']");
		
		if (confirm("정말 수락 하시겠습니까?") == false) {
			return;
		}
		
		$.ajax({
			url : "/regHiredProc.do",
			type : "post",
			data : regHired.serialize() + "&reg=1",
			success : function(json) {
				var result = json["result"];
				if (result > 0) {
					alert("수락 처리 되었습니다.");
					var modal = document.querySelector(".modalDiv_hired");
					modal.style.display = "none";
					location.reload();
				}
			},
			error : function() {
				alert("수락중 오류가 발생했습니다.");
			}
		});
	};
	
	//용병거절
	function refuseHired(){
		
		var refuseHired = $("[name='hiredWaitingList']");
		
		if (confirm("정말 거절 하시겠습니까?") == false) {
			return;
		}
		
		$.ajax({
			url : "/regHiredProc.do",
			type : "post",
			data : refuseHired.serialize() + "&refuse=1",
			success : function(json) {
				var result = json["refuse"];
				if (result == 0) {
					alert("거절 처리 되었습니다.");
					var modal = document.querySelector(".modalDiv_hired");
					modal.style.display = "none";
					location.reload();
				}
			},
			error : function() {
				alert("거절중 오류가 발생했습니다.");
			}
		});
	};
	
	
	
	
	
	//레슨수락
	function regLesson(){
			
		var regLesson = $("[name='lessonWaitingList']");
		
		if (confirm("정말 수락 하시겠습니까?") == false) {
			return;
		}
		
		$.ajax({
			url : "/reglessonProc.do",
			type : "post",
			data : regLesson.serialize() + "&reg=1",
			success : function(json) {
				var result = json["result"];
				if (result > 0) {
					alert("수락 처리 되었습니다.");
					var modal = document.querySelector(".modalDiv_lesson");
					modal.style.display = "none";
					location.reload();
				}
			},
			error : function() {
				alert("수락중 오류가 발생했습니다.");
			}
		});
		
	};
	
	//레슨거절
	function refuseLesson(){
		
		var refuseLesson = $("[name='lessonWaitingList']");
		
		if (confirm("정말 거절 하시겠습니까?") == false) {
			return;
		}
		
		$.ajax({
			url : "/reglessonProc.do",
			type : "post",
			data : refuseLesson.serialize() + "&refuse=1",
			success : function(json) {
				var result = json["refuse"];
				if (result == 0) {
					alert("거절 처리 되었습니다.");
					var modal = document.querySelector(".modalDiv_lesson");
					modal.style.display = "none";
					location.reload();
				}
			},
			error : function() {
				alert("거절중 오류가 발생했습니다.");
			}
		});
		
	};
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//팀원 모집 신청인원
	function modalOpen_waiting(){
		var modal = document.querySelector(".modalDiv_waiting");
		modal.style.display = "block";
	};
	
	function modalClose_waiting(){
		var modal = document.querySelector(".modalDiv_waiting");
		modal.style.display = "none";
	};
	//-----------------------------------------------------------------
	//팀생성
	function modalOpen_regTeam(){
		var modal = document.querySelector(".modalDiv_regTeam");
		modal.style.display = "block";
	};
	
	function modalClose_regTeam(){
		var modal = document.querySelector(".modalDiv_regTeam");
		modal.style.display = "none";
	};
	//-----------------------------------------------------------------
	//내정보에서 팀 클릭했을때
	function modalOpen_myTeamInfo(){
		var modal = document.querySelector(".modalDiv_myTeamInfo");
		modal.style.display = "block";
	};
	
	function modalClose_myTeamInfo(){
		var modal = document.querySelector(".modalDiv_myTeamInfo");
		modal.style.display = "none";
	};
	//-----------------------------------------------------------------
	//매칭신청이 있을때
	function modalOpen_matching(){
		var modal = document.querySelector(".modalDiv_matching");
		modal.style.display = "block";
	};
	
	function modalClose_matching(){
		var modal = document.querySelector(".modalDiv_matching");
		modal.style.display = "none";
	};
	//-----------------------------------------------------------------
	//용병신청이 있을때
	function modalOpen_hired(){
		var modal = document.querySelector(".modalDiv_hired");
		modal.style.display = "block";
	};
	
	function modalClose_hired(){
		var modal = document.querySelector(".modalDiv_hired");
		modal.style.display = "none";
	};
	//-----------------------------------------------------------------
	//레슨신청이 있을때
	function modalOpen_lesson(){
		var modal = document.querySelector(".modalDiv_lesson");
		modal.style.display = "block";
	};
	
	function modalClose_lesson(){
		var modal = document.querySelector(".modalDiv_lesson");
		modal.style.display = "none";
	};
	//-----------------------------------------------------------------
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>

	<div class="communityFreeBoardFormTitle">
		<p class="titleBackgoundText">마이페이지</p>
	</div>
	<!-- ================================================================================================================= -->
	<!-- 내정보  / 팀명 클릭시 팀원리스트 상세보기-->
	<table cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
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
		<div class="bg_myTeamInfo">
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
				
				<br><br><br>
				
				<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
				<caption><b>용병 목록</b></caption>
					<tr>
						<th>이름</th>
						<th>지역</th>
						<th>나이</th>
					</tr>
					<c:forEach var="hired" items="${requestScope.getHiredList}" varStatus="status">
						<tr>
							<td align="center">${hired.name}</td>
							<td align="center">${hired.sido}</td>
							<td align="center">${hired.age}</td>
						</tr>
					</c:forEach>
				</table>
				<c:if test="${empty requestScope.getHiredList}">
					<center>
					<br>
					<b>현재 팀에 용병이 없습니다.</b>
					</center>
				</c:if>
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
			<th>일시</th>
			<th>시간</th>
			<th>상대팀</th>
		</tr>
		<c:forEach var="list" items="${requestScope.getTeamMatchDay}" varStatus="status">
			<tr>
				<td align="center">${list.stadium_name}</td>
				<td align="center">${list.day}</td>
				<td align="center">${list.time_range}</td>
				<td align="center">${list.team_name}</td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${empty requestScope.getTeamMatchDay}">
			<center>
			<br><br>
			<b>예정된 경기가 없습니다.</b>
			</center>
			<div style="height:10px;"></div>
	</c:if>
	
	
	<div style="height:30px;"></div>
	<!-- ================================================================================================================= -->
	<!-- 팀 수락 관련 -->
	<c:if test="${requestScope.myInfo.team_master eq requestScope.myInfo.m_no}">
		<c:if test="${requestScope.WaitingCnt > 0}">
	    	<center>
				<table style="border-collapse:collapse" border="1">
				<tr>
					<td style="cursor:pointer" class="waitingCheck" onclick="modalOpen_waiting()">
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
					<c:forEach var="listTeam" items="${requestScope.waitList}" varStatus="status">
						<tr>
							<td align="center">${listTeam.name}</td>
							<td align="center">${listTeam.age}</td>
							<td align="center">${listTeam.sido}</td>
							<td align="center"><input type="checkbox" class="approve" name="m_no_A" value="${listTeam.m_no}"></td>
						</tr>
					</c:forEach>
				</table>
			</form>
			<div style="height:8px;"></div>
			<button onclick="allApprove()">전체선택</button>
			<button onclick="regTeamMem()">수락</button>
			<button onclick="refuseTeamMem()">거절</button>
			<button onclick="modalClose_waiting()">닫기</button>
			</div>
		</div>
	</div>
	
	<div style="height:30px;"></div>
	<!-- ================================================================================================================= -->
	<!-- 용병 관련 -->
	
	<c:if test="${requestScope.myInfo.team_master eq requestScope.myInfo.m_no}">
		<c:if test="${requestScope.mercWaitingCnt > 0}">
	    	<center>
				<table style="border-collapse:collapse" border="1">
				<tr>
					<td style="cursor:pointer" class="matchWaitingCheck" onclick="modalOpen_hired()">
						용병신청이 있습니다.
					</td>
				</tr>
			</table>
			</center>
		</c:if>
	</c:if>
	
	<div class="modalDiv_hired" align="center"> 
		<div class="bg_hired">
			<div class="modal_hired">
			<form name = "hiredWaitingList">
				<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
					<caption><b>수락대기중</b></caption>
					<tr>
						<th>이름</th>
						<th>나이</th>
						<th>지역</th>
						<th>선택</th>
					</tr>
					<c:forEach var="listhired" items="${requestScope.waitHiredList}" varStatus="status">
						<tr>
							<td align="center">${listhired.name}</td>
							<td align="center">${listhired.age}</td>
							<td align="center">${listhired.sido}</td>
							<td align="center"><input type="checkbox" class="approve" name="m_no_H" value="${listhired.m_no}"></td>
						</tr>
					</c:forEach>
				</table>
				
				
			</form>
			<div style="height:8px;"></div>
			<button onclick="allApprove()">전체선택</button>
			<button onclick="regHired()">수락</button>
			<button onclick="refuseHired()">거절</button>
			<button onclick="modalClose_hired()">닫기</button>
			</div>
		</div>
	</div>
	
	
	<div style="height:30px;"></div>
	
	
	
	
	
	
	
	
	<!-- ================================================================================================================= -->
	<!-- 레슨 관련 -->
	
	<center>
		<table style="border-collapse:collapse" border="1">
			<tr>
				<td style="cursor:pointer" class="matchWaitingCheck" onclick="modalOpen_lesson()">
					레슨 관리
				</td>
			</tr>
		</table>
	</center>
	
	
	<div class="modalDiv_lesson" align="center"> 
		<div class="bg_lesson">
			<div class="modal_lesson">
				
				<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
				<caption><b>나의 레슨 인원</b></caption>
					<tr>
						<th>이름</th>
						<th>지역</th>
						<th>나이</th>
					</tr>
					<c:forEach var="lesson" items="${requestScope.getLessonList}" varStatus="status">
						<tr>
							<td align="center">${lesson.name}</td>
							<td align="center">${lesson.sido}</td>
							<td align="center">${lesson.age}</td>
						</tr>
					</c:forEach>
				</table>
				<c:if test="${empty requestScope.getLessonList}">
					<center>
					<br>
					<b>관리하는 인원이 없습니다.</b>
					</center>
				</c:if>
				
				<br><br><br>
				<form name="lessonWaitingList">
					<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
					<caption><b>신청대기자</b></caption>
						<tr>
							<th>이름</th>
							<th>지역</th>
							<th>나이</th>
							<th>선택</th>
						</tr>
						<c:forEach var="lessonWaiting" items="${requestScope.waitLessonList}" varStatus="status">
							<tr>
								<td align="center">${lessonWaiting.name}</td>
								<td align="center">${lessonWaiting.sido}</td>
								<td align="center">${lessonWaiting.age}</td>
								<td align="center"><input type="checkbox" class="approve" name="m_no_L" value="${lessonWaiting.m_no}"></td>
							</tr>
						</c:forEach>
					</table>
					<c:if test="${empty requestScope.waitLessonList}">
						<center>
						<br>
						<b>대기중인 인원이 없습니다.</b>
						</center>
					</c:if>
					<input type="hidden" name="m_no" value="${sessionScope.m_no}">
				</form>
				<div style="height:8px;"></div>
				<button onclick="allApprove()">전체선택</button>
				<button onclick="regLesson()()">수락</button>
				<button onclick="refuseLesson()">거절</button>
				<button onclick="modalClose_lesson()">닫기</button>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	

	<!-- ================================================================================================================= -->
	<!-- 매칭 관련 -->
	<c:if test="${requestScope.myInfo.team_master eq requestScope.myInfo.m_no}">
		<c:if test="${requestScope.matchWaitingCnt > 0}">
	    	<center>
				<table style="border-collapse:collapse" border="1">
				<tr>
					<td style="cursor:pointer" class="matchWaitingCheck" onclick="modalOpen_matching()">
						매칭신청이 있습니다.
					</td>
				</tr>
			</table>
			</center>
		</c:if>
	</c:if>
	 
	<div class="modalDiv_matching" align="center"> 
		<div class="bg_matching">
			<div class="modal_matching">
			<form name = "matchWaitingList">
				<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" align="center">
					<caption><b>수락대기중</b></caption>
					<tr>
						<th>팀 명</th>
						<th>팀장명</th>
						<th>경기장</th>
						<th>일 시</th>
						<th>시 간</th>
						<th>선택</th>
					</tr>
					<c:forEach var="listMatch" items="${requestScope.matchWaitingList}" varStatus="status">
						<tr>
							<td align="center">${listMatch.team_name}</td>
							<td align="center">${listMatch.nickname}</td>
							<td align="center">${listMatch.stadium_name}</td>
							<td align="center">${listMatch.day}</td>
							<td align="center">${listMatch.time_range}</td>
							<td align="center"><input type="radio" class="approve" name="vs_team" value="${listMatch.vs_team}"></td>
						</tr>
						<input type="hidden" name="stadium" value="${listMatch.stadium}">
						<input type="hidden" name="time_no"    value="${listMatch.time_no}">
					</c:forEach>
				</table>
				
				<input type="hidden" name="m_no" value="${sessionScope.m_no}">
				<input type="hidden" name="match_team" value="${requestScope.myInfo.team_no}">

				 
			</form>
			<div style="height:8px;"></div>
			<button onclick="matching()">수락</button>
			<button onclick="">거절</button>
			<button onclick="modalClose_matching()">닫기</button>
			</div>
		</div>
	</div>
	  
	
	<div style="height:30px;"></div>
	
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
			<form name = "teamRegist" onsubmit="return false;">
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
				<button onclick="regTeam()">생성</button>
				<button onclick="modalClose_regTeam()">닫기</button>
			</div>
		</div>
	</div>
	
	<!-- ================================================================================================================= -->
	
	
	
	
	
	
	<div style="height:50px;"></div>

	
</body>
</html>