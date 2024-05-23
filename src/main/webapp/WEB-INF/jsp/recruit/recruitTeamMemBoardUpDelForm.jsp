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





<script>
	function checkBoardUpForm() {
		//------------------------------------------------------------------------
		// name='recruitTeamMemBoardUpDelForm" 를 가진 form 태그 관리 JQuery 객체 메위주 얻기 
		//------------------------------------------------------------------------
		var formObj = $("[name='recruitTeamMemBoardUpDelForm']");
		
		var titleObj = formObj.find(".title");
        var sidoId = formObj.find("[name='sido_id']").val();
        var sigunguId = formObj.find("[name='sigungu_id']").val();
        var dayObj = formObj.find("[name='day']:checked").val();
        var timeObj = formObj.find("[name='time']:checked").val();
        var posObj = formObj.find("[name='pos']:checked").val();
        var team_memObj = formObj.find("[name='team_mem']:checked").val();
        var contentObj = formObj.find(".content");
        
		//----------------------------------------------
		// 제목 문자 패턴 검사하기
		//----------------------------------------------
		if( new RegExp(/^.{2,30}$/).test(titleObj.val())==false ){
			//alert($(".title:checked").size());
			alert("제목은 임의 문자 2~30자 입력해야합니다");
			return;
		}

		//----------------------------------------------
		// 시도 유효성 검사하기
		//----------------------------------------------
        if (sidoId == 0) {
            alert("시/도를 선택해주세요.");
            return;
        }

		//----------------------------------------------
		// 시군구 유효성 검사하기
		//----------------------------------------------
        if (sigunguId == 0) {
            alert("군/구를 선택해주세요.");
            return;
        }

		//----------------------------------------------
		// 요일 유효성 검사하기
		//----------------------------------------------
		if (!dayObj) {
            alert("요일은 최소한 한 개 이상 선택해 주셔야 합니다.");
            return;
        }

		//----------------------------------------------
		// 시간 유효성 검사하기
		//----------------------------------------------
		if (!timeObj) {
            alert("시간은 최소한 한 개 이상 선택해 주셔야 합니다.");
            return;
        }

		//----------------------------------------------
		// 포지션 유효성 검사하기
		//----------------------------------------------
		if (!posObj) {
            alert("포지션을 선택해 주셔야 합니다.");
            return;
        }

		//----------------------------------------------
		// 종류 유효성 검사하기
		//----------------------------------------------
		if (!team_memObj) {
            alert("종류를 선택해 주셔야 합니다.");
            return;
        }
		//----------------------------------------------
		// 내용 문자 패턴 검사하기
		//----------------------------------------------
		if( 
				contentObj.val().trim().length==0 
				||
				contentObj.val().trim().length>500 
		){
			alert("내용은 임의 문자 1~500자 입력해야합니다.");
			return;
		}
		//----------------------------------------------
		// 정말 입력할 건지 확인하기
		//----------------------------------------------
		if( confirm("정말 입력하시겠습니까?")==false ){ return; }
		//-----------------------------------------------------
		// JQuery 객체의 [ajax 메소드]를 호출하여
		// WAS 에 비동기 방식으로 "/boardRegProc.do" 주소로 접속하고 
		// 게시판 입력 결과를 받아서
		// 성공했으면 경고하고 게시판 목록화면으로 이동하고
		// 실패했으면 경고하기
		//-----------------------------------------------------

		alert(formObj.serialize());
		
		$.ajax({
			url : "/recruitTeamMemBoardUpProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 글입니다.");
					location.href = "/recruitTeamMemBoardForm.do";
				} 
				else {
					alert("수정 성공입니다.");
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
					alert("이미 삭제된 글입니다.");
					location.href = "/recruitTeamMemBoardForm.do";
				} else {
					alert("게시물 삭제 성공!");
					location.href = "/recruitTeamMemBoardForm.do";
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
	
	<div class="recruitTeamMemBoardUpDelFormTitle">
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText"></p>
	</div>


<center>
	<form name="recruitTeamMemBoardUpDelForm">
		<table align="center" bordercolor="gray" border=1 cellpadding=7
			style="border-collpase: collpase">
			<caption>[팀/팀원 모집 수정/삭제]</caption>
			<tr>
				<th bgColor="lightgray">작성자</th>
				<td>${requestScope.detail.nickname}</td>
			</tr>
			<tr>
				<th bgColor="lightgray">제 목</th>
				<td><input type="text" name="title" class="title" size="40"
					maxlength="30" value="${requestScope.detail.title}"></td>
			</tr>
			<tr>
					<th>지역</th>
					<td colspan="5" >${requestScope.updel_sidosigungu.sido_c}-${requestScope.updel_sidosigungu.sigungu_c}->(수정)
			            <select name="sido_id" id="" onchange="categoryChange(this)">
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
			            <select name="sigungu_id" id="state">
			              <option value ="0">군/구 선택</option>
			            </select>
					</td>
				</tr>
				
				<tr>
					<th>요일</th>
					<td>
						<input type="checkbox" name="day" value="1" <c:if test="${requestScope.updel_day.contains('월')}">checked</c:if>>월
						<input type="checkbox" name="day" value="2" <c:if test="${requestScope.updel_day.contains('화')}">checked</c:if>>화
						<input type="checkbox" name="day" value="3" <c:if test="${requestScope.updel_day.contains('수')}">checked</c:if>>수
						<input type="checkbox" name="day" value="4" <c:if test="${requestScope.updel_day.contains('목')}">checked</c:if>>목
						<input type="checkbox" name="day" value="5" <c:if test="${requestScope.updel_day.contains('금')}">checked</c:if>>금
						<input type="checkbox" name="day" value="6" <c:if test="${requestScope.updel_day.contains('토')}">checked</c:if>>토
						<input type="checkbox" name="day" value="7" <c:if test="${requestScope.updel_day.contains('일')}">checked</c:if>>일
					</td>
				</tr>
				<tr>
					<th>시간</th>
					<td>
						<input type="checkbox" name="time" value="새벽" <c:if test="${requestScope.updel_time.contains('새벽')}">checked</c:if>>새벽
						<input type="checkbox" name="time" value="오전" <c:if test="${requestScope.updel_time.contains('오전')}">checked</c:if>>오전
						<input type="checkbox" name="time" value="오후" <c:if test="${requestScope.updel_time.contains('오후')}">checked</c:if>>오후
						<input type="checkbox" name="time" value="야간" <c:if test="${requestScope.updel_time.contains('야간')}">checked</c:if>>야간
					</td>
				</tr>
				
				<tr>
					<th>포지션</th>
					<td>
						<input type="radio" name="pos" value="ST" <c:if test="${requestScope.detail.pos.contains('ST')}">checked</c:if>>ST
						<input type="radio" name="pos" value="CM" <c:if test="${requestScope.detail.pos.contains('CM')}">checked</c:if>>CM
						<input type="radio" name="pos" value="CB" <c:if test="${requestScope.detail.pos.contains('CB')}">checked</c:if>>CB
						<input type="radio" name="pos" value="GK" <c:if test="${requestScope.detail.pos.contains('GK')}">checked</c:if>>GK
						<input type="radio" name="pos" value="All" <c:if test="${requestScope.detail.pos.contains('ALL')}">checked</c:if>>All
					</td>
				</tr>
				
				<tr>
					<th>종류</th>
					<td>
						<input type="radio" name="team_mem" value="팀" <c:if test="${requestScope.detail.team_mem.contains('팀')}">checked</c:if>>팀
						<input type="radio" name="team_mem" value="팀원" <c:if test="${requestScope.detail.team_mem.contains('팀원')}">checked</c:if>>팀원
					</td>
				</tr>
				<tr>
					<th bgColor="lightgray">내 용</th>
					<td>
					<textarea name="content" class="content" rows="13" cols="40" maxlength="500">${requestScope.detail.content}</textarea>
				</td>
			</tr>
			
		</table>
		<input type="hidden" name="b_no" value="${requestScope.detail.b_no}">
	</form>
</center>

	<div style="height: 5px"></div>
	<center>
		<span style="cursor: pointer"
			onclick="location.replace('/recruitTeamMemBoardForm.do')">[목록화면으로]</span>
	</center>
	<center>
		<input type="button" value="수정" onclick="checkBoardUpForm();">
		<input type="button" value="삭제" onclick="checkBoardDelForm();">
	</center>
				
		
	</div>
	<div style="height: 20px"></div>
</body>
</html>