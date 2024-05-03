<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>newCommunityMarketplaceForm</title>
<link href="/style/newCommunityMarketplaceFormStyle.css" rel="stylesheet">

<script src="/js/newCommunityMarketplaceFormScript.js"></script>
 
<script>
	function checkMarketplaceBoardRegForm(){
		
		var formObj = $("[name='newCommunityMarketplaceForm']");
		var serialize = formObj.serialize();
		
		
		$.ajax(
				{ 
					
					url    : "/MarketplaceRegProc.do"
						
					,type  : "post"
					
					,data  : serialize
					
					,success : function(json){
						var result = json["result"];
						if(result==1){
							alert("장터등록 성공 입니다.");
							location.replace("/communityMarketplaceBoardForm.do")
						}
						else{
							alert("장터등록 실패입니다!");
						}
					}
					
					,error : function(){
						alert("장터등록 실패! 관리자에게 문의 바랍니다.");
					}
				}
			);
		
	}
	
</script>


</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="newCommunityMarketplaceFormTitle">
    	<img src="/image/CommunityTitleBackgroundImage.jpg" class="titleBackgoundImg">
    	<p class="titleBackgoundText">장터 등록</p>
    </div>
    <div class="newCommunityMarketplaceFormContainer">
		<form name="newCommunityMarketplaceForm">
			<table class="newCommunityMarketplaceFormRegTable" border="1" bordercolor="black">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="subject" class="subject" size="40" maxlength="30">
					</td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>
						<input type="text" name="writer" class="writer" size="40" maxlength="15">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" class="content" rows="20" cols="40" maxlength="500" style="resize:none"></textarea>
					</td>
				</tr>
				<tr>
					<th>파일 첨부</th>
					<td>
						<input type="file" name="imageFileAdd" class="imageFileAdd" accept="image/*" multiple >						
										
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd" class="pwd" size="40" maxlength="4" >
					</td>
				</tr>
			</table>
			<div class="newCommunityMarketplaceFormBtnDiv">
				<div class="resetBtnDiv">
					<input type="reset" class="boardResetBtn"value="다시 작성">
				</div>
				<div class="boardRegAndMoveList"> 
					<input type="button" class="boardRegBtn" value="저장" onClick="checkMarketplaceBoardRegForm();">
					<input type="button" class="moveListBtn" value="목록" onClick="location.replace('/communityMarketplaceBoardForm.do')">
				</div>
			</div>
		</form>
	</div>
</body>
</html>