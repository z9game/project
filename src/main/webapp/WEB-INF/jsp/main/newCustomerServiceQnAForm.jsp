<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewCustomerServiceQnAForm</title>
<link href="/style/main/newCustomerServiceQnAFormStyle.css" rel="stylesheet">
<!-- <script src="/js/main/newCustomerServiceQnAFormScript.js"></script> -->
<script>
	function checkQnABoardRegForm(){
	
		var formObj = $("[name='newCustomerServiceQnAForm']");
		var subjectObj = formObj.find(".subject");
		var contentObj = formObj.find(".content");
		var pwdObj = formObj.find(".pwd");
		var password = "<%= session.getAttribute("password") %>";
		
		if(new RegExp(/^.{2,100}$/).test(subjectObj.val())==false){
			alert("제목은 2~100자 한글입니다.");
			subjectObj.val("");
			return;
		}
		
		if (contentObj.val().trim().length==0||contentObj.val().trim().length>1000){
			alert("내용은 1~1000자 입력해야 합니다.");
			contentObj.val("");
			return;
		}
		
		if(pwdObj.val().trim().length > 50){
			alert("계정 비밀번호를 정확히 입력해주세요.");
			pwdObj.val("");
			return;
		}
		
		if (pwdObj.val() !== password) {
			alert("계정 비밀번호와 다릅니다.");
			return;
		}
		
		if(confirm("작성하시겠습니까?") == false){
			return;
		}
		
		$.ajax({
			
				url:"/QnABoardRegProc.do",
					
				type:"post",
					
				data:formObj.serialize(),
					
				success:function(json){
					var result = json["result"];
					
					if(result == 1){
						alert("작성 성공");
						location.href = '/main/customerServiceForm.do';
					} else {
						alert("작성 실패");
					}
				},
				
				error:function(){"작성 실패"}
			})
	}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="newCustomerServiceQnAFormTitle">
    	<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">QnA 등록</p>
    </div>
    <div class="newCustomerServiceQnAFormContainer">
		<form name="newCustomerServiceQnAForm">
			<table class="newCustomerServiceQnAFormRegTable" border="1" bordercolor="black">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="subject" class="subject" size="40" maxlength="100">
					</td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>
						<input type="text" name="writer" class="writer" size="40" maxlength="100" value="<%= session.getAttribute("nickname") %>" readonly>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<% out.println((String)session.getAttribute("email")); %>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" class="content" rows="20" cols="42" maxlength="1000" style="resize:none"></textarea>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd" class="pwd" size="40" maxlength="50">
					</td>
				</tr>
			</table>
			<div class="newCustomerServiceQnAFormBtnDiv">
				<div class="resetBtnDiv">
					<input type="reset" class="boardResetBtn"value="다시 작성">
				</div>
				<div class="boardRegAndMoveList">
					<input type="button" class="boardRegBtn" value="저장" onClick="checkQnABoardRegForm();">
					<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/main/customerServiceForm.do')">
				</div>
			</div>
		</form>
	</div>
</body>
</html>