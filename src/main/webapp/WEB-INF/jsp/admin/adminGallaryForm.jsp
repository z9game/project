<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminGallaryForm</title>
<link href="/style/community/communityGallaryFormStyle.css" rel="stylesheet">
<script src="/js/community/communityGallaryFormScript.js"></script>
<script>
	// 페이지 번호 클릭마다 갱신하는 변수
	var listPage = 1;
	
	// form 태그
	var searchForm;
	var searchFormSelectPageNo;
	
	$(function() {
		searchForm = $("[name='searchForm']");
		searchFormSelectPageNo = searchForm.find(".selectPageNo");		
	});

	function search() {
	    
		// 검색 
		var formKeyword1 = searchForm.find(".keyword1");
		var formSearchType1 = searchForm.find(".searchType1");
		
		// 검색창 사용자 입력값 변수에 저장
		var searchDiv = $(".communityGallaryFormSearch");
		var keyword1Value = searchDiv.find("[name='keyword1']").val();
		var searchType1Value = searchDiv.find("[name='searchType1']").val();		
		
		// 폼태그 안에 검색타입, 검색어, 페이지번호 저장
		formKeyword1.val(keyword1Value);
		formSearchType1.val(searchType1Value);
		searchFormSelectPageNo.val(listPage);
	    
	    $.ajax({            
	            url       : "/adminGallaryForm.do"
	          , type       : "post"
	          , data       : searchForm.serialize()
	          , success    : function(responseHtml) { ajaxSuccess(responseHtml); }
	          , error    : function( )          { ajaxError( ); }
	    });
	 }
	 
	 function pageNoClick(clickPageNo) {   
		listPage = clickPageNo;
		search();
	 }
	 
	 function ajaxSuccess(responseHtml) {
	    
	    var obj = $(responseHtml);
	    
	    var formKeyword1 = searchForm.find(".keyword1");
	    var formSearchType1 = searchForm.find(".searchType1");
	    
		$("#boardDiv").html(obj.find("#boardDiv").html());
		$("#paingsDiv").html(obj.find("#paingsDiv").html());
       
		/*
		// 검색 조건 초기화 되어 hidden 값을 이용해 설정
		var tagTab = $("#tabAll");         
		tagTab.find("[name='searchType1']").val( formSearchType1.val() );
		tagTab.find("[name='keyword1']").val( formKeyword1.val() );
		*/
	 }
	 
	 function ajaxError() {
	    alert("ajaxError : " + searchForm.serialize());
	 }
	 
	 function submitGallaryDetailForm(b_no) {	    
	    $("[name='detailForm']").find("[name='b_no']").val( b_no );	    
	    document.detailForm.submit();
	 }

	function newCommunityGallaryFormBtnClick() {
		
	    var sessionMid = '<%= session.getAttribute("mid") %>'
	
	    if (sessionMid === 'null') {
	    	alert('로그인이 필요한 서비스입니다.');
	    	location.href = '/loginForm.do';
	    } else {
	    	location.href = '/adminNewCommunityGallaryForm.do';
	    }
	}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="communityGallaryFormTitle">
    	<img src="/image/CommunityTitleBackgroundImage.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">관리자 갤러리</p>
    </div>
   	<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>
    
   <form name="searchForm" onsubmit="return false;">
      <input type="hidden" name="keyword1" class="keyword1" value="">
      <input type="hidden" name="searchType1" class="searchType1" value="">      
      <input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
      <input type="hidden" name="rowCntPerPage" class="rowCntPerPage" value="8" >
   </form>

   <form name="detailForm" action="/adminCommunityGallaryDetailForm.do" method="post">
      <input type="hidden" name="b_no" value="" >
   </form>       
    
    <div class="newCommunityGallaryBtnDiv">
		<input type="button" class="newCommunityGallaryBtn" value="새 글 쓰기" onClick="newCommunityGallaryFormBtnClick();">
	</div>
	
    <div class="communityGallaryFormContainer">

		<div class="communityGallaryFormSearch">
			<table border="1" bordercolor="black" style="border-collapse:collapse; margin: 0 auto; margin-top:25px; width:1000px;" cellpadding="7" align="center">
				<tr>
					<th>
						검&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;색
					</th>
					<td>
						<select name="searchType1">
							<option value="all">전체</option>
							<option value="writer">글작성자</option> 
							<option value="subject">제목</option>
							<option value="content">내용</option>
							<!-- 추가적인 검색 조건을 샐렉트 박스에 추가 -->
						</select> 
						<input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" >
						<input type="button" value="    검색    " onclick="search()"> 
					</td>
				</tr>
			</table>               
		</div>
		
		<div id="boardDiv" class="communityGallaryFormContainer">
			<c:forEach var="imageboard" items="${requestScope.communityGallaryBoardList}" varStatus="status">
				<div style="cursor: pointer;" class="communityGallaryFormBoard" onClick="submitGallaryDetailForm('${ imageboard.b_no }');">
					<div class="communityGallaryImageDiv">
						<img src="/image/SoccerBall.jpg" class="communityGallaryImage">
					</div>
					<div class="communityGallarySubject">${imageboard.subject}</div>
					<div class="communityGallaryWriter">${imageboard.nickname}</div>
					<div class="communityGallaryRegDate">${imageboard.reg_date}</div>
				</div>
			</c:forEach>
			
			<c:forEach var="empty_row" begin="${ requestScope.communityGallaryBoardListSize + 1 }" end="${ requestScope.communityGallaryBoardPageMap.rowCntPerPage }">
				<div class="communityGallaryFormBoard">
					<div class="communityGallaryImageDiv">
						<!-- <img src="/image/SoccerBall.jpg" class="communityGallaryImage"> -->
					</div>
					<div class="communityGallarySubject">&nbsp;</div>
					<div class="communityGallaryWriter">&nbsp;</div>
					<div class="communityGallaryRegDate">&nbsp;</div>
				</div>
			</c:forEach>
			
			<span id="paingsDiv" class="pagingNos">
				<span style="cursor:pointer;" onClick="pageNoClick( 1 );">[처음]</span>
				<span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.communityGallaryBoardPageMap.selectPageNo } - 1 );">[이전]</span>
				&nbsp;&nbsp;
                     
				<c:forEach var="pageNo" begin="${ requestScope.communityGallaryBoardPageMap.begin_pageNo }" end="${ requestScope.communityGallaryBoardPageMap.end_pageNo }">
					<c:if test="${ requestScope.communityGallaryBoardPageMap.selectPageNo == pageNo }">
						<span style="cursor:pointer" onClick="pageNoClick(${ pageNo });"><b><u>${ pageNo }</u></b></span>
					</c:if>
               
					<c:if test="${ requestScope.communityGallaryBoardPageMap.selectPageNo != pageNo }">
						<span style="cursor:pointer" onClick="pageNoClick(${ pageNo });">[${ pageNo }]</span>
					</c:if>
				</c:forEach>
				&nbsp;&nbsp;
                     
				<span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.communityGallaryBoardPageMap.selectPageNo } + 1 );">[다음]</span>
				<span style="cursor:pointer;" onClick="pageNoClick( ${ requestScope.communityGallaryBoardPageMap.last_pageNo } );">[마지막]</span>
                     
				&nbsp;&nbsp;&nbsp;
				[${ requestScope.communityGallaryBoardListCnt } / ${ requestScope.communityGallaryBoardListAllCnt }] 개
			</span>
		</div>
	</div>

</body>
</html>