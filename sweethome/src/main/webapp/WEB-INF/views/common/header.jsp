<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here1</title>
 <style>
        div{
            box-sizing: border-box;         
        }
        #header{
            width: 1500px;
            height: 150px;
            margin: auto;
            display: flex;       
        }    
        #header_left{
            width:20%;
            position: relative;
        }
        #header_left>img{
            width: 180px;
            height: 100px;
            position: absolute;
            margin: auto;
            top: 30px;
        }
        #header_right{
            width: 80%;
            height: 100%;
        }
        
        #header_rightUp{
            height: 60%;
        }
        #header_rightDown{
            height: 40%;
        }

        #header_rightDown>ul{
            list-style-type: none;
            font-size: 28px;
            font-weight: bold;
            margin: auto;
        }
        #header_rightDown>ul>li{
            float: right;
            margin: 10px;          
        }
        #header_rightDown>ul>li>a{
        	text-decoration: none;
            color: rgb(65, 65, 65);
        }
        #header_rightDown>ul>li>a:hover{
            color: rgb(247, 202, 201);
            cursor: pointer;
        }

    </style>
</head>
<body>
	<div id="header">
        <div id="header_left">
            <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FewshBz%2Fbtru1asrG4F%2FD4bgCQcDjVHeVEm5ii1KX0%2Fimg.png" alt="logo">
        </div>
        <div id="header_right">
            <div id="header_rightUp">
              
            </div>
            <div id="header_rightDown">
                <ul>
                <c:choose>
                	<c:when test="${ empty loginUser }">
                    	<li><a href="loginform.me">로그인</a>/<a href="">회원가입</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="">마이페이지</a></li>
                	</c:otherwise>
                </c:choose>
                    <li><a href="">커뮤니티</a></li>
                    <li><a href="">인테리어</a></li>
                    <li><a href="">하우스</a></li>
                </ul>

            </div>
        </div>

    </div>
</body>
</html>