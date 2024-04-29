<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminDetailUpDelForm</title>
<link href="/style/communityNoticeBoardFormStyle.css" rel="stylesheet">
<script src="/js/communityNoticeBoardFormScript.js"></script>





<script>
	function checkBoardUpForm() {

		var formObj = $("[name='adminDetailUpDelForm']");
		var nameObj = formObj.find(".name");
		var midObj = formObj.find(".mid");
		var contentObj = formObj.find(".content");

		if (confirm("정말수정하시겠습니까?") == false) {
			return;
		}

		$.ajax({
			url : "/noticeboardUpProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 공지사항입니다.");
					location.href = "/communityNoticeBoardForm.do";
				} else {
					alert("공지사항 수정 성공입니다.");
					location.href = "/communityNoticeBoardForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}

	function checkBoardDelForm() {
		var formObj = $("[name='noticeboardUpDelForm']");
		if (confirm("정말 삭제하시겠습니까?") == false) {
			return;
		}
		$.ajax({
			url : "/noticeboardDelProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 공지사항입니다.");
					location.href = "/communityNoticeBoardForm.do";
				} else {
					alert("공지사항 삭제 성공입니다.");
					location.href = "/communityNoticeBoardForm.do";
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
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText">회원정보수정</p>
	</div>



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
				<th bgColor="lightgray">닉네임</th>
				<td><input type="text" name="mid" class="nickname" size="40"
					maxlength="30" value="${requestScope.memberDTO.nickname}"></td>
			</tr>

			<tr>
				<th bgColor="lightgray">이메일</th>
				<td><input type="text" name="mid" class="email" size="40"
					maxlength="30" value="${requestScope.memberDTO.email}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">생일</th>
				<td><input type="text" name="mid" class="birthday" size="40"
					maxlength="30" value="${requestScope.memberDTO.birthday}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">전화번호</th>
				<td><input type="text" name="mid" class="phone" size="40"
					maxlength="30" value="${requestScope.memberDTO.phone}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">상세주소</th>
				<td><input type="text" name="mid" class="detail_address"
					size="40" maxlength="30"
					value="${requestScope.memberDTO.detail_address}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">가입일</th>
				<td><input type="text" name="mid" class="reg_date" size="40"
					maxlength="30" value="${requestScope.memberDTO.reg_date}"></td>
			</tr>

		</table>




		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collpase: collpase">
			<caption>[기록 수정/삭제]</caption>
			<tr>
				<th bgColor="lightgray">이 름</th>
				<td><input type="text" name="writer" class="writer" size="10"
					maxlength="15" value="${requestScope.memberDTO.name}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">경기수</th>
				<td><input type="text" name="subject" class="subject" size="40"
					maxlength="30" value="${requestScope.playerRecordDTO.games_played}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">승리수</th>
				<td><input type="text" name="subject" class="subject" size="40"
					maxlength="30" value="${requestScope.playerRecordDTO.wins}"></td>
			</tr>

			<tr>
				<th bgColor="lightgray">무승부</th>
				<td><input type="text" name="subject" class="subject" size="40"
					maxlength="30" value="${requestScope.playerRecordDTO.draws}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">패배수</th>
				<td><input type="text" name="subject" class="subject" size="40"
					maxlength="30" value="${requestScope.playerRecordDTO.losses}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">골</th>
				<td><input type="text" name="subject" class="subject" size="40"
					maxlength="30" value="${requestScope.playerRecordDTO.goals_for}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">어시스트</th>
				<td><input type="text" name="subject" class="subject" size="40"
					maxlength="30" value="${requestScope.playerRecordDTO.goals_assist}"></td>
			</tr>



		</table>









		<input type="hidden" name="m_no"
			value="${requestScope.memberDTO.m_no}"> <input type="hidden"
			name="player" value="${requestScope.playerRecordDTO.player}">
	</form>


	<div style="height: 5px"></div>
	<center>
		<span style="cursor: pointer"
			onclick="location.replace('/adminFrom.do')">[목록 화면으로]</span>
	</center>
	<center>
		<input type="button" value="수정" onclick="checkAdminMemberUpForm();">
		<input type="button" value="삭제" onclick="checkAdiminDelForm();">
	</center>


</body>
</html>