<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양도</title>
<link href="/style/community/communityNoticeBoardFormStyle.css"
	rel="stylesheet">
<script src="/js/community/communityNoticeBoardFormScript.js"></script>




<script>

function checkRedirect() {
    var status = "${requestScope.yangdoDTO.status}";
    var writer = "${requestScope.yangdoDTO.writer}";
    var transferredTo = "${requestScope.yangdoDTO.transferred_to}";
    var currentUser = "<%= request.getSession().getAttribute("m_no") %>";

    if (status !== "양도중" && currentUser !== writer && currentUser !== transferredTo) {
        alert("양도 완료된 글입니다.");
        window.location.href = "/stadiumTransferForm.do";
    }
}
checkRedirect();






function yangdoSincheongForm(yangdo_no, m_no,booking_no){
	alert(yangdo_no)
	alert(booking_no)
	alert(m_no)

	
	
	$.ajax({
		//-------------------------------
		// WAS 로 접속할 주소 설정
		//-------------------------------
		url : "/yangdoSincheongProc.do"
		//-------------------------------
		// WAS 로 접속하는 방법 설정. get 또는 post
		//-------------------------------
		,
		type : "post"

		,
		data: {
            yangdo_no: yangdo_no,
            m_no: m_no,
            booking_no: booking_no
        },

		success : function(json) {
			var result = json["result"];
			if (result == 0) {
				alert("실패.");

			}
			
			else {
				alert("성공.");
				location.href = "/stadiumTransferForm.do";
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
	<div class="communityNoticeBoardFormTitle">
		<img src="/image/SoccerBackground.jpg" class="titleBackgoundImg">
		<p class="titleBackgoundText">양도</p>
	</div>
	
	
		<c:if test="${empty requestScope.yangdoDTO}">
			<script>
				alert("게시판 글이 삭제되었습니다.");
				location.replace('/stadiumTransferForm');
			</script>
		</c:if>
	
		<c:if test="${!empty requestScope.yangdoDTO}">
			<table border="1" bordercolor="gray" align="center" cellpadding="7">
				<caption>[게시판 상세글 보기]</caption>
				<tr>
					<th bgColor="lightgray">작성자</th>
					<td>${ requestScope.yangdoDTO.nickname }</td>
				</tr>
				<tr>
					<th bgColor="lightgray">제 목</th>
					<td>${ requestScope.yangdoDTO.title }</td>
				</tr>
				<tr>
					<th bgColor="lightgray">조회수</th>
					<td>${ requestScope.yangdoDTO.readcount }</td>
				</tr>

				<tr>
					<th bgColor="lightgray">경기장</th>
					<td>${ requestScope.yangdoDTO.yangdo_stadium }</td>
				</tr>
				<tr>
					<th bgColor="lightgray">지역</th>
					<td>${ requestScope.yangdoDTO.yangdo_sido }-${ requestScope.yangdoDTO.yangdo_sigungu }</td>
				</tr>
				<tr>
					<th bgColor="lightgray">날짜/시간</th>
					<td>${ requestScope.yangdoDTO.yangdo_date }/${ requestScope.yangdoDTO.yangdo_time }</td>
				</tr>
					

				<tr>
					<th bgColor="lightgray">등록일</th>
					<td>${ requestScope.yangdoDTO.reg_date }</td>
				</tr>
				<tr>
					<th bgColor="lightgray">내 용</th>
					<td>
						<textarea style="border:none;" name="content" class="content" rows="13" cols="40" maxlength="500" readonly>${ requestScope.yangdoDTO.content }</textarea>
					</td>
				</tr>
				<c:if test="${not empty sessionScope.m_no and requestScope.yangdoDTO.writer ne sessionScope.m_no}">
					<c:if test="${requestScope.yangdoDTO.status ne '양도완료'}">
						<tr>
							<th bgColor="lightgray" >신청</th>
							<td>
								<input type="button" value="신청" onclick="yangdoSincheongForm('${requestScope.yangdoDTO.yangdo_no}', '<%=request.getSession().getAttribute("m_no") %>','${requestScope.yangdoDTO.booking_no}');">
							</td>
						</tr>
					</c:if>
				</c:if>
				<c:if test="${requestScope.yangdoDTO.status eq '양도완료'}">
        			<tr>
            			<th bgColor="lightgray">상태</th>
           				 	<td>양도완료</td>
       				</tr>
    			</c:if>
				
				
			</table>			
			
			<div style="height:5px;"></div>
			
			<center>
				<span style="cursor: pointer;" onclick="location.replace('/stadiumTransferForm.do')">[목록 화면으로]</span>
				<c:if test="${requestScope.yangdoDTO.status ne '양도완료' and requestScope.yangdoDTO.m_no eq sessionScope.m_no}">
   				 <input type="button" value="수정/삭제" onclick="document.yangdoDetailUpdDeleForm.submit();">
				</c:if>
			</center>
			
			<form name="yangdoDetailUpdDeleForm" action="/yangdoDetailUpdDeleForm.do" method="post">
				<input type="hidden" name="yangdo_no" value="${ requestScope.yangdoDTO.yangdo_no }">
				
			</form>
			<form name="yangdoSincheongFormNo" >
				<input type="hidden" name="yangdo_no" value="${ requestScope.yangdoDTO.yangdo_no }">
				<input type="hidden" name="m_no" value="<%= request.getSession().getAttribute("m_no") %>">
			</form>
			
		</c:if>
		
	</body>
</html>