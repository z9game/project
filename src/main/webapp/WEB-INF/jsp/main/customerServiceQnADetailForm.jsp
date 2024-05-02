<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewCustomerServiceQnAForm</title>
<link href="/style/newCustomerServiceQnAFormStyle.css" rel="stylesheet">
<script src="/js/newCustomerServiceQnAFormScript.js"></script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="newCustomerServiceQnAFormTitle">
    	<img src="/image/CommunityTitleBackgroundImage.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">QnA 등록</p>
    </div>
    <div class="newCustomerServiceQnAFormContainer">
		<form name="newCustomerServiceQnAForm">
			<table class="newCustomerServiceQnAFormRegTable" border="1" bordercolor="black">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="subject" class="subject" size="40" maxlength="30">
					</td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>
						<input type="text" name="writer" class="writer" size="40" maxlength="15">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" class="content" rows="20" cols="40" maxlength="500" style="resize:none"></textarea>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd" class="pwd" size="40" maxlength="4">
					</td>
				</tr>
			</table>
			<div class="newCustomerServiceQnAFormBtnDiv">
				<div class="resetBtnDiv">
					<input type="reset" class="boardResetBtn"value="다시 작성">
				</div>
				<div class="boardRegAndMoveList">
					<input type="button" class="boardRegBtn" value="저장" onClick="checkBoardRegForm();">
					<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/customerServiceForm.do')">
				</div>
			</div>
		</form>
	</div>
</body>
</html>