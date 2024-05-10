<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TournamentBoardForm</title>
<link href="/style/tournamentBoardFormStyle.css"
	rel="stylesheet">

<script src="/js/community/communityFreeBoardFormScript.js"></script>


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
	select_region = "전체";
	
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
			url   : "/adminTournamentBoardForm.do" 
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
				
				$(".tournamentBoard").html(obj.find(".tournamentBoard").html()  );
				ing_or_end = "진행";
				
				
			}			
			
			,error 	 : function(){alert("검색 실패 / 관리자에게 문의 바람");}
			
		}) 
	};
	
	
	
	function end()
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
			url   : "/adminTournamentBoardForm.do" 
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
				
				$(".tournamentBoard").html(obj.find(".tournamentBoard").html()  );
				ing_or_end = "끝";
				
				
		
				
	
			}			
			,error 	 : function(){alert("검색 실패 / 관리자에게 문의 바람");}
			
		})
	};
	
	
	function search(text)
	{	
		$(".region1").click(function(){
			$(".region1").removeClass("selected1");
			$(this).addClass("selected1");
		});
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
				url   : "/adminTournamentBoardForm.do" 
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
					
					$(".tournamentBoard").html( $(responseHtml).find(".tournamentBoard").html()  )
					
					select_region = text;
					
					
					
		
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
				url   : "/adminTournamentBoardForm.do" 
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
					
					$(".tournamentBoard").html( $(responseHtml).find(".tournamentBoard").html()  )
					
					select_region = text;
					
			
		
				}			
				,error 	 : function(){alert("검색 실패 / 관리자에게 문의 바람");}
				
			})
		}
			
	} 
	
	
	function goTournamentBoardDetail(list_no)
	{
	   $("[name='adminTournamentDetailForm'] [name='list_no']").val(list_no); 
	   document.adminTournamentDetailForm.submit();
	}
	
	
	function pageNoClick(clickPageNo) {
		
		$("[name='recruit_Team_mem']").find(".selectPageNo").val(clickPageNo);

		search_detail();

	}
	
	
	function search_detail() {

		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth()+1;
		var day = now.getDate();
		var nowdate = year + "-" + "0" + month + "-" + day;
		
		var boardSearchFormObj = $("[name='tournament_search']");

		var keyword1Obj = boardSearchFormObj.find(".keyword1"); 

		var keyword1 = keyword1Obj.val();
		  
		if(typeof(keyword1)!='string' ){keyword1=""; }
	    
	    keyword1 = $.trim(keyword1);
	    
	    boardSearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val());
	    
	 	if(ing_or_end == "진행")
		{
			$.ajax({
				//----------------------------------------------------------
				//WAS 에 접속할 URL 주소 지정
				//----------------------------------------------------------
				url   : "/adminTournamentBoardForm.do" 
				//----------------------------------------------------------
				//form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
				//----------------------------------------------------------
				,type : "post"
				//----------------------------------------------------------
				//WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
				//----------------------------------------------------------
				,data : boardSearchFormObj.serialize() + "&region=" + text + "&ing=" + nowdate
					
				,success : function(responseHtml){
					
					var obj = $(responseHtml);
					
					$(".tournamentBoard").html( $(responseHtml).find(".tournamentBoard").html()  )
					$(".pagingNos").html(obj.find(".pagingNos").html());
					
		
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
				url   : "/adminTournamentBoardForm.do" 
				//----------------------------------------------------------
				//form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
				//----------------------------------------------------------
				,type : "post"
				//----------------------------------------------------------
				//WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
				//----------------------------------------------------------
				,data : boardSearchFormObj.serialize() + "&region=" + text + "&end=" + nowdate
					
				,success : function(responseHtml){
					
					var obj = $(responseHtml);
					
					$(".tournamentBoard").html( $(responseHtml).find(".tournamentBoard").html()  )
					$(".pagingNos").html(obj.find(".pagingNos").html());
			
		
				}			
				,error 	 : function(){alert("검색 실패 / 관리자에게 문의 바람");}
				
			})
		} 
	    
	}
	
	function enterkey()
	{
		
		if(window.event.keyCode == 13)
		{
			search_detail();
		}
	}
	
		
</script>








</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText"></p>
	</div>


	<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>

	<center>
		
		<form name="tournament_search" onsubmit="return false">
			<select name="searchType1">
				<option value="all">전체</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> 
			<input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" onkeyup="enterkey()"> 
			
			<input type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
			<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">
		</form>	
		
		<div style="height:10px;"></div>
		<input type="button" onclick="search_detail()" class="searchBtn" style="cursor:pointer" value="검색">
		
		<div style="height:25px;"></div>
		<br>
		<input type="button" class="new_RegBoard" style="cursor:pointer" onClick="" value="새 글쓰기">
		<div style="height:25px;"></div>
	
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
						<td class="region1 selected1" onClick="search('전체')">&middot;전체</td>
						<td class="region1" onClick="search('서울')">&middot;서울</td>
						<td class="region1" onClick="search('경기')">&middot;경기/인천</td>
						<td class="region1" onClick="search('강원')">&middot;강원</td>
						<td class="region1" onClick="search('충청')">&middot;충청</td>
						<td class="region1" onClick="search('전라')">&middot;전라</td>
						<td class="region1" onClick="search('경상')">&middot;경상</td>
						<td class="region1" onClick="search('제주')">&middot;제주</td>
					</tr>
				</table>
			
				
			
				<%-- <div class="boardList">
				<c:forEach var="gameList" items="${requestScope.tournamentList}">
					<table style="border: 1px solid">
						<tr style="cursor:pointer" onClick="goTournamentBoardDetail(${gameList.list_no});">
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
				</div> --%>
				<!-- ================================================================================================================================ -->
				<div class="tournamentBoard">
			         <table class="tournamentTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin: 0 auto; margin-top:10px; width:1000px;">
			            <tr>
			               <th style="width:25px;">번호</th>
			               <th style="width:150px;">제목</th>
			               <th style="width:80px;">신청기간</th>
			               <th style="width:40px;">지역</th>
			                <th style="width:40px;">등록일</th>
			               <c:forEach var="gameList" items="${requestScope.tournamentList}">
			                  <tr style="cursor:pointer" onClick="goTournamentBoardDetail(${gameList.list_no});">
			                     <td align="center">${gameList.list_no}</td>
			                     <td align="center">${gameList.subject}</td>
			                     <td align="center">${gameList.regist_start} ~ ${gameList.regist_end}</td>
			                     <td align="center">${gameList.region}</td>
			                     <td align="center">${gameList.reg_date}</td>
			                  </tr>
			               </c:forEach>
			                  
			               
			         </table>
			         <c:if test="${empty requestScope.tournamentList}">
		                  <center>
		                  <br><br>
		                  <b>조건에 맞는 결과물이 없습니다.</b>
		                  </center>
		             </c:if>
			      </div>
			      
				<!-- ================================================================================================================================ -->	
			</div>
		</div>
		<div style="height:10px;"></div>
		<center>
			<span class="pagingNos"> <span style="cursor: pointer"
				onClick="pageNoClick(1)">[처음]</span> <span style="cursor: pointer"
				onClick="pageNoClick(${requestScope.tournamentMap.selectPageNo}-1)">[이전]</span>&nbsp;&nbsp;
	
	
				<c:forEach var="pageNo"
					begin="${requestScope.tournamentMap.begin_pageNo}"
					end="${requestScope.tournamentMap.end_pageNo}">
	
					<c:if test="${requestScope.tournamentMap.selectPageNo==pageNo}">
	            ${pageNo}
	         </c:if>
	
					<c:if test="${requestScope.tournamentMap.selectPageNo!=pageNo}">
						<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
					</c:if>
				</c:forEach>&nbsp;&nbsp; <span style="cursor: pointer"
				onClick="pageNoClick(${requestScope.tournamentMap.selectPageNo}+1)">[다음]</span>
				<span style="cursor: pointer"
				onClick="pageNoClick(${requestScope.tournamentMap.last_pageNo})">[마지막]</span>
			</span> <select name="rowCntPerPage" class="rowCntPerPage"
				onChange="search()">
				<option value="10">10
				<option value="15">15
				<option value="20">20
			</select>행보기 &nbsp;&nbsp;&nbsp;
		</center>
		
    </center>
    
    
    <form action="/adminTournamentDetailForm.do" method="post" name="adminTournamentDetailForm">
    	<input type="hidden" name="list_no">
    </form>
    <div style="height:50px;"></div>
	
</body>
</html>