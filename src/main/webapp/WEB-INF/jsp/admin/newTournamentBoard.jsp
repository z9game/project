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
   function regBoard()
   {
	   var formObj = $("[name='newTournamentBoard']");
	   $.ajax({
			//-------------------------------
			// WAS 로 접속할 주소 설정
			//-------------------------------
			url : "/newTournamentBoardProc.do"
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
					location.href='/adminTournamentBoardForm.do';
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
</script>


</head>
<body>
   <%@ include file="/WEB-INF/jsp/header.jsp"%>
   <div class="adminTournamentBoardDetailFormTitle">
      <img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
      <p class="titleBackgoundText"></p>
   </div>

   <%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>

      	<form name="newTournamentBoard">
	         <table class="newAdminTournamentBoardFormRegTable" border="1" bordercolor="black">
	            <tr>
	               <th>제목</th>
	               <td>
	               		<input type="text" name="subject"> 	 
	               </td>
	            </tr>
	            
	            <!-- 오라클에 지역 갑이 문자가 아닌 숫자로 저장돼 지역의 value값을 숫자에서 문자로 변경하였음 -->
	            
	            <tr>
	               <th>지역</th>
	               <td>
	               		<select name="region">
	               			<option>지역선택</option>
	               			<option value="서울">서울</option>
	               			<option value="경기">경기</option>
	               			<option value="인천">인천</option>
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
	                 	<input type="date" name="regist_start">
	                 	~
	                 	<input type="date" name="regist_end">
	                 </td> 
	            </tr> 
	         	<tr>
	           		<th bgColor="lightgray">내 용</th>
		            <td>
		               <textarea name="content" class="content" rows="13" cols="40" maxlength="500">
		               
		               </textarea>
		            </td>
	         	</tr>
	      </table>
		</form>

      <center>
         <!--------------------------------------------------- -->
         <!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
         <!--------------------------------------------------- -->
         <input type="button" value="등록" style="cursor:pointer" onclick="regBoard()">
		 <span style="cursor: pointer"
            onclick="location.href='/adminTournamentBoardForm.do'"> [목록화면으로] </span>

</body>
</html>