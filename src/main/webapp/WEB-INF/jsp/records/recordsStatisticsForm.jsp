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
<script>
	function clickToSort(sort){
		
		var formObj = $("[name='recordsStatisticsForm']")
		
		$("[name='recordsStatisticsForm']").find("[name='sort']").val(sort);
		$(".recordsStatisticsForm").submit();
		
		$.ajax({
			
			url:"/records/recordsStatisticsForm.do",
			
			type:"post",
			
			data:formObj.serialize(),
			
			success: function(responseHtml){
				var obj = $(responseHtml);
				
				$("[name = recordsStatisticsForm]").html(
					obj.filter("[name = recordsStatisticsForm]").html()	
				);
			},
			
			error: function(){alert("Sort 실패")}
		})
	}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recordsStatisticsFormTitle">
    	<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">통계</p>
    </div>
    <form name="recordsStatisticsForm" onsubmit="return false">
	    <input type="hidden" name="sort" class="sort">
	    <div class="recordsStatisticsFormTableDiv">
	    	<table class="recordsStatisticsFormTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin:0 auto; margin-top:10px; width:1000px;">
	    		<tr>
	    			<th style="width:50px;">순위</th>
	    			<th style="width:50px;">선수</th>
	    			<c:if test="${param.sort!='games_played asc' and param.sort != 'games_played desc'}">
	    				<th onClick="clickToSort('games_played desc')"style="width:50px; cursor:pointer;">경기수</th>
	    			</c:if>
	    			<c:if test="${param.sort == 'games_played desc'}">
	    				<th onClick="clickToSort('games_played asc')"style="width:50px; cursor:pointer;">경기수 ▽</th>
	    			</c:if>
	    			<c:if test="${param.sort == 'games_played asc'}">
	    				<th onClick="clickToSort('')"style="width:50px; cursor:pointer;">경기수 △</th>
	    			</c:if>
	    			<c:if test="${param.sort!='wins asc' and param.sort != 'wins desc'}">
	    				<th onClick="clickToSort('wins desc')"style="width:50px; cursor:pointer;">승</th>
	    			</c:if>
	    			<c:if test="${param.sort == 'wins desc'}">
	    				<th onClick="clickToSort('wins asc')"style="width:50px; cursor:pointer;">승 ▽</th>
	    			</c:if>
	    			<c:if test="${param.sort =='wins asc'}">
	    				<th onClick="clickToSort('')"style="width:50px; cursor:pointer;">승 △</th>
	    			</c:if>
	    			<c:if test="${param.sort!='draws asc' and param.sort != 'draws desc'}">
	    				<th onClick="clickToSort('draws desc')"style="width:50px; cursor:pointer;">무</th>
	    			</c:if>
	    			<c:if test="${param.sort == 'draws desc'}">
	    				<th onClick="clickToSort('draws asc')"style="width:50px; cursor:pointer;">무 ▽</th>
	    			</c:if>
	    			<c:if test="${param.sort =='draws asc'}">
	    				<th onClick="clickToSort('')"style="width:50px; cursor:pointer;">무 △</th>
	    			</c:if>
	    			<c:if test="${param.sort!='losses asc' and param.sort != 'losses desc'}">
	    				<th onClick="clickToSort('losses desc')"style="width:50px; cursor:pointer;">패</th>
	    			</c:if>
	    			<c:if test="${param.sort == 'losses desc'}">
	    				<th onClick="clickToSort('losses asc')"style="width:50px; cursor:pointer;">패 ▽</th>
	    			</c:if>
	    			<c:if test="${param.sort =='losses asc'}">
	    				<th onClick="clickToSort('')"style="width:50px; cursor:pointer;">패 △</th>
	    			</c:if>
	    			<c:if test="${param.sort!='goals_for asc' and param.sort != 'goals_for desc'}">
	    				<th onClick="clickToSort('goals_for desc')"style="width:50px; cursor:pointer;">득점</th>
	    			</c:if>
	    			<c:if test="${param.sort == 'goals_for desc'}">
	    				<th onClick="clickToSort('goals_for asc')"style="width:50px; cursor:pointer;">득점 ▽</th>
	    			</c:if>
	    			<c:if test="${param.sort =='goals_for asc'}">
	    				<th onClick="clickToSort('')"style="width:50px; cursor:pointer;">득점 △</th>
	    			</c:if>
	    			<c:if test="${param.sort!='goals_assist asc' and param.sort != 'goals_assist desc'}">
	    				<th onClick="clickToSort('goals_assist desc')"style="width:50px; cursor:pointer;">도움</th>
	    			</c:if>
	    			<c:if test="${param.sort == 'goals_assist desc'}">
	    				<th onClick="clickToSort('goals_assist asc')"style="width:50px; cursor:pointer;">도움 ▽</th>
	    			</c:if>
	    			<c:if test="${param.sort =='goals_assist asc'}">
	    				<th onClick="clickToSort('')"style="width:50px; cursor:pointer;">도움 △</th>
	    			</c:if>
	    			<c:forEach var="recordsStatistics" items="${requestScope.recordsStatistics}" varStatus="status">
						<tr>
							<td align="center">${status.count}</td>
							<!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
							<td align="center">${recordsStatistics.nickname}</td>
							<td align="center">${recordsStatistics.games_played}</td>
							<td align="center">${recordsStatistics.wins}</td>
							<td align="center">${recordsStatistics.draws}</td>
							<td align="center">${recordsStatistics.losses}</td>
							<td align="center">${recordsStatistics.goals_for}</td>
							<td align="center">${recordsStatistics.goals_assist}</td>
						</tr>
					</c:forEach>
	    		</tr>
	    	</table>
	    </div>
	</form>
</body>
</html>