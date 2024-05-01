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
	      <li><a href="#tab01">팀</a></li>
	      <li><a href="#tab02">팀원</a></li>
	    </ul>
	    <div class="tabcontent">
	      <div id="tab01">
	      	<div class="recruitTeamBoardFormContainer">
		    	<div class="recruitTeamBoardFormConditionalSearch">
					<table border="1" bordercolor="black" style="border-collapse:collapse; margin: 0 auto; margin-top:50px; width:1000px;" cellpadding="7" align="center">
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
								<input type="checkbox" class="time" name="time" value="morning">새벽&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" class="time" name="time" value="am">오전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" class="time" name="time" value="pm">오후&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" class="time" name="time" value="night">야간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" class="time" name="time" value="everytime">상관없음
							</td>
						</tr>
					</table>
				</div>
				<div class="recruitTeamBoardFormBoard">
					<div class="newRecruitTeamBoardBtnDiv">
						<input type="button" class="newRecruitTeamBoardBtn" value="새 글 쓰기" onClick="location.replace('/newRecruitTeamBoardForm.do')">
					</div>
					<table class="boardListTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin: 0 auto; margin-top:10px; width:1000px;">
						<tr>
							<th style="width:50px;">번호</th>
							<th style="width:300px;">제목</th>
							<th style="width:80px;">글쓴이</th>
							<th style="width:100px;">내용</th>
							<th style="width:100px;">조회수</th>
							<th style="width:100px;">등록일</th>
							<c:forEach var="board" items="${requestScope.teamList}" varStatus="status">
								<tr style="cursor:pointer" onClick="goBoardDetailForm();">
									<td align="center">${board.recruitment_no}</td>
									<td align="center">${board.title}</td>
									<td align="center">${board.writer}</td>
									<td align="center">${board.content}</td>
									<td align="center">${board.readcount}</td>
									<td align="center">${board.reg_date}</td>
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
	      
	      
	      <div id="tab02">
	      	<div class="recruitTeamBoardFormContainer">
		    	<div class="recruitTeamBoardFormConditionalSearch">
					<table border="1" bordercolor="black" style="border-collapse:collapse; margin: 0 auto; margin-top:50px; width:1000px;" cellpadding="7" align="center">
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
								<input type="checkbox" class="time" name="time" value="morning">새벽&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" class="time" name="time" value="am">오전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" class="time" name="time" value="pm">오후&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" class="time" name="time" value="night">야간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" class="time" name="time" value="everytime">상관없음
							</td>
						</tr>
					</table>
				</div>
				<div class="recruitTeamBoardFormBoard">
					<div class="newRecruitTeamBoardBtnDiv">
						<input type="button" class="newRecruitTeamBoardBtn" value="새 글 쓰기" onClick="location.replace('/newRecruitTeamBoardForm.do')">
					</div>
					<table class="boardListTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin: 0 auto; margin-top:10px; width:1000px;">
						<tr>
							<th style="width:50px;">번호</th>
							<th style="width:300px;">제목</th>
							<th style="width:80px;">글쓴이</th>
							<th style="width:100px;">내용</th>
							<th style="width:100px;">조회수</th>
							<th style="width:100px;">등록일</th>
							<c:forEach var="board" items="${requestScope.memList}" varStatus="status">
								<tr style="cursor:pointer" onClick="goBoardDetailForm();">
									<td align="center">${board.recruitment_no}</td>
									<td align="center">${board.title}</td>
									<td align="center">${board.writer}</td>
									<td align="center">${board.content}</td>
									<td align="center">${board.readcount}</td>
									<td align="center">${board.reg_date}</td>
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