<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm</title>
<link href="/style/loginFormStyle.css" rel="stylesheet">
<script src="/js/loginFormScript.js"></script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="loginFormContainer">
		<form name="loginForm">
			<table border="1" align="center" style="margin-top:20px;">
				<caption style="margin-bottom:10px;"><b>[로그인]</b></caption>
				<tr>
					<th bgcolor="lightgray">아이디</th>
					<td>
						<input type="text" name="mid" class="mid">
						<!-- class 값은 JQuery, CSS에서 통합적으로 사용하기 위해 설정 -->
						<!-- name 값은 파라미터명="파라미터값"으로 사용되며 대부분의 경우 DB의 Column명과 일치함 -->
					</td>
				</tr>
				<tr>
					<th bgcolor="lightgray">암&nbsp;&nbsp;&nbsp;호</th>
					<td>
						<input type="password" name="pwd" class="pwd">
					</td>
				</tr>
			</table>
			<div class="loginAndautoLogin">
				<input type="button" value="로그인" class="loginbtn">
			</div>
			<div class="memberRegAndInfoFind">
				<input type="button" value="회원가입" class="regBtn" style="cursor:pointer" onclick="location.replace('/memberRegForm.do')">
				<input type="button" value="회원정보찾기" class="memberInfoFindBtn" style="cursor:pointer" onclick="location.replace('/memberInfoFindForm.do')">
			</div>
		</form>
	</div>
</body>
</html>