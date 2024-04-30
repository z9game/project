<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityNoticeBoardDetailForm</title>
<link href="/style/communityNoticeBoardFormStyle.css" rel="stylesheet">
<script src="/js/communityNoticeBoardFormScript.js"></script>





<script>
	function checkNoticeBoardUpForm() {

		
		var formObj = $("[name='adminNoticeboardUpDelForm']");
		var writerObj = formObj.find(".writer");
		var subjectObj = formObj.find(".subject");
		var contentObj = formObj.find(".content");

		if (confirm("정말수정하시겠습니까?") == false) {
			return;
		}

		$.ajax({
			url : "/adminNoticeboardUpProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 공지사항입니다.");
					location.href = "/adminNoticeBoardForm.do";
				} else {
					alert("공지사항 수정 성공입니다.");
					location.href = "/adminNoticeBoardForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}

	function checkNoticeBoardDelForm() {
		var formObj = $("[name='adminNoticeboardUpDelForm']");
		if (confirm("정말 삭제하시겠습니까?") == false) {
			return;
		}
		$.ajax({
			url : "/adminNoticeboardDelProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 공지사항입니다.");
					location.href = "/adminNoticeBoardForm.do";
				} else {
					alert("공지사항 삭제 성공입니다.");
					location.href = "/adminNoticeBoardForm.do";
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
		<p class="titleBackgoundText">공지사항</p>
	</div>

<div class="row admin_side_nav">
		<ul class="nav nav-pills flex-column">
			<li class="nav-item">관리자 메뉴</li>
			<li class="nav-item"><a class="nav-link" href="adminForm.do">회원
					관리</a></li>
			<li class="nav-item"><a class="nav-link" href="adminNoticeBoardForm.do">공지사항
			</a></li>
		</ul>
	</div>


	<form name="adminNoticeboardUpDelForm">
		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collpase: collpase">
			<caption>[공지사항 수정/삭제]</caption>
			<tr>
				<th bgColor="lightgray">이 름</th>
				<td><input type="text" name="writer" class="writer" size="10"
					maxlength="15" value="${requestScope.communityDTO.writer}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">제 목</th>
				<td><input type="text" name="subject" class="subject" size="40"
					maxlength="30" value="${requestScope.communityDTO.subject}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">조회수</th>
				<td>${requestScope.communityDTO.readcount}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">등록일</th>
				<td>${requestScope.communityDTO.reg_date}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">내 용</th>
				<td><textarea name="content" class="content" rows="13"
						cols="40" maxlength="500">${requestScope.communityDTO.content}
            </textarea>
			</tr>

		</table>
		<input type="hidden" name="b_no"
			value="${requestScope.communityDTO.b_no}">
	</form>


	<div style="height: 5px"></div>
	<center>
		<span style="cursor: pointer"
			onclick="location.replace('/adminNoticeBoardForm.do')">[목록
			화면으로]</span>
	</center>
	<center>
		<input type="button" value="수정" onclick="checkNoticeBoardUpForm();">
		<input type="button" value="삭제" onclick="checkNoticeBoardDelForm();">
	</center>


</body>
</html>