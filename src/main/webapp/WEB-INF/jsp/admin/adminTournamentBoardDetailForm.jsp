<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>newAdminTournamentBoardForm</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">

<script src="/js/community/communityFreeBoardFormScript.js"></script>

<script>
   function newRegist()
   {
      var registObj = $("[name='newAdminTournamentBoardForm']");

      
      
      $.ajax({
         //----------------------------------------------------------
         //WAS 에 접속할 URL 주소 지정
         //----------------------------------------------------------
         url   : "/tournamentRegProc.do" 
         //----------------------------------------------------------
         //form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
         //----------------------------------------------------------
         ,type : "post"
         //----------------------------------------------------------
         //WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
         //----------------------------------------------------------
         ,data : registObj.serialize()
         //----------------------------------------------------------
         //WAS 의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
         //이때, 익명함수의 매개변수로 WAS 의 응답물이 들어 온다.
         //----------------------------------------------------------
            //--------------------------
            //WAS 의 응답물이
            //1행1열의 데이터라면 숫자 or 문자로 들어오고
            //1행n열의 데이터라면 JSON 으로 들어오고
            //n행1열의 데이터라면 Array 으로 들어오고
            //n행m열의 데이터라면 다량의 JSON 이 저장된 Array 객체로 들어온다.
            //--------------------------
            
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

      <form name="newAdminTournamentBoardForm">
         <table class="newAdminTournamentBoardFormRegTable" border="1" bordercolor="black">
            <tr>
               <th>제목</th>
               <td>
                  <input type="text" name="subject" class="subject" size="40" maxlength="30">
               </td>
            </tr>
            
            <!-- 오라클에 지역 갑이 문자가 아닌 숫자로 저장돼 지역의 value값을 숫자에서 문자로 변경하였음 -->
            
            <tr>
               <th>지역</th>
               <td>
                  <select name="region" id="">
                     <option value="0">지역선택</option>
                     <option value="서울">서울</option>
                     <option value="경기">경기</option>
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
                  <!--------------------------------------------------- -->
                  <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
                  <!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
                  <!-- 상세보기할 게시판의 조회수 표현하기 -->
                  <!--------------------------------------------------- -->
                  <td>
                  <input type="date" class="regist_start" name="regist_start"> - <input type="date" class="regist_end" name="regist_end">
                  </td>
               </tr> 
         <tr>
            <th bgColor="lightgray">내 용</th>
            <!--------------------------------------------------- -->
            <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
            <!-- content 라는 멤버변수 안의 데이터를 표현하기 -->
            <!-- 상세보기할 게시판의 내용 표현하기 -->
            <!--------------------------------------------------- -->
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
         <span style="cursor: pointer"
            onclick="location.href='/adminTournamentBoardForm.do'"> [목록화면으로] </span>
         <input type="button" value="등록" style="cursor:pointer" onclick="newRegist()">



</body>
</html>