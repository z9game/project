<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminFormTitle</title>
<link href="/style/community/communityFreeBoardFormStyle.css" rel="stylesheet">
<link href="/style/adminFormStyle.css" rel="stylesheet">
<script src="/js/community/communityFreeBoardFormScript.js"></script>



<script>



$(document).ready(function() {
    $(".rowCntPerPage").val("10");
    search();
    checkDate();
    
    

    
  
});







// 	function goAdminMemberDetailForm(m_no) {
// 	    // m_no와 함께 player_record_no 파라미터 추가
// 	    $("[name='adminMemberDetailForm'] [name='m_no']").val(m_no);
// 	    //$("[name='memberDetailForm'] [name='player_record_no']").val(player_record_no);
	    
//     // memberDetailForm 폼 submit
//     document.adminMemberDetailForm.submit();
// }


	
	function search() {
		//---------------------------------------------
		// 변수 boardSearchFormObj 선언하고 
		// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
		//---------------------------------------------
		var boardSearchFormObj = $("[name='adminSearchForm']");

		var keyword1Obj = boardSearchFormObj.find(".keyword1"); 
		  
		var keyword2Obj = boardSearchFormObj.find(".keyword2");
		
		var minGames_playedObj = boardSearchFormObj.find(".minGames_played"); 
		  
		var maxGames_playedObj = boardSearchFormObj.find(".maxGames_played");
		
		
		
		
		var keyword1 = keyword1Obj.val();
		  
	    var keyword2 = keyword2Obj.val();
	    
	    
	    var minGames_played = minGames_playedObj.val();
		  
	    var maxGames_played = maxGames_playedObj.val();
	    
	    
	  
	    boardSearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val())
		
		
	
	    


		
		$.ajax({
					//-------------------------------
					// WAS 로 접속할 주소 설정
					//-------------------------------
					url : "/adminForm.do"
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

	
						
						$(".adminFormContainer").html(obj.filter(".adminFormContainer").html());
						
						

						
						$(".pagingNos").html(obj.find(".pagingNos").html());
						


					}

					,
					error : function() {

						alert("검색 실패! 관리자에게 문의 바랍니다.");
					}

				});

	}

	function searchWithSort(sort) {
	    $("[name='adminSearchForm']").find("[name='sort']").val(sort);
	    $(".searchBtn").click();
	}
	
	
	
	 function searchAll() {
	        var boardSearchFormObj = $("[name='adminSearchForm']");
	        boardSearchFormObj.find(".keyword1").val("");
	        boardSearchFormObj.find(".keyword2").val("");
	        boardSearchFormObj.find(".sort").val("");
	        boardSearchFormObj.find("#minDate").val("");
	        boardSearchFormObj.find("#maxDate").val("");
	        boardSearchFormObj.find(".selectPageNo").val("1");
	        boardSearchFormObj.find(".searchType1").val("all");
	        boardSearchFormObj.find(".gender").prop("checked", false);
	        boardSearchFormObj.find(".ageRange").prop("checked", false);
	        boardSearchFormObj.find(".sido").val("0");
	        boardSearchFormObj.find(".sigungu").val("0");
		    boardSearchFormObj.find(".sigungu").empty();
		    boardSearchFormObj.find(".sigungu").append('<option value="0">군/구 선택</option>');
	        boardSearchFormObj.find(".minGames_played").val("0");
	        boardSearchFormObj.find(".maxGames_played").val("0");
	        boardSearchFormObj.find(".minWin").val("0");
	        boardSearchFormObj.find(".maxWin").val("0");
	        boardSearchFormObj.find(".minDraws").val("0");
	        boardSearchFormObj.find(".maxDraws").val("0");
	        boardSearchFormObj.find(".minLoss").val("0");
	        boardSearchFormObj.find(".maxLoss").val("0");
	        boardSearchFormObj.find(".minGoals").val("0");
	        boardSearchFormObj.find(".maxGoals").val("0");
	        boardSearchFormObj.find(".minAssists").val("0");
	        boardSearchFormObj.find(".maxAssists").val("0");

	        search();
	    }

	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// [페이지 번호]를 클릭하면 호출되는 함수 pageNoClick 선언하기 
	// 쪼개서 보여주기.
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	function pageNoClick(clickPageNo) {
		//alert(clickPageNo);
		//---------------------------------------------
		// name='selectPageNo' 를 가진 태그의 value 값에 
		// 매개변수로 들어오는 [클릭한 페이지 번호]를 저장하기
		// 즉 <input type="hidden" name="selectPageNo" value="1"> 태그에
		// value 값에 [클릭한 페이지 번호]를 저장하기
		//---------------------------------------------
		$("[name='adminSearchForm']").find(".selectPageNo").val(clickPageNo)

		search()

	}

	function checkDate() {
		$(function() {
		    // minDatepicker 설정
		    $("#minDate").datepicker({
		        dateFormat: 'yy-mm-dd', // 날짜 형식 설정
		        showOtherMonths: true, // 다른 달의 날짜도 표시
		        showMonthAfterYear: true, // 년도 먼저, 월 나중에 표시
		        changeYear: true, // 년도 선택 가능
		        changeMonth: true, // 월 선택 가능
		        showOn: "both", // 아이콘과 텍스트로 달력 열기 가능
		        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 달력 이미지 추가
		        buttonImageOnly: true, // 아이콘 이미지만 표시
				
		        buttonText: "날짜 선택", // 버튼 텍스트 설정
		        yearSuffix: "년", // 연도 뒤에 붙는 텍스트 설정
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 월 이름 설정
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 요일 이름 설정
		        minDate: "-5Y", // 최소 날짜 설정
		        maxDate: 0, // 최대 날짜 설정
		        onClose: function(selectedDate) {
		            if (selectedDate) {
		                $("#maxDate").datepicker("option", "minDate", selectedDate);
		            } else {
		                // 사용자가 입력을 취소했을 때 maxDate의 minDate를 기본값으로 재설정
		                $("#maxDate").datepicker("option", "minDate", "-5Y");
		            }
		        }
		    });

		    // maxDatepicker 설정
		    $("#maxDate").datepicker({
		        dateFormat: 'yy-mm-dd', // 날짜 형식 설정
		        showOtherMonths: true, // 다른 달의 날짜도 표시
		        showMonthAfterYear: true, // 년도 먼저, 월 나중에 표시
		        changeYear: true, // 년도 선택 가능
		        changeMonth: true, // 월 선택 가능
		        showOn: "both", // 아이콘과 텍스트로 달력 열기 가능
		        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 달력 이미지 추가
		        buttonImageOnly: true, // 아이콘 이미지만 표시
		        buttonText: "날짜 선택", // 버튼 텍스트 설정
		        yearSuffix: "년", // 연도 뒤에 붙는 텍스트 설정
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 월 이름 설정
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 요일 이름 설정
		        minDate: "-5Y", // 최소 날짜 설정
		        maxDate: 0, // 최대 날짜 설정
		        onClose: function(selectedDate) {
		            if (selectedDate) {
		                $("#minDate").datepicker("option", "maxDate", selectedDate);
		            } else {
		                // 사용자가 입력을 취소했을 때 minDate의 maxDate를 오늘 날짜로 재설정
		                $("#minDate").datepicker("option", "maxDate", new Date());
		            }
		        }
		    });

		});

	}
	
	
	function goMemberDetail(m_no){

		
	    $("[name='memberDetailUpDelForm'] [name='m_no']").val(m_no);
		
		
		document.memberDetailUpDelForm.submit();
		
		

	}
	
	function settingOpen() {
        var modal = document.querySelector(".settingModal");
        modal.style.display = "block";
    }

    // 모달 닫기
    function settingClose() {
        var modal = document.querySelector(".settingModal");
        modal.style.display = "none";
    }
	
   
    function saveSettings() {
    	
    	var settingFormObj = $("[name='settingForm']");
    	
//      	alert(settingFormObj.serialize())
//     	console.log(settingFormObj.serialize())
    	 
    	$.ajax({
			//-------------------------------
			// WAS 로 접속할 주소 설정
			//-------------------------------
			url : "/MemberSettingProc.do"
			//-------------------------------
			// WAS 로 접속하는 방법 설정. get 또는 post
			//-------------------------------
			,
			type : "post"

			,
			data : settingFormObj.serialize()

			,
			success : function(response) {
				
				settingClose()
				alert("저장되었습니다.")
				$('#adminFormContent').html(response);

			}

			,
			error : function() {

				alert("수정실패! 관리자에게 문의 바랍니다.");
			}

		});
        
    }
  

</script>
<style>
	#nav-item-title{
		text-align: center;
		border: 1px solid #006666;
		border-radius: 30px;
		width: 150px;
		height: 50px;
		line-height: 3.3;
		margin-top: 30px;
		background-color: #006666;
		color: #FFFFFF;
	}
	#setting {
		position: fixed;
		width: 3%;
		bottom: 50%;
		right: 15%;
		border-radius: 50%;
		opacity: 0.7;
		border:3px solid #999999;
  	}
  	#setting:hover {
	/* 마우스 가져다 대면 외각 색설정 */
	cursor:pointer;
	/* 효과시간  */
	transition: 0.3s;
	/* 크기 확대 */
	transform: scale(1.1);
	}

	 /* 스타일은 여기에 추가하세요 */
    .settingModal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4);
    }

    .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
    }

    /* 닫기 버튼 스타일 */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
</style>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>

	<div class="communityFreeBoardFormTitle">
		<p class="titleBackgoundText">관리자 페이지</p>
	</div>
	<div class="adminPageSideBar">
		<%@ include file="/WEB-INF/jsp/admin/admin_side_nav.jsp"%>
	</div>

	 <div >
        <img src="image/adminSettingIcon.png" id="setting" onclick="settingOpen()">
        
    </div>

    <div id="settingModal" class="settingModal">
    <div class="modal-content">
        <span class="close" onclick="settingClose()">X</span>
        <div class="adminSetting" align="center">
            <!-- 여기에 모달 내용 추가 -->
      <form name="settingForm" onsubmit="return false">
          <table >
          	<c:forEach var="list" items="${requestScope.memberSearchSettingList}">
          		 <c:if test="${list.search_condition_type == 'gender'}">
				<tr>
					<th >성별</th>
					<td >
						<input type="radio" name="genderSetting" value="show"  <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="genderSetting" value="hide"  <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'age_group'}">
				<tr>
					<th >연령대</th>
					<td >
						<input type="radio" name="ageRangeSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="ageRangeSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'city'}">
				<tr>
					<th >시/도</th>
					<td >
						<input type="radio" name="sidoSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="sidoSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'join_date'}">
				<tr>
					<th >가입일</th>
					<td >
						<input type="radio" name="joinDateSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="joinDateSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'game_count'}">
				<tr>
					<th >경기수</th>
					<td >
						<input type="radio" name="gameCountSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="gameCountSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'win_count'}">
				<tr>
					<th >승리수</th>
					<td >
						<input type="radio" name="winCountSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="winCountSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'draw_count'}">
				<tr>
					<th >무승부</th>
					<td >
						<input type="radio" name="drawCountSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="drawCountSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'loss_count'}">
				<tr>
					<th >패배</th>
					<td >
						<input type="radio" name="lossCountSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="lossCountSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'goals'}">
				<tr>
					<th >골</th>
					<td >
						<input type="radio" name="goalCountSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="goalCountSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
				</tr>
				</c:if>
				<c:if test="${list.search_condition_type == 'assists'}">
				<tr>
					<th >어시스트</th>
					<td >
						<input type="radio" name="assistsCountSetting" value="show" <c:if test="${list.is_active == 'show'}">checked</c:if> >보이기
						<input type="radio" name="assistsCountSetting" value="hide" <c:if test="${list.is_active == 'hide'}">checked</c:if> >숨기기
					</td>
				</tr>
				</c:if>
				
		</c:forEach>
			</table>	
		</form>
			<input type="button" class="boardRegBtn" value="저장" onclick="saveSettings()">
            
        </div>
    </div>
</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	<form name="adminSearchForm" class="adminSearchForm" onsubmit="return false">

		<table class="adminSearchFormTable" align="center" style="border: 1px solid #c59246e0; border-collapse: separate; border-radius: 20px; padding: 0px 15px 15px 15px;">
				<tr>
					<td style="border-bottom: none;">
					
						<table cellpadding="5" cellspacing="0"
							style="border-collapse: collapse;" align="center">
							<c:forEach var="setting" items="${requestScope.memberSearchSettingList}">
							
							<c:if test="${setting.is_active == 'show'}">
						
							<tr class="${setting.search_condition_type}">
                                <th style="border-radius: 10px; height: 55px; border-bottom: none; border-top: none;">
                                
                                    <c:if test="${setting.search_condition_type == 'gender'}">성별
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center; " >
											<label style="display: flex; align-items: center; margin-right: 50px;">
												<input type="checkbox" name="gender" value="남" class="gender" style="zoom:2.0; margin-right: 5px;">남
											</label>
											<label style="display: flex; align-items: center;">
												<input type="checkbox" name="gender" value="여" class="gender" style="zoom:2.0; margin-right: 5px;">여
											</label>
										</td>
										<tr><td style="border-bottom: none;"></td></tr>                                   
                                    </c:if>
                                    
                                    
                                    <c:if test="${setting.search_condition_type == 'age_group'}">연령대
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center;">
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="10대" class="ageRange" style="zoom:2.0; margin-right: 5px;">10대
									</label>
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="20대" class="ageRange" style="zoom:2.0; margin-right: 5px;">20대
									</label>
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="30대" class="ageRange" style="zoom:2.0; margin-right: 5px;">30대
									</label>
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="40대" class="ageRange" style="zoom:2.0; margin-right: 5px;">40대
									</label>
								</td>
								<td style="text-align: center; border-bottom: none; display: flex; align-items: center;">
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="50대" class="ageRange" style="zoom:2.0; margin-right: 5px;">50대
									</label>
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="60대" class="ageRange" style="zoom:2.0; margin-right: 5px;">60대
									</label>
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="70대" class="ageRange" style="zoom:2.0; margin-right: 5px;">70대
									</label>
									<label style="display: flex; align-items: center; margin-right: 30px;">
										<input type="checkbox" name="ageRange" value="80대" class="ageRange" style="zoom:2.0; margin-right: 5px;">80대
									</label>
								</td>
								<tr><td style="border-bottom: none;"></td></tr>  
                                    </c:if>
                                    
                                    <c:if test="${setting.search_condition_type == 'city'}">시/도
                                    	<td colspan="5" style="text-align: center; border-bottom: none; display: flex; align-items: center;"><select name="sido" id="" class="sido"
												onchange="categoryChange(this)">
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
								</select> <select name="sigungu" id="state" class="sigungu">
										<option value="0">군/구 선택</option>
								</select></td>
								<tr><td style="border-bottom: none;"></td></tr>  
                                   </c:if>
                                    
                                    <c:if test="${setting.search_condition_type == 'join_date'}">가입일
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center;">
                                    	<input type="text" name="minDate" id="minDate"readonly="readonly">&nbsp;~&nbsp;
                                    	<input type="text" name="maxDate" id="maxDate" readonly="readonly">
                                    	<tr><td style="border-bottom: none;"></td></tr>  
                                    	</td>
		                                    
                                    </c:if>
                                    
                                    <c:if test="${setting.search_condition_type == 'game_count'}">경기수
										<td style="text-align: center; border-bottom: none; display: flex; align-items: center;"><input type="number" name="minGames_played"
									class="minGames_played" value="0">&nbsp;~&nbsp;<input
									type="number" name="maxGames_played" class="maxGames_played"
									value="0"></td>    
									<tr><td style="border-bottom: none;"></td></tr>                                  
                                    </c:if>
                                    
                                    <c:if test="${setting.search_condition_type == 'win_count'}">승리수
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center;">
                                    	<input type="number" name="minWin" class="minWin"value="0">&nbsp;~&nbsp;
                                    	<input type="number" name="maxWin"class="maxWin" value="0"></td>
                                    	<tr><td style="border-bottom: none;"></td></tr>  
                                    </c:if>
                                    
                                    <c:if test="${setting.search_condition_type == 'draw_count'}">무승부
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center;"><input type="number" name="minDraws" class="minDraws"
									value="0">&nbsp;~&nbsp;<input type="number" name="maxDraws"
									class="maxDraws" value="0"></td>
									<tr><td style="border-bottom: none;"></td></tr>  
                                    </c:if>
                                    
                                    <c:if test="${setting.search_condition_type == 'loss_count'}">패배
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center;"><input type="number" name="minLoss" class="minLoss"
									value="0">&nbsp;~&nbsp;<input type="number" name="maxLoss"
									class="maxLoss" value="0"></td>
									<tr><td style="border-bottom: none;"></td></tr>  
                                    </c:if>
                                    
                                    <c:if test="${setting.search_condition_type == 'goals'}">골
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center;"><input type="number" name="minGoals" class="minGoals"
									value="0">&nbsp;~&nbsp;<input type="number" name="maxGoals"
									class="maxGoals" value="0"></td>
									<tr><td style="border-bottom: none;"></td></tr>  
                                   
                                    </c:if>
                                    	
                                    
                                    <c:if test="${setting.search_condition_type == 'assists'}">어시스트
                                    	<td style="text-align: center; border-bottom: none; display: flex; align-items: center;"><input type="number" name="minAssists"
									class="minAssists" value="0">&nbsp;~&nbsp;<input type="number"
									name="maxAssists" class="maxAssists" value="0"></td>
                                    
                                    </c:if>
                                </th>
							</tr>
							
							
							
							
							
							
							
						
							</c:if>	
						</c:forEach>
						</table>
						<div class="search">
							<select name="searchType1" class="searchType1">
								<option value="all">전체</option>
								<option value="name">이름</option>
								<option value="mid">아이디</option>
								<option value="nickname">별명</option>
								<option value="phone">전화번호</option>
								<option value="email">이메일</option>
							</select>
							<input type="text" name="keyword1" class="keyword1"> 
							<select name="orand" class="orAnd">
								<option value="or">or
								<option value="and">and
							</select>
							<input type="text" name="keyword2" class="keyword2">
						</div>
						<div class="searchBtnDiv">
							<input type="button" value="검색" class="searchBtn" class="searchBtn" onclick="search()" style="width: 100px; height: 40px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer; margin-right: 10px;">
							<input type="button" value="초기화" class="searchAllBtn" onclick="searchAll()" style="width: 100px; height: 40px; background-color: #c59246e0; color: #FFFFFF; border-radius: 10px; border: 1px solid #c59246e0; cursor: pointer;">   
						</div>
					</td>
				</tr>
					
					
	
			</table>
		<input type="hidden" name="sort" class="sort"> <input
			type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">

	</form>














	<div class="adminFormTopContents">
			<span class="fontLightGray" id="adminFormAllCount">Total. ${requestScope.memberListAllCnt}개</span>
			<div class="adminFormRowCntPerPage">
				<select name="rowCntPerPage" class="rowCntPerPage" onChange="search()">
					<option value="10">10개씩 보기
					<option value="15">15개씩 보기
					<option value="20">20개씩 보기
				</select>
			</div>
		</div>
		
	<div class="adminFormContainer">
			<div class="adminListDiv" style="margin-bottom: 20px;">
				<table class="adminListTable" cellpadding="7" align="center"
					style="border-collapse: collapse; margin: 0 auto; margin-top: 10px; width: 1000px;">
					<tr>
<!-- 					<th style="width: 30px;" >번호</th> -->
					
					<c:if test="${param.sort!='m_no asc' and param.sort!='m_no desc' }">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('m_no desc')">번호</th>
					</c:if>

					<c:if test="${param.sort=='m_no desc'}">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('m_no asc')">번호▼</th>
					</c:if>

					<c:if test="${param.sort=='m_no asc' }">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('')">번호▲</th>
					</c:if>
					
					


					<c:if test="${param.sort!='mid asc' and param.sort!='mid desc' }">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('mid desc')">아이디</th>
					</c:if>

					<c:if test="${param.sort=='mid desc'}">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('mid asc')">아이디▼</th>
					</c:if>

					<c:if test="${param.sort=='mid asc' }">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('')">아이디▲</th>
					</c:if>







					<c:if
						test="${param.sort!='m.name asc' and param.sort!='m.name desc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('m.name desc')">이름</th>
					</c:if>

					<c:if test="${param.sort=='m.name desc'}">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('m.name asc')">이름▼</th>
					</c:if>

					<c:if test="${param.sort=='m.name asc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('')">이름▲</th>
					</c:if>


					<c:if
						test="${param.sort!='nickname asc' and param.sort!='nickname desc' }">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('nickname desc')">별명</th>
					</c:if>

					<c:if test="${param.sort=='nickname desc'}">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('nickname asc')">별명▼</th>
					</c:if>

					<c:if test="${param.sort=='nickname asc' }">
						<th width="100px" style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
							onclick="searchWithSort('')">별명▲</th>
					</c:if>









					<c:if
						test="${param.sort!='reg_date asc' and param.sort!='reg_date desc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('reg_date desc')">가입일</th>
					</c:if>

					<c:if test="${param.sort=='reg_date desc'}">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('reg_date asc')">가입일▼</th>
					</c:if>

					<c:if test="${param.sort=='reg_date asc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('')">가입일▲</th>
					</c:if>



					<c:if test="${param.sort!='age asc' and param.sort!='age desc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('age desc')">나이</th>
					</c:if>

					<c:if test="${param.sort=='age desc'}">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('age asc')">나이▼</th>
					</c:if>

					<c:if test="${param.sort=='age asc' }">
						<th width="100px" style="cursor: pointer"
							onclick="searchWithSort('')">나이▲</th>
					</c:if>





				</tr>





				<c:forEach var="admin" items="${requestScope.memberList}"
					varStatus="status">
					<tr style="cursor: pointer"
						onClick="goMemberDetail(${admin.m_no});">
						<td align="center">${requestScope.memberMap.begin_serialNo_asc + status.index}</td>
						<td align="center">${admin.mid}</td>
						<td align="center">${admin.name}</td>
						<td align="center">${admin.nickname}</td>
						<td align="center">${admin.reg_date}</td>
						<td align="center">${admin.age}</td>


					</tr>
				</c:forEach>
			</table>
			<c:if test="${empty requestScope.memberList}">
				<br>
				<center>조건에 맞는 검색 결과가 없습니다.</center>
			</c:if>
		</div>
	</div>

	<div class="adminFormPaging">
			<span class="pagingNos">
				<!-- <span style="cursor: pointer" onClick="pageNoClick(1)">[처음]</span> -->
				<span style="cursor: pointer" onClick="pageNoClick(${requestScope.memberMap.selectPageNo}-1)" class="arrowLeft"><strong>&lt</strong></span>
				<c:forEach var="pageNo" begin="${requestScope.memberMap.begin_pageNo}" end="${requestScope.memberMap.end_pageNo}">
					<c:if test="${requestScope.memberMap.selectPageNo==pageNo}">
			            <p class="activePageNo">${pageNo}</p>
			        </c:if>
					<c:if test="${requestScope.memberMap.selectPageNo!=pageNo}">
						<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">${pageNo}</span>
					</c:if>
				</c:forEach>
				<span style="cursor: pointer" onClick="pageNoClick(${requestScope.memberMap.selectPageNo}+1)" class="arrowRight"><strong>&gt</strong></span>
			</span>
		</div>
<!-- 	<form name="adminMemberDetailForm" action="/adminMemberDetailForm.do" -->
<!-- 		method="post"> -->
<!-- 		<!-- 클릭한 행의 게시판 고유번호가 저장될 히든태그 선언 --> 
<!-- 		<input type="hidden" name="m_no"> <input type="hidden" -->
<!-- 			name="player"> -->

<!-- 	</form> -->
	
	<form name="memberDetailUpDelForm" action="/memberDetailUpDelForm.do"
			method="post">
			<input type="hidden" name="m_no" value="${requestScope.memberDTO.m_no}"> 
			
		</form>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>