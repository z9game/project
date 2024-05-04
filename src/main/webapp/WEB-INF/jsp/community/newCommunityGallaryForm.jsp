<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewCommunityGallaryForm</title>
<link href="/style/newCommunityGallaryFormStyle.css" rel="stylesheet">
<!--  
<script src="/js/newCommunityGallaryFormScript.js"></script>
-->
<script>
function checkGallaryBoardRegForm(){
	
	var formObj = $("[name='newCommunityGallaryForm']");
	
	var subject = $(".subject").val();
	var content = $(".content").val();
	
	if (subject.trim().length == 0) {
		alert("제목을 입력해야 합니다.");
		return;
	}
	
	if (content.trim().length == 0) {
		alert("내용을 입력해야 합니다.");
		return;
	}
	
	var serialize = formObj.serialize();
	
	
	
	$.ajax(
			{ 
				
				url    : "/CommunityGallaryProc.do"
					
				,type  : "post"
				
				,data  : serialize
				
				,success : function(json){
					var result = json["result"];
					if(result==1){
						alert("갤러리 등록 성공 입니다.");
						location.replace("/communityGallaryForm.do")
					}
					else{
						alert("갤러리 등록 실패입니다!");
					}
				}
				
				,error : function(){
					alert("갤러리 실패! 관리자에게 문의 바랍니다.");
				}
			}
		);
	
}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="newCommunityGallaryFormTitle">
    	<img src="/image/CommunityTitleBackgroundImage.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">갤러리 등록</p>
    </div>
    <div class="newCommunityGallaryFormContainer">
		<form name="newCommunityGallaryForm"> 
			<table class="newCommunityGallaryFormRegTable" border="1" bordercolor="black">
				<tr>
					<th>글쓴이</th>
					<td>
						<%= session.getAttribute("nickname") %>
						<input type="hidden" name="writer" class="writer" size="40" maxlength="15" value="<%= session.getAttribute("nickname") %>">
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="subject" class="subject" size="40" maxlength="30">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" class="content" rows="20" cols="40" maxlength="500" style="resize:none"></textarea>
					</td>
				</tr>
				<tr>
					<th>파일 첨부</th>
					<td>
						<input type="file" name="imageFileAdd" class="imageFileAdd" accept="image/*" multiple>				
					</td>
				</tr>
				<!-- 
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd" class="pwd" size="40" maxlength="4">
					</td>
				</tr>
				 -->
			</table>
			<div class="newCommunityGallaryFormBtnDiv">
				<div class="resetBtnDiv">
					<input type="reset" class="boardResetBtn"value="다시 작성">
				</div>
				<div class="boardRegAndMoveList">
					<input type="button" class="boardRegBtn" value="저장" onClick="checkGallaryBoardRegForm();">
					<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/communityGallaryForm.do')">
				</div>
			</div>
		</form>
	</div>
</body>
</html>