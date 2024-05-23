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
	function checkTournamentUpForm() {
		
		var formObj = $("[name='updateAdminTournament']");
		
		if (confirm("정말 수정하시겠습니까?") == false) {
			return;
		}
	
		$.ajax({
			url : "/upTournamentBoardProc.do",
			type : "post",
			data : formObj.serialize(),
			success : function(json) {
				var result = json["result"];
				if (result == 0) {
					alert("삭제된 글입니다.");
					location.href = "/adminTournamentBoardForm.do";
				} 
				else {
					alert("대회일정 수정 성공입니다.");
					location.href = "/adminTournamentBoardForm.do";
				}
			},
			error : function() {
				alert("수정 실패! 관리자에게 문의 바랍니다.");
			}
		});
	}
</script>


</head>
<body>
   <%@ include file="/WEB-INF/jsp/header.jsp"%>
   <div class="adminTournamentBoardDetailFormTitle">
      <img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
      <p class="titleBackgoundText"></p>
   </div>

   <%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>

      <form name="updateAdminTournament">
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
               			<option value="서울">서울</option>
               			<option value="경인">경인</option>
               			<option value="강원">강원</option>
               			<option value="충청">충청</option>
               			<option value="전라">전라</option>
               			<option value="경상">경상</option>
               			<option value="제주">제주</option>
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
	               <textarea name="content" class="content" rows="13" cols="40" maxlength="500">${requestScope.detail.content}</textarea>
	            </td>
         	</tr>
     	 </table>
     	 
     	 <input type="hidden" name="list_no" value="${requestScope.detail.list_no}">
      </form>


      <center>
         <!--------------------------------------------------- -->
         <!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
         <!--------------------------------------------------- -->
         <span style="cursor: pointer"
            onclick="location.href='/adminTournamentBoardForm.do'"> [목록화면으로] </span>
         <input type="button" value="수정" style="cursor:pointer" onclick="checkTournamentUpForm();">

</body>
</html>