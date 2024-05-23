<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<c:if test="${empty sessionScope.mid}">
	<script>
		alert("로그인이 필요합니다.");
		location.replace("/loginForm.do");
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecruitTeamBoardDetailForm</title>
<link href="/style/recruitTeamBoardDetailFormStyle.css" rel="stylesheet">
<script src="/js/recruitTeamBoardFormScript.js"></script>

<script>
	$(function() {
		
		loadStadiumNo();
		
	});

	function checkBoardRegForm()
	{
		var formObj = $("[name='newMatchingBoard']")
		
		$.ajax({
			//-------------------------------
			// WAS 로 접속할 주소 설정
			//-------------------------------
			url : "/newMatchingBoardProc.do"
			//-------------------------------
			// WAS 로 접속하는 방법 설정. get 또는 post
			//-------------------------------
			,
			type : "post"
	
			,
			data : formObj.serialize()
	
			,
			success : function(json) {
	
				var result = json["result"];
				
				if(result == 1)
				{
					alert("게시물 입력 성공!");
					location.href='/matchingForm.do';
				}
				else
				{
					alert("게시물 입력 실패!")
				}
	
				
	
			}
	
			,
			error : function() {
	
				alert("입력 실패! 관리자에게 문의 바랍니다.");
			}
	
		});	
	}
	
	function loadStadiumNo() {
		var formObj = $("[name='newMatchingBoard']");
	
	    $.ajax({
	        url: '/machingStadiumSelectBoxLoad.do',
	        method: 'POST',
	        data: formObj.serialize(),
	        success: function(json) {
	        	if (json[0] == null) { return; }
	        	
	            var options = '';
	            for (var i = 0; i < json.length; i++) {
	            	var s = json[i];
	            	options += '<option value="' + s.stadium_no + '">' + s.stadium_name + '</option>';
	            }
	            
	            $("select[name='stadium_no']").html(options); // select 요소에 추가
	            
	            loadMachingDay();
	        },	
	        
	        error: function(xhr, status, error) {
	            console.error("에러 발생: " + error);
	        }
	    });
	}
	
	function loadMachingDay() {
		
		var formObj = $("[name='newMatchingBoard']");
		
	    $.ajax({
	        url: '/machingDaySelectBoxLoad.do',
	        method: 'POST',
	        data: formObj.serialize(),
	        success: function(json) {
	        	if (json[0] == null) { return; }
	            var options = '';
	            for (var i = 0; i < json.length; i++) {
	            	var b = json[i];
	            	options += '<option value="' + b.booking_date + '">' + b.booking_date + '</option>';
	            }
	            
	            $("select[name='day']").html(options); // select 요소에 추가
	            
	            loadMachingTime();
	        },	
	        
	        error: function(xhr, status, error) {
	            console.error("에러 발생: " + error);
	        }
	    });		
	}
	
	function loadMachingTime() {
		
		var formObj = $("[name='newMatchingBoard']");
		
	    $.ajax({
	        url: '/machingTimeSelectBoxLoad.do',
	        method: 'POST',
	        data: formObj.serialize(),
	        success: function(json) {
	        	if (json[0] == null) { return; }
	            var options = '';
	            for (var i = 0; i < json.length; i++) {
	            	var t = json[i];
	            	options += '<option value="' + t.time_no + '">' + t.time_range + '</option>';
	            }
	            
	            $("select[name='matchingTime']").html(options); // select 요소에 추가
	        },	
	        
	        error: function(xhr, status, error) {
	            console.error("에러 발생: " + error);
	        }
	    });		
	}
		
</script>
</head>
<body>
   <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recruitTeamBoardDetailFormTitle">
       <img src="/image/RecruitTitleBackgroundImage.jpg" class="titleBackgoundImg">
       <p class="titleBackgoundText">매칭 찾기</p>
    </div>

   	<form name="newMatchingBoard">
      <center>
         <table align="center" bordercolor="gray" border=1 cellpadding=7
            style="border-collapse: collapse">
            <caption>[매칭찾기 새 글쓰기]</caption>
            <tr>
               <th bgColor="lightgray">제목</th>
               <!--------------------------------------------------- -->
               <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
               <!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
               <!-- 상세보기할 게시판의 이름 표현하기 -->
               <!--------------------------------------------------- -->
               <td>
               		<input type="text" name="title" class="title" size="40" maxlength="30">
               </td>
            </tr>
            <tr>
               <th bgColor="lightgray">글쓴이</th>
               <!--------------------------------------------------- -->
               <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
               <!-- subject 라는 멤버변수 안의 데이터를 표현하기 -->
               <!-- 상세보기할 게시판의 제목 표현하기 -->
               <!--------------------------------------------------- -->
               <td>${sessionScope.nickname}</td>
            </tr>
            <tr>
            	<th bgColor="lightgray">팀 명</th>
            	<td>${requestScope.myInfo.team_name}</td>
            </tr>
            <!-- 	주석처리
            <tr>
                <th bgColor="lightgray">지역</th>
                <td>
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
		              <option>군/구 선택</option>
		            </select>
				</td>
             </tr>
			-->
			<tr>
                <th bgColor="lightgray">경기장명</th>
                <td>
					<select name="stadium_no" id="stadium_no" onchange="loadMachingDay()">
						<option value="0">매칭예약 미신청 상태</option>
					</select>
				</td>
             </tr>
             <!-- 	주석처리
             <tr>
                <th bgColor="lightgray">시간</th>
                <td>
                	<select name="matchingTime" id="">
		              	<option value="0">시간 선택</option>
						<option value="1">AM06시~AM08시</option>
						<option value="2">AM08시~AM10시</option>
						<option value="3">AM10시~AM12시</option>
						<option value="4">PM12시~PM14시</option>
						<option value="5">PM14시~PM16시</option>
						<option value="6">PM16시~PM18시</option>
						<option value="7">PM18시~PM20시</option>
						<option value="8">PM20시~PM22시</option>
						<option value="9">PM22시~PM24시</option>
						<option value="10">AM02시~AM04시</option>
						<option value="11">AM04시~AM06시</option>
	            	</select>
                </td>
             </tr>
              -->
              
			<tr>
				<th bgColor="lightgray">일시(날짜)</th>
                <td>
					<select name="day" onchange="loadMachingTime()">
						<option value="0">매칭예약 미신청 상태</option>
					</select>
				</td>
             </tr>
              
			<tr>
                <th bgColor="lightgray">시간</th>
                <td>
                	<select name="matchingTime">
                		<option value="0">매칭예약 미신청 상태</option>
                	</select>
                </td>
             </tr>
             
             <!-- 	주석처리 순서 위치도 바꿈 
             <tr>
                <th bgColor="lightgray">일시</th>
                <td>
					<input type="date" id="date" name="day">
				</td>
             </tr>
			-->
          
            <tr>
               <th bgColor="lightgray">내 용</th>
               <!--------------------------------------------------- -->
               <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
               <!-- content 라는 멤버변수 안의 데이터를 표현하기 -->
               <!-- 상세보기할 게시판의 내용 표현하기 -->
               <!--------------------------------------------------- -->
               <td><textarea name="content" class="content" rows="13"
                     cols="40" maxlength="500"></textarea></td>
            </tr>
         </table>
      </center>
      
      <input type="hidden" name="writer" value="${sessionScope.m_no}">
      <input type="hidden" name="m_no" value="${sessionScope.m_no}">
      <input type="hidden" name="team_no" value="${requestScope.myInfo.team_no}">
      
     </form>

      <center>
         <!--------------------------------------------------- -->
         <!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
         <!--------------------------------------------------- -->
         <span style="cursor: pointer"
            onclick="location.href='/matchingForm.do'">
            [목록 화면으로] </span>
         <input type="button" value="등록" style="cursor:pointer" onclick="checkBoardRegForm()" >
       </center>
       <div style="height:30px;"></div>
     
    
</body>
</html>