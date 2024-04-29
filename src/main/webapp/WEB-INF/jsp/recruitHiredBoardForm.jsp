<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecruitHiredBoardForm</title>
<link href="/style/recruitHiredBoardFormStyle.css" rel="stylesheet">
<script src="/js/recruitHiredBoardFormScript.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recruitHiredBoardFormTitle">
    	<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">용병 모집</p>
    </div>
    <div class="recruitHiredBoardFormContainer">
    	<div class="recruitHiredBoardFormConditionalSearch">
			<table border="1" bordercolor="black" style="border-collapse:collapse; margin-top:50px; margin-left:250px; width:1000px;" cellpadding="7" align="center">
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
		<div class="recruitHiredBoardFormBoard">
			<div class="newRecruitHiredBoardBtnDiv">
				<input type="button" class="newRecruitHiredBoardBtn" style="margin-top:50px;" value="새 글 쓰기" onClick="location.replace('/newRecruitHiredBoardForm.do')">
			</div>
			<table class="boardListTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin-top:10px; margin-left:250px; width:1000px;">
				<tr>
					<th style="width:50px;">번호</th>
					<th style="width:300px;">제목</th>
					<th style="width:80px;">글쓴이</th>
					<th style="width:100px;">조회수</th>
					<th style="width:100px;">등록일</th>
					<c:forEach var="board" items="${requestScope.boardList}" varStatus="status">
						<tr style="cursor:pointer" onClick="goBoardDetailForm(${board.b_no});">
							<td align="center">${requestScope.boardMap.begin_serialNo_desc - status.count + 1}</td>
							<!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
							<td align="center">${board.writer}</td>
							<td align="center">${board.readcount}</td>
							<td align="center">${board.reg_date}</td>
						</tr>
					</c:forEach>
			</table>
			<c:if test="${empty requestScope.boardList}">
				<br>
				<center>
					조건에 맞는 검색 결과가 없습니다.
				</center>
			</c:if>
		</div>
	</div>
</body>
</html>