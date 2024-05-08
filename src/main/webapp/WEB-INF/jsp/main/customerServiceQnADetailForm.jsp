<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CustomerServiceQnADetailForm</title>
<link href="/style/main/customerServiceQnADetailFormStyle.css" rel="stylesheet">
<script src="/js/main/customerServiceQnADetailFormScript.js"></script>
<script>
	function checkMid(){
		var mid = ${requestScope.customerServiceDetailDTO.mid};
		alert(mid);
	}

	function submitDetailFormComment(b_no){
		if(b_no == ''){
			location.href="/main/newCustomerServiceQnAForm.do";
		} else {
			$("[name='newCustomerServiceQnACommentForm'] .b_no").val(b_no);
	        document.newCustomerServiceQnAForm.action = "/main/newCustomerServiceQnAForm.do";
	        document.newCustomerServiceQnAForm.submit();
		}
	}
	
	function checkQnACommentRegForm(){
		
		var formObj = $("[name='customerServiceQnADetailFormCommentInsertForm']");
		
		$.ajax({
			
			url:"/QnACommentRegProc.do",
				
			type:"post",
				
			data:formObj.serialize(),
				
			success:function(json){
				var result = json["result"];
				
				if(result == 1){
					alert("작성 성공");
					window.location.reload();
				} else {
					alert("작성 실패");
				}
			},
			
			error:function(){"작성 실패(다른 오류)"}
		})
	}
	
	function customerServiceQnAUpdateForm(){
		
	}
	
	function customerServiceQnADeleteForm() {
        var formObj = $("[name='customerServiceQnADeleteForm']");
        var pwdInsert = prompt("계정 비밀번호를 입력해주세요.");

        function checkPwd() {
            if (sessionPwd !== pwdInsert) {
                alert("계정 비밀번호를 정확히 입력해주세요.");
                checkPwd();
            }
        }

        if(confirm("삭제하시겠습니까?") == false){
        	formObj.submit();
			return;
		}
    }
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <form name="newCustomerServiceQnACommentForm" action="/main/newCustomerServiceQnAForm.do" method="POST">
        <c:if test="${not empty requestScope.customerServiceDetailDTO.b_no}">
            <input type="hidden" class="b_no" name="b_no" value="${requestScope.customerServiceDetailDTO.b_no}">
        </c:if>
    </form>
    <form name="customerServiceQnAUpdateForm" action="/main/customerServiceQnAUpdateForm.do" method="POST">
        <c:if test="${not empty requestScope.customerServiceDetailDTO.b_no}">
            <input type="hidden" class="b_no" name="b_no" value="${requestScope.customerServiceDetailDTO.b_no}">
        </c:if>
    </form>
    <form name="customerServiceQnADeleteForm" action="/customerServiceQnADeleteProc.do" method="POST">
        <c:if test="${not empty requestScope.customerServiceDetailDTO.b_no}">
            <input type="hidden" class="b_no" name="b_no" value="${requestScope.customerServiceDetailDTO.b_no}">
        </c:if>
    </form>
    <div class="customerServiceQnADetailFormTitle">
        <img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
        <p class="titleBackgoundText">QnA</p>
    </div>
    <div class="moveListBtnDiv">
        <input type="button" class="moveListBtn" value="목록" onClick="location.href = '/main/customerServiceForm.do'">
    </div>
    <div class="customerServiceQnADetailFormContainer">
        <table class="customerServiceQnADetailFormRegTable" border="1" bordercolor="black" style="width:600px;">
            <tr>
                <th>제목</th>
                <td>
                    ${requestScope.customerServiceDetailDTO.subject}
                </td>
            </tr>
            <tr>
                <th>글쓴이</th>
                <td>
                    ${requestScope.customerServiceDetailDTO.writer}
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" class="content" rows="20" cols="40" maxlength="500" style="resize:none; border:0; width:450px;" readonly>
                        ${requestScope.customerServiceDetailDTO.content}
                    </textarea>
                </td>
            </tr>
        </table>
        <input type="button" class="checkbutton" value="확인" onClick="checkMid();">
        <c:if test="${requestScope.customerServiceDetailDTO.mid.equals(session.getAttribute('mid'))}">
	        <div class="upDelBoardBtnDiv">
		        <input type="button" class="updateBoardBtn" value="수정" onClick="customerServiceQnAUpdateForm();">
		        <input type="button" class="deleteBoardBtn" value="삭제" onClick="customerServiceQnADeleteForm();">
		    </div>
		</c:if>
        <div class="customerServiceQnADetailFormCommentInsertDiv">
        	<c:if test="${!empty requestScope.customerServiceQnADetailComment}">
	            <div class="customerServiceQnADetailFormComment">
	                <table class="customerServiceQnADetailFormCommentTable" border="1" bordercolor="black">
	                	<c:forEach var="customerServiceQnADetailComment" items="${requestScope.customerServiceQnADetailComment}" varStatus="status">
		                    <tr>
		                        <th>글쓴이</th>
		                        <td>${customerServiceQnADetailComment.writer}</td>
		                        <th>작성일</th>
		                        <td>${customerServiceQnADetailComment.reg_date}</td>
		                    </tr>
		                    <tr>
		                        <th>내용</th>
		                        <td colspan="3" style="width:490px; height:100px;">${customerServiceQnADetailComment.content}</td>
		                    </tr>
		             	</c:forEach>
	                </table>
	            </div>
	        </c:if>
            <c:if test="${sessionScope.mid == 'admin'}">
            	<form name="customerServiceQnADetailFormCommentInsertForm">
            		<input type="hidden" name="b_no" value="${requestScope.customerServiceDetailDTO.b_no}">
       				<input type="hidden" name="bc_no" value="${requestScope.customerServiceDetailDTO.b_no}">
	                <table border="1" bordercolor="black">
	                    <tr>
	                        <th>글쓴이</th>
	                        <td>${sessionScope.nickname}</td>
	                        <th>작성일</th>
	                        <td><c:set var="currentDate" value="<%= new java.text.SimpleDateFormat(\"yyyy-MM-dd\").format(new java.util.Date()) %>" />${currentDate}</td>
	                    </tr>
	                    <tr>
	                        <th>답변 입력</th>
	                        <td colspan="3">
								<textarea name="content" class="content" rows="20" cols="42" maxlength="1000" style="resize:none; width: 470px; height: 100px;"></textarea>
								<input type="button" class="commentRegBtn" value="저장" onClick="checkQnACommentRegForm();">
	                    	</td>
	                    </tr>
	                </table>
	        	</form>
            </c:if>
        </div>
    </div>
</body>
</html>
