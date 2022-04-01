<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
	body{
		margin: 0;
	}
	.menubar {
		width: 230px;
		margin: 0;
	}
	.menubar>ul {
	        list-style-type: none;
	        padding: 0px;
	        margin: 0px;
	        width: 230px;
	        background: rgb(247, 202, 201);
	        height: 100vh;
	}
	
	.menubar li div {
	    padding: 10px;
	    color: white;
	    font-weight: bold;
	}
	
	.menubar li div:hover {
	    background: #333;
	    color: #fff;
	}
	    
	.menubar li div.home>img {
	    width: 200px;
	    margin-bottom: 5px;
	}
	
	#manage{
	    list-style: none;
	    margin: 0px;
	    padding: 0px;
	}
</style>
</head>
<body>
	<div class="menubar">
		<ul id="manage">
			<li><div class="home" onclick="location.href='#'" style="pointer-events:none;"><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FewshBz%2Fbtru1asrG4F%2FD4bgCQcDjVHeVEm5ii1KX0%2Fimg.png" alt="스위트홈"></div></li>
			<li>
                <div onclick="location.href='memberList.me?mpage=1'">회원관리</div>
            </li>
			<li>
				<div onclick="location.href=''">하우스관리</div>
			</li>
			<li>
				<div onclick="location.href=''">신고관리</div>
			</li>
			<li>
				<div onclick="location.href=''">1:1문의 관리</div>
			</li> 
			<li>
				<div onclick="location.href=''">인테리어 판매 관리</div>
			</li>
			<li>
				<div onclick="location.href=''">매출 통계</div>
			</li>
			<li><div onclick="location.href='logout.me'">로그아웃</div></li>
		</ul>
	</div>
</body>
</html>