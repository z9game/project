<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminDetailUpDelForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">

<script src="/js/community/communityFreeBoardFormScript.js"></script>




<script>
	function checkAdminMemberUpForm() {
		var formObj = $("[name='adminDetailUpDelForm']")
		var midobj = $(".mid");
		var pwdobj = $(".pwd");
		var checkpwdobj = $(".checkpwd");
		var nameobj = $(".name");
		var emailObj = $(".email");
		var nicknameObj = $(".nickname");
		var phone1Obj = $(".phone1");
		var phone2Obj = $(".phone2");
		var phone3Obj = $(".phone3");
		var addressObj = $(".detail_address")
		
		var sidoId = formObj.find("[name='sido_id']").val();
    	var sigunguId = formObj.find("[name='sigungu_id']").val();
		
		
		if(new RegExp(/^[가-힣]{2,15}$/).test(nameobj.val()) == false)
		{	
			alert("이름은 2~15자의 한글이어야 합니다.");
			//nameobj.val("");
			return;
		}
		
		if(new RegExp(/^[a-zA-Z0-9]{5,20}$/).test(midobj.val()) == false)
		{	

			alert("아이디는 영어 대/소문자 와 숫자로만 입력 가능합니다./5~20자 이내")
			//midobj.val("");
			return;
		}
		

		if(new RegExp(/^[가-힣a-zA-Z0-9]{2,15}$/).test(nicknameObj.val()) == false)
		{	
			alert("닉네임은 2~15자 특수문자를 제외한 한글,영어,숫자로만 입력 가능합니다.");
			//nicknameObj.val("");
			return;
		}
		
		if(new RegExp(/^[a-zA-Z0-9]{5,20}$/).test(pwdobj.val()) == false)
		{
			alert("암호는 영어 대/소문자 와 숫자로만 입력 가능/5~20자 이내")
			//pwdobj.val("");
			return;		
		}
		
		if(pwdobj.val() != checkpwdobj.val())
		{
			alert("암호와 암호확인 문자가 동일하지 않습니다.")
			return;		
		}
		

		if(new RegExp(/^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/).test(emailObj.val()) == false)
		{
			alert("올바른 이메일 형식을 입력해주세요");
			//emailObj.val("");
			return;
		}
		
		
		
		

		if(new RegExp(/^[0-9]{3}$/).test(phone1Obj.val()) == false)
		{	
			alert("잘못된 전화번호형식입니다.");
			//phone1Obj.val("");
			return;
		}
		
		if(new RegExp(/^[0-9]{4}$/).test(phone2Obj.val()) == false)
		{	
			alert("잘못된 전화번호형식입니다.");
			//phone2Obj.val("");
			return;
		}
		
		if(new RegExp(/^[0-9]{4}$/).test(phone3Obj.val()) == false)
		{	
			alert("잘못된 전화번호형식입니다.");
			//phone3Obj.val("");
			return;
		}
		
		 if (sidoId !== "0" && (sigunguId === "0" || sigunguId === null || sigunguId === '')) {
		        alert("군구를 선택해주세요.");
		        return;
		    }
		
		
		
		if(new RegExp(/^[a-zA-Z가-힣0-9\s]+$/).test(addressObj.val()) == false)
		{	
			alert("잘못된 주소형식입니다.");
			//addressObj.val("");
			return;
		}
		
		
		
		if(formObj.find(".games_played").val() < 0 ||
				   formObj.find(".wins").val() < 0 ||
				   formObj.find(".draws").val() < 0 ||
				   formObj.find(".losses").val() < 0 ||
				   formObj.find(".goals_for").val() < 0 ||
				   formObj.find(".goals_assist").val() < 0) {
				    alert("기록은 0 미만으로 입력될 수 없습니다.");
				    return;
				}
		
		
		
	
		
// 		if(loginCheckCnt == 0)
// 		{
// 			alert("아이디 중복확인 해주세요")
// 			return;
// 		}
// 		else if(loginCheckCnt == 1)
// 		{
// 			loginCheckCnt--;
// 		}
		//alert(formObj.serialize());

		if (confirm("정말수정하시겠습니까?") == false) {
			return;
		}

		$.ajax({
			url : "/adminMemberUpProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 회원입니다.");
					location.href = "/adminForm.do";
				} else {
					alert("회원정보 수정 성공입니다.");
					location.href = "/adminForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}

	function checkAdiminDelForm() {
		var formObj = $("[name='adminDetailUpDelForm']");
		if (confirm("정말 삭제하시겠습니까?") == false) {
			return;
		}
		$.ajax({
			url : "/adminMemberDelProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 회원입니다.");
					location.href = "/adminForm.do";
				} else {
					alert("공지사항 삭제 성공입니다.");
					location.href = "/adminForm.do";
				}
			},
			error : function() {
				alert("삭제 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}
</script>

</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		
		<p class="titleBackgoundText">회원정보수정</p>
	</div>

	<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>

	<form name="adminDetailUpDelForm">
		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collpase: collpase">
			<caption>[회원정보 수정/삭제]</caption>
			<tr>
				<th bgColor="lightgray">이 름</th>
				<td><input type="text" name="name" class="name" size="10"
					maxlength="15" value="${requestScope.memberDTO.name}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">아이디</th>
				<td><input type="text" name="mid" class="mid" size="40"
					maxlength="30" value="${requestScope.memberDTO.mid}"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>
				<!-------------------------------------------------------->
				<input type="text" name="nickname" class="nickname" size="15" maxlength="15" value="${requestScope.memberDTO.nickname}">
				<!-------------------------------------------------------->
				</td>
			</tr>
			
			<tr>
				<th>암호</th>
				<td>
				<!-------------------------------------------------------->
				<input type="password" name="password" class="pwd" size="15" maxlength="15" value="${requestScope.memberDTO.password}">
				<!-------------------------------------------------------->
				</td>
			</tr>
			
			<tr>
				<th>암호확인</th>
				<td>
				<!-------------------------------------------------------->
				<input type="password" name="checkpwd" class="checkpwd" size="15" maxlength="15" value="${requestScope.memberDTO.password}">
				<!-------------------------------------------------------->
				</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td>
				<!-------------------------------------------------------->
				<input type="email" name="email" class="email" size="25" maxlength="50" value="${requestScope.memberDTO.email}">
				<!-------------------------------------------------------->
				</td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td>
				<!-------------------------------------------------------->
				<input type="tel" name="phone1" class="phone1" size="3" maxlength="3" value="${requestScope.memberDTO.phone1}">-<input type="tel" name="phone2" class="phone2" size="3" maxlength="4" value="${requestScope.memberDTO.phone2}">-<input type="tel" name="phone3" class="phone3" size="3" maxlength="4" value="${requestScope.memberDTO.phone3}">
				<!-------------------------------------------------------->
				</td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td colspan="5" > ${requestScope.memberDTO.sido} ${requestScope.memberDTO.sigungu} -> (수정)
		            <select name="sido_id" id="" onchange="categoryChange(this)"  class ="sido_id">
		              <option value="0">시/도 선택</option>
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
		            <select name="sigungu_id" id="state" class="sigungu_id">
		              <option value ="0">군/구 선택</option>
		            </select>
				</td>
			</tr>
			
			<tr>
			
			 <tr>
				<th>상세주소</th>
				<td>
				<!-------------------------------------------------------->
				<input type="text" name="detail_address" class="detail_address" size="25" maxlength="50" value="${requestScope.memberDTO.detail_address}">
				<!-------------------------------------------------------->
				</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${requestScope.memberDTO.reg_date}</td>
			</tr>

		</table>




		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collpase: collpase">
			<caption>[기록 수정/삭제]</caption>
			<tr>
				<th bgColor="lightgray">이 름</th>
				<td><input type="text" name="name" class="name" size="10"
					maxlength="15" value="${requestScope.memberDTO.name}" disabled>
				</td>
			</tr>

			<tr>
				<th bgColor="lightgray">경기수</th>
				<td><input type="number" name="games_played" class="games_played"
					size="40" maxlength="30"
					value="${requestScope.playerRecordDTO.games_played}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">승리수</th>
				<td><input type="number" name="wins" class="wins" size="40"
					maxlength="30" value="${requestScope.playerRecordDTO.wins}"></td>
			</tr>

			<tr>
				<th bgColor="lightgray">무승부</th>
				<td><input type="number" name="draws" class="draws" size="40"
					maxlength="30" value="${requestScope.playerRecordDTO.draws}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">패배수</th>
				<td><input type="number" name="losses" class="losses" size="40"
					maxlength="30" value="${requestScope.playerRecordDTO.losses}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">골</th>
				<td><input type="number" name="goals_for" class="goals_for"
					size="40" maxlength="30"
					value="${requestScope.playerRecordDTO.goals_for}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">어시스트</th>
				<td><input type="number" name="goals_assist" class="goals_assist"
					size="40" maxlength="30"
					value="${requestScope.playerRecordDTO.goals_assist}"></td>
			</tr>



		</table>









		<input type="hidden" name="m_no"
			value="${requestScope.memberDTO.m_no}"> <input type="hidden"
			name="player" value="${requestScope.playerRecordDTO.player}">
	</form>


	<div style="height: 5px"></div>
	<center>
		<span style="cursor: pointer"
			onclick="location.replace('/adminForm.do')">[목록 화면으로]</span>
	</center>
	<center>
		<input type="button" value="수정" onclick="checkAdminMemberUpForm();">
		<input type="button" value="삭제" onclick="checkAdiminDelForm();">
	</center>


</body>
</html>