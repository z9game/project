<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글쓰기</title>
<link href="/style/newRecruitHiredBoardFormStyle.css" rel="stylesheet">
<script src="/js/newRecruitHiredBoardFormScript.js"></script>
<script src="/js/common.js"></script>

<script>

	function checkBoardRegForm()
	{
		var formObj = $("[name='newRecruitHiredBoardForm']")
		
		$.ajax({
			//-------------------------------
			// WAS 로 접속할 주소 설정
			//-------------------------------
			url : "/recruitHiredRegProc.do"
			//-------------------------------
			// WAS 로 접속하는 방법 설정. get 또는 post
			//-------------------------------
			,
			type : "post"

			,
			data : formObj.serialize()

			,
			success : function(json) {

				var result = json["result"];
				
				if(result == 1)
				{
					alert("게시물 입력 성공!");
					location.href='/recruitHiredBoardForm.do';
				}
				else
				{
					alert("게시물 입력 실패!")
				}

				

			}

			,
			error : function() {

				alert("입력 실패! 관리자에게 문의 바랍니다.");
			}

		});	
	}

</script>

</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="newRecruitHiredBoardFormTitle">
    	<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">용병 모집 등록</p>
    </div>
    <div class="newRecruitHiredBoardFormContainer">
    
		<form name="newRecruitHiredBoardForm">
			<table class="newRecruitHiredBoardFormRegTable" border="1" bordercolor="black">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title" class="title" size="40" maxlength="30">
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						${sessionScope.nickname}
					</td>
				</tr>
				<tr>
					<th>지역</th>
					<td>
						<select name="sido" id="" onchange="categoryChange(this)">
			              	<option value="0">시/도 선택</option>
							<option value="1">강원</option>
							<option value="2">경기</option>
							<option value="3">경남</option>
							<option value="4">경북</option>
							<option value="5">광주</option>
							<option value="6">대구</option>
							<option value="7">대전</option>
							<option value="8">부산</option>
							<option value="9">서울</option>
							<option value="10">울산</option>
							<option value="11">인천</option>
							<option value="12">전남</option>
							<option value="13">전북</option>
							<option value="14">제주</option>
							<option value="15">충남</option>
							<option value="16">충북</option>
		            	</select>

			            <select name="sigungu" id="state">
			              <option>군/구 선택</option>
			            </select>
					</td>
				</tr>
				
				<tr>
					<th>요일</th>
					<td>
						<input type="checkbox" name="day" value="1">월
						<input type="checkbox" name="day" value="2">화
						<input type="checkbox" name="day" value="3">수
						<input type="checkbox" name="day" value="4">목
						<input type="checkbox" name="day" value="5">금
						<input type="checkbox" name="day" value="6">토
						<input type="checkbox" name="day" value="7">일
					</td>
				</tr>
				<tr>
					<th>시간</th>
					<td>
						<input type="checkbox" name="time" value="새벽">새벽
						<input type="checkbox" name="time" value="오전">오전
						<input type="checkbox" name="time" value="오후">오후
						<input type="checkbox" name="time" value="야간">야간
					</td>
				</tr>
				
				<tr>
					<th>포지션</th>
					<td>
						<input type="radio" name="pos" value="ST">ST
						<input type="radio" name="pos" value="CM">CM
						<input type="radio" name="pos" value="CB">CB
						<input type="radio" name="pos" value="GK">GK
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" class="content" rows="20" cols="40" maxlength="500" style="resize:none"></textarea>
					</td>
				</tr>
				
			</table>
			<div class="newRecruitHiredBoardFormBtnDiv">
				<div class="resetBtnDiv">
					<input type="reset" class="boardResetBtn"value="다시 작성">
				</div>
				<div class="boardRegAndMoveList">
					<input type="button" class="boardRegBtn" value="저장" onClick="checkBoardRegForm();">
					<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/recruitHiredBoardForm.do')">
				</div>
			</div>
			      <input type="hidden" name="nickname" value="${sessionScope.m_no}">
		</form>
	</div>
</body>
</html>