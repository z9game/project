<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CustomerServiceQnAUpdateForm</title>
<link href="/style/main/customerServiceQnAUpdateFormStyle.css" rel="stylesheet">
<!-- <script src="/js/main/newCustomerServiceQnAFormScript.js"></script> -->
<script>
	function checkQnABoardUpdateForm(b_no){
		
		var formObj = $("[name='updateCustomerServiceQnAForm']");
		var subjectObj = formObj.find(".subject");
		var contentObj = formObj.find(".content");
		
		var sessionPwd = "<%= session.getAttribute("password") %>";
		
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
		
	    function checkPwd() {
	    	var pwdInsert = prompt("계정 비밀번호를 입력해주세요.");
			
			if (pwdInsert == null) { 
		        return;
		    }
			
	        if (sessionPwd != pwdInsert) {
	        	
	            alert("계정 비밀번호를 정확히 입력해주세요.");
	            
	            checkQnABoardUpdateForm();
	            
	        } else {
	            if(confirm("수정하시겠습니까?") == true){
	            	
	            	$.ajax({
	        			
	    				url:"/customerServiceQnAUpdateProc.do",
	    					
	    				type:"post",
	    					
	    				data:formObj.serialize(),
	    					
	    				success:function(json){
	    					var result = json["result"];
	    					
	    					if(result > 0){
	    						
	                    		alert("수정 성공");
	                    		
                    			$("[name='returnCustomerServiceQnADetailForm'] .b_no").val(b_no);
                    			document.returnCustomerServiceQnADetailForm.action="/main/customerServiceQnADetailForm.do";
                    			document.returnCustomerServiceQnADetailForm.submit();
	    					}
	                    		
	    				},
	    				
	    				error:function(){"수정 실패(에러)"}
	    			})
	            }
	        }
		}
	
	    checkPwd();
	}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="updateCustomerServiceQnAFormTitle">
	    <img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
	   	<p class="titleBackgoundText">QnA 수정</p>
 	</div>
    <div class="updateCustomerServiceQnAFormContainer">
    	<form name="returnCustomerServiceQnADetailForm" action="/customerServiceQnADetailForm.do" method="POST">
	    	<input type="hidden" class="b_no" name="b_no" value="${requestScope.customerServiceDetailDTO.b_no}">
	    </form>
		<form name="updateCustomerServiceQnAForm">
			<input type="hidden" class="b_no" name="b_no" value="${requestScope.customerServiceDetailDTO.b_no}">
			<table class="updateCustomerServiceQnAFormRegTable" border="1" bordercolor="black">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="subject" class="subject" size="40" maxlength="100" value="${requestScope.customerServiceDetailDTO.subject}">
					</td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>
						<% out.println((String)session.getAttribute("nickname")); %>
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
						<textarea name="content" class="content" rows="20" cols="42" maxlength="1000" style="resize:none">${requestScope.customerServiceDetailDTO.content}</textarea>
					</td>
				</tr>
			</table>
			<div class="updateCustomerServiceQnAFormBtnDiv">
				<div class="resetBtnDiv">
					<input type="reset" class="boardResetBtn"value="다시 작성">
				</div>
				<div class="boardRegAndMoveList">
					<input type="button" class="boardRegBtn" value="저장" onClick="checkQnABoardUpdateForm(${requestScope.customerServiceDetailDTO.b_no});">
					<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/main/customerServiceForm.do')">
				</div>
			</div>
		</form>
	</div>
</body>
</html>