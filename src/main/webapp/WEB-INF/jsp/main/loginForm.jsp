<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm</title>
<link href="/style/main/loginFormStyle.css" rel="stylesheet">
<script src="/js/main/loginFormScript.js"></script>

<script>

	function doLogin()
	{
		var midobj=$(".mid");
		var pwdobj=$(".password");
		
		var mid = midobj.val();
		var password = pwdobj.val();
		
		
		$.ajax({
			//----------------------------------------------------------
			//WAS 에 접속할 URL 주소 지정
			//----------------------------------------------------------
			url   : "/loginProc.do" 
			//----------------------------------------------------------
			//form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
			//----------------------------------------------------------
			,type : "post"
			//----------------------------------------------------------
			//WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
			//----------------------------------------------------------
			,data : $("[name='loginForm']").serialize()
					//,data : "mid =" + mid + "&pwd =" + pwd
					//,data : {"mid":mid, "pwd":pwd} <-JSON // serialize() 방식 말고 이 두 가지 방법도 가능함.
			//----------------------------------------------------------
			//WAS 의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			//이때, 익명함수의 매개변수로 WAS 의 응답물이 들어 온다.
			//----------------------------------------------------------
				//--------------------------
				//WAS 의 응답물이
				//1행1열의 데이터라면 숫자 or 문자로 들어오고
				//1행n열의 데이터라면 JSON 으로 들어오고
				//n행1열의 데이터라면 Array 으로 들어오고
				//n행m열의 데이터라면 다량의 JSON 이 저장된 Array 객체로 들어온다.
				//--------------------------
				
			,success : function(midpwdCnt){
				//--------------------------
				//만약에 매개변수의 데이터가 1이면
				//만약에 WAS 가 응답한 데이터가 1이면
				//만약에 아이디와 암호의 존재 개수가 1이면
				//--------------------------
				if(midpwdCnt == 1)
				{
					//--------------------------
					//alert("로그인 성공")
					//location 객체의 href 메소드를 호출하여
					//WAS로 URL 주소 '/boardList.do' 로 접속시도하고 
					//새로운 HTML 문서를 받아서 현재 화면에 실행한다.
					//즉, 새로운 화면을 연다.
					//<주의> href 메소드를 호출하여
					//WAS로 접속 할때는 get 방식으로 접속한다.
					//--------------------------
					location.href='/main/mainForm.do';
				}
				else
				{
					alert("로그인 실패")
				}
			}
			,error 	 : function(){alert("오류 발생!")}
			
		}) 
	}
	
	function enterkey()
	{
	   
	   if(window.event.keyCode == 13)
	   {
		   doLogin();
	   }
	}
	
</script>

</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="loginFormContainer">
		<form name="loginForm" onsubmit="return false">
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
						<input type="password" name="password" class="password" onkeyup="enterkey()">
					</td>
				</tr>
			</table>
			<div class="loginAndautoLogin">
				<input type="button" value="로그인" class="loginbtn" onclick="doLogin()">
			</div>
			<div class="memberRegAndInfoFind">
				<input type="button" value="회원가입" class="regBtn" style="cursor:pointer" onclick="location.replace('/memberRegForm.do')">
				<input type="button" value="회원정보찾기" class="memberInfoFindBtn" style="cursor:pointer" onclick="location.replace('/memberInfoFindForm.do')">
			</div>
		</form>
	</div>
</body>
</html>
