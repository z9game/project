<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<c:if test="${empty sessionScope.mid}">
	<script>
		alert("로그인이 필요한 서비스입니다.");
		location.replace("/loginForm.do");
	</script>
</c:if>

<c:if test="${requestScope.communityDTO.writer != sessionScope.nickname}">
	<script>
		alert("작성한 사용자가 아닙니다");
		location.replace("/loginForm.do");
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityNoticeBoardDetailForm</title>
<link href="/style/community/communityNoticeBoardFormStyle.css" rel="stylesheet">
<script src="/js/community/communityNoticeBoardFormScript.js"></script>





<script>
	function checkBoardUpForm() {

		
		var formObj = $("[name='noticeboardUpDelForm']");
		var writerObj = formObj.find(".writer");
		var subjectObj = formObj.find(".subject");
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
		<p class="titleBackgoundText">공지사항</p>
	</div>



	<form name="noticeboardUpDelForm">
		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collpase: collpase">
			<caption>[공지사항 수정/삭제]</caption>
			<tr>
				<th bgColor="lightgray">이 름</th>
				<td>${requestScope.communityDTO.writer}<input type="hidden" name="writer" class="writer" size="10"
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
			onclick="location.replace('/communityNoticeBoardForm.do')">[목록 화면으로]
		</span>
	</center>
	<center>
		<input type="button" value="수정" onclick="checkBoardUpForm();">
		<input type="button" value="삭제" onclick="checkBoardDelForm();">
	</center>


</body>
</html>