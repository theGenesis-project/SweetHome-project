<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    
    <title>Document</title>
    <style>
      
        #nav{
            width: 1500px;
            height: 50px;
            background-color: rgb(240, 240, 240);
            margin: auto;
        }
        #nav>ul{
            list-style-type: none;
           
        }
        #nav>ul>li{
            float: right;
            margin-top: 12px;

        }
        #nav>ul>li>a{
            color: rgb(99, 99, 99);  
            text-decoration: none;
            margin: 25px;
           
            font-weight: 550;
        }
        #nav>ul>li>a:hover{
            color: rgb(247, 202, 201);
        }

    </style>
</head>
<body>
	<div id="nav">
	        <ul>
	            <li><a href="interiorBestList.in">베스트</a></li>
	            <li><a href="interiorList.in?intCate=1&inpage=1">카테고리</a></li>
	        </ul>
	
	</div>
	

</body>
</html>