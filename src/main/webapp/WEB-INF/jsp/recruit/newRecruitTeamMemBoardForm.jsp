<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateTeamMemReadCnt</title>
<link href="/style/newRecruitTeamBoardFormStyle.css" rel="stylesheet">
<script src="/js/newRecruitTeamBoardFormScript.js"></script>

<script>

	function checkBoardRegForm()
	{
		var formObj = $("[name='newRecruitTeamMemBoardForm']")
		
		$.ajax({
			//-------------------------------
			// WAS 로 접속할 주소 설정
			//-------------------------------
			url : "/recruitTeamMemRegProc.do"
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
					location.href='/recruitTeamMemBoardForm.do';
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
    <div class="newRecruitTeamMemBoardFormTitle">
    	<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">팀 / 팀원 모집 등록</p>
    </div>
    <div class="newRecruitTeamMemBoardFormContainer">
    
		<form name="newRecruitTeamMemBoardForm">
			<table class="newRecruitTeamMemBoardFormRegTable" border="1" bordercolor="black">
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
				<tr>
					<th>팀/팀원</th>
					<td>
						<input type="radio" name="team_mem" value="팀">팀
						<input type="radio" name="team_mem" value="팀원">팀원
					</td>
				<tr>
				
			</table>
			<div class="newRecruitTeamMemBoardFormBtnDiv">
				<div class="resetBtnDiv">
					<input type="reset" class="boardResetBtn"value="다시 작성">
				</div>
				<div class="boardRegAndMoveList">
					<input type="button" class="boardRegBtn" value="저장" onClick="checkBoardRegForm();">
					<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/recruitTeamMemBoardForm.do')">
				</div>
			</div>
		</form>
		
	</div>
</body>
</html>