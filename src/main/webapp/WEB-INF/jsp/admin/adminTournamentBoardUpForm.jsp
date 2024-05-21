<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminTournamentUpForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">

<script src="/js/community/communityFreeBoardFormScript.js"></script>

<script>
   
</script>


</head>
<body>
   <%@ include file="/WEB-INF/jsp/header.jsp"%>
   <div class="adminTournamentBoardDetailFormTitle">
      <img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
      <p class="titleBackgoundText"></p>
   </div>

   <%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>

      
         <table class="newAdminTournamentBoardFormRegTable" border="1" bordercolor="black">
            <tr>
               <th>제목</th>
               <td>
               		<input type="text" name="subject" value="${requestScope.detail.subject}"> 	 
               </td>
            </tr>
            
            <!-- 오라클에 지역 갑이 문자가 아닌 숫자로 저장돼 지역의 value값을 숫자에서 문자로 변경하였음 -->
            
            <tr>
               <th>지역</th>
               <td>
               		<select name="region">
               			<option>지역선택</option>
               			<option value="서울" <c:if test="${requestScope.region eq '서울'}">selected</c:if>>서울</option>
               			<option value="경인" <c:if test="${requestScope.region eq '경인'}">selected</c:if>>경인</option>
               			<option value="강원" <c:if test="${requestScope.region eq '강원'}">selected</c:if>>강원</option>
               			<option value="충청" <c:if test="${requestScope.region eq '충청'}">selected</c:if>>충청</option>
               			<option value="전라" <c:if test="${requestScope.region eq '전라'}">selected</c:if>>전라</option>
               			<option value="경상" <c:if test="${requestScope.region eq '경상'}">selected</c:if>>경상</option>
               			<option value="제주" <c:if test="${requestScope.region eq '제주'}">selected</c:if>>제주</option>
               		</select>
               </td>
            </tr>
            

            <tr>
            	<th bgColor="lightgray">신청기간</th>
                 <td>
                 	<input type="date" name="regist_start" value="${requestScope.detail.regist_start}">
                 	~
                 	<input type="date" name="regist_end" value="${requestScope.detail.regist_end}">
                 </td> 
            </tr> 
         	<tr>
           		<th bgColor="lightgray">내 용</th>
	            <td>
	               <textarea name="content" class="content" rows="13" cols="40" maxlength="500">
	               ${requestScope.detail.content}
	               </textarea>
	            </td>
         	</tr>
      </table>


      <center>
         <!--------------------------------------------------- -->
         <!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
         <!--------------------------------------------------- -->
         <span style="cursor: pointer"
            onclick="location.href='/adminTournamentBoardForm.do'"> [목록화면으로] </span>
         <input type="button" value="수정" style="cursor:pointer" onclick="document.updateTournament.submit()">

	<form name="updateTournament" action="/adminTournamentBoardUpForm.do" method="post">
		<input type="hidden" name="list_no" value="${requestScope.detail.list_no}">
	</form>

</body>
</html>