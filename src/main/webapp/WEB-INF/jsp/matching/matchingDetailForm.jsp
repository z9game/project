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
</head>
<body>
   <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="recruitTeamBoardDetailFormTitle">
       <img src="/image/RecruitTitleBackgroundImage.jpg" class="titleBackgoundImg">
       <p class="titleBackgoundText">매칭 찾기</p>
    </div>

   
      <center>
         <table align="center" bordercolor="gray" border=1 cellpadding=7
            style="border-collapse: collapse">
            <caption>[매칭찾기 상세글 보기]</caption>
            <tr>
               <th bgColor="lightgray">제목</th>
               <!--------------------------------------------------- -->
               <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 저장된 boardDTO 객체의 -->
               <!-- writer 라는 멤버변수 안의 데이터를 표현하기 -->
               <!-- 상세보기할 게시판의 이름 표현하기 -->
               <!--------------------------------------------------- -->
               <td>${requestScope.detail.title}</td>
            </tr>
            <tr>
               <th bgColor="lightgray">글쓴이</th>
               <!--------------------------------------------------- -->
               <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
               <!-- subject 라는 멤버변수 안의 데이터를 표현하기 -->
               <!-- 상세보기할 게시판의 제목 표현하기 -->
               <!--------------------------------------------------- -->
               <td>${requestScope.detail.nickname}</td>
            </tr>
            <tr>
               <th bgColor="lightgray">조회수</th>
               <!--------------------------------------------------- -->
               <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
               <!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
               <!-- 상세보기할 게시판의 조회수 표현하기 -->
               <!--------------------------------------------------- -->
               <td>${requestScope.detail.readcount}</td>
            </tr>
            
            <tr>
                <th bgColor="lightgray">지역</th>
                <!--------------------------------------------------- -->
                <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
                <!-- readcount 라는 멤버변수 안의 데이터를 표현하기 -->
                <!-- 상세보기할 게시판의 조회수 표현하기 -->
                <!--------------------------------------------------- -->
                <td>${requestScope.detail.sido_c} ${requestScope.detail.sigungu_c}</td>
             </tr>
             
             <tr>
                <th bgColor="lightgray">시간</th>
                <td>${requestScope.detail.time_range}</td>
             </tr>
             
             <tr>
                <th bgColor="lightgray">일시</th>
                <td>${requestScope.detail.day}</td>
             </tr>
          
            <tr>
               <th bgColor="lightgray">내 용</th>
               <!--------------------------------------------------- -->
               <!-- HttpServletRequest 객체에 "boardDTO" 라는 키값으로 boardDTO 객체의 -->
               <!-- content 라는 멤버변수 안의 데이터를 표현하기 -->
               <!-- 상세보기할 게시판의 내용 표현하기 -->
               <!--------------------------------------------------- -->
               <td><textarea name="content" class="content" rows="13"
                     cols="40" maxlength="500" readonly>${requestScope.detail.content}</textarea></td>
            </tr>
         </table>
      </center>

      <center>
         <!--------------------------------------------------- -->
         <!-- [목록 화면으로] 글씨 표현하고 클릭하면  WAS 로 '/boardList.do' 로 접속하기-->
         <!--------------------------------------------------- -->
         <span style="cursor: pointer"
            onclick="location.href='/matchingForm.do'">
            [목록 화면으로] </span>
         <input type="button" value="수정/삭제" style="cursor:pointer" onclick="" >
       </center>
       <div style="height:30px;"></div>
     
    
</body>
</html>