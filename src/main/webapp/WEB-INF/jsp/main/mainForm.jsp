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
<!-- 지역 차트 함수 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {
    'packages':['geochart'],
    });
    google.charts.setOnLoadCallback(drawRecordsStatisticsRegionRatioChart);

    function drawRecordsStatisticsRegionRatioChart() {
        var data = google.visualization.arrayToDataTable([
            ['Region', 'Popularity'],
            <c:forEach var="regionRatio" items="${requestScope.regionRatio}" varStatus="status">
	            ['서울', ${regionRatio.count_seoul}],
	            ['경기도', ${regionRatio.count_gyeonggido}],
	            ['강원도', ${regionRatio.count_gangwondo}],
	            ['충청남도', ${regionRatio.count_chungcheongdo}],
	            ['충청북도', ${regionRatio.count_chungcheongdo}],
	            ['전라남도', ${regionRatio.count_jeollado}],
	            ['전라북도', ${regionRatio.count_jeollado}],
	            ['경상남도', ${regionRatio.count_gyeongsangdo}],
	            ['경상북도', ${regionRatio.count_gyeongsangdo}],
	            ['대구', ${regionRatio.count_gyeongsangdo}],
	            ['제주도', ${regionRatio.count_jejudo}]
	    	</c:forEach>
        ]);

        var options = {
            region: 'KR',
            displayMode: 'regions',
            resolution: 'provinces',
            colorAxis: { minValue: 0 },
            title: '지역별 이용자 수',
            backgroundColor: "#F5F5F5"
        };

        var chart = new google.visualization.GeoChart(document.getElementById('recordsStatisticsRegionRatio'));

        chart.draw(data, options);
    }
</script>

<!-- 성별 차트 함수 -->

<script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawRecordsStatisticsGenderRatioChart);
    function drawRecordsStatisticsGenderRatioChart() {
    var data = google.visualization.arrayToDataTable([
        ['Gender', '회원 수'],
        <c:forEach var="genderRatio" items="${requestScope.genderRatio}" varStatus="status">
	        ['남', ${genderRatio.count_men}],
	        ['여', ${genderRatio.count_women}]
	    </c:forEach>
    ]);

    var options = {
        is3D: true,
        backgroundColor: "#F5F5F5"
    };

    var chart = new google.visualization.PieChart(document.getElementById('recordsStatisticsGenderRatio'));
    chart.draw(data, options);
    }
</script>

<!-- 연령별 차트 함수 -->

<script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawRecordsStatisticsAgeRatioChart);
    function drawRecordsStatisticsAgeRatioChart() {
    var data = google.visualization.arrayToDataTable([
        ["연령대", "회원 수", { role: "style" } ],
        <c:forEach var="ageRatio" items="${requestScope.ageRatio}" varStatus="status">
	        ["10대", ${ageRatio.count_10}, "red"],
	        ["20대", ${ageRatio.count_20}, "orange"],
	        ["30대", ${ageRatio.count_30}, "yellow"],
	        ["40대", ${ageRatio.count_40}, "green"],
	        ["50대", ${ageRatio.count_50}, "blue"],
	        ["60대", ${ageRatio.count_60}, "navy"],
	        ["70대", ${ageRatio.count_70}, "purple"],
	        ["80대", ${ageRatio.count_80}, "blue"]
	   	</c:forEach>
    ]);

    var options = {
    	backgroundColor: "#F5F5F5"
    };

    var chart = new google.visualization.ColumnChart(document.getElementById("recordsStatisticsAgeRatio"));
    chart.draw(data, options);
    }
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="mainFormContainer">
		<div class="section" id="sectionMain">
			<div class="sectionMainTextDiv">
				<div class="sectionMainText" id="sectionMainText_1">FOOTBALL LEAGUE</div>
				<br>
				<div class="sectionMainText" id="sectionMainText_2">2024 생활체육 축구 매칭</div>
				<br>
				<div class="sectionMainText" id="sectionMainText_3">축구 매칭과 함께하는 내게 맞는 팀 구성</div>
				<br>
				<div class="sectionMainText" id="sectionMainText_4"><strong>5월 24일 개설</strong></div>
				<br>
				<div class="sectionMainText" id="sectionMainText_5">Coding 247</div>
			</div>
			<img src="/image/MainImage.jpg">
		</div>
		<div class="section" id="sectionStatistics">
			<div class="sectionStatisticsTitle">
				<strong>Statistics</strong>
			</div>
			<div class="sectionStatisticsContainer">
				<div class="recordsStatisticsRegionRatioContainer">
			        <div class="recordsStatisticsRegionRatioTitle"><p>지역별 비율</p></div>
			        <div id="recordsStatisticsRegionRatio" style="width: 500px; height: 500px;"></div>
			    </div>
			    <div class="recordsStatisticsGenderRatioContainer">
			        <div class="recordsStatisticsGenderRatioTitle"><p>성별 비율</p></div>
			        <div id="recordsStatisticsGenderRatio" style="width: 500px; height: 500px;"></div>
			    </div>
			    <div class="recordsStatisticsAgeRatioContainer">
			        <div class="recordsStatisticsAgeRatioTitle"><p>연령별 비율</p></div>
			        <div id="recordsStatisticsAgeRatio" style="width: 500px; height: 500px;"></div>
			    </div>
			</div>
		</div>
		<div class="section" id="sectionRanking">
			<div class="sectionRankingTitle">
				<strong>Ranking</strong>
			</div>
			<div class="sectionRankingContiner">
				<div class="recordsRankingFormCategoryTab">
			    	<ul class="recordsRankingFormCategoryTabNav">
				    	<li><a href="#recordsRankingFormCategoryTabAll">전체 순위</a></li>
				    	<li><a href="#recordsRankingFormCategoryTabRegion">지역별 순위</a> <!-- ajax로 지역 구분 -->
				    		<div class="recordsRankingFormCategoryTabSelectDiv">
						    	<table class="recordsRankingFormCategoryTabSelect" align="center" style="border-collapse:collapse">
						    		<!-- <tr align="center">
						    			<td class="region selected" onClick="searchRegion(9)">서울</td>
						    			<td class="region" onClick="searchRegion(2, 11)">경기/인천</td>
						    			<td class="region" onClick="searchRegion(1)">강원</td>
						    			<td class="region" onClick="searchRegion(7, 15, 16)">충청</td>
						    		</tr>
						    		<tr align="center">
						    			<td class="region" onClick="searchRegion(5, 12, 13)">전라</td>
						    			<td class="region" onClick="searchRegion(3, 4, 6, 8, 10)">경상</td>
						    			<td class="region" onClick="searchRegion(14)">제주</td>
						    		</tr> -->
						    		<tr align="center">
						    			<td class="region selected" onClick="searchRegion(9)">서울</td>
						    			<td class="region" onClick="searchRegion(2)">경기/인천</td>
						    			<td class="region" onClick="searchRegion(1)">강원</td>
						    			<td class="region" onClick="searchRegion(7)">충청</td>
						    		</tr>
						    		<tr align="center">
						    			<td class="region" onClick="searchRegion(5)">전라</td>
						    			<td class="region" onClick="searchRegion(3)">경상</td>
						    			<td class="region" onClick="searchRegion(14)">제주</td>
						    		</tr>
						    	</table>
						    </div>
					    </li>
				    	<li><a href="#recordsRankingFormCategoryTabGender">성별 순위</a> <!-- ajax로 남/녀 구분 -->
				    		<div class="recordsRankingFormCategoryTabSelectDiv">
						    	<table class="recordsRankingFormCategoryTabSelect" align="center" style="border-collapse:collapse; width: 100%;">
						    		<tr>
						    			<td class="gender selected" onClick="searchGender('남')" style="width: 50%; text-align: center;">남</td>
						    			<td class="gender" onClick="searchGender('여')" style="width: 50%; text-align: center;">여</td>
						    		</tr>
						    	</table>
						    </div>
					    </li>
				    	<li><a href="#recordsRankingFormCategoryTabAge">연령대별 순위</a> <!-- ajax로 연령대 구분 -->
				    		<div class="recordsRankingFormCategoryTabSelectDiv">
						    	<table class="recordsRankingFormCategoryTabSelect" align="center" style="border-collapse:collapse">
						    		<tr>
						    			<td class="age selected" onClick="searchAge('10대')">10대</td>
						    			<td class="age" onClick="searchAge('20대')">20대</td>
						    			<td class="age" onClick="searchAge('30대')">30대</td>
						    			<td class="age" onClick="searchAge('40대')">40대</td>
						    		</tr>
						    		<tr>
						    			<td class="age" onClick="searchAge('50대')">50대</td>
						    			<td class="age" onClick="searchAge('60대')">60대</td>
						    			<td class="age" onClick="searchAge('70대')">70대</td>
						    			<td class="age" onClick="searchAge('80대')">80대</td>
						    		</tr>
						    	</table>
						    </div>
					    </li>
				    </ul>
				    <div class="recordsRankingFormCategoryTabContent">
				    	<div id="recordsRankingFormCategoryTabAll">
						    <div class="recordsRankingFormTabAllRating">
							    <table class="recordsRankingFormTabAllGoalRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2">최다 승</th>
							    	</tr>
							    	<c:forEach var="recordsGoalRatingTabAll" items="${requestScope.recordsWinRatingTabAll}" varStatus="status" begin="0" end="2">
								    	<tr>
								    		<td>${recordsGoalRatingTabAll.nickname}</td>
								    		<td>${recordsGoalRatingTabAll.wins} 승</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabAllWinRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2">최다 득점</th>
							    	</tr>
							    	<c:forEach var="recordsWinRatingTabAll" items="${requestScope.recordsGoalRatingTabAll}" varStatus="status" begin="0" end="2">
								    	<tr>
								    		<td>${recordsWinRatingTabAll.nickname}</td>
								    		<td>${recordsWinRatingTabAll.goals_for} 골</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabAllAssistRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2">최다 도움</th>
							    	</tr>
							    	<c:forEach var="recordsAssistRatingTabAll" items="${requestScope.recordsAssistRatingTabAll}" varStatus="status" begin="0" end="2">
								    	<tr>
								    		<td>${recordsAssistRatingTabAll.nickname}</td>
								    		<td>${recordsAssistRatingTabAll.goals_assist} 회</td>
								    	</tr>
								    </c:forEach>
							    </table>
							</div>
						</div>
						<!-- -------------------------------------------------------------------------------------------------------------------------- -->
						<!-- --------------------------------------------지      역      별      순      위----------------------------------------------- -->
						<!-- -------------------------------------------------------------------------------------------------------------------------- -->
						<div id="recordsRankingFormCategoryTabRegion">
						    <div class="recordsRankingFormTabRegionRating">
							    <table class="recordsRankingFormTabRegionWinRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2">최다 승</th>
							    	</tr>
							    	<c:forEach var="recordsGoalRatingTabRegion" items="${requestScope.recordsWinRatingTabRegion}" varStatus="status" begin="0" end="2">
								    	<tr>
								    		<td>${recordsGoalRatingTabRegion.nickname}</td>
								    		<td>${recordsGoalRatingTabRegion.wins} 승</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabRegionGoalRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2">최다 득점</th>
							    	</tr>
							    	<c:forEach var="recordsWinRatingTabRegion" items="${requestScope.recordsGoalRatingTabRegion}" varStatus="status" begin="0" end="2">
								    	<tr>
								    		<td>${recordsWinRatingTabRegion.nickname}</td>
								    		<td>${recordsWinRatingTabRegion.goals_for} 골</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabRegionAssistRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2">최다 도움</th>
							    	</tr>
							    	<c:forEach var="recordsAssistRatingTabRegion" items="${requestScope.recordsAssistRatingTabRegion}" varStatus="status" begin="0" end="2">
								    	<tr>
								    		<td>${recordsAssistRatingTabRegion.nickname}</td>
								    		<td>${recordsAssistRatingTabRegion.goals_assist} 회</td>
								    	</tr>
								    </c:forEach>
							    </table>
							</div>
						</div>
						<!-- -------------------------------------------------------------------------------------------------------------------------- -->
						<!-- -------------------------------------------------성      별      순      위------------------------------------------------- -->
						<!-- -------------------------------------------------------------------------------------------------------------------------- -->
						<div id="recordsRankingFormCategoryTabGender">
						    <div class="recordsRankingFormTabGenderRating">
							    <table class="recordsRankingFormTabGenderWinRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2">최다 승</th>
							    	</tr>
							    	<c:forEach var="recordsGoalRatingTabGender" items="${requestScope.recordsWinRatingTabGender}" varStatus="status" begin="0" end="2">
								    	<tr>
								    		<td>${recordsGoalRatingTabGender.nickname}</td>
								    		<td>${recordsGoalRatingTabGender.wins} 승</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabGenderGoalRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2">최다 득점</th>
							    	</tr>
							    	<c:forEach var="recordsWinRatingTabGender" items="${requestScope.recordsGoalRatingTabGender}" varStatus="status" begin="0" end="2">
								    	<tr>
								    		<td>${recordsWinRatingTabGender.nickname}</td>
								    		<td>${recordsWinRatingTabGender.goals_for} 골</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabGenderAssistRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2">최다 도움</th>
							    	</tr>
							    	<c:forEach var="recordsAssistRatingTabGender" items="${requestScope.recordsAssistRatingTabGender}" varStatus="status" begin="0" end="2">
								    	<tr>
								    		<td>${recordsAssistRatingTabGender.nickname}</td>
								    		<td>${recordsAssistRatingTabGender.goals_assist} 회</td>
								    	</tr>
								    </c:forEach>
							    </table>
							</div>
						</div>
						<!-- -------------------------------------------------------------------------------------------------------------------------- -->
						<!-- --------------------------------------------연      령      별      순      위----------------------------------------------- -->
						<!-- -------------------------------------------------------------------------------------------------------------------------- -->
						<div id="recordsRankingFormCategoryTabAge">
						    <div class="recordsRankingFormTabAgeRating">
							    <table class="recordsRankingFormTabAgeWinRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2">최다 승</th>
							    	</tr>
							    	<c:forEach var="recordsGoalRatingTabAge" items="${requestScope.recordsWinRatingTabAge}" varStatus="status" begin="0" end="2">
								    	<tr>
								    		<td>${recordsGoalRatingTabAge.nickname}</td>
								    		<td>${recordsGoalRatingTabAge.wins} 승</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabAgeGoalRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2">최다 득점</th>
							    	</tr>
							    	<c:forEach var="recordsWinRatingTabAge" items="${requestScope.recordsGoalRatingTabAge}" varStatus="status" begin="0" end="2">
								    	<tr>
								    		<td>${recordsWinRatingTabAge.nickname}</td>
								    		<td>${recordsWinRatingTabAge.goals_for} 골</td>
								    	</tr>
								    </c:forEach>
							    </table>
							    <table class="recordsRankingFormTabAgeAssistRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
							    	<tr>
							    		<th colspan="2">최다 도움</th>
							    	</tr>
							    	<c:forEach var="recordsAssistRatingTabAge" items="${requestScope.recordsAssistRatingTabAge}" varStatus="status" begin="0" end="2">
								    	<tr>
								    		<td>${recordsAssistRatingTabAge.nickname}</td>
								    		<td>${recordsAssistRatingTabAge.goals_assist} 회</td>
								    	</tr>
								    </c:forEach>
							    </table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section" id="sectionSchedule">
			<div class="sectionScheduleTitle">
				<strong>Schedule</strong>
			</div>
			<div class="regionlist">
				<div class="sectionScheduleContainer">
					<c:forEach var="mainTournamentList" items="${requestScope.mainTournamentList}" varStatus="status">
						<div class="sectionScheduleFormBoard">
							<div class="sectionScheduleFormBoardImageDiv">
								<img src="/image/SoccerBall.jpg" class="sectionScheduleTournamentImg">
							</div>
							<div class="sectionScheduleFormBoardSubject">${mainTournamentList.subject}</div>
							<div class="sectionScheduleFormBoardRegion">대회 지역 : ${mainTournamentList.region}</div>
							<div class="sectionScheduleFormBoardRegist">신청 기간 : ${mainTournamentList.regist_start} ~ ${mainTournamentList.regist_end}</div>
						</div>
					</c:forEach>
				</div>
			</div> 
		</div>
		<div class="section" id="sectionMedia">
			<div class="sectionMediaGallaryTitle">
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