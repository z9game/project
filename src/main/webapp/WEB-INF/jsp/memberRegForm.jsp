<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberRegForm</title>
<link href="/style/memberRegFormStyle.css" rel="stylesheet">
<script src="/js/memberRegFormScript.js"></script>
<script>
	loginCheckCnt = 0;
	
	function checkmid(){
		var midobj = $(".mid");
		
		if(midobj.val().trim() == '') {
	        alert("아이디를 입력해주세요.");
	        midobj.val("");
	        return;
	   	}
		
		$.ajax({
			
			url   : "/midFindProc.do" 
	
			,type : "post"
	
			,data : midobj.serialize()
			
			,success : function(memberCnt){
				if(memberCnt == 1){
					alert("중복된 아이디입니다.");
					midobj.val("");
				} else {
					alert("가입 가능한 아이디입니다.");
					loginCheckCnt++;
				}
				
			}			
			,error : function(){alert("입력 실패 / 관리자에게 문의 바람");}
		})
	}
	
	function regMember(){
	
		var midobj = $(".mid");
		var pwdobj = $(".password");
		var checkpwdobj = $(".checkpwd");
		var nameobj = $(".name");
		var formobj = $("[name='memRegForm']")
		
		if(new RegExp(/^[가-힣]{2,15}$/).test(nameobj.val()) == false){	
			alert("이름은 2~15자의 한글이어야 합니다.");
			nameobj.val("");
			return;
		}
		
		
		if(new RegExp(/^[a-zA-Z0-9]{5,20}$/).test(midobj.val()) == false){	
			alert("아이디는 영어 대/소문자 와 숫자로만 입력 가능합니다./5~20자 이내")
			midobj.val("");
			return;
		}
		
		
		if(new RegExp(/^[a-zA-Z0-9]{5,20}$/).test(pwdobj.val()) == false){
			alert("암호는 영어 대/소문자 와 숫자로만 입력 가능/5~20자 이내")
			pwdobj.val("");
			return;		
		}
		
		
		if(pwdobj.val() != checkpwdobj.val()){
			alert("암호와 암호확인 문자가 동일하지 않습니다.")
			return;		
		}
		
		if(loginCheckCnt == 0){
			alert("아이디 중복확인 해주세요")
			return;
		}else if(loginCheckCnt == 1){
			loginCheckCnt--;
		}
		
		alert(formobj.serialize());
		
		$.ajax({
			
			url   : "/memberRegProc.do" 
			
			,type : "post"
			
			,data : formobj.serialize()
			
			,success : function(json){
				var result = json["result"];
				if(result == 1){
					alert("회원가입 성공.");
					location.href='loginForm.do';
				}else{
					alert("회원가입 실패, 관리자에게 문의 바람");
				}
				
			}			
			,error : function(){alert("가입 실패 / 관리자에게 문의 바람");}
		})
	}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="memberRegFormContainer">
		<form name="memberRegForm">
			<table align="center" border=1 style="margin-bottom: 10px; margin-top: 10px;">
				<caption style="margin-bottom:10px;"><b>[회원가입]</b><br></caption>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="mid" class="mid" size="30" maxlength="30">
						<input type="button" name="checkMid" class="checkMid" onclick="checkmid()" value="중복 확인">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="mname" class="mname" size="40" maxlength="15">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd" class="pwd" size="40"  maxlength="30">
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="pwdConfirm" class="pwdConfirm" size="40">
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
						<input type="date" name="birth" class="birth" size="40" maxlength="30">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="phoneNumber" class="phoneNumber" size="40" maxlength="30">
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
			            <select name="sido" id="" onchange="categoryChange(this)">
			              <option value>시/도 선택</option>
			              <option value="general01">강원</option>
			              <option value="general02">경기</option>
			              <option value="general03">경남</option>
			              <option value="general04">경북</option>
			              <option value="general05">광주</option>
			              <option value="general06">대구</option>
			              <option value="general07">대전</option>
			              <option value="general08">부산</option>
			              <option value="general09">서울</option>
			              <option value="general10">울산</option>
			              <option value="general11">인천</option>
			              <option value="general12">전남</option>
			              <option value="general13">전북</option>
			              <option value="general14">제주</option>
			              <option value="general15">충남</option>
			              <option value="general16">충북</option>
			            </select>
			            <select name="gungu" id="state">
			              <option>군/구 선택</option>
			            </select>
					</td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>
			           <input type="text" name="address" class="address" size="40" maxlength="50">
					</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>
						<input type="date" name="regDate" class="regDate" size="40" readonly>
					</td>
				</tr>
			</table>
			<div class="regConfirmBtnDiv">
				<input type="button" class="regConfirmBtn" value="회원가입" onclick="regMember()">
				<input type="button" class="moveLoginPage" value="로그인 화면" onClick="location.replace('/loginForm.do')">
			</div>
		</form>
	</div>
</body>
</html>