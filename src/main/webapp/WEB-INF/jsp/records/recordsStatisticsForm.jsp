<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecordsStatisticsForm</title>
<link href="/style/records/recordsStatisticsFormStyle.css" rel="stylesheet">
<!-- <script src="/js/recordsStatisticsFormScript.js"></script> -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
	<!-- 매칭 성공률 차트 함수 -->

<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawRecordsStatisticsMatchingSuccessRateChart);

    function drawRecordsStatisticsMatchingSuccessRateChart() {
        var data = google.visualization.arrayToDataTable([
        ['Year', '성공률'],
        ['2013',  0],
        ['2014',  0],
        ['2015',  0],
        ['2016',  0]
        ]);

        var options = {
        title: '매칭 성공률',
        hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
        vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('recordsStatisticsMatchingSuccessRate'));
        chart.draw(data, options);
    }
</script>

<!-- 연도별 등록 회원 차트 함수 -->

<script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawRecordsStatisticsAnnualRegisteredMemberRatioChart);
    function drawRecordsStatisticsAnnualRegisteredMemberRatioChart() {
    var data = google.visualization.arrayToDataTable([
        ["연도", "회원 수", { role: "style" } ],
        <c:forEach var="annualRegisteredMember" items="${requestScope.annualRegisteredMember}" varStatus="status">
	        ["2000", ${annualRegisteredMember.count_2000}, "red"],
	        ["2005", ${annualRegisteredMember.count_2005}, "orange"],
	        ["2010", ${annualRegisteredMember.count_2010}, "yellow"],
	        ["2015", ${annualRegisteredMember.count_2015}, "green"],
	        ["2020", ${annualRegisteredMember.count_2020}, "blue"],
	        ["2024", ${annualRegisteredMember.count_2024}, "navy"]
		</c:forEach>
    ]);

    var options = {
    };

    var chart = new google.visualization.ColumnChart(document.getElementById("recordsStatisticsAnnualRegisteredMemberRatio"));
    chart.draw(data, options);
    }
</script>

<!-- 지역 차트 함수 -->

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
            title: '지역별 이용자 수'
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
        is3D: true
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
    };

    var chart = new google.visualization.ColumnChart(document.getElementById("recordsStatisticsAgeRatio"));
    chart.draw(data, options);
    }
</script>

<!-- 팀 별 인원수 -->

<script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawRecordsStatisticsNumberOfTeamMemberChart);
    function drawRecordsStatisticsNumberOfTeamMemberChart() {
    var data = google.visualization.arrayToDataTable([
        ["팀", "팀원 수", { role: "style" } ],
        ["A팀", 0, "red"],
        ["B팀", 0, "orange"],
        ["C팀", 0, "yellow"],
        ["D팀", 0, "green"],
        ["E팀", 0, "blue"],
        ["F팀", 0, "navy"],
        ["G팀", 0, "purple"],
        ["H팀", 0, "blue"]
    ]);

    var options = {
    };

    var chart = new google.visualization.ColumnChart(document.getElementById("recordsStatisticsNumberOfTeamMember"));
    chart.draw(data, options);
    }
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recordsStatisticsFormTitle">
    	<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">통계</p>
    </div>
    <div class="recordsStatisticsMatchingSuccessRateContainer">
        <div class="recordsStatisticsMatchingSuccessRateTitle"><p>매칭 성공률</p></div>
        <div id="recordsStatisticsMatchingSuccessRate" style="width: 100%; height: 500px;"></div>
    </div>
    <div class="recordsStatisticsAnnualRegisteredMemberRatioContainer">
        <div class="recordsStatisticsAnnualRegisteredMemberRatioTitle"><p>연도별 등록 회원 비율</p></div>
        <div id="recordsStatisticsAnnualRegisteredMemberRatio" style="width: 900px; height: 300px;"></div>
    </div>
    <div class="recordsStatisticsRegionRatioContainer">
        <div class="recordsStatisticsRegionRatioTitle"><p>지역별 비율</p></div>
        <div id="recordsStatisticsRegionRatio" style="width: 900px; height: 500px;"></div>
    </div>
    <div class="recordsStatisticsGenderRatioContainer">
        <div class="recordsStatisticsGenderRatioTitle"><p>성별 비율</p></div>
        <div id="recordsStatisticsGenderRatio" style="width: 900px; height: 500px;"></div>
    </div>
    <div class="recordsStatisticsAgeRatioContainer">
        <div class="recordsStatisticsAgeRatioTitle"><p>연령별 비율</p></div>
        <div id="recordsStatisticsAgeRatio" style="width: 900px; height: 300px;"></div>
    </div>
    <div class="recordsStatisticsNumberOfTeamMemberContainer">
        <div class="recordsStatisticsNumberOfTeamMemberTitle"><p>팀원 수</p></div>
        <div id="recordsStatisticsNumberOfTeamMember" style="width: 900px; height: 300px;"></div>
	</div>
</body>
</html>