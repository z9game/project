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
    checkDate();
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

		var keyword1Obj = boardSearchFormObj.find(".keyword1"); 
		  
		var keyword2Obj = boardSearchFormObj.find(".keyword2");
		
		var keyword1 = keyword1Obj.val();
		  
	    var keyword2 = keyword2Obj.val();
	    


	    boardSearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val())
		
		
	
	    
		alert(boardSearchFormObj.serialize());

		
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

	function searchWithSort(sort) {
	    // sort 값을 form의 sort 필드에 설정합니다.
	    var sortField = $("[name='adminSearchForm']").find("[name='sort']");
	    sortField.val(sort);
	    
	    // 설정된 sort 값을 확인합니다.
	    //alert("설정된 sort 값: " + sortField.val());
	    
	    // 폼을 서브밋하여 결과를 업데이트합니다.
	    search();
	}

	
	
	
	function searchAll() {

		//---------------------------------------------
		// 변수 boardSearchFormObj 선언하고 
		// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
		//---------------------------------------------
		var boardSearchFormObj = $("[name='adminSearchForm']");

		boardSearchFormObj.find(".keyword1").val("");
		boardSearchFormObj.find(".keyword2").val("");
		boardSearchFormObj.find(".sort").val("");
		boardSearchFormObj.find("#minDate").val("");
		boardSearchFormObj.find("#maxDate").val("");
		boardSearchFormObj.find(".selectPageNo").val("1");

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

	function checkDate() {
		$(function() {
		    // minDatepicker 설정
		    $("#minDate").datepicker({
		        dateFormat: 'yy-mm-dd', // 날짜 형식 설정
		        showOtherMonths: true, // 다른 달의 날짜도 표시
		        showMonthAfterYear: true, // 년도 먼저, 월 나중에 표시
		        changeYear: true, // 년도 선택 가능
		        changeMonth: true, // 월 선택 가능
		        showOn: "both", // 아이콘과 텍스트로 달력 열기 가능
		        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 달력 이미지 추가
		        buttonImageOnly: true, // 아이콘 이미지만 표시
				
		        buttonText: "날짜 선택", // 버튼 텍스트 설정
		        yearSuffix: "년", // 연도 뒤에 붙는 텍스트 설정
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 월 이름 설정
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 요일 이름 설정
		        minDate: "-5Y", // 최소 날짜 설정
		        maxDate: 0, // 최대 날짜 설정
		        onClose: function(selectedDate) {
		            if (selectedDate) {
		                $("#maxDate").datepicker("option", "minDate", selectedDate);
		            } else {
		                // 사용자가 입력을 취소했을 때 maxDate의 minDate를 기본값으로 재설정
		                $("#maxDate").datepicker("option", "minDate", "-5Y");
		            }
		        }
		    });

		    // maxDatepicker 설정
		    $("#maxDate").datepicker({
		        dateFormat: 'yy-mm-dd', // 날짜 형식 설정
		        showOtherMonths: true, // 다른 달의 날짜도 표시
		        showMonthAfterYear: true, // 년도 먼저, 월 나중에 표시
		        changeYear: true, // 년도 선택 가능
		        changeMonth: true, // 월 선택 가능
		        showOn: "both", // 아이콘과 텍스트로 달력 열기 가능
		        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 달력 이미지 추가
		        buttonImageOnly: true, // 아이콘 이미지만 표시
		        buttonText: "날짜 선택", // 버튼 텍스트 설정
		        yearSuffix: "년", // 연도 뒤에 붙는 텍스트 설정
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 월 이름 설정
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 요일 이름 설정
		        minDate: "-5Y", // 최소 날짜 설정
		        maxDate: 0, // 최대 날짜 설정
		        onClose: function(selectedDate) {
		            if (selectedDate) {
		                $("#minDate").datepicker("option", "maxDate", selectedDate);
		            } else {
		                // 사용자가 입력을 취소했을 때 minDate의 maxDate를 오늘 날짜로 재설정
		                $("#minDate").datepicker("option", "maxDate", new Date());
		            }
		        }
		    });

		});

	}

	
	
	


</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>

	<div class="communityFreeBoardFormTitle">
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText">어드민 페이지</p>

	</div>


	<div class="row admin_side_nav">
		<ul class="nav nav-pills flex-column">
			<li class="nav-item">관리자 메뉴</li>
			<li class="nav-item"><a class="nav-link" href="adminForm.do">회원
					관리</a></li>
			<li class="nav-item"><a class="nav-link"
				href="adminNoticeBoardForm.do">공지사항 </a></li>
		</ul>
	</div>




	<form name="adminSearchForm" onsubmit="return false">

		<table align="center">
			<tr>
				<td>
					<table border="1" cellpadding="5" cellspacing="0"
						style="border-collapse: collapse" align="center">
						<caption>
							<b>[검색조건]</b>
						</caption>
						<tr>
							<th>키워드</th>

							<td><select name="searchType1">
									<option value="all">전체</option>
									<option value="name">이름</option>
									<option value="mid">아이디</option>
									<option value="nickname">별명</option>
									<option value="phone">전화번호</option>
									<option value="email">이메일</option>

									<!-- 추가적인 검색 조건을 샐렉트 박스에 추가 -->
							</select> <input type="text" name="keyword1" class="keyword1"> <select
								name="orand">
									<option value="or">or
									<option value="and">and
							</select> <input type="text" name="keyword2" class="keyword2"></td>
						<tr>
							<th>성별</th>
							<td><input type="checkbox" name="gender" value="남"
								class="gender">남 <input type="checkbox" name="gender"
								value="여" class="gender">여</td>
						</tr>
						<tr>
							<th>시/도</th>
							<td colspan="5" >
							<select name="sido" id=""
								onchange="categoryChange(this)">
									<option value ="0">시/도 선택</option>
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
							</select> <select name="sigungu" id="state">
									<option value = "0">군/구 선택</option>
							</select></td>
						</tr>
						<tr>
							<th>날짜검색</th>
							<td>최소<input type="text" name="minDate" id="minDate"
								readonly="readonly"> ~ 최대 <input type="text"
								name="maxDate" id="maxDate" readonly="readonly"></td>
						</tr>

					</table>
			</tr>

			<tr align="center">
				<td><input type="button" value="검색" class="searchBtn"
					onclick="search()"> <input type="button" value="모두 검색"
					class="searchAllBtn" onclick="searchAll()"></td>
			</tr>

		</table>
		<input type="hidden" name="sort" class="sort"> <input
			type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">

	</form>















	<div class="adminFormContainer">
		<div class="adminListDiv" style="margin-bottom: 20px;">
			<table class="adminListTable" cellpadding="7" border="1"
				bordercolor="gray" align="center"
				style="border-collapse: collapse; margin: 0 auto; margin-top: 10px; width: 1000px;">
				<tr>
					<th style="width: 30px;">번호</th>


					<c:if test="${param.sort!='mid asc' and param.sort!='mid desc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('mid desc')">아이디</th>
					</c:if>

					<c:if test="${param.sort=='mid desc'}">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('mid asc')">아이디▼</th>
					</c:if>

					<c:if test="${param.sort=='mid asc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('')">아이디▲</th>
					</c:if>







					<c:if test="${param.sort!='name asc' and param.sort!='name desc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('name desc')">이름</th>
					</c:if>

					<c:if test="${param.sort=='name desc'}">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('name asc')">이름▼</th>
					</c:if>

					<c:if test="${param.sort=='name asc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('')">이름▲</th>
					</c:if>


					<c:if
						test="${param.sort!='nickname asc' and param.sort!='nickname desc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('nickname desc')">별명</th>
					</c:if>

					<c:if test="${param.sort=='nickname desc'}">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('nickname asc')">별명▼</th>
					</c:if>

					<c:if test="${param.sort=='nickname asc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('')">별명▲</th>
					</c:if>









					<c:if
						test="${param.sort!='reg_date asc' and param.sort!='reg_date desc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('reg_date desc')">등록일</th>
					</c:if>

					<c:if test="${param.sort=='reg_date desc'}">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('reg_date asc')">등록일▼</th>
					</c:if>

					<c:if test="${param.sort=='reg_date asc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('')">등록일▲</th>
					</c:if>

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