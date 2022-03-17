<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .content{
            /*border: 1px solid rgb(247, 202 , 201);*/
            width: 1200px;
            margin: auto;
        }

        .innerOuter{
            border: 2px solid rgb(247, 202 , 201);
            width:600px;
            height:280px;
            margin:auto;
        }

        .inputForm{
            border: 1px solid rgb(247, 202 , 201);
            width : 400px;
            height: 50px;
            margin: auto;  
            font-size: 15px;
        }

        .findForm{
            padding-left: 95px;
        }

        .btn1 {  
            border: none;
            width: 180px;
            height:40px;
            background-color: rgb(247, 202 , 201) ; 
            font-weight: bold;  
        }

        .findId{
            padding-left: 300px;
        }

        .complete{
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- 메뉴바 -->
    <jsp:include page="../common/header.jsp" />

    <div class="content">
        <br>
        <div class="findId"><h3>아이디 찾기</h3></div>
        <div class="innerOuter">
                <br>
                <div class="complete">
                    <h3>이름 님의 정보와 일치하는 아이디입니다. </h3>
                    <br>
                    아이디<br>
                    가입날짜<br><br><Br>
                    <button class="btn1">로그인하러 가기</button>
                    <button class="btn1">비밀번호 찾기</button>
                </div>     
        </div>
        <br><br>
    </div>

     <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>