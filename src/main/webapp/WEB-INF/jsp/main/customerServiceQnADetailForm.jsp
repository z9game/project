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
	function submitDetailFormComment(b_no){
		if(b_no == ''){
			location.href="/main/newCustomerServiceQnAForm.do";
		} else {
			$("[name='newCustomerServiceQnAForm'] .b_no").val(b_no);
	        document.newCustomerServiceQnAForm.action = "/main/newCustomerServiceQnAForm.do";
	        document.newCustomerServiceQnAForm.submit();
		}
	}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <form name="newCustomerServiceQnAForm" action="/main/newCustomerServiceQnAForm.do" method="POST">
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
        <div class="customerServiceQnADetailFormCommentInsertDiv">
            <div class="customerServiceQnADetailFormCommentInsert">
                <table class="customerServiceQnADetailFormCommentInsertTable" border="1" bordercolor="black">
                	<c:forEach var="customerServiceQnABoard" items="${requestScope.customerServiceQnABoardList}" varStatus="status">
	                    <tr>
	                        <th>글쓴이</th>
	                        <td>${sessionScope.nickname}</td>
	                        <th>작성일</th>
	                        <td>${requestScope.customerServiceDetailDTO.reg_date}</td>
	                    </tr>
	                    <tr>
	                        <th>내용</th>
	                        <td colspan="3" style="width:490px; height:100px;">${requestScope.customerServiceDetailDTO.content}</td>
	                    </tr>
	             	</c:forEach>
                </table>
            </div>
            <c:if test="${sessionScope.mid == 'admin'}">
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
            </c:if>
        </div>
    </div>
</body>
</html>
