<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecordsRankingForm</title>
<link href="/style/records/recordsRankingFormStyle.css" rel="stylesheet">
<!-- <script src="/js/recordsRankingFormScript.js"></script> -->
<script>
// Category 선택 

	$(function(){
		$('.recordsRankingFormCategoryTabContent > div, .recordsRankingFormCategoryTabSelectDiv').hide();
		$('.recordsRankingFormCategoryTabNav a').click(function(){
			
			var index = $(this).parent().index();
			
			$('.recordsRankingFormCategoryTabSelectDiv').hide();
			
	        $(this).parent().find('.recordsRankingFormCategoryTabSelectDiv').show();
			
			$('.recordsRankingFormCategoryTabContent > div').hide().filter(this.hash).fadeIn();
			
			$('.recordsRankingFormCategoryTabNav a').removeClass('active');
			
			$(this).addClass('active');
			
			return false;
			
		}).filter(':eq(0)').click();
		
		// 각 탭 초기화
		
		$('.recordsRankingFormCategoryTabNav a[href="#recordsRankingFormCategoryTabRegion"]').click(function() {
	        $('.recordsRankingFormCategoryTabSelectDiv').hide();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(0)').show();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(0) .region').removeClass('selected');
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(0) .region:first').addClass('selected');
	    });
	    
	    $('.recordsRankingFormCategoryTabNav a[href="#recordsRankingFormCategoryTabGender"]').click(function() {
	        $('.recordsRankingFormCategoryTabSelectDiv').hide();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(1)').show();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(1) .gender').removeClass('selected');
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(1) .gender:first').addClass('selected');
	    });
	    
	    $('.recordsRankingFormCategoryTabNav a[href="#recordsRankingFormCategoryTabAge"]').click(function() {
	        $('.recordsRankingFormCategoryTabSelectDiv').hide();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(2)').show();
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(2) .age').removeClass('selected');
	        $('.recordsRankingFormCategoryTabSelectDiv:eq(2) .age:first').addClass('selected');
	    });
	});

// 지역 카테고리 선택

	function searchRegion(text){
		
		$(".region").click(function(){
			$(".region").removeClass("selected");
			$(this).addClass("selected");
		});
		
		var formObj = $("[name='recordsRankingFormTabRegion']");
		
		$.ajax({

			url : "/recordsRankingForm.do",
			
			type : "post",
			
			data : formObj.serialize(),
			
			success : function(responseHtml){
			
						var obj = $(responseHtml);
						
						$(".recordsRankingFormTable").html(obj.find(".recordsRankingFormTable").html());
					},
			
			error : function(){alert("지역 변경 오류")}
		});
	
	}
	
// 성별 카테고리 선택

	function searchGender(text){
		
		$(".gender").click(function(){
			$(".gender").removeClass("selected");
			$(this).addClass("selected");
		});
	
	}
	
// 연령대 카테고리 선택

	function searchAge(text){
		
		$(".age").click(function(){
			$(".age").removeClass("selected");
			$(this).addClass("selected");
		});
	
	}

// Sort

	function clickToSort(sort){
		
		var formObj = $("[name='recordsRankingFormTabAll']")
		
		$("[name='recordsRankingFormTabAll']").find("[name='sort']").val(sort);
		$(".recordsRankingFormTabAllTableDiv").submit();
		
		$.ajax({
			
			url:"/recordsRankingForm.do",
			
			type:"post",
			
			data:formObj.serialize(),
			
			success: function(responseHtml){
				var obj = $(responseHtml);
				
				$("[name = recordsRankingFormTabAll]").html(
					obj.find("[name = recordsRankingFormTabAll]").html()	
				);
			},
			
			error: function(){alert("Sort 실패")}
		})
	}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recordsRankingFormTitle">
    	<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">랭킹</p>
    </div>
    <div class="recordsRankingFormCategoryTab">
    	<ul class="recordsRankingFormCategoryTabNav">
	    	<li><a href="#recordsRankingFormCategoryTabAll">전체 순위</a></li>
	    	<li><a href="#recordsRankingFormCategoryTabRegion">지역별 순위</a> <!-- ajax로 지역 구분 -->
	    		<div class="recordsRankingFormCategoryTabSelectDiv">
			    	<table class="recordsRankingFormCategoryTabSelect" align="center" style="border-collapse:collapse">
			    		<tr align="center">
			    			<td class="region selected" onClick="searchRegion('9')">서울</td>
			    			<td class="region" onClick="searchRegion('2, 11')">경기/인천</td>
			    			<td class="region" onClick="searchRegion('1')">강원</td>
			    			<td class="region" onClick="searchRegion('7, 15, 16')">충청</td>
			    		</tr>
			    		<tr align="center">
			    			<td class="region" onClick="searchRegion('5, 12, 13')">전라</td>
			    			<td class="region" onClick="searchRegion('3, 4, 6, 8, 10')">경상</td>
			    			<td class="region" onClick="searchRegion('14')">제주</td>
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
			    <form name="recordsRankingFormTabAll" onsubmit="return false">
				    <input type="hidden" name="sort" class="sort">
				    <div class="recordsRankingFormTabAllTableDiv">
				    	<table class="recordsRankingFormTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin:0 auto; margin-top:10px; width:1000px;">
				    		<tr>
				    			<th style="width:20px;">순위</th>
				    			<th style="width:100px;">선수</th>
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
				    			<c:forEach var="recordsRankingTabAll" items="${requestScope.recordsRankingTabAll}" varStatus="status">
									<tr>
										<td align="center">${status.count}</td>
										<!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
										<td align="center">${recordsRankingTabAll.nickname}</td>
										<td align="center">${recordsRankingTabAll.games_played}</td>
										<td align="center">${recordsRankingTabAll.wins}</td>
										<td align="center">${recordsRankingTabAll.draws}</td>
										<td align="center">${recordsRankingTabAll.losses}</td>
										<td align="center">${recordsRankingTabAll.goals_for}</td>
										<td align="center">${recordsRankingTabAll.goals_assist}</td>
									</tr>
								</c:forEach>
				    		</tr>
				    	</table>
				    </div>
				</form>
			</div>
			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
			<!-- --------------------------------------------지      역      별      순      위----------------------------------------------- -->
			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
			<div id="recordsRankingFormCategoryTabRegion">
			    <div class="recordsRankingFormTabAllRating">
				    <table class="recordsRankingFormTabAllGoalRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
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
				    <table class="recordsRankingFormTabRegionWinRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
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
			    <form name="recordsRankingFormTabRegion" onsubmit="return false">
				    <input type="hidden" name="sort" class="sort">
				    <div class="recordsRankingFormTabRegionTableDiv">
				    	<table class="recordsRankingFormTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin:0 auto; margin-top:10px; width:1000px;">
				    		<tr>
				    			<th style="width:20px;">순위</th>
				    			<th style="width:100px;">선수</th>
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
				    			<c:forEach var="recordsRankingTabRegion" items="${requestScope.recordsRankingTabRegion}" varStatus="status">
									<tr>
										<td align="center">${status.count}</td>
										<!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
										<td align="center">${recordsRankingTabRegion.nickname}</td>
										<td align="center">${recordsRankingTabRegion.games_played}</td>
										<td align="center">${recordsRankingTabRegion.wins}</td>
										<td align="center">${recordsRankingTabRegion.draws}</td>
										<td align="center">${recordsRankingTabRegion.losses}</td>
										<td align="center">${recordsRankingTabRegion.goals_for}</td>
										<td align="center">${recordsRankingTabRegion.goals_assist}</td>
									</tr>
								</c:forEach>
				    		</tr>
				    	</table>
				    </div>
				</form>
			</div>
			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
			<!-- --------------------------------------------성      별      순      위------------------------------------------------------ -->
			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
			<div id="recordsRankingFormCategoryTabGender">
			    <div class="recordsRankingFormTabAllRating">
				    <table class="recordsRankingFormTabAllGoalRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2">최다 승</th>
				    	</tr>
				    	<c:forEach var="recordsGoalRating" items="${requestScope.recordsWinRating}" varStatus="status" begin="0" end="2">
					    	<tr>
					    		<td>${recordsGoalRating.nickname}</td>
					    		<td>${recordsGoalRating.wins} 승</td>
					    	</tr>
					    </c:forEach>
				    </table>
				    <table class="recordsRankingFormTabAllWinRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2">최다 득점</th>
				    	</tr>
				    	<c:forEach var="recordsWinRating" items="${requestScope.recordsGoalRating}" varStatus="status" begin="0" end="2">
					    	<tr>
					    		<td>${recordsWinRating.nickname}</td>
					    		<td>${recordsWinRating.goals_for} 골</td>
					    	</tr>
					    </c:forEach>
				    </table>
				    <table class="recordsRankingFormTabAllAssistRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2">최다 도움</th>
				    	</tr>
				    	<c:forEach var="recordsAssistRating" items="${requestScope.recordsAssistRating}" varStatus="status" begin="0" end="2">
					    	<tr>
					    		<td>${recordsAssistRating.nickname}</td>
					    		<td>${recordsAssistRating.goals_assist} 회</td>
					    	</tr>
					    </c:forEach>
				    </table>
				</div>
			    <form name="recordsRankingFormTabGender" onsubmit="return false">
				    <input type="hidden" name="sort" class="sort">
				    <div class="recordsRankingFormTabGenderTableDiv">
				    	<table class="recordsRankingFormTabGenderTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin:0 auto; margin-top:10px; width:1000px;">
				    		<tr>
				    			<th style="width:20px;">순위</th>
				    			<th style="width:100px;">선수</th>
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
				    			<c:forEach var="recordsRanking" items="${requestScope.recordsRanking}" varStatus="status">
									<tr>
										<td align="center">${status.count}</td>
										<!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
										<td align="center">${recordsRanking.nickname}</td>
										<td align="center">${recordsRanking.games_played}</td>
										<td align="center">${recordsRanking.wins}</td>
										<td align="center">${recordsRanking.draws}</td>
										<td align="center">${recordsRanking.losses}</td>
										<td align="center">${recordsRanking.goals_for}</td>
										<td align="center">${recordsRanking.goals_assist}</td>
									</tr>
								</c:forEach>
				    		</tr>
				    	</table>
				    </div>
				</form>
			</div>
			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
			<!-- --------------------------------------------연      령      별      순      위----------------------------------------------- -->
			<!-- -------------------------------------------------------------------------------------------------------------------------- -->
			<div id="recordsRankingFormCategoryTabAge">
			    <div class="recordsRankingFormTabAllRating">
				    <table class="recordsRankingFormTabAllGoalRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2">최다 승</th>
				    	</tr>
				    	<c:forEach var="recordsGoalRating" items="${requestScope.recordsWinRating}" varStatus="status" begin="0" end="2">
					    	<tr>
					    		<td>${recordsGoalRating.nickname}</td>
					    		<td>${recordsGoalRating.wins} 승</td>
					    	</tr>
					    </c:forEach>
				    </table>
				    <table class="recordsRankingFormTabAllWinRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2">최다 득점</th>
				    	</tr>
				    	<c:forEach var="recordsWinRating" items="${requestScope.recordsGoalRating}" varStatus="status" begin="0" end="2">
					    	<tr>
					    		<td>${recordsWinRating.nickname}</td>
					    		<td>${recordsWinRating.goals_for} 골</td>
					    	</tr>
					    </c:forEach>
				    </table>
				    <table class="recordsRankingFormTabAllAssistRating" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; width:200px;">
				    	<tr>
				    		<th colspan="2">최다 도움</th>
				    	</tr>
				    	<c:forEach var="recordsAssistRating" items="${requestScope.recordsAssistRating}" varStatus="status" begin="0" end="2">
					    	<tr>
					    		<td>${recordsAssistRating.nickname}</td>
					    		<td>${recordsAssistRating.goals_assist} 회</td>
					    	</tr>
					    </c:forEach>
				    </table>
				</div>
			    <form name="recordsRankingForm" onsubmit="return false">
				    <input type="hidden" name="sort" class="sort">
				    <div class="recordsRankingFormTableDiv">
				    	<table class="recordsRankingFormTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin:0 auto; margin-top:10px; width:1000px;">
				    		<tr>
				    			<th style="width:20px;">순위</th>
				    			<th style="width:100px;">선수</th>
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
				    			<c:forEach var="recordsRanking" items="${requestScope.recordsRanking}" varStatus="status">
									<tr>
										<td align="center">${status.count}</td>
										<!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
										<td align="center">${recordsRanking.nickname}</td>
										<td align="center">${recordsRanking.games_played}</td>
										<td align="center">${recordsRanking.wins}</td>
										<td align="center">${recordsRanking.draws}</td>
										<td align="center">${recordsRanking.losses}</td>
										<td align="center">${recordsRanking.goals_for}</td>
										<td align="center">${recordsRanking.goals_assist}</td>
									</tr>
								</c:forEach>
				    		</tr>
				    	</table>
				    </div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>