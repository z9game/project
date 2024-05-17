<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recruitHiredBoardForm</title>
<link href="/style/recruitTeamBoardFormStyle.css" rel="stylesheet">
<link href="/style/sub.css" rel="stylesheet">
<script src="/js/recruitTeamBoardFormScript.js"></script>
<script src="/js/common.js"></script>

<script>

//엔터키작동
function enterkey()
{
   
   if(window.event.keyCode == 13)
   {
      search();
   }
}

//검색
function search() {

   //---------------------------------------------
   // 변수 boardSearchFormObj 선언하고 
   // name='recruit_hired' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
   //---------------------------------------------
   var boardSearchFormObj = $("[name='recruit_hired']");

   var keyword1Obj = boardSearchFormObj.find(".keyword1"); 

   var keyword1 = keyword1Obj.val();
     
   if(typeof(keyword1)!='string' ){keyword1=""; }
    
    keyword1 = $.trim(keyword1);
    
    
   $.ajax({
      //-------------------------------
      // WAS 로 접속할 주소 설정
      //-------------------------------
      url : "/recruitHiredBoardForm.do"
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

         $(".recruitHiredBoard").html(obj.find(".recruitHiredBoard").html());
			
      }

      ,
      error : function() {

         alert("검색 실패! 관리자에게 문의 바랍니다.");
      }

   });
}
   
 

   function goRecruitHiredDetailForm(recruitment_no)
   {
      $("[name='recruitHiredBoardDetailForm'] [name='recruitment_no']").val(recruitment_no); 
      document.recruitHiredBoardDetailForm.submit();
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
			location.href='/newRecruitHiredBoardForm.do'
		}
	   
   }
   
</script>
</head>
<body>
   <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recruitHiredBoardFormTitle">
       <img src="/image/RecruitTitleBackgroundImage.jpg" class="titleBackgoundImg">
       <p class="titleBackgoundText"></p>
    </div>
    <br>
   <div>
   <!-- mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm -->
		<form name="recruit_hired" onsubmit="return false">
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
	  				
	  			<dl class="pos">
	  				<dt class="item">포 지 션</dt>
	  					<dd  class="content">
	  						<input type="checkbox" id="st" name="pos" onclick="" value="ST">ST&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="cm" name="pos" onclick="" value="CM">CM&nbsp;&nbsp;&nbsp;&nbsp;<br>
							<input type="checkbox" id="cb" name="pos" onclick="" value="CB">CB&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="gk" name="pos" onclick="" value="GK">GK&nbsp;&nbsp;&nbsp;&nbsp;<br>
							<input type="checkbox" id="allPos" name="pos" onclick="" value="allpos">상관없음
	  					</dd>
	  			</dl>
			</div>	
			
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
			<div class="newRecruitHiredBoardBtnDiv">
				<input type="button" class="newRecruitHiredBoardBtn" value="새 글 쓰기" onclick="checkReserveForm()">
			</div>
		</center>
     
     
     
      <div class="recruitHiredBoard">
         <table class="boardListTable" cellpadding="7" border="1" bordercolor="gray" align="center" style="border-collapse:collapse; margin: 0 auto; margin-top:10px; width:1000px;">
            <tr>
               <th style="width:50px;">번호</th>
               <th style="width:300px;">제목</th>
               <th style="width:80px;">닉네임</th>
               <th style="width:100px;">조회수</th>
			   <th style="width:100px;">등록일</th>
			 </tr>		
               <c:forEach var="list" items="${requestScope.boardList}" varStatus="status">
                  <tr style="cursor:pointer" onClick=" goRecruitHiredDetailForm(${list.recruitment_no});">
					 <td align="center">${list.recruitment_no}</td>
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
  
	<div style="height:30px;"></div>
         
      <form name="recruitHiredBoardDetailForm" action="/recruitHiredBoardDetailForm.do" method="post">
         <!-- 클릭한 행의 게시판 고유번호가 저장될 히든태그 선언 -->
         <input type="hidden" name="recruitment_no">
      </form>        
     
      
</body>
</html>