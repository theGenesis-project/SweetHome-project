<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 작성</title>
<link rel="stylesheet" href="resources/css/ask.css" />
<link rel="stylesheet" href="resources/css/mypage.css" />
<script type="text/javascript" src="resources/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
    <div class="sweethome-container">
    	<div class="ask-container">
			<h1 class="title">문의 작성하기</h1>
			<br> 
	
			<form class="enroll-form" action="insert.ask" method="post" enctype="multipart/form-data">
			<c:choose>
				<c:when test="${ empty loginUser }">
					<script>
						var result = confirm("로그인 후 이용 가능한 페이지입니다. 로그인 하시겠습니까?");
						
						if(result) {
							location.href="loginform.me";
						} else {
							history.back();
						}
					</script>				
				</c:when>
				<c:otherwise>
					<!-- 로그인한 회원 정보 넘기기 -->
					<input type="text" name="userNo" value="${ loginUser.userNo }" hidden>
				</c:otherwise>
			</c:choose>
			
			<table class="Qform">
				<tr>
					<th>제목</th>
					<td><input type="text" name="askTitle" style="width : 99%;" required></td>
				</tr>
				<tr>
					<th>사진 첨부</th>
					<td class="Qanswer">
						<p class="pic-disc">
							* JPEG, PNG형식의 5M 이하의 파일만 첨부 가능합니다. <br> 
							* 개인정보가 포함된 이미지 등록은 자제하여 주시기 바랍니다. <br>
						</p> <input type="file" name="upfile">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td class="Qcontent">
						<textarea name="askContent" id="askContent" style="height:500px; width: 99%"></textarea>
					</td>
				</tr>
			</table>
			<button type="submit" class="house-button btn-pink" style="display: block; margin: 10px auto 10px auto;" onclick=" return save();">등록하기 </button>
			</form>
		</div>
    </div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		 oAppRef: oEditors,
		 elPlaceHolder: "askContent",
		 sSkinURI: "resources/smartEditor/SmartEditor2Skin.html",
		 htParams : {
		      // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		      bUseToolbar : true,             
		      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		      bUseVerticalResizer : true,     
		      // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		      bUseModeChanger : true
		  }, 
		 fCreator: "createSEditor2"
		});
		
		function save(){
			// 에디터의 내용이 textarea에 적용된다.
			oEditors.getById["askContent"].exec("UPDATE_CONTENTS_FIELD", []);  
			// html코드를 뺀 작성내용
			var content = document.getElementById("askContent").value.replace(/(<([^>]+)>)/ig,"");
			if(content == "") {
				alert("내용을 작성하세요");
				return false;
			}
		    
			return true;
		}
	</script>
</body>
</html>

