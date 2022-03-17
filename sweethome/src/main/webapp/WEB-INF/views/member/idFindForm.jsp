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
            width: 410px;
            height:50px;
            background-color: rgb(247, 202 , 201) ; 
            font-weight: bold;  
        }

        .findId{
            padding-left: 300px;
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
                <br><br>
                <div class="findForm">
                    <input type="text" placeholder="아이디" class="inputForm"> <br>
                    <br>
                    <input type="text" placeholder="회원가입시 사용한 이메일을 입력해주세요" class="inputForm">
                    <br><br>
                    <button class="btn1">아이디 찾기</button>
                </div>     
        </div>
        <br><br>
    </div>

     <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>