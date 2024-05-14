<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StadiumTransferForm</title>
<link href="/style/stadiumTransferFormStyle.css" rel="stylesheet">
<script src="/js/stadiumTransferFormScript.js"></script>
<script>



function stadiumTransferForm(){
    var sessionMid = '<%= session.getAttribute("mid") %>';

    if (sessionMid == "" || sessionMid == 'null') {
        alert('로그인이 필요한 서비스입니다.');
        location.href = '/loginForm.do';
        return;
    } else {
        // 로그인 상태라면 새 글 쓰기 페이지로 이동하는 코드를 추가할 수 있습니다.
        location.href = '/newStadiumTransferForm.do'; // 이동할 페이지 URL을 수정해야 합니다.
    }
}



</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="stadiumTransferFormTitle">
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText">경기장 양도</p>
	</div>
	<div class="stadiumTransferFormContainer">
		<div class="stadiumTransferFormConditionalSearch">
			<center>
				<table align="center">
					<tr>
						<td>
							<table border="1" cellpadding="5" cellspacing="0"
								style="border-collapse: collapse" align="center">
								<caption>
									<b>[검색조건]</b>
								</caption>
								<tr>
									<th>경기장이름</th>
									<td><input type="text" name="Stadiumkeyword1"
										class="Stadiumkeyword1"> <select name="orand">
											<option value="or">or
											<option value="and">and
									</select> <input type="text" name="Stadiumkeyword2"
										class="Stadiumkeyword2"></td>
								</tr>
								<tr>
									<th>시/도</th>
									<td colspan="5"><select name="sido" id="" class="sido"
										onchange="categoryChange(this)">
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
									</select> <select name="sigungu" id="state" class="sigungu">
											<option value="0">군/구 선택</option>
									</select></td>
								</tr>
							</table>
					</tr>
					<tr align="center">
						<td><input type="button" value="검색" class="searchBtn"
							onclick="search()"> <input type="button" value="모두 검색"
							class="searchAllBtn" onclick="searchAll()"></td>
					</tr>

				</table>
			</center>

		</div>





		<div class="stadiumTransferFormBoard">
			<div class="newStadiumTransferBoardBtnDiv">
				<input type="button" class="newStadiumTransferBoardBtn"
					value="새 글 쓰기"
					onClick="stadiumTransferForm();">
			</div>
			<table class="boardListTable" cellpadding="7" border="1"
				bordercolor="gray" align="center"
				style="border-collapse: collapse; margin: 0 auto; margin-top: 10px; width: 1000px;">
				<tr>
					<th style="width: 50px;">번호</th>
					<th style="width: 300px;">제목</th>
					<th style="width: 80px;">글쓴이</th>
					<th style="width: 100px;">조회수</th>
					<th style="width: 100px;">등록일</th>
					<c:forEach var="board" items="${requestScope.boardList}"
						varStatus="status">
						<tr style="cursor: pointer"
							onClick="goBoardDetailForm(${board.b_no});">
							<td align="center">${requestScope.boardMap.begin_serialNo_desc - status.count + 1}</td>
							<!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
							<td align="center">${board.writer}</td>
							<td align="center">${board.readcount}</td>
							<td align="center">${board.reg_date}</td>
						</tr>
					</c:forEach>
			</table>
			<c:if test="${empty requestScope.boardList}">
				<br>
				<center>조건에 맞는 검색 결과가 없습니다.</center>
			</c:if>
		</div>
	</div>
</body>
</html>