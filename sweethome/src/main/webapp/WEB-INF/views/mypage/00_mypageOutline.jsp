<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/mypage.css" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="sweethome-container">
		<div class="sub-nav">
			<jsp:include page="../common/mypageNavi.jsp"/>
		</div>
		<div class="mypage"> 
			<div class="inner-nav">
				<div class="inner-nav-area">
					<div class="inner-nav1 inner-nav-content">	
					</div>
					<div class="inner-nav2 inner-nav-content">
					</div>
					<div class="end"></div>
				</div>
			</div>
			<div class="inner-body">이너바디</div>
		</div>
		<div class="end">
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>