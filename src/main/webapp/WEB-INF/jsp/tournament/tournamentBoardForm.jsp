<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TournamentBoardForm</title>
<link href="/style/tournamentBoardFormStyle.css" rel="stylesheet">
<script src="/js/tournamentBoardFormScript.js"></script>

<script>
	$(document).ready(function(){
	    $(".tournament").click(function(){
	       $(".tournament").removeClass("onvalue");
	       $(this).addClass("onvalue");
	    });
	    
	    $(".region1").click(function(){
	       $(".region1").removeClass("selected1");
	       $(this).addClass("selected1");
	    });
	    
	    ing();
	 })
	 
	 
	 //진행/마감 초기설정
	 ing_or_end = "초기";
	
	 //지역선택 초기설정
	 regionChoice = "초기"
	
	 
	 //현재 시간 잡기위한 함수
	 function nowDate(date) {
	    var year = date.getFullYear();
	    var month = date.getMonth()+1;
	    var day = date.getDate();
	    return year + "-" + month + "-" + day;
	}
	
	//진행중인 대회
	function ing() {
		regionChoice = "전체";
	    var now = new Date();
	    var nowdate = nowDate(now);

	    $.ajax({
	        url: "/tournamentBoardForm.do",
	        type: "post",
	        data: "ing=" + nowdate,
	        success: function(responseHtml) {
	            var obj = $(responseHtml);
	            $(".region").html(obj.find(".region").html());
	            $(".pagingNos").html(obj.find(".pagingNos").html());
	            ing_or_end = "진행";
	        },
	        error: function() {
	            alert("검색 실패 / 관리자에게 문의 바람");
	        }
	    });
	}
	
	//마감된 대회
	function end() {
		regionChoice = "전체";
	    var now = new Date();
	    var nowdate = nowDate(now);

	    $.ajax({
	        url: "/tournamentBoardForm.do",
	        type: "post",
	        data: "end=" + nowdate,
	        success: function(responseHtml) {
	            var obj = $(responseHtml);
	            $(".region").html(obj.find(".region").html());
	            $(".pagingNos").html(obj.find(".pagingNos").html());
	            ing_or_end = "끝";
	        },
	        error: function() {
	            alert("검색 실패 / 관리자에게 문의 바람");
	        }
	    });
	}
	
	
	
	function select(region)
	{
		 if (region) 
		 {
			 regionChoice = region;
		 }
		 search();
	}
	
	
	//지역 클릭했을때
	 function search()
	   {   
	      $(".region1").click(function(){
	         $(".region1").removeClass("selected1");
	         $(this).addClass("selected1");
	      });
	      
	      var formObj = $("[name='regionchoice']")
	      var choicedRegion = regionChoice;
	      var now = new Date();
		  var nowdate = nowDate(now);

	      if(ing_or_end == "진행")
	      {

	         $.ajax({
	            //----------------------------------------------------------
	            //WAS 에 접속할 URL 주소 지정
	            //----------------------------------------------------------
	            url   : "/tournamentBoardForm.do" 
	            //----------------------------------------------------------
	            //form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
	            //----------------------------------------------------------
	            ,type : "post"
	            //----------------------------------------------------------
	            //WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
	            //----------------------------------------------------------
	            ,data : formObj.serialize() + "&region=" + choicedRegion + "&ing=" + nowdate
	               
	            ,success : function(responseHtml){

	               var obj = $(responseHtml);
	               $(".boardList").html(   $(responseHtml).find(".boardList").html()   );
	               $(".pagingNos").html(  obj.find(".pagingNos").html()  );
	               //$("body").append("<hr><hr><hr><hr><textarea cols=50 rows=50>" + responseHtml+ "</textarea>);
					//$("body").append("<hr>" + responseHtml)
		  		
		  				//responseHtml
		  				
		  				/*$(".boardList").length 
		  				+ " / "
		  				$(responseHtml).find(".boardList").length 
		  				+ " / "
		  				  $(".pagingNos").length 
		  				+ " / "
		  				obj.find(".pagingNos").length */
	            }         
	            ,error     : function(){alert("검색 실패 / 관리자에게 문의 바람");}
	            
	         })
	      }
	      
	      else if(ing_or_end == "끝")
	      {
	         $.ajax({
	            //----------------------------------------------------------
	            //WAS 에 접속할 URL 주소 지정
	            //----------------------------------------------------------
	            url   : "/tournamentBoardForm.do" 
	            //----------------------------------------------------------
	            //form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
	            //----------------------------------------------------------
	            ,type : "post"
	            //----------------------------------------------------------
	            //WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
	            //----------------------------------------------------------
	            ,data : formObj.serialize() + "&region=" + choicedRegion + "&end=" + nowdate
	               
	            ,success : function(responseHtml){
	               
	               var obj = $(responseHtml);
	               
	               $(".boardList").html( $(responseHtml).find(".boardList").html());
	               $(".pagingNos").html(obj.find(".pagingNos").html());
	              
	               
	               /*$("body").append("<hr>" + responseHtml); */
	               
	      
	            }         
	            ,error     : function(){alert("검색 실패 / 관리자에게 문의 바람");}
	            
	         })
	      }
	         
	   } 
	
  
	 function pageNoClick(clickPageNo) {
		
		$("[name='regionchoice']").find(".selectPageNo").val(clickPageNo);
		//alert($("[name='regionchoice']").find(".selectPageNo").val())
		search();
	}
	
	 function goTournamentBoardDetail(list_no)
	   {
	      $("[name='tournamentBoardDetail'] [name='list_no']").val(list_no); 
	      document.tournamentBoardDetail.submit();
	   }
   
</script>

</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="tournamentBoardFormTitle">
       <img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
       <p class="titleBackgoundText">대회일정</p>
    </div>
    <br>
    <center>
      <div>
      	<form name="regionchoice">
         <table align="center" style="border-collapse:collapse" border="1">
            <tr>
               <td class="tournament onvalue" onclick="ing()">
                  진행중인 대회
               </td>
               <td class="tournament" onclick="end()">
                  마감된 대회
               </td>
            </tr>
         </table> 
         
         <div class="region"> <!-- 지역 선택 Div -->
            <table align="center" style="border-collapse:collapse">
               <tr>
                  <td class="region1 selected1"  onClick="select('전체')">&middot;전체</td>
                  <td class="region1" onClick="select('서울')">&middot;서울</td>
                  <td class="region1" onClick="select('경인')">&middot;경인</td>
                  <td class="region1" onClick="select('강원')">&middot;강원</td>
                  <td class="region1" onClick="select('충청')">&middot;충청</td>
                  <td class="region1" onClick="select('전라')">&middot;전라</td>
                  <td class="region1" onClick="select('경상')">&middot;경상</td>
                  <td class="region1" onClick="select('제주')">&middot;제주</td>
               </tr>
            </table> 
       		<input type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
       	
         
            <div class="boardList">
            <c:forEach var="gameList" items="${requestScope.tournamentList}">
               <table style="border: 1px solid">
                  <tr style="cursor:pointer" onClick="goTournamentBoardDetail(${gameList.list_no});">
                     <td rowspan="3">
                     
                        <img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
                     </td>
                     
                     <td>
                        <b>${gameList.subject}</b>
                     </td>
                  </tr>   
                  
                  <tr>
                     <td>
                        대회지역 = ${gameList.region}
                     </td>
                  </tr>
                  
                  <tr>
                     <td>
                        신청기간 = ${gameList.regist_start} ~ ${gameList.regist_end}
                     </td>
                  </tr>
                  
                  </c:forEach>
               </table>
               <c:if test="${empty requestScope.tournamentList}">
                  
                     <br><br><br><br>
                     <b>조건에 맞는 결과물이 없습니다.</b>
                  
               </c:if>
            </div>
         </div>  
         </form> 
      </div>
    </center>
    
    
    <div style="height:10px;"></div>
      <center>
         <span class="pagingNos"> <span style="cursor: pointer"
            onClick="pageNoClick(1)">[처음]</span> <span style="cursor: pointer"
            onClick="pageNoClick(${requestScope.tournamentMap.selectPageNo}-1)">[이전]</span>&nbsp;&nbsp;
   
   
            <c:forEach var="pageNo"
               begin="${requestScope.tournamentMap.begin_pageNo}"
               end="${requestScope.tournamentMap.end_pageNo}">
   
               <c:if test="${requestScope.tournamentMap.selectPageNo==pageNo}">
               ${pageNo}
               </c:if>
   
               <c:if test="${requestScope.tournamentMap.selectPageNo!=pageNo}">
                  <span style="cursor: pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
               </c:if>
            </c:forEach>&nbsp;&nbsp; <span style="cursor: pointer"
            onClick="pageNoClick(${requestScope.tournamentMap.selectPageNo}+1)">[다음]</span>
            <span style="cursor: pointer"
            onClick="pageNoClick(${requestScope.tournamentMap.last_pageNo})">[마지막]</span>
         </span> 
      </center>
      
    </center>
    
    <div style="height:20px;"></div>
    <form action="/tournamentBoardDetail.do" method="post" name="tournamentBoardDetail">
       <input type="hidden" name="list_no">
    </form>
</body>
</html>