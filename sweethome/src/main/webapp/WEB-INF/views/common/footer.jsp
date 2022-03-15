<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
       div{
           box-sizing: border-box;
       }
        #footer{
            width: 1500px;
            height: 180px;
            margin: auto;
        }
        #footerUp{
            display: flex;
        }
        #footerUp1>img{
            width: 160px;
            height: 80px;
        }
        #footerUp2{
            width: 600px;
        }
        #footerUp2>ul li{
            float: left;
            list-style: none;
            padding-top: 13px;    
        }
        #footerUp2>ul>li{
            margin: 5px;
        }
        #footerUp2>ul>li a{
            text-decoration: none;
            color: grey;
        }
        #footerDown{
            margin-top: 9px;
            color: grey;
        }
    </style>
</head>
<body>
<hr>
 <div id="footer">
        <div id="footerUp">
            <div id="footerUp1">
                <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FewshBz%2Fbtru1asrG4F%2FD4bgCQcDjVHeVEm5ii1KX0%2Fimg.png" alt="logo">
            </div>
            <div id="footerUp2">
                <ul>
                    <li><a href="">개인정보 처리방침</a></li>
                    <li><a href="askForm">1:1 문의</a></li>
                    <c:if test="${ not empty loginUser }">
                    	<li><a class="logout-button" href="logout.me">로그아웃</a></li>
					</c:if>
                </ul>
            </div>
        </div>
        <div id="footerDown">
            상호명: THE GENESIS  대표자명: 천지창조  사업자등록번호: 851-87-00622<br>
            주소: 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F  대표번호: 1544-9970<br>
            문의: help@sweethome.co.kr 임대/제휴: contact@sweethome.co.kr 인테리어: interior@sweethome.co.kr<br>
            COPYRIGHT THE GENESIS ALL RIGHTS RESERVED<br>
        </div>

 </div>
</body>
</html>