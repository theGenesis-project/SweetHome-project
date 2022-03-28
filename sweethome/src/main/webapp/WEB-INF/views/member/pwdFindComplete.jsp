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

		.btn2 {  
            border: none;
            width: 410px;
            height:50px;
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
        <div class="findId"><h3>비밀번호 찾기</h3></div>
        <div class="innerOuter">
                <br>
                <c:choose> 
                	<c:when test="${not empty email}"> 
		                <div class="complete">
		                	<br>
		                    <h3>입력하신 이메일로 임시 비밀번호를 발송했습니다. </h3>
		                    <br>				                 				    
		                    <button class="btn2" onclick="location.href='loginform.me'">로그인하러 가기</button>
		                </div> 
	                </c:when>
	                <c:otherwise>
		                <div class="complete">
		                		<br><br><br>
			                    <h3>일치하는 정보가 없습니다. </h3>
			                    <br>
			                    <button class="btn2" onclick="location.href='pwdFind.me'">뒤로가기</button>  
			            </div> 
	                </c:otherwise>
                </c:choose>    
        </div>
        <br><br>
    </div>

     <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>