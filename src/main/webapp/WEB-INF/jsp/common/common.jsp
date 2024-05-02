<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSP 기술 Page Directive를 이용해 페이지 처리 방식 선언 -->

<%@ page import="java.util.List"%>

<%@ page import="java.util.Map"%>

<%@ page import="kosmo.team.project.dto.SampleDTO"%>

<%@ page import="kosmo.team.project.dto.CommunityDTO"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- CustomTag를 사용하기 위한 조건 -->

<script src="/js/jquery-1.11.0.min.js"></script>

<script src="/js/common.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script >

function setweekgroup() {
      if ($("#workweekcdGroupA").is(":checked")) {
         $("#day1, #day2, #day3, #day4, #day5").prop("checked", true);
         $("#day0").prop("checked", false);
      } 
      else {
         $("#day1, #day2, #day3, #day4, #day5").prop("checked", false);
      }
      
      
      if ($("#workweekcdGroupB").is(":checked")) {
         $("#day6, #day7").prop("checked", true);
         $("#day0").prop("checked", false);
      } 
      else {
         $("#day6, #day7").prop("checked", false);
      }
      
      //=============================================================================================================================================================================================
      
      if ($("#workweekcdGroupAA").is(":checked")) {
          $("#day11, #day22, #day33, #day44, #day55").prop("checked", true);
          $("#day00").prop("checked", false);
       } 
       else {
          $("#day11, #day22, #day33, #day44, #day55").prop("checked", false);
       }
      
      if ($("#workweekcdGroupBB").is(":checked")) {
          $("#day66, #day77").prop("checked", true);
          $("#day00").prop("checked", false);
       } 
       else {
          $("#day66, #day77").prop("checked", false);
       }
      
   };
   
   
   function setweekDay() {
   
      if ($("#day1").is(":checked") && $("#day2").is(":checked") && $("#day3").is(":checked") && $("#day4").is(":checked") && $("#day5").is(":checked")) {
         $("#workweekcdGroupA").prop("checked", true);
      } 
      else if($("#day1").is(":checked") || $("#day2").is(":checked") || $("#day3").is(":checked") || $("#day4").is(":checked") || $("#day5").is(":checked")) 
      {
         $("#day0").prop("checked", false);
      }  
      else {
         $("#workweekcdGroupA").prop("checked", false);
      }
      
      
      if ($("#day6").is(":checked") && $("#day7").is(":checked")) {
         $("#workweekcdGroupB").prop("checked", true);
      } 
      else if($("#day6").is(":checked") || $("#day7").is(":checked"))
      {
         $("#day0").prop("checked", false);
      }
      
      else {
         $("#workweekcdGroupB").prop("checked", false);
      }
      //=============================================================================================================================================================================================
         
      if ($("#day11").is(":checked") && $("#day22").is(":checked") && $("#day33").is(":checked") && $("#day44").is(":checked") && $("#day55").is(":checked")) {
         $("#workweekcdGroupAA").prop("checked", true);
      } 
      else if($("#day11").is(":checked") || $("#day22").is(":checked") || $("#day33").is(":checked") || $("#day44").is(":checked") || $("#day55").is(":checked")) 
      {
         $("#day00").prop("checked", false);
      }  
      else {
         $("#workweekcdGroupAA").prop("checked", false);
      }
      
      
      if ($("#day66").is(":checked") && $("#day77").is(":checked")) {
         $("#workweekcdGroupBB").prop("checked", true);
      } 
      else if($("#day66").is(":checked") || $("#day77").is(":checked"))
      {
         $("#day00").prop("checked", false);
      }
      
      else {
         $("#workweekcdGroupBB").prop("checked", false);
      }
   };
   
   
   function allday()
   {
     if ($("#day0").is(":checked")) {
         $("#day1, #day2, #day3, #day4, #day5, #day6, #day7, #workweekcdGroupA, #workweekcdGroupB").prop("checked", false);
      }
     
   //=============================================================================================================================================================================================
      
      if ($("#day00").is(":checked")) {
           $("#day11, #day22, #day33, #day44, #day55, #day66, #day77, #workweekcdGroupAA, #workweekcdGroupBB").prop("checked", false);
         }
   }
   
   
   function everyset()
   {
      if ($("#everytime").is(":checked")) {
            $("#morning, #am, #pm, #night").prop("checked", false);
       }
      
    //=============================================================================================================================================================================================
       
       if ($("#everytime2").is(":checked")) {
            $("#morning2, #am2, #pm2, #night2").prop("checked", false);
       }
   }
   
   function timeset()
   {
      if($("#morning").is(":checked") || $("#am").is(":checked") || $("#pm").is(":checked") || $("#night").is(":checked")) 
         {
            $("#everytime").prop("checked", false);
         }  
      
      //=============================================================================================================================================================================================
         
      if($("#morning2").is(":checked") || $("#am2").is(":checked") || $("#pm2").is(":checked") || $("#night2").is(":checked")) 
         {
            $("#everytime2").prop("checked", false);
         }    
   }
      
   
   </script>