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

$(document).ready(function() {
    $(".rowCntPerPage").val("10");
    search();


  
});



function goTransferDetailForm(yangdo_no) {

    $("[name='transferDetailForm'] [name='yangdo_no']").val(yangdo_no);

    

document.transferDetailForm.submit();
}






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


function search(){

	SearchFormObj = $("[name='stadiumTransferFormConditionalSearch']");

	SearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val() );

    

    $.ajax({
    	//-------------------------------
		// WAS 로 접속할 주소 설정
		//-------------------------------
		url      : "/stadiumTransferForm.do"
		//-------------------------------
		// WAS 로 접속하는 방법 설정. get 또는 post
		//-------------------------------
		,type    : "post"
		
		,data    : SearchFormObj.serialize( )

        ,success : function(responseHtml) {
      	

            var obj = $(responseHtml);
  
            $(".stadiumTransferFormContainer").html(obj.filter(".stadiumTransferFormContainer").html());
			
            $(".pagingNos").html(obj.find(".pagingNos").html());

        }

       , error : function() {
        	
            alert("검색 실패! 관리자에게 문의 바랍니다.");
        } 
       
    });
		
}








function pageNoClick( clickPageNo ){
	//alert(clickPageNo);
	//---------------------------------------------
	// name='selectPageNo' 를 가진 태그의 value 값에 
	// 매개변수로 들어오는 [클릭한 페이지 번호]를 저장하기
	// 즉 <input type="hidden" name="selectPageNo" value="1"> 태그에
	// value 값에 [클릭한 페이지 번호]를 저장하기
	//---------------------------------------------
	$("[name='stadiumTransferFormConditionalSearch']").find(".selectPageNo").val(clickPageNo)
	
	
	search()
	
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
	
	<form name="stadiumTransferFormConditionalSearch" onsubmit="return false">

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



		<input type="hidden" name="sort" class="sort"> <input
			type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
			<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">
</form>



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
					<c:forEach var="Yangdo" items="${requestScope.stadiumYangdoList}"
						varStatus="status">
						<tr style="cursor: pointer"
							onClick="goTransferDetailForm(${Yangdo.yangdo_no});">
							<td align="center">${requestScope.StadiumYangdoMap.begin_serialNo_desc - status.count + 1}</td>
							<!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
							<td align="center">${Yangdo.title}</td>
							<td align="center">${Yangdo.writer}</td>
							<td align="center">${Yangdo.readcount}</td>
							<td align="center">${Yangdo.reg_date}</td>
						</tr>
					</c:forEach>
			</table>
			<c:if test="${empty requestScope.stadiumYangdoList}">
				<br>
				<center>조건에 맞는 검색 결과가 없습니다.</center>
			</c:if>
		</div>
	</div>
	
	
	
		<center>

		<span class="pagingNos"> <span style="cursor: pointer"
			onClick="pageNoClick(1)">[처음]</span> <span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.noticeBoardMap.selectPageNo}-1)">[이전]</span>&nbsp;&nbsp;


			<c:forEach var="pageNo"
				begin="${requestScope.StadiumYangdoMap.begin_pageNo}"
				end="${requestScope.StadiumYangdoMap.end_pageNo}">

				<c:if test="${requestScope.StadiumYangdoMap.selectPageNo==pageNo}">
            ${pageNo}
         </c:if>

				<c:if test="${requestScope.StadiumYangdoMap.selectPageNo!=pageNo}">
					<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
				</c:if>
			</c:forEach>&nbsp;&nbsp; <span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.StadiumYangdoMap.selectPageNo}+1)">[다음]</span>
			<span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.StadiumYangdoMap.last_pageNo})">[마지막]</span>
			&nbsp;&nbsp;&nbsp;
			[${requestScope.StadiumYangdoListCnt}/${requestScope.StadiumYangdoListAllCnt}]개
			&nbsp;&nbsp;
		</span> <select name="rowCntPerPage" class="rowCntPerPage"
			onChange="search()">
			<option value="10">10
			<option value="15">15
			<option value="20">20
		</select>행보기 &nbsp;&nbsp;&nbsp;
	</center>
	
	
	
	
	<form name="transferDetailForm" action="/transferDetailForm.do"
		method="post">
		<!-- 클릭한 행의 게시판 고유번호가 저장될 히든태그 선언 -->
		<input type="hidden" name="yangdo_no" >
	</form>
	
	
	
	
	
	
	
	
</body>
</html>