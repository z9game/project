<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityFreeBoardUpDelForm</title>
<link href="/style/communityFreeBoardFormStyle.css" rel="stylesheet">
<script src="/js/communityFreeBoardFormScript.js"></script>





<script>
	function checkBoardUpForm() {
		
		var formObj = $("[name='communityFreeBoardUpDelForm']");
		var writerObj = formObj.find(".writer");
		var subjectObj = formObj.find(".subject");
		var contentObj = formObj.find(".content");

		if (confirm("정말수정하시겠습니까?") == false) {
			return;
		}

		$.ajax({
			url : "/communityFreeBoardUpProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 글입니다.");
					location.href = "/communityFreeBoardForm.do";
				} else {
					alert("자유게시판 수정 성공입니다.");
					location.href = "/communityFreeBoardForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}

	function checkBoardDelForm() {
		var formObj = $("[name='communityFreeBoardUpDelForm']");
		if (confirm("정말 삭제하시겠습니까?") == false) {
			return;
		}
		$.ajax({
			url : "/communityFreeBoardDelProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 글입니다.");
					location.href = "/communityFreeBoardForm.do";
				} else {
					alert("자유게시판 수정 성공입니다.");
					location.href = "/communityFreeBoardForm.do";
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
	
	<div class="communityFreeBoardFormTitle">
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText">자유게시판</p>
	</div>



	<form name="communityFreeBoardUpDelForm">
		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collpase: collpase">
			<caption>[자유게시판 수정/삭제]</caption>
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
				<th bgColor="lightgray">내 용</th>
				<td>
					<textarea name="content" class="content" rows="13" cols="40" maxlength="500">${requestScope.communityDTO.content}</textarea>
				</td>
			</tr>

		</table>
		<input type="hidden" name="b_no" value="${requestScope.communityDTO.b_no}">
	</form>


	<div style="height: 5px"></div>
	<center>
		<span style="cursor: pointer"
			onclick="location.replace('/communityFreeBoardForm.do')">[목록
			화면으로]</span>
	</center>
	<center>
		<input type="button" value="수정" onclick="checkBoardUpForm();">
		<input type="button" value="삭제" onclick="checkBoardDelForm();">
	</center>


</body>
</html>