<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecruitTeamBoardDetailForm</title>
<link href="/style/recruitTeamBoardDetailFormStyle.css" rel="stylesheet">
<script src="/js/recruitTeamBoardFormScript.js"></script>

<script>
	//수정 관련 함수
	function checkBoardUpForm() {
		
		var formObj = $("[name='upDelMatching']");
		if (confirm("정말 수정하시겠습니까?") == false) {
			return;
		}
	
		$.ajax({
			url : "/updateMatchingBoardProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 글입니다.");
					location.href = "/matchingForm.do";
				} 
				else {
					alert("자유게시판 수정 성공입니다.");
					location.href = "/matchingForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}
	
	//삭제 관련 함수
	function checkBoardDelForm() {
		var formObj = $("[name='upDelMatching']");
		if (confirm("정말 삭제하시겠습니까?") == false) {
			return;
		}
		$.ajax({
			url : "/deleteMatchingBoardProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("이미 삭제된 글입니다.");
					location.href = "/matchingForm.do";
				} else {
					alert("게시물 삭제 성공!");
					location.href = "/matchingForm.do";
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
   <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recruitTeamBoardDetailFormTitle">
       <img src="/image/RecruitTitleBackgroundImage.jpg" class="titleBackgoundImg">
       <p class="titleBackgoundText">매칭 찾기</p>
    </div>

   
      <center>
     	<form name="upDelMatching">
         <table align="center" bordercolor="gray" border=1 cellpadding=7
            style="border-collapse: collapse">
            <caption>[게시물 수정]</caption>
            <tr>
               <th bgColor="lightgray">제 목</th>
               <td><input type="text" name="title" class="title" size="40"
					maxlength="30" value="${requestScope.upDelDetail.title}"></td>
            </tr>
            <tr>
               <th bgColor="lightgray">글쓴이</th>
               <td>${requestScope.upDelDetail.nickname}</td>
            </tr>
            <tr>
                <th bgColor="lightgray">지 역</th>
                <td colspan="5" >${requestScope.upDelDetail.sido_c}-${requestScope.upDelDetail.sigungu_c}->(수정)
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
                <th bgColor="lightgray">시 간</th>
                <td>
                	<select name="matchingTime" id="" value="${requestScope.upDelDetail.time_no}">
		              	<option value="0" <c:if test="${requestScope.upDelDetail.time_no == 0}">selected</c:if>>시간 선택</option>
					    <option value="1" <c:if test="${requestScope.upDelDetail.time_no == 1}">selected</c:if>>AM06시~AM08시</option>
					    <option value="2" <c:if test="${requestScope.upDelDetail.time_no == 2}">selected</c:if>>AM08시~AM10시</option>
					    <option value="3" <c:if test="${requestScope.upDelDetail.time_no == 3}">selected</c:if>>AM10시~AM12시</option>
					    <option value="4" <c:if test="${requestScope.upDelDetail.time_no == 4}">selected</c:if>>PM12시~PM14시</option>
					    <option value="5" <c:if test="${requestScope.upDelDetail.time_no == 5}">selected</c:if>>PM14시~PM16시</option>
					    <option value="6" <c:if test="${requestScope.upDelDetail.time_no == 6}">selected</c:if>>PM16시~PM18시</option>
					    <option value="7" <c:if test="${requestScope.upDelDetail.time_no == 7}">selected</c:if>>PM18시~PM20시</option>
					    <option value="8" <c:if test="${requestScope.upDelDetail.time_no == 8}">selected</c:if>>PM20시~PM22시</option>
					    <option value="9" <c:if test="${requestScope.upDelDetail.time_no == 9}">selected</c:if>>PM22시~PM24시</option>
					    <option value="10" <c:if test="${requestScope.upDelDetail.time_no == 10}">selected</c:if>>AM02시~AM04시</option>
					    <option value="11" <c:if test="${requestScope.upDelDetail.time_no == 11}">selected</c:if>>AM04시~AM06시</option>
	            	</select>
	            </td>
             </tr>
             
             <tr>
                <th bgColor="lightgray">날 짜</th>
                <td><input type="date" id="date" name="date" value="${requestScope.upDelDetail.day}"></td>
             </tr>
          
            <tr>
               <th bgColor="lightgray">내 용</th>
               <td><textarea name="content" class="content" rows="13"
                     cols="40" maxlength="500">${requestScope.upDelDetail.content}</textarea></td>
            </tr>
         </table>
		<input type="hidden" name="match_no" value="${requestScope.upDelDetail.match_no}">
        </form>
      </center>

      <center>
         <!--------------------------------------------------- -->
         <!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
         <!--------------------------------------------------- -->
         <span style="cursor: pointer"
            onclick="location.href='/matchingForm.do'">
            [목록 화면으로] </span>
         	<input type="button" value="수정" style="cursor:pointer" onclick="checkBoardUpForm();" >
         	<input type="button" value="삭제" style="cursor:pointer" onclick="checkBoardDelForm();" >
       </center>
       <div style="height:30px;"></div>

 
</body>
</html>