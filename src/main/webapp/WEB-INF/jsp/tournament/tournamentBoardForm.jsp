<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TournamentBoardForm</title>
<link href="/style/tournamentBoardFormStyle.css" rel="stylesheet">
<script src="/js/tournamentBoardFormScript.js"></script>

<script>

	$(document).ready(function(){
		$(".tournament").click(function(){
			$(".tournament").removeClass("onvalue");
			$(this).addClass("onvalue");
		});
		
		$(".region1").click(function(){
			$(".region1").removeClass("selected1");
			$(this).addClass("selected1");
		});
		
		ing();
	})
	
	ing_or_end = "초기";
	
	function ing()
	{
		
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth()+1;
		var day = now.getDate();
		var nowdate = year + "-" + "0" + month + "-" + day;
	
		
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
			,data : "ing=" + nowdate
				
			,success : function(responseHtml){
				
				var obj = $(responseHtml);
				
				//alert( obj.find(".regionlist").length +" / "+obj.filter(".regionlist").length )
				
				$(".region").html(obj.find(".region").html()  );
				ing_or_end = "진행";
				
				
			}			
			
			,error 	 : function(){alert("검색 실패 / 관리자에게 문의 바람");}
			
		}) 
	};
	
	
	
	function end()
	{
		$(".region2").removeClass("selected2");
		$(".all2").addClass("selected2");
		
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth()+1;
		var day = now.getDate();
		var nowdate = year + "-" + "0" + month + "-" + day;
		
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
			,data : "end=" + nowdate
				
			,success : function(responseHtml){
				
				var obj = $(responseHtml);
				
				$(".region").html(obj.find(".region").html()  );
				ing_or_end = "끝";
				
				
		
				

			}			
			,error 	 : function(){alert("검색 실패 / 관리자에게 문의 바람");}
			
		})
	};

	
	function search(text)
	{	
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
					
					$(".boardList").html( $(responseHtml).find(".boardList").html()  )
					
					
					
		
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
					
					$(".boardList").html( $(responseHtml).find(".boardList").html()  )
					
			
					
		
				}			
				,error 	 : function(){alert("검색 실패 / 관리자에게 문의 바람");}
				
			})
		}
			
	} 
	
	
</script>

</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="tournamentBoardFormTitle">
    	<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">대회일정</p>
    </div>
    <br>
    <center>
		<div>
			<table align="center" style="border-collapse:collapse" border="1">
				<tr>
					<td class="tournament onvalue" onclick="ing()">
						진행중인 대회
					</td>
					<td class="tournament" onclick="end()">
						마감된 대회
					</td>
				</tr>
			</table> 
			
			
				
			<div class="region"> <!-- 지역 선택 Div -->
				<table align="center" style="border-collapse:collapse">
					<tr>
						<td class="region1 selected1"  onClick="search('전체')">&middot;전체</td>
						<td class="region1" onClick="search('서울')">&middot;서울</td>
						<td class="region1" onClick="search('경기')">&middot;경기/인천</td>
						<td class="region1" onClick="search('강원')">&middot;강원</td>
						<td class="region1" onClick="search('충청')">&middot;충청</td>
						<td class="region1" onClick="search('전라')">&middot;전라</td>
						<td class="region1" onClick="search('경상')">&middot;경상</td>
						<td class="region1" onClick="search('제주')">&middot;제주</td>
					</tr>
				</table>
			
				<div class="boardList">
				<c:forEach var="gameList" items="${requestScope.tournamentList}">
					<table style="border: 1px solid">
						<tr style="cursor:pointer" onClick="">
							<td rowspan="3">
								<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
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
					</table>
					<c:if test="${empty requestScope.tournamentList}">
						
							<br><br><br><br>
							<b>조건에 맞는 결과물이 없습니다.</b>
						
					</c:if>
				</div>
					
			</div>	
		</div>
    </center>
    
    <form action="/tournamentBoardDetail.do" method="post" name="tournamentBoardDetail">
    	<input type="hidden" name="">
    </form>
</body>
</html>