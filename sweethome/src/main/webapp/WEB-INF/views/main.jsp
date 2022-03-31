<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스위트홈</title>
</head>
<body>
	<jsp:include page="common/header.jsp" />
	
	<a href="chat">채팅</a>
	
	<br><br>
	
	<a href="houseInsert">하우스 등록 테스트</a>

	<br><br>
	
	<h4>하우스 삭제 테스트</h4>

	삭제할 하우스 번호 입력<br>
	<input type="text" id="house-no"><button onclick="delHouse();">삭제</button>
	
	<script>
		function delHouse() {

			var hno = document.getElementById("house-no").value;
			var result = confirm("해당 하우스를 삭제하시겠습니까?");
			
			if(result) {
				location.href = "deleteHouse.ho?hno=" + hno;
			}
			else {
				hno = "";
			}
		}
	</script>

	<br><br>

	<h4>하우스 수정 테스트</h4>

	수정할 하우스 번호 입력<br>
	<input type="text" id="house-no-fix"><button onclick="fixHouse();">수정</button>
	
	<script>
		function fixHouse() {

			var hno = document.getElementById("house-no-fix").value;
			var result = confirm("해당 하우스를 수정하시겠습니까?");
			
			if(result) {
				location.href = "updateHouseForm.ho?hno=" + hno;
			}
			else {
				hno = "";
			}
		}
	</script>
	
	<jsp:include page="common/footer.jsp" />
</body>
</html>