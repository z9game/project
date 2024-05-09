<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recruitTeamMemBoardUpDelForm</title>
<link href="/style/recruitTeamBoardFormStyle.css" rel="stylesheet">
<script src="/js/recruitTeamBoardFormScript.js"></script>





<!-- <script>
	function checkBoardUpForm() {
		
		var formObj = $("[name='recruitTeamMemBoardUpDelForm']");
		var writerObj = formObj.find(".writer");
		var titleObj = formObj.find(".title");
		var contentObj = formObj.find(".content");

		if (confirm("정말수정하시겠습니까?") == false) {
			return;
		}

		$.ajax({
			url : "/recruitTeamMemBoardUpProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 글입니다.");
					location.href = "/recruitTeamMemBoardForm.do";
				} else {
					alert("자유게시판 수정 성공입니다.");
					location.href = "/recruitTeamMemBoardForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}

	function checkBoardDelForm() {
		var formObj = $("[name='recruitTeamMemBoardUpDelForm']");
		if (confirm("정말 삭제하시겠습니까?") == false) {
			return;
		}
		$.ajax({
			url : "/recruitTeamMemBoardDelProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 글입니다.");
					location.href = "/recruitTeamMemBoardForm.do";
				} else {
					alert("자유게시판 수정 성공입니다.");
					location.href = "/recruitTeamMemBoardForm.do";
				}
			},
			error : function() {
				alert("삭제 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}
</script> -->

</head>
<body>
	
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	
	<div class="recruitTeamMemBoardUpDelFormTitle">
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText">팀/팀원 모집 수정</p>
	</div>



	<form name="recruitTeamMemBoardUpDelForm">
		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collpase: collpase">
			<caption>[팀/팀원 모집 수정/삭제]</caption>
			<tr>
				<th bgColor="lightgray">이 름</th>
				<td><input type="text" name="writer" class="writer" size="10"
					maxlength="15" value="${requestScope.recruitDTO.writer}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">제 목</th>
				<td><input type="text" name="title" class="title" size="40"
					maxlength="30" value="${requestScope.recruitDTO.title}"></td>
			</tr>
			<tr>
				<th bgColor="lightgray">조회수</th>
				<td>${requestScope.recruitDTO.readcount}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">지역</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
				<!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 조회수 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.recruitDTO.sido}-${requestScope.recruitDTO.sigungu}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">요일</th>
				<!--------------------------------------------------- -->
				<!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
				<!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
				<!-- 상세보기할 게시판의 조회수 표현하기 -->
				<!--------------------------------------------------- -->
				<td>${requestScope.recruitDTO.day}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">내 용</th>
				<td>
					<textarea name="content" class="content" rows="13" cols="40" maxlength="500">${requestScope.recruitDTO.content}</textarea>
				</td>
			</tr>

		</table>
		<input type="hidden" name="b_no" value="${requestScope.recruitDTO.b_no}">
	</form>


	<div style="height: 5px"></div>
	<center>
		<span style="cursor: pointer"
			onclick="location.replace('/recruitTeamMemBoardForm.do')">[목록
			화면으로]</span>
	</center>
	<center>
		<input type="button" value="수정" onclick="checkBoardUpForm();">
		<input type="button" value="삭제" onclick="checkBoardDelForm();">
	</center>


</body>
</html>