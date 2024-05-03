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
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="customerServiceQnADetailFormTitle">
    	<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">QnA</p>
    </div>
    <div class="customerServiceQnADetailFormContainer">
		<table class="customerServiceQnADetailFormRegTable" border="1" bordercolor="black">
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
					<textarea name="content" class="content" rows="20" cols="40" maxlength="500" style="resize:none" readonly>
						${requestScope.customerServiceDetailDTO.content}
					</textarea>
				</td>
			</tr>
		</table>
		<div class="customerServiceQnADetailFormBtnDiv">
			<c:if test="${sessionScope.mid == 'admin'}">
				<div class="resetBtnDiv">
					<input type="reset" class="boardCommentBtn"value="답변 작성">
				</div>
			</c:if>
			<div class="moveListBtnDiv">
				<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/main/customerServiceForm.do')">
			</div>
		</div>
	</div>
</body>
</html>