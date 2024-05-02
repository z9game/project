<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CustomerServiceForm</title>
<link href="/style/main/customerServiceFormStyle.css" rel="stylesheet">
<script src="/js/main/customerServiceFormScript.js"></script>
<script>
// FAQ / 질문과 답변 카테고리 선택 
	$(function(){
		$('.customerServiceCategoryTabContent > div').hide();
		$('.customerServiceCategoryTabNav a').click(function(){
			$('.customerServiceCategoryTabContent > div').hide().filter(this.hash).fadeIn();
			$('.customerServiceCategoryTabNav a').removeClass('active');
			$(this).addClass('active');
			return false;
		}).filter(':eq(0)').click();
	});

// FAQ 페이지
	$(document).ready(function() {
		
	    // 페이지가 로드될 때 전체 카테고리를 활성화 상태로 설정
	    $(".customerServiceCategory").eq(0).addClass("active");
	
	    // 카테고리 클릭 시 이벤트 핸들러
	    $(document).on("click", ".customerServiceCategory", function() {
	        $(".customerServiceCategory").removeClass("active");
	        $(this).addClass("active");
	
	        var category = $(this).text().trim(); // 클릭한 카테고리의 값을 가져옴
	
	        // AJAX를 통해 해당 카테고리의 내용을 가져옴
	        $.ajax({
	            url: "/main/customerServiceForm.do",
	            type: "post",
	            data: { category: category }, // 클릭한 카테고리의 값을 전달
	            success: function(responseHtml) {
	                var obj = $(responseHtml);
	                var filteredHtml = "";
	
	                // 가져온 내용 중 카테고리에 해당하는 것만 필터링하여 리스트에 삽입
	                obj.find(".customerServiceitem").each(function() {
	                    var itemCategory = $(this).find("span").text().trim();
	                    if (category === "전체" || itemCategory === category) {
	                        filteredHtml += $(this)[0].outerHTML;
	                    }
	                });
	                $("#list-area").html(filteredHtml);
	
	                // 클릭된 아이템에만 활성화 클래스를 추가하고 나머지 아이템의 활성화 클래스를 제거
	                $(".customerServiceitem").removeClass("active");
	                $(".customerServiceitem").eq(0).addClass("active");
	            },
	            error: function() {
	                alert("에러 발생")
	            }
	        });
	    });
	});
	
// 질문과 답변 페이지	

	function search() {

		var customerServicePagingFormObj = $("[name='customerServicePagingForm']");
		
		customerServicePagingFormObj.find(".rowCntPerPage").val("10");
	
		$.ajax({
				
			url : "/main/customerServiceForm.do",
			
			type : "post",
			
			data : customerServicePagingFormObj.serialize(),
			
			success : function(responseHtml) {
	
				var obj = $(responseHtml);
	
				$("#customerServiceCategoryTabQnA .customerServiceQnAFormContainer").html(obj.find("#customerServiceCategoryTabQnA .customerServiceQnAFormContainer").html());
	
				$(".pagingNos").html(obj.find(".pagingNos").html());
				
			},
			
			error : function() {
	
				alert(customerServicePagingFormObj.serialize());
			}
	
		});

	}

	function pageNoClick(clickPageNo) {
		
		$("[name='customerServicePagingForm']").find(".SelectPageNo").val(clickPageNo)

		search();
	}
	
	function submitDetailForm(b_no){
		var formObj = $(".customerServiceDetailForm");
		formObj.find("[name='b_no']").val(b_no);
		document.customerServiceDetailForm.submit();
	}
	
	function newCustomerServiceQnABoardBtnClick() {
		
	    var sessionMid = '<%= session.getAttribute("mid") %>'

	    if (sessionMid === 'null') {
	    	alert('로그인이 필요한 서비스입니다.');
	    } else {
	    	checkPwd();
	    }
	    
	    function checkPwd(){
	    	var pwdInput = prompt("계정 비밀번호를 입력해주세요.");
	    	var sessionPwd = '<%= session.getAttribute("password") %>'
	    	
	    	if(pwdInput == sessionPwd){
	        	location.href = '/main/newCustomerServiceQnAForm.do';
	    	} else {
	    		alert("비밀번호가 다릅니다.");
	    		checkPwd();
	    	}
	    }
	}

</script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="customerServiceFormTitle">
        <img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
        <p class="titleBackgoundText">고객센터</p>
    </div>
    <form name="customerServicePagingForm" onsubmit="return false">
    	<input type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
    	<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">
    </form>
    <form name="customerServiceDetailForm" class="customerServiceDetailForm" action="/updateCustomerServiceDetailFormReadCountPlusOne.do" method="post">
    	<input type="hidden" name="b_no">
    </form>
    <div class="customerServiceCategoryTab">
    	<ul class="customerServiceCategoryTabNav">
    		<li><a href="#customerServiceCategoryTabFAQ">FAQ</a></li>
    		<li><a href="#customerServiceCategoryTabQnA">QnA</a></li>
    	</ul>
    	<div class="customerServiceCategoryTabContent">
    		<div id="customerServiceCategoryTabFAQ">
			    <div class="customerServiceFormFAQContainer">
			        <div id="main-area">
			            <div id="category-area">
			                <ul id="category">
			                    <li class="customerServiceCategory"><span>전체</span></li>
			                    <c:forEach var="customerServiceCategoryList" items="${requestScope.customerServiceCategoryList}">
			                        <li class="customerServiceCategory">${customerServiceCategoryList.customerservice_categoryname}</li>
			                    </c:forEach>
			                </ul>
			            </div>
			            <div id="list-area">
			                <ul id="list">
			                    <c:forEach var="customerServiceList" items="${requestScope.customerServiceList}">
			                        <li class="customerServiceitem">
			                            <div class="text">
			                                <span>${customerServiceList.customerservice_categoryname}</span>${customerServiceList.customerservice_subject}
			                            </div>
			                            <div class="additional">
			                                ${customerServiceList.customerservice_content}
			                            </div>
			                        </li>
			                    </c:forEach> 
			                </ul>
			            </div>
			        </div>
			    </div>
			</div>
			<div id="customerServiceCategoryTabQnA">
				<div class="customerServiceQnAFormContainer">
					<div class="customerServiceQnAFormBoard">
						<div class="newCustomerServiceQnABoardBtnDiv">
							<input type="button" class="newCustomerServiceQnABoardBtn" value="새 글 쓰기" onClick="newCustomerServiceQnABoardBtnClick()">
						</div>
						<table class="customerServiceQnABoardListTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin:0 auto; margin-top:10px; width:1000px;">
							<tr>
								<th style="width:50px;">번호</th>
								<th style="width:300px;">제목</th>
								<th style="width:80px;">작성자</th>
								<th style="width:100px;">등록일</th>
								<th style="width:100px;">조회수</th>
								<c:forEach var="customerServiceQnABoard" items="${requestScope.customerServiceQnABoardList}" varStatus="status">
									<tr style="cursor:pointer" onClick="submitDetailForm(${customerServiceQnABoard.b_no});">
										<td align="center">${requestScope.customerServiceQnABoardMap.begin_serialNo_desc - status.count + 1}</td>
										<!--${requestScope.boardMap.begin_serialNo_desc - status.index} -->
										<td align="center">${customerServiceQnABoard.subject}</td>
										<td align="center">${customerServiceQnABoard.writer}</td>
										<td align="center">${customerServiceQnABoard.reg_date}</td>
										<td align="center">${customerServiceQnABoard.readcount}</td>
									</tr>
								</c:forEach>
						</table>
						<c:if test="${empty requestScope.customerServiceQnABoardList}">
							<br>
							<center>
								조건에 맞는 검색 결과가 없습니다.
							</center>
						</c:if>
					</div>
				</div>
				<div class="customerServiceCategoryTabQnAPaging">
					<span class="pagingNos">
						<span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span>
						<span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.selectPageNo}-1)">[이전]</span>&nbsp;&nbsp;
						<c:forEach var="pageNo" begin="${requestScope.customerServiceQnABoardMap.begin_pageNo}" end="${requestScope.customerServiceQnABoardMap.end_pageNo}">
							<c:if test="${requestScope.customerServiceQnABoardMap.selectPageNo==pageNo}">
					            ${pageNo}
					        </c:if>
							<c:if test="${requestScope.customerServiceQnABoardMap.selectPageNo!=pageNo}">
								<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
							</c:if>
						</c:forEach>&nbsp;&nbsp;
						<span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.selectPageNo}+1)">[다음]</span>
						<span style="cursor: pointer" onClick="pageNoClick(${requestScope.customerServiceQnABoardMap.last_pageNo})">[마지막]</span>
						&nbsp;&nbsp;&nbsp;
						Total. ${requestScope.customerServiceQnABoardListAllCnt}개
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
