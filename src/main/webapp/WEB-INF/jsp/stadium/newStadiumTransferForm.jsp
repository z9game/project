<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewStadiumTransferForm</title>
<link href="/style/newStadiumTransferFormStyle.css" rel="stylesheet">
<script src="/js/newStadiumTransferFormScript.js"></script>
<script>

function loadDate() {
    var stadiumId = $("select[name='MyStadium']").val();
    var m_no = $("input[name='m_no']").val(); // m_no의 값을 가져옵니다
    
    // 확인을 위해 alert으로 m_no 값 출력
   // alert("m_no 값: " + m_no);

    if (stadiumId === "선택") {
        $("select[name='MyDate']").html('<option value="선택">날짜</option>');
        return;
    }

    $.ajax({
        url: '/myStadiumRentDate.do',
        method: 'POST',
        data: {
            stadium_no: stadiumId,
            m_no: m_no // 데이터 객체에 m_no 추가
        },
        success: function(json) {
            var RentDate = json; // 시간 범위를 JSON으로 받음
            
            var dateOptions = '<option value="선택">날짜</option>';
            
            for (var i = 0; i < RentDate.length; i++) {
            	dateOptions += '<option value="' + RentDate[i].booking_date + '">' + RentDate[i].booking_date + '</option>';
            }
            
            $("select[name='MyDate']").html(dateOptions); // 시간 범위를 select 요소에 추가
        },

        
        error: function(xhr, status, error) {
            console.error("에러 발생: " + error);
        }
    });
}



function loadTimeRanges() {
    var bookingDate = $("select[name='MyDate']").val();
    var stadiumId = $("select[name='MyStadium']").val();
    var m_no = $("input[name='m_no']").val(); // m_no의 값을 가져옵니다
    
    if (bookingDate === "선택") {
        $("select[name='MyTimeRange']").html('<option value="선택">시간</option>');
        return;
    }

    // 정규식을 사용하여 날짜 부분 추출
    var Date = bookingDate.replace(/^([0-9]{4}-[0-9]{2}-[0-9]{2})((\s?).*)$/, "$1");
    alert(Date); 

    $.ajax({
        url: '/myStadiumRentTime.do',
        method: 'POST',
        data: {
            stadium_no: stadiumId,
            booking_date: Date, // 추출된 날짜를 전송
            m_no: m_no
        },
        success: function(json) {
            var timeRanges = json;
            var timeOptions = '<option value="선택">시간</option>';
            for (var i = 0; i < timeRanges.length; i++) {
                timeOptions += '<option value="' + timeRanges[i].time_slot + '">' + timeRanges[i].time_range + '</option>';
            }
            $("select[name='MyTimeRange']").html(timeOptions);
        },
        error: function(xhr, status, error) {
            console.error("에러 발생: " + error);
        }
    });
}










function TransferForm(){
	
	
	
	
	
	var formObj = $("[name='newStadiumTransferForm']");
	var subjectObj = formObj.find(".title");
	var contentObj = formObj.find(".content");
	
	
	alert(formObj.serialize())
	
	
	
	
	
	var sessionPwd = "<%= session.getAttribute("password") %>";
	
	if(new RegExp(/^.{2,100}$/).test(subjectObj.val())==false){
		alert("제목은 2~100자 한글입니다.");
		subjectObj.val("");
		return;
	}
	
	if (contentObj.val().trim().length==0||contentObj.val().trim().length>1000){
		alert("내용은 1~1000자 입력해야 합니다.");
		contentObj.val("");
		return;
	}
	
    function checkPwd() {
    	var pwdInsert = prompt("계정 비밀번호를 입력해주세요.");
		
		if (pwdInsert == null) { 
	        return;
	    }
		
        if (sessionPwd != pwdInsert) {
        	
            alert("계정 비밀번호를 정확히 입력해주세요.");
            
            checkQnABoardRegForm();
            
        } else {
            if(confirm("작성하시겠습니까?") == true){
            	$.ajax({
        			
    				url:"/stadiumTransferProc.do",
    					
    				type:"post",
    					
    				data:formObj.serialize(),
    					
    				success:function(json){
    					var result = json["result"];
    					
    					if(result == 1){
    						alert("작성 성공");
    						location.href = '/stadiumTransferForm.do';
    					} else {
    						alert("작성 실패");
    					}
    				},
    				
    				error:function(){"작성 실패"}
    			})
            }
        }
	}

    checkPwd();
}








</script>







</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="newStadiumTransferFormTitle">
    	<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">경기장 양도 등록</p>
    </div>
    
    
    
    
    
    
    <div class="newStadiumTransferFormContainer">
		<form name="newStadiumTransferForm">
			<table class="newStadiumTransferFormRegTable" border="1" bordercolor="black">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title" class="title" size="40" maxlength="30">
					</td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>
						<input type="text" name="writer" class="writer" size="40" maxlength="100" value="<%= session.getAttribute("nickname") %>" style="border: 0;" readonly>
			
					</td>

			<tr>
				<th bgColor="lightgray">경기장</th>
				<td>
				    <select name="MyStadium" class="MyStadium" onchange="loadDate()">
				        <option value="선택" >경기장선택</option>
				        <c:forEach var="myStadium" items="${requestScope.myStadiumList}" varStatus="status" >
				        	<option value="${myStadium.stadium_no}">${myStadium.stadium_name}</option>
				        </c:forEach>
				       
				    </select>
				    <select name="MyDate" class="MyDate"onchange="loadTimeRanges()">
				        <option value="선택">날짜</option>
				       
				    </select>
				    <select name="MyTimeRange" class="MyTimeRange">
				        <option value="선택">시간</option>
				       
				    </select>
				</td>

			</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" class="content" rows="20" cols="40" maxlength="500" style="resize:none"></textarea>
					</td>
				</tr>

			</table>
			<div class="newStadiumTransferFormBtnDiv">
				<div class="resetBtnDiv">
					<input type="reset" class="boardResetBtn"value="다시 작성">
				</div>
				<div class="boardRegAndMoveList">
					<input type="button" class="boardRegBtn" value="저장" onClick="TransferForm();">
					<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/stadiumTransferForm.do')">
				</div>
			</div>
			<input type="hidden" name="m_no" value="<%= request.getSession().getAttribute("m_no") %>">
		</form>
	</div>
</body>
</html>