<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecruitTeamBoardForm</title>
<link href="/style/recruitTeamBoardFormStyle.css" rel="stylesheet">
<script src="/js/recruitTeamBoardFormScript.js"></script>

<script>
	$(function(){
	  $('.tabcontent > div').hide();
	  $('.tabnav a').click(function () {
	    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	    $('.tabnav a').removeClass('active');
	    $(this).addClass('active');
	    return false;
	  }).filter(':eq(0)').click();
	});
	
	function enterkey_T()
	{
		if(window.event.keyCode == 13)
		{
			searchTeam();
		}
	}
	
	function enterkey_M()
	{
		if(window.event.keyCode == 13)
		{
			searchMem();
		}
	}
	
	
	function reset_Team_Search() {

		//---------------------------------------------
		// 변수 boardSearchFormObj 선언하고 
		// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
		//---------------------------------------------
		var teamSearchFormObj = $(".recruitTeamSearchForm");

		teamSearchFormObj.find(".keyword1").val("");
		searchTeam();

	}
	
	function reset_Mem_Search() {

		//---------------------------------------------
		// 변수 boardSearchFormObj 선언하고 
		// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
		//---------------------------------------------
		var memSearchFormObj = $(".recruitMemSearchForm");
		memSearchFormObj.find(".keyword2").val("");
		searchMem();

	}
	
	
	
	function searchTeam() {

		//---------------------------------------------
		// 변수 boardSearchFormObj 선언하고 
		// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
		//---------------------------------------------
		var boardSearchFormObj = $("[name='recruitTeamSearchForm']");

		var keyword1Obj = boardSearchFormObj.find(".keyword1"); 

		var keyword1 = keyword1Obj.val();
		  
		if(typeof(keyword1)!='string' ){keyword1=""; }
	    
	    keyword1 = $.trim(keyword1);
	    
	  

		$.ajax({
					//-------------------------------
					// WAS 로 접속할 주소 설정
					//-------------------------------
					url : "/recruitTeamBoardForm.do"
					//-------------------------------
					// WAS 로 접속하는 방법 설정. get 또는 post
					//-------------------------------
					,
					type : "post"

					,
					data : boardSearchFormObj.serialize()

					,
					success : function(responseHtml) {

						var obj = $(responseHtml);

						$(".recruitTeamBoardFormContainer").html(obj.find(".recruitTeamBoardFormContainer").html());

					}

					,
					error : function() {

						alert("검색 실패! 관리자에게 문의 바랍니다.");
					}

				});

	}
	
	
	function searchMem() {

		//---------------------------------------------
		// 변수 boardSearchFormObj 선언하고 
		// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
		//---------------------------------------------
		var boardSearchFormObj = $("[name='recruitMemSearchForm']");

		var keyword2Obj = boardSearchFormObj.find(".keyword2"); 

		var keyword2 = keyword2Obj.val();
		  
		if(typeof(keyword2)!='string' ){keyword2=""; }
	    
		keyword2 = $.trim(keyword2);

		$.ajax({
					//-------------------------------
					// WAS 로 접속할 주소 설정
					//-------------------------------
					url : "/recruitTeamBoardForm.do"
					//-------------------------------
					// WAS 로 접속하는 방법 설정. get 또는 post
					//-------------------------------
					,
					type : "post"

					,
					data : boardSearchFormObj.serialize()

					,
					success : function(responseHtml) {

						var obj = $(responseHtml);

						$(".recruitMemBoardFormContainer").html(obj.find(".recruitMemBoardFormContainer").html());

					}

					,
					error : function() {

						alert("검색 실패! 관리자에게 문의 바랍니다.");
					}

				});

	}
	
	
	
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recruitTeamBoardFormTitle">
    	<img src="/image/RecruitTitleBackgroundImage.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">팀 / 팀원 모집</p>
    </div>
    
    <div class="tab">
	    <ul class="tabnav">
	      <li><a href="#tab01" onClick="reset_Team_Search();">팀</a></li>
	      <li><a href="#tab02" onClick="reset_Mem_Search();">팀원</a></li>
	    </ul>

	    <div class="tabcontent">
	    
	    
	    
	    
	  <!-- ======================================================================================================================================================================================================================= -->   
	  <!-- 밑에는 팀 선택 --> 
	  <!-- ======================================================================================================================================================================================================================= -->   
	    
	      <div id="tab01" class = "recruitTeamSearchForm">
		      	<div class="recruitTeamBoardFormContainer">
			    	<div class="recruitTeamBoardFormConditionalSearch">
			    		<div class="newRecruitTeamBoardBtnDiv">
							<input type="button" class="newRecruitTeamBoardBtn" value="새 글 쓰기" onClick="location.replace('/newRecruitTeamBoardForm.do')">
						</div>
			    		<form name="recruitTeamSearchForm" onsubmit="return false">
			    			<table align="center">
								<tr>
									<td>
									<table border="1" bordercolor="black" style="border-collapse:collapse; margin: 0 auto; margin-top:50px; width:1000px;" cellpadding="7" align="center">
										<tr>
											<th>
											검&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;색
											</th>
											<td>
												<select name="searchType1">
													<option value="all">전체</option>
													<option value="writer">글작성자</option>
													<option value="title">제목</option>
													<option value="content">내용</option>
													<!-- 추가적인 검색 조건을 샐렉트 박스에 추가 -->
												</select> 
												<input type="text" name="keyword1" class="keyword1" onkeyup="enterkey_T()"> 
											</td>
										</tr>
										<tr>
											<th>
											지역선택
											</th>
											<td colspan="5" align="center">
											<div class="search_boxes">
								
									            <select name="sido" id="" onchange="categoryChange(this)">
									              <option value>시/도 선택</option>
									              <option value="general01">강원</option>
									              <option value="general02">경기</option>
									              <option value="general03">경남</option>
									              <option value="general04">경북</option>
									              <option value="general05">광주</option>
									              <option value="general06">대구</option>
									              <option value="general07">대전</option>
									              <option value="general08">부산</option>
									              <option value="general09">서울</option>
									              <option value="general10">울산</option>
									              <option value="general11">인천</option>
									              <option value="general12">전남</option>
									              <option value="general13">전북</option>
									              <option value="general14">제주</option>
									              <option value="general15">충남</option>
									              <option value="general16">충북</option>
									            </select>
								
									            <select name="gungu" id="state">
									              <option>군/구 선택</option>
									            </select>
									         </div>
									         </td>
										</tr>
										<tr>
											<th>선호 요일</th>
											<td>
												<input type="checkbox" id="workweekcdGroupA" name="allweekday" onclick="setweekgroup()">평일(월,화,수,목,금)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="workweekcdGroupB" name="allweekend" onclick="setweekgroup()">주말(토,일)
												<br>
												<input type="checkbox" id="day1" name="day" onclick="setweekDay()" value="mon">월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="day2" name="day" onclick="setweekDay()" value="tue">화&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="day3" name="day" onclick="setweekDay()" value="wed">수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="day4" name="day" onclick="setweekDay()" value="thr">목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="day5" name="day" onclick="setweekDay()" value="fri">금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="day6" name="day" onclick="setweekDay()" value="sat">토&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="day7" name="day" onclick="setweekDay()" value="sun">일
												<br>
												<input type="checkbox" id="day0" name="day" value="everyday" onclick="allday()">상관없음
											</td>
										</tr>
										<tr>
											<th>
												선호 시간
											</th>
											<td colspan="5" align="center">
												<input type="checkbox" id="morning"  name="time" onclick="timeset()" value="morning">새벽&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="am"  name="time" onclick="timeset()" value="am">오전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="pm"  name="time" onclick="timeset()" value="pm">오후&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="night"  name="time" onclick="timeset()" value="night">야간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="everytime"  name="time" onclick="everyset()" value="everytime">상관없음
											</td>
										</tr>
									</table>
								</td>
								</tr>
							<tr align="center">
								<td>
									<input type="button" value="검색" onclick="searchTeam()">
								</td>
							</tr>
							</table>
						</form>
					</div>
					<div class="recruitTeamBoardFormBoard">
						<table class="boardListTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin: 0 auto; margin-top:10px; width:1000px;">
							<tr>
								<th style="width:50px;">번호</th>
								<th style="width:300px;">제목</th>
								<th style="width:80px;">글쓴이</th>
								<th style="width:100px;">내용</th>
								<th style="width:100px;">조회수</th>
								<th style="width:100px;">등록일</th>
								<c:forEach var="team" items="${requestScope.teamList}" varStatus="status">
									<tr style="cursor:pointer" onClick="goBoardDetailForm();">
										<td align="center">${team.recruitment_no}</td>
										<td align="center">${team.title}</td>
										<td align="center">${team.writer}</td>
										<td align="center">${team.content}</td>
										<td align="center">${team.readcount}</td>
										<td align="center">${team.reg_date}</td>
									</tr>
								</c:forEach>
						</table>
						<c:if test="${empty requestScope.teamList}">
							<br>
							<center>
								조건에 맞는 검색 결과가 없습니다.
							</center>
						</c:if>
					</div>
				</div>
	      </div>
	      
	  <!-- ======================================================================================================================================================================================================================= -->   
	  <!-- 밑에는 팀원 선택 --> 
	  <!-- ======================================================================================================================================================================================================================= -->   
	      <div id="tab02" class = "recruitMemSearchForm">
		      	<div class="recruitMemBoardFormContainer">
			    	<div class="recruitMemBoardFormConditionalSearch">
				    	<div class="newRecruitMemBoardBtnDiv">
							<input type="button" class="newRecruitMemBoardBtn" value="새 글 쓰기" onClick="location.replace('/newRecruitTeamBoardForm.do')">
						</div>
			    		<form name="recruitMemSearchForm" onsubmit="return false">
			    			<table align="center">
								<tr>
									<td>
									<table border="1" bordercolor="black" style="border-collapse:collapse; margin: 0 auto; margin-top:50px; width:1000px;" cellpadding="7" align="center">
										<tr>
											<th>
											검&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;색
											</th>
											<td>
												<select name="searchType2">
													<option value="all">전체</option>
													<option value="writer">글작성자</option>
													<option value="title">제목</option>
													<option value="content">내용</option>
													<!-- 추가적인 검색 조건을 샐렉트 박스에 추가 -->
												</select> 
												<input type="text" name="keyword2" class="keyword2" onkeyup="enterkey_M()"> 
											</td>
										</tr>
										<tr>
											<th>
											지역선택
											</th>
											<td colspan="5" align="center">
											<div class="search_boxes">
								
									            <select name="sido" id="" onchange="categoryChange(this)">
									              <option value>시/도 선택</option>
									              <option value="general01">강원</option>
									              <option value="general02">경기</option>
									              <option value="general03">경남</option>
									              <option value="general04">경북</option>
									              <option value="general05">광주</option>
									              <option value="general06">대구</option>
									              <option value="general07">대전</option>
									              <option value="general08">부산</option>
									              <option value="general09">서울</option>
									              <option value="general10">울산</option>
									              <option value="general11">인천</option>
									              <option value="general12">전남</option>
									              <option value="general13">전북</option>
									              <option value="general14">제주</option>
									              <option value="general15">충남</option>
									              <option value="general16">충북</option>
									            </select>
								
									            <select name="gungu" id="state2">
									              <option>군/구 선택</option>
									            </select>
									         </div>
									         </td>
										</tr>
										<tr>
											<th>선호 요일</th>
											<td>
												<input type="checkbox" id="workweekcdGroupAA" name="allweekday" onclick="setweekgroup()">평일(월,화,수,목,금)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="workweekcdGroupBB" name="allweekend" onclick="setweekgroup()">주말(토,일)
												<br>
												<input type="checkbox" id="day11" name="day" onclick="setweekDay()" value="mon">월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="day22" name="day" onclick="setweekDay()" value="tue">화&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="day33" name="day" onclick="setweekDay()" value="wed">수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="day44" name="day" onclick="setweekDay()" value="thr">목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="day55" name="day" onclick="setweekDay()" value="fri">금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="day66" name="day" onclick="setweekDay()" value="sat">토&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="day77" name="day" onclick="setweekDay()" value="sun">일
												<br>
												<input type="checkbox" id="day00" name="day" value="everyday" onclick="allday()">상관없음
											</td>
										</tr>
										<tr>
											<th>
												선호 시간
											</th>
											<td colspan="5" align="center">
												<input type="checkbox" id="morning2"  name="time" onclick="timeset()" value="morning">새벽&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="am2"  name="time" onclick="timeset()" value="am">오전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="pm2"  name="time" onclick="timeset()" value="pm">오후&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="night2"  name="time" onclick="timeset()" value="night">야간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" id="everytime2"  name="time" onclick="everyset()" value="everytime">상관없음
											</td>
										</tr>
									</table>
									</td>
								</tr>
								<tr align="center">
									<td>
										<input type="button" value="검색" onclick="searchMem()">
									</td>
								</tr>
							</table>
						</form>
									
									
					</div>
					<div class="recruitMemBoardFormBoard">
						<table class="boardListTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin: 0 auto; margin-top:10px; width:1000px;">
							<tr>
								<th style="width:50px;">번호</th>
								<th style="width:300px;">제목</th>
								<th style="width:80px;">글쓴이</th>
								<th style="width:100px;">내용</th>
								<th style="width:100px;">조회수</th>
								<th style="width:100px;">등록일</th>
								<c:forEach var="mem" items="${requestScope.memList}" varStatus="status">
									<tr style="cursor:pointer" onClick="goBoardDetailForm();">
										<td align="center">${mem.recruitment_no}</td>
										<td align="center">${mem.title}</td>
										<td align="center">${mem.writer}</td>
										<td align="center">${mem.content}</td>
										<td align="center">${mem.readcount}</td>
										<td align="center">${mem.reg_date}</td>
									</tr>
								</c:forEach>
						</table>
						<c:if test="${empty requestScope.memList}">
							<br>
							<center>
								조건에 맞는 검색 결과가 없습니다.
							</center>
						</c:if>
					</div>
				</div>
	      </div>
	    </div>
  	</div>
  	
  	
  	
	   
</body>
</html>