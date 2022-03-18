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
	
	<p>${ h2.traffic }</p>
	
	<jsp:include page="common/footer.jsp" />
</body>
</html>