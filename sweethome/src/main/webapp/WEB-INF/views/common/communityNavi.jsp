<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
        div{
            border: red 1px solid;
        }
        #nav{
            width: 1200px;
            height: 50px;
            background-color: rgb(240, 240, 240);
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
            <li><a href="">메이트찾기</a></li>
            <li><a href="">중고거래</a></li>
            <li><a href="">정보</a></li>
            <li><a href="">공지사항</a></li>
        </ul>
    </div>
	

</body>
</html>