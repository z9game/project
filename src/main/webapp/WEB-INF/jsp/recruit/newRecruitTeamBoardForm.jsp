<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewRecruitTeamBoardForm</title>
<link href="/style/newRecruitTeamBoardFormStyle.css" rel="stylesheet">
<script src="/js/newRecruitTeamBoardFormScript.js"></script>

</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="newRecruitTeamBoardFormTitle">
    	<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">팀 / 팀원 모집 등록</p>
    </div>
    <div class="newRecruitTeamBoardFormContainer">
    
		<form name="newRecruitTeamBoardForm">
			<table class="newRecruitTeamBoardFormRegTable" border="1" bordercolor="black">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title" class="title" size="40" maxlength="30">
					</td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>
						<input type="text" name="writer" class="writer" size="40" maxlength="15">
					</td>
				
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" class="content" rows="20" cols="40" maxlength="500" style="resize:none"></textarea>
					</td>
				</tr>
				
			</table>
			<div class="newRecruitTeamBoardFormBtnDiv">
				<div class="resetBtnDiv">
					<input type="reset" class="boardResetBtn"value="다시 작성">
				</div>
				<div class="boardRegAndMoveList">
					<input type="button" class="boardRegBtn" value="저장" onClick="checkBoardRegForm();">
					<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/recruitTeamBoardForm.do')">
				</div>
			</div>
			<input type="hidden" name="choice" value="팀">
		</form>
		
	</div>
</body>
</html>