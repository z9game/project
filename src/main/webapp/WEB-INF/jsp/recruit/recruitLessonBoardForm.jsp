<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recruitLessonBoardForm</title>
<link href="/style/recruitTeamBoardFormStyle.css" rel="stylesheet">
<link href="/style/sub.css" rel="stylesheet">
<script src="/js/recruitTeamBoardFormScript.js"></script>
<script src="/js/common.js"></script>

<script>

//페이징처리_기본값10개로설정
$(document).ready(function() {
  $(".rowCntPerPage").val("10");
});


//페이징처리
function search() {
	//---------------------------------------------
	// 변수 boardSearchFormObj 선언하고 
	// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
	//---------------------------------------------
	var boardSearchFormObj = $("[name='recruit_lesson']");

  boardSearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val())
	
	
	//값 들어오는지 확인
  //alert(boardSearchFormObj.serialize());


	//이거있어야함
	$.ajax({
				//--------------------------------------------
				// WAS 로 접속할 주소 설정
				//--------------------------------------------
				url : "/recruitLessonBoardForm.do"
				//--------------------------------------------
				// WAS 로 접속하는 방법 설정. get 또는 post
				//--------------------------------------------
				,
				type : "post"

				,
				data : boardSearchFormObj.serialize()

				,
				success : function(responseHtml) {

					var obj = $(responseHtml);


					//해당하는 페이지의 내용으로 덮어씌워라
					$(".recruitLessonBoard").html(obj.find(".recruitLessonBoard").html());
					
					

					//번호를 눌렀을 때 해당하는 페이지의 내용을 가지고 와라
					$(".pagingNos").html(obj.find(".pagingNos").html());
					


				}

				,
				error : function() {

					alert("검색 실패! 관리자에게 문의 바랍니다.");
				}

			});

}

//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
//[페이지 번호]를 클릭하면 호출되는 함수 pageNoClick 선언하기 
//쪼개서 보여주기.
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function pageNoClick(clickPageNo) {
	//alert(clickPageNo);
	//---------------------------------------------
	// name='selectPageNo' 를 가진 태그의 value 값에 
	// 매개변수로 들어오는 [클릭한 페이지 번호]를 저장하기
	// 즉 <input type="hidden" name="selectPageNo" value="1"> 태그에
	// value 값에 [클릭한 페이지 번호]를 저장하기
	//---------------------------------------------
	$("[name='recruit_lesson']").find(".selectPageNo").val(clickPageNo)

	search()

}

//엔터키작동
function enterkey()
{
   
   if(window.event.keyCode == 13)
   {
      search();
   }
}

/* //검색
function search() {

   //---------------------------------------------
   // 변수 boardSearchFormObj 선언하고 
   // name='recruit_lesson' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
   //---------------------------------------------
   var boardSearchFormObj = $("[name='recruit_lesson']");

   var keyword1Obj = boardSearchFormObj.find(".keyword1"); 

   var keyword1 = keyword1Obj.val();
     
   if(typeof(keyword1)!='string' ){keyword1=""; }
    
    keyword1 = $.trim(keyword1);
    
    
   $.ajax({
      //-------------------------------
      // WAS 로 접속할 주소 설정
      //-------------------------------
      url : "/recruitLessonBoardForm.do"
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

         $(".recruitLessonBoard").html(obj.find(".recruitLessonBoard").html());
			
      }

      ,
      error : function() {

         alert("검색 실패! 관리자에게 문의 바랍니다.");
      }

   });
} */
   
 

   function goRecruitLessonDetailForm(recruitment_no)
   {
      $("[name='recruitLessonBoardDetailForm'] [name='recruitment_no']").val(recruitment_no); 
      document.recruitLessonBoardDetailForm.submit();
   }

   
   function checkReserveForm() {

	   
	   var sessionMid = '<%=session.getAttribute("mid")%>';

	   if (sessionMid == "" || sessionMid == 'null') {
	       alert('로그인이 필요한 서비스입니다.');
	       location.href = '/loginForm.do';
	       return;
	   }
		else
		{
			location.href='/newRecruitLessonBoardForm.do'
		}
	   
   }
   
   //레슨페이지 sort 관련 함수
   function searchWithSort(sort)
   {
   	$("[name='recruit_lesson']").find("[name='sort_date']").val(sort);
   	search();
   	
   }
   
</script>
</head>
<body>
   <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recruitLessonBoardFormTitle">
       <img src="/image/RecruitTitleBackgroundImage.jpg" class="titleBackgoundImg">
       <p class="titleBackgoundText"></p>
    </div>
    <br>
   <div>
   <!-- mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm -->
		<form name="recruit_lesson" onsubmit="return false">
			<div class="top">
				<dl class="search">
	 				<dt class="item">검 색</dt>
						<dd  class="content">
							<select name="searchType1">
								<option value="all">전체</option>
								<option value="nickname">닉네임</option> 
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select> 
							<input type="text" name="keyword1" placeholder="검색어를 입력하세요" class="keyword1" onkeyup="enterkey()"> 
						</dd>
	 			</dl>
	 			<dl class="area">
	 				<dt class="item">지 역</dt>
	 					<dd class="content">	
	 						<select name="sido" id="" onchange="categoryChange(this)">
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
	
				            <select name="sigungu" id="state">
				              <option value="0">군/구 선택</option>
				            </select>
	 					</dd>
	 			</dl>
			</div>		
			
			<div class="middle">
				<dl class="day">
	  				<dt class="item">요 일</dt>
	  					<dd class="content">
							<input type="checkbox" id="workweekcdGroupA" name="allweekday" onclick="setweekgroup()">평일(월,화,수,목,금)&nbsp;&nbsp;
							<input type="checkbox" id="workweekcdGroupB" name="allweekend" onclick="setweekgroup()">주말(토,일)<br>
							<input type="checkbox" id="day1" name="day" onclick="setweekDay()" value="1">월&nbsp;&nbsp;
							<input type="checkbox" id="day2" name="day" onclick="setweekDay()" value="2">화&nbsp;&nbsp;
							<input type="checkbox" id="day3" name="day" onclick="setweekDay()" value="3">수&nbsp;&nbsp;
							<input type="checkbox" id="day4" name="day" onclick="setweekDay()" value="4">목&nbsp;&nbsp;
							<input type="checkbox" id="day5" name="day" onclick="setweekDay()" value="5">금<br>
							<input type="checkbox" id="day6" name="day" onclick="setweekDay()" value="6">토&nbsp;&nbsp;
							<input type="checkbox" id="day7" name="day" onclick="setweekDay()" value="7">일<br>
							<input type="checkbox" id="day0" name="day" value="0" onclick="allday()">상관없음
	  					</dd>
	  				</dl>
	  				
	  			<dl class="time">
	 				<dt class="item">시 간</dt>
	  					<dd  class="content">
	  						<input type="checkbox" id="morning" name="time" onclick="timeset()" value="새벽">새벽&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="am" name="time" onclick="timeset()" value="오전">오전&nbsp;&nbsp;&nbsp;<br>
							<input type="checkbox" id="pm" name="time" onclick="timeset()" value="오후">오후&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="night" name="time" onclick="timeset()" value="야간">야간&nbsp;&nbsp;<br>
							<input type="checkbox" id="everytime" name="time" onclick="everyset()" value="alltime">상관없음&nbsp;&nbsp;
	  					</dd>
	  			</dl>
	  				
	  			<dl class="money">
	 				<dt class="item">비 용</dt>
	  					<dd  class="content">
	  							
	  						<input type="checkbox" id="free" name="money" onclick="moneycheck()" value="무료">무료&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="paid" name="money" onclick="moneycheck()" value="유료">유료&nbsp;&nbsp;&nbsp;<br>
							<input type="checkbox" id="nomatter" name="money" onclick="everymoney()" value="상관없음">상관없음&nbsp;&nbsp;&nbsp;
	  					</dd>
	  			</dl>
			</div>	
			
			<!-- 페이징처리관련 밑에두줄-->
			<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
			<input type="hidden" name="selectPageNo" class="selectPageNo"  value="1">
			<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
			<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">
			<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
			<input type="hidden" name="sort_date">
			<!-- 위에 한 줄은 sort 관련 -->
			
			
	 	</form>
		
  <!-- mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm -->		
   
     
      <center>
   		 <br><br>
   		 	<div class="searchBtn">
				<dl class="searchBtn" >
	 				<dt class="item" onclick="search()" class="searchBtn" style="cursor:pointer">검색</dt>
	 			</dl>
			</div>
   		 <br><br><br>
			<div class="newRecruitLessonBoardBtnDiv">
				<input type="button" class="newRecruitLessonBoardBtn" value="새 글 쓰기" onclick="checkReserveForm()">
			</div>
		</center>
     
     
     
      <div class="recruitLessonBoard">
         <table class="boardListTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin: 0 auto; margin-top:10px; width:1000px;">
            <tr>
               <th style="width:50px;">번호</th>
               <th style="width:300px;">제목</th>
               <th style="width:80px;">닉네임</th>
               <th style="width:100px;">조회수</th>
			   <c:if test="${param.sort_date!='reg_date asc' and param.sort_date!='reg_date desc'}">
					<th width="100" onClick="searchWithSort('reg_date desc')" style="cursor:pointer">등록일</th>
					</c:if>
					<!--============================================================= -->
					<!-- 만약 파명 "sort" 의 파값이 'reg_date desc' 면 -->
					<!-- 즉 정렬 의지가 'reg_date desc' 면             -->
					<!--============================================================= -->
					<c:if test="${param.sort_date=='reg_date desc'}">
						<th width="100" onClick="searchWithSort('reg_date asc')" style="cursor:pointer">등록일▼</th>
					</c:if>	
					<!--============================================================= -->
					<!-- 만약 파명 "sort" 의 파값이 'reg_date asc' 면 -->
					<!-- 즉 정렬 의지가 'reg_date asc' 면             -->
					<!--============================================================= -->
					<c:if test="${param.sort_date=='reg_date asc'}">	
						<th width="100" onClick="searchWithSort('')" style="cursor:pointer">등록일▲</th>
					</c:if>
			 </tr>		
               <c:forEach var="list" items="${requestScope.boardList}" varStatus="status">
                  <tr style="cursor:pointer" onClick=" goRecruitLessonDetailForm(${list.recruitment_no});">
					 <td align="center">${requestScope.lessonMap.begin_serialNo_desc - status.index}</td>
                     <td align="center">${list.title}</td>
                     <td align="center">${list.nickname}</td>
                     <td align="center">${list.readcount}</td>
                     <td align="center">${list.reg_date}</td>
                  </tr>
               </c:forEach>
                  
               
         </table>
         <c:if test="${empty requestScope.boardList}">
                  <center>
                  <br><br><br><br>
                  <b>조건에 맞는 결과물이 없습니다.</b>
                  </center>
            </c:if>
      </div>
   </div>
   
   <!-- 페이징 처리 -->
    <center>

		<span class="pagingNos"> <span style="cursor: pointer"
			onClick="pageNoClick(1)">[처음]</span> <span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.lessonMap.selectPageNo}-1)">[이전]</span>&nbsp;&nbsp;


			<c:forEach var="pageNo"
				begin="${requestScope.lessonMap.begin_pageNo}"
				end="${requestScope.lessonMap.end_pageNo}">

				<c:if test="${requestScope.lessonMap.selectPageNo==pageNo}">
            ${pageNo}
        	    </c:if>

				<c:if test="${requestScope.lessonMap.selectPageNo!=pageNo}">
					<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
				</c:if>
			</c:forEach>&nbsp;&nbsp; <span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.lessonMap.selectPageNo}+1)">[다음]</span>
			<span style="cursor: pointer"
			onClick="pageNoClick(${requestScope.lessonMap.last_pageNo})">[마지막]</span>

		</span> <select name="rowCntPerPage" class="rowCntPerPage"
			onChange="search()">
			<option value="10">10
			<option value="15">15
			<option value="20">20
		</select>행보기 &nbsp;&nbsp;&nbsp;
	</center>
  
	<div style="height:30px;"></div>
         
      <form name="recruitLessonBoardDetailForm" action="/recruitLessonBoardDetailForm.do" method="post">
         <!-- 클릭한 행의 게시판 고유번호가 저장될 히든태그 선언 -->
         <input type="hidden" name="recruitment_no">
      </form>        
     
      
</body>
</html>