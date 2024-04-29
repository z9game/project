<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminFormTitle</title>
<link href="/style/communityFreeBoardFormStyle.css" rel="stylesheet">

<script src="/js/communityFreeBoardFormScript.js"></script>

<script>
	$(document).ready(function() {
		$(".rowCntPerPage").val("10");

		search();

	});
	function goAdminMemberDetailForm(m_no) {
	    // m_no와 함께 player_record_no 파라미터 추가
	    $("[name='adminMemberDetailForm'] [name='m_no']").val(m_no);
	    //$("[name='memberDetailForm'] [name='player_record_no']").val(player_record_no);
	    
	    // memberDetailForm 폼 submit
	    document.adminMemberDetailForm.submit();
	}


	
	function search() {

		//---------------------------------------------
		// 변수 boardSearchFormObj 선언하고 
		// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
		//---------------------------------------------
		var boardSearchFormObj = $("[name='adminSearchForm']");


		boardSearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val())

		$.ajax({
					//-------------------------------
					// WAS 로 접속할 주소 설정
					//-------------------------------
					url : "/adminForm.do"
					//-------------------------------
					// WAS 로 접속하는 방법 설정. get 또는 post
					//-------------------------------
					,
					type : "post"

					,
					data : boardSearchFormObj.serialize()

					,
					success : function(responseHtml) {

						var obj = $(responseHtml);

						$(".adminFormContainer").html(obj.filter(".adminFormContainer").html());

						$(".pagingNos").html(obj.find(".pagingNos").html());

					}

					,
					error : function() {

						alert("검색 실패! 관리자에게 문의 바랍니다.");
					}

				});

	}

	function searchAll() {

		//---------------------------------------------
		// 변수 boardSearchFormObj 선언하고 
		// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
		//---------------------------------------------
		var boardSearchFormObj = $("[name='adminSearchForm']");

		boardSearchFormObj.find(".selectPageNo").val("1")

		search();

	}

	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [페이지 번호]를 클릭하면 호출되는 함수 pageNoClick 선언하기 
	// 쪼개서 보여주기.
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	function pageNoClick(clickPageNo) {
		//alert(clickPageNo);
		//---------------------------------------------
		// name='selectPageNo' 를 가진 태그의 value 값에 
		// 매개변수로 들어오는 [클릭한 페이지 번호]를 저장하기
		// 즉 <input type="hidden" name="selectPageNo" value="1"> 태그에
		// value 값에 [클릭한 페이지 번호]를 저장하기
		//---------------------------------------------
		$("[name='adminSearchForm']").find(".selectPageNo").val(clickPageNo)

		search()

	}
</script>

</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>

	<div class="communityFreeBoardFormTitle">
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText">어드민 페이지</p>

	</div>


	<form name="adminSearchForm" onsubmit="return false">
		<input type="hidden" name="SelectPageNo" class="SelectPageNo"
			value="1"> <input type="hidden" name="rowCntPerPage"
			class="rowCntPerPage">
	</form>

	<div class="row admin_side_nav">
		<ul class="nav nav-pills flex-column">
			<li class="nav-item">관리자 메뉴</li>
			<li class="nav-item"><a class="nav-link" href="adminForm.do">회원
					관리</a></li>
		</ul>
	</div>





	<center>
		<b>회원목록</b>
	</center>
	<div class="adminFormContainer">
		<div class="adminListDiv" style="margin-bottom: 20px;">
			<table class="adminListTable" cellpadding="7" border="1"
				bordercolor="gray" align="center"
				style="border-collapse: collapse; margin: 0 auto; margin-top: 10px; width: 1000px;">
				<tr>
					<th style="width: 30px;">번호</th>
					<th style="width: 50px;">아이디</th>
					<th style="width: 50px;">이름</th>
					<th style="width: 50px;">닉네임</th>
					<th style="width: 100px;">등록일</th>
				</tr>

				<c:forEach var="admin" items="${requestScope.memberList}"
					varStatus="status">
					<tr style="cursor: pointer"
						onClick="goAdminMemberDetailForm(${admin.m_no});">
						<td align="center">${requestScope.memberMap.begin_serialNo_asc + status.index}</td>
						<td align="center">${admin.mid}</td>
						<td align="center">${admin.name}</td>
						<td align="center">${admin.nickname}</td>
						<td align="center">${admin.reg_date}</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${empty requestScope.memberList}">
				<br>
				<center>조건에 맞는 검색 결과가 없습니다.</center>
			</c:if>
		</div>
	</div>




	<center>

		<span class="pagingNos"> <span style="cursor: pointer"
			onClick="pageNoClick(1)">[처음]</span> <span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.memberMap.selectPageNo}-1)">[이전]</span>&nbsp;&nbsp;


			<c:forEach var="pageNo"
				begin="${requestScope.memberMap.begin_pageNo}"
				end="${requestScope.memberMap.end_pageNo}">

				<c:if test="${requestScope.memberMap.selectPageNo==pageNo}">
            ${pageNo}
         </c:if>

				<c:if test="${requestScope.memberMap.selectPageNo!=pageNo}">
					<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
				</c:if>
			</c:forEach>&nbsp;&nbsp; <span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.memberMap.selectPageNo}+1)">[다음]</span>
			<span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.memberMap.last_pageNo})">[마지막]</span>
			&nbsp;&nbsp;&nbsp;
			[${requestScope.memberListCnt}/${requestScope.memberListAllCnt}]개
			&nbsp;&nbsp;
		</span> <select name="rowCntPerPage" class="rowCntPerPage"
			onChange="search()">
			<option value="10">10
			<option value="15">15
			<option value="20">20
		</select>행보기 &nbsp;&nbsp;&nbsp;
	</center>


	<form name="adminMemberDetailForm" action="/adminMemberDetailForm.do"
		method="post">
		<!-- 클릭한 행의 게시판 고유번호가 저장될 히든태그 선언 -->
		<input type="hidden" name="m_no"> <input type="hidden"
			name="player">

	</form>








</body>
</html>