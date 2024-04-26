<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityNoticeBoardForm</title>
<link href="/style/communityNoticeBoardFormStyle.css" rel="stylesheet">
<script src="/js/communityNoticeBoardFormScript.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="communityNoticeBoardFormTitle">
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText">공지사항</p>
	</div>
	<div class="communityNoticeBoardFormContainer">
		<div class="noticeboardListDiv" style="margin-bottom: 20px;">
			<table class="noticeboardListTable" cellpadding="7" border="1"
				bordercolor="gray" align="center" style="border-collapse: collapse">
				<tr>
					<th style="width: 50px;">번호</th>
					<th style="width: 300px;">제목</th>
					<th style="width: 80px;">글쓴이</th>
					<th style="width: 100px;">조회수</th>
					<th style="width: 100px;">등록일</th>
				</tr>
				<c:forEach var="noticeboard" items="${requestScope.noticeBoardList}"
					varStatus="status">
					<tr style="cursor: pointer">
						<td align="center">${requestScope.noticeBoardList.size() - status.index}</td>
						<td>${noticeboard.subject}</td>
						<td align="center">${noticeboard.writer}</td>
						<td align="center">${noticeboard.readcount}</td>
						<td align="center">${noticeboard.reg_date}</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${empty noticeBoardList}">
				<br>
				<center>조건에 맞는 검색 결과가 없습니다.</center>
			</c:if>
		</div>
	</div>
	<center>
		<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
		<!--- 게시판 페이징 번호 출력하기.  시작   -->
		<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
		<span class="pagingNos"> <!--------------------------------------------->
			<!-- [처음] [이전] 출력하기 --> <!--------------------------------------------->
			<span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> <span
			style="cursor: pointer"
			onClick="pageNoClick(${requestScope.boardMap.selectPageNo}-1)">[이전]</span>&nbsp;&nbsp;

			<!---------------------------------------------> <!--  [반복문 C코어 태그]를 사용하여 페이지 번호 출력하기 -->
			<!---------------------------------------------> <c:forEach
				var="pageNo" begin="${requestScope.boardMap.begin_pageNo}"
				end="${requestScope.boardMap.end_pageNo}">
				<!--------------------------------------------->
				<!--  만약에 [선택한 페이지 번호]와 [화면에 출력할 페이지 번호]가 같으면  -->
				<!--------------------------------------------->
				<c:if test="${requestScope.boardMap.selectPageNo==pageNo}">
            ${pageNo}
         </c:if>
				<!--------------------------------------------->
				<!--  만약에 [선택한 페이지 번호]와 [화면에 출력할 페이지 번호]가 다르면  -->
				<!--------------------------------------------->
				<c:if test="${requestScope.boardMap.selectPageNo!=pageNo}">
					<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
				</c:if>
			</c:forEach>&nbsp;&nbsp; <!---------------------------------------------> <!-- [다음] [마지막] 출력하기 -->
			<!---------------------------------------------> <span
			style="cursor: pointer"
			onClick="pageNoClick(${requestScope.boardMap.selectPageNo}+1)">[다음]</span>
			<span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.boardMap.last_pageNo})">[마지막]</span>
			&nbsp;&nbsp;&nbsp; <!--------------------------------------------->
			[${requestScope.boardListCnt}/${requestScope.boardListAllCnt}]개 <!--------------------------------------------->
			&nbsp;&nbsp;
		</span>
		<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
		<!--- 게시판 페이징 번호 출력하기.  끝   -->
		<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
		<select name="rowCntPerPage" class="rowCntPerPage" onChange="search()">
			<option value="10">10
			<option value="15">15
			<option value="20">20
		</select>행보기 &nbsp;&nbsp;&nbsp;
	</center>

</body>
</html>