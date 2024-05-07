<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admiNoticeBoardRegForm</title>
<link href="/style/communityNoticeBoardFormStyle.css" rel="stylesheet">
<script src="/js/communityNoticeBoardFormScript.js"></script>


<script>
	//----------------------------------------
	// 저장 버튼을 클릭하면 호출되는 함수
	//----------------------------------------

	function checkAdminNoticeBoardRegForm() {
		//----------------------------------------------
		// name='boardRegForm" 를 가진 form 태그 관리 JQuery 객체 메위주 얻기 
		//----------------------------------------------
		var formObj = $("[name='adminNoticeboardRegForm']");
		//----------------------------------------------
		// class='writer"  를 가진 태그 관리 JQuery 객체 메위주 얻기 
		// class='subject" 를 가진 태그 관리 JQuery 객체 메위주 얻기 
		// class='email"   를 가진 태그 관리 JQuery 객체 메위주 얻기 
		// class='content" 를 가진 태그 관리 JQuery 객체 메위주 얻기 
		// class='pwd"     를 가진 태그 관리 JQuery 객체 메위주 얻기 
		//----------------------------------------------
		var writerObj = formObj.find(".writer");
		var subjectObj = formObj.find(".subject");
		var contentObj = formObj.find(".content");
		//----------------------------------------------
		// 작성자명의 문자 패턴 검사하기
		//----------------------------------------------
		if (new RegExp(/^[가-힣]{2,15}$/).test(writerObj.val()) == false) {
			alert("작성자는 2~15자 한글이어야합니다.");
			writerObj.val("");
			return;
		}
		//----------------------------------------------
		// 제목의 문자 패턴 검사하기
		//----------------------------------------------
		if (new RegExp(/^.{2,30}$/).test(subjectObj.val()) == false) {
			alert("제목은 임의 문자 2~30자 입력해야합니다");
			subjectObj.val("");
			return;
		}

		//----------------------------------------------
		// 작성자명의 문자 패턴 검사하기
		//----------------------------------------------
		if (contentObj.val().trim().length == 0
				|| contentObj.val().trim().length > 500) {
			alert("내용은 임의 문자 1~500자 입력해야합니다.");
			return;
		}

		alert(formObj.serialize());
		//----------------------------------------------
		// 정말 입력 할건지 확인하기
		//----------------------------------------------
		if (confirm("정말 입력하시겠습니까?") == false) {
			return;
		}
		//-----------------------------------------------------
		// JQuery 객체의 [ajax 메소드]를 호출하여
		// WAS 에 비동기 방식 "/boardRegProc.do" 주소로 접속하고 
		// 게시판 입력 결과를 받아서
		// 성공했으면 경고하고 게시판 목록화면으로 이동하고
		// 실패했으면 경고하기
		//-----------------------------------------------------
		$.ajax({
			//--------------------------------------
			// WAS 에 접속할 URL 주소 지정
			//--------------------------------------
			url : "/adminNoticeboardRegProc.do"
			//--------------------------------------
			// 파라미터값을 보내는 방법 지정
			//--------------------------------------
			,
			type : "post"
			//--------------------------------------
			// WAS 에 보낼 파명과 파값을 설정하기. "파명=파값&파명=파값~"
			//--------------------------------------
			,
			data : formObj.serialize()
			//----------------------------------------------------------
			// WAS 의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			// 이때 익명함수의 매개변수로 WAS 의 응답물이 들어 온다.
			//----------------------------------------------------------
			,
			success : function(json) {
				var result = json["result"];
				if (result == 1) {
					alert("공지사항 입력 성공입니다.");
					location.href = "/adminNoticeBoardForm.do"
				} else {
					alert("공지사항 입력 실패입니다. 관리자에게 문의 바람!");
					location.href = "/adminNoticeBoardForm.do"
				}
			}
			//----------------------------------------------------------
			// WAS 의 응답이 실패했을 실행할 익명함수 설정.
			//----------------------------------------------------------
			,
			error : function() {
				alert("입력 실패! 관리자에게 문의 바람니다.");
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


<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>




	<form name="adminNoticeboardRegForm">
		<!------------------------------------------>
		<!-- 만약에 파명 b_no 의 파값이 없으면-->
		<!------------------------------------------>
		<c:if test="${empty param.b_no}">
			<!------------------------------>
			<!-- hidden 태그 선언하고0 저장하기-->
			<!------------------------------>
			<input type="hidden" name="b_no" value="0">
		</c:if>
		<!------------------------------------------>
		<!-- 만약에 파명 b_no 의 파값이 있으면-->
		<!------------------------------------------>
		<c:if test="${!empty param.b_no}">
			<!------------------------------>
			<!-- hidden 태그 선언하고 파명 b_no 의 파값 저장하기-->
			<!------------------------------>
			<input type="hidden" name="b_no" value="${param.b_no}">
		</c:if>

		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collapse: collapse">

			<c:if test="${empty param.b_no}">
				<caption>[새글쓰기]</caption>
			</c:if>

			<tr>
				<th>작성자</th>
				<td width="300px">
					<!--------------------------------------------------------> <input
					type="text" name="writer" class="writer" size="10" maxlength="15"
					value="관리자"> <!-------------------------------------------------------->
				</td>
			</tr>
			<tr>
				<th>제 목</th>
				<td>
					<!--------------------------------------------------------> <input
					type="text" name="subject" class="subject" size="40" maxlength="30">
					<!-------------------------------------------------------->
				</td>
			</tr>
			<tr>
				<th>내 용</th>
				<td>
					<!--------------------------------------------------------> <textarea
						name="content" class="content" rows="13" cols="40" maxlength="500"></textarea>
					<!-------------------------------------------------------->
				</td>
			</tr>
		</table>
		<div style="height: 5px;"></div>
		<center>
			<input type="button" value="저장"
				onClick="checkAdminNoticeBoardRegForm();"> <input
				type="reset" value="다시작성"> <span style="cursor: pointer"
				onClick="location.replace('/adminNoticeBoardForm.do');">[목록보기]</span>
		</center>

	</form>


</body>
</html>