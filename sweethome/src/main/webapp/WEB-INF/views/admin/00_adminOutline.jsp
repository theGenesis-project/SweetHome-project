<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.admin-container{
		height: 100vh;
		width: 100vw;
	}
	.sub_nav {
	width: 15vw;
	float: left;
	height: auto;
	}
	
	.mypage {
		float: left;
		width: 75vw;
		position: relative;
	}
	
	.end{
		clear: both;
	}
</style>
</head>
<body>
	<div class="admin-container">
		<div class="sub-nav">
			<jsp:include page="adminNavi.jsp"/>
		</div>
		<div class="mypage"> 
		</div>
		<div class="end">
		</div>
	</div>
</body>
</html>