<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainForm</title>
<link href="/style/main/mainFormStyle.css" rel="stylesheet">
<script src="/js/main/mainFormScript.js"></script>
<script>
	ing_or_end = "초기";
	$(function(){ing();})
	

	function ing(){
		$(".tournament").click(function(){
			$(".tournament").removeClass("selected2");
			$(this).addClass("selected2");
		})
	
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth()+1;
		var day = now.getDate();
		var nowdate = year + "-" + "0" + month + "-" + day;
	
		$.ajax({
			
			url   : "/tournamentBoardForm.do",
			
			type : "post",
			
			data : "ing=" + nowdate,
			
			success : function(responseHtml){
						var obj = $(responseHtml);
						$(".regionlist").html(obj.filter(".regionlist").html()  );
						ing_or_end = "진행";
					}			
			
			,error : function(){alert("검색 실패 / 관리자에게 문의 바람");}
		}) 
	};
	
	function end(){
		$(".tournament").click(function(){
			$(".tournament").removeClass("selected2");
			$(this).addClass("selected2");
		})
		
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth()+1;
		var day = now.getDate();
		var nowdate = year + "-" + "0" + month + "-" + day;
		
		$.ajax({

			url   : "/tournamentBoardForm.do",
			
			type : "post",
			
			data : "end=" + nowdate,
			
			success : function(responseHtml){
				var obj = $(responseHtml);
				$(".regionlist").html(obj.filter(".regionlist").html()  );
				ing_or_end = "끝";},
				
			error : function(){alert("검색 실패 / 관리자에게 문의 바람");}
		})
	};
	
	function search(text){
		$(".region").click(function(){
			
			$(".region").removeClass("selected");
			$(this).addClass("selected");
			
		})
		
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth()+1;
		var day = now.getDate();
		var nowdate = year + "-" + "0" + month + "-" + day;
		
		if(ing_or_end == "진행")
		{
			$.ajax({
				//----------------------------------------------------------
				//WAS 에 접속할 URL 주소 지정
				//----------------------------------------------------------
				url   : "/tournamentBoardForm.do" 
				//----------------------------------------------------------
				//form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
				//----------------------------------------------------------
				,type : "post"
				//----------------------------------------------------------
				//WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
				//----------------------------------------------------------
				,data : "region=" + text + "&ing=" + nowdate
					
				,success : function(responseHtml){
					
					var obj = $(responseHtml);
					
					$(".xxx").html( $(responseHtml).find(".xxx").html()  )
					
					
					
		
				}			
				,error 	 : function(){alert("검색 실패 / 관리자에게 문의 바람");}
				
			})
		}
		
		else if(ing_or_end == "끝")
		{
			$.ajax({
				//----------------------------------------------------------
				//WAS 에 접속할 URL 주소 지정
				//----------------------------------------------------------
				url   : "/tournamentBoardForm.do" 
				//----------------------------------------------------------
				//form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
				//----------------------------------------------------------
				,type : "post"
				//----------------------------------------------------------
				//WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
				//----------------------------------------------------------
				,data : "region=" + text + "&end=" + nowdate
					
				,success : function(responseHtml){
					
					var obj = $(responseHtml);
					
					$(".xxx").html( $(responseHtml).find(".xxx").html()  )
					
			
					
		
				}			
				,error 	 : function(){alert("검색 실패 / 관리자에게 문의 바람");}
				
			})
		}
			
	} 
		
	
	
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="mainFormContainer">
		<div class="section" id="sectionMain">
			<div class="sectionMainText">안녕하세요<br>우리는 1조<br>축구 매칭 사이트 제작<br>병합완료<br>cjk Branch</div>
			<img src="/image/MainImage.jpg">
		</div>
		<div class="section" id="sectionStatistics">
			통계 Section
		</div>
		<div class="section" id="sectionRanking">
			랭킹 Section
		</div>
		<div class="section" id="sectionSchedule">
			<div>
				<strong>Schedule</strong>
			</div>
    		<table class="sectionScheduleChoiceTable" border="1" bordercolor="black" cellpadding="7" align="center">
    			<tr class="ing_end">
    				<td width="100" class="tournament selected2" onClick="ing()"><b>진행중인 대회</b></td>
    				<td width="100" class="tournament" onClick="end()"><b>마감된 대회</b></td>
    			</tr>
			</table>
			<div class="regionlist">	
				<table class="sectionScheduleRegionTable" align="center">
					<tr class="sectionScheduleRegionTableSelect">
						<td class="region selected"  onClick="search('전체')">&middot;전체</td>
						<td class="region" onClick="search('서울')">&middot;서울</td>
						<td class="region" onClick="search('경기')">&middot;경기/인천</td>
						<td class="region" onClick="search('강원')">&middot;강원</td>
						<td class="region" onClick="search('충청')">&middot;충청</td>
						<td class="region" onClick="search('전라')">&middot;전라</td>
						<td class="region" onClick="search('경상')">&middot;경상</td>
						<td class="region" onClick="search('제주')">&middot;제주</td>
					</tr>
				</table>
				<table class="sectionScheduleTournamentTable">
					<c:forEach var="gameList" items="${requestScope.tournamentList}">
					<tr class="sectionScheduleTournamentTableList" onClick="">
						<td rowspan="3">
							<img src="/image/SoccerBackground.jpg" class="titleBackgroundImg">
						</td>
						<td>
							<b>${gameList.subject}</b>
						</td>
					</tr>
					<tr>
						<td>
							대회지역 = ${gameList.region}
						</td>
					</tr>
					<tr>
						<td>
							신청기간 = ${gameList.regist_start} ~ ${gameList.regist_end}
						</td>
					</tr>
					</c:forEach>
					<c:if test="${empty requestScope.tournamentList}">
							조건에 맞는 결과물이 없습니다.
					</c:if>
				</table>
			</div> 
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