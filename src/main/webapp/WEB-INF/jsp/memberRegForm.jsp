<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberRegForm</title>
<link href="/style/memberRegFormStyle.css" rel="stylesheet">


<script>


loginCheckCnt = 0;

function checkmid()
{
	var midobj = $(".mid");
	if(midobj.val().trim() == '') {
        alert("아이디를 입력해주세요.");
        midobj.val("");
        return;
    }
	
	//-----------------------------------------------------
	// JQuery 객체의 [ajax 메소드]를 호출하여
	// WAS 에 비동기방식으로 "/boardRegProc.do" 주소로 접속하고 
	// 게시판 입력 결과를 받아서
	// 성공했으면 경고하고 게시판 목록화면으로 이동하고
	// 실패했으면 경고하기
	//-----------------------------------------------------
	$.ajax({
		//----------------------------------------------------------
		//WAS 에 접속할 URL 주소 지정
		//----------------------------------------------------------
		url   : "/midFindProc.do" 
		//----------------------------------------------------------
		//form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
		//----------------------------------------------------------
		,type : "post"
		//----------------------------------------------------------
		//WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
		//----------------------------------------------------------
		,data : midobj.serialize()
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
			
		,success : function(memberCnt){
			if(memberCnt == 1)
			{
				alert("중복된 아이디입니다.");
				midobj.val("");
			}
			

			else
			{
				alert("가입 가능한 아이디입니다.");
				loginCheckCnt++;
			}
			
		}			
		,error 	 : function(){alert("입력 실패 / 관리자에게 문의 바람");}
		
	})
}



function regMember()
{

	var midobj = $(".mid");
	var pwdobj = $(".password");
	var checkpwdobj = $(".checkpwd");
	var nameobj = $(".name");
	var formobj = $("[name='memRegForm']")
	
	

	
	
	if(new RegExp(/^[가-힣]{2,15}$/).test(nameobj.val()) == false)
	{	
		alert("이름은 2~15자의 한글이어야 합니다.");
		nameobj.val("");
		return;
	}
	
	
	if(new RegExp(/^[a-zA-Z0-9]{5,20}$/).test(midobj.val()) == false)
	{	

		alert("아이디는 영어 대/소문자 와 숫자로만 입력 가능합니다./5~20자 이내")
		midobj.val("");
		return;
	}
	
	
	if(new RegExp(/^[a-zA-Z0-9]{5,20}$/).test(pwdobj.val()) == false)
	{
		alert("암호는 영어 대/소문자 와 숫자로만 입력 가능/5~20자 이내")
		pwdobj.val("");
		return;		
	}
	
	
	if(pwdobj.val() != checkpwdobj.val())
	{
		alert("암호와 암호확인 문자가 동일하지 않습니다.")
		return;		
	}
	
	if(loginCheckCnt == 0)
	{
		alert("아이디 중복확인 해주세요")
		return;
	}
	else if(loginCheckCnt == 1)
	{
		loginCheckCnt--;
	}
	
	
	//-----------------------------------------------------
	// JQuery 객체의 [ajax 메소드]를 호출하여
	// WAS 에 비동기방식으로 "/boardRegProc.do" 주소로 접속하고 
	// 게시판 입력 결과를 받아서
	// 성공했으면 경고하고 게시판 목록화면으로 이동하고
	// 실패했으면 경고하기
	//-----------------------------------------------------
	$.ajax({
		//----------------------------------------------------------
		//WAS 에 접속할 URL 주소 지정
		//----------------------------------------------------------
		url   : "/memberRegProc.do" 
		//----------------------------------------------------------
		//form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
		//----------------------------------------------------------
		,type : "post"
		//----------------------------------------------------------
		//WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
		//----------------------------------------------------------
		,data : formobj.serialize()
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
			
		,success : function(json){
			var result = json["result"];
			if(result == 1)
			{
				alert("회원가입 성공.");
				location.href='/loginForm.do';
			}

			else
			{
				alert("회원가입 실패, 관리자에게 문의 바람");
				
			}
			
		}			
		,error 	 : function(){alert("가입 실패 / 관리자에게 문의 바람");}
		
	})
}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="memberRegFormContainer">
		<form name="memRegForm">
			<table align="center" border=1 style="margin-bottom: 10px; margin-top: 10px;">
				<caption style="margin-bottom:10px;"><b>[회원가입]</b><br></caption>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="mid" class="mid" size="30" maxlength="30">
						<input type="button" onclick="checkmid()" value="중복 확인">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" class="name" size="40" maxlength="15">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="password" class="password" size="40"  maxlength="30">
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="checkpwd" class="checkpwd" size="40">
					</td>
				</tr>
				<tr>
					<th>별명</th>
					<td>
						<input type="text" name="nickname" class="nickname" size="40" maxlength="30">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="email" class="email" size="40" maxlength="50">
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="date" name="birthday" class="birthday" size="40" maxlength="30">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="phone" class="phone" size="40" maxlength="30">
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" class="gender" value="남">남
						<input type="radio" name="gender" class="gender" value="여">여
					</td>
				</tr>
				<tr>
					<th>시/도</th>
					<td colspan="5" align="center">
			            <select name="sido_id" id="" onchange="categoryChange(this)">
			              <option value>시/도 선택</option>
			              <option value="1">강원</option>
			              <option value="2">경기</option>
			              <option value="3">경남</option>
			              <option value="4">경북</option>
			              <option value="5">광주</option>
			              <option value="6">대구</option>
			              <option value="7">대전</option>
			              <option value="8">부산</option>
			              <option value="9">서울</option>
			              <option value="10">울산</option>
			              <option value="11">인천</option>
			              <option value="12">전남</option>
			              <option value="13">전북</option>
			              <option value="14">제주</option>
			              <option value="15">충남</option>
			              <option value="16">충북</option>
			            </select>
			            <select name="sigungu_id" id="state">
			              <option>군/구 선택</option>
			            </select>
					</td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>
			           <input type="text" name="detail_address" class="detail_address" size="40" maxlength="50">
					</td>
				</tr>
			</table>
			<div class="regConfirmBtnDiv">
				<input type="button" class="regConfirmBtn" value="회원가입" onclick="regMember()">
				<input type="button" class="moveLoginPage" value="로그인 화면" onClick="location.replace('/main/loginForm.do')">
			</div>
		</form>
	</div>
</body>
</html>