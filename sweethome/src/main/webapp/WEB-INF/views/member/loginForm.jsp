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
            border: 1px solid rgb(247, 202 , 201);
            width: 1200px;
            margin: auto;
        }

        .innerOuter{
            border: 1px solid rgb(247, 202 , 201);
            width:600px;
            height:550px;
            margin:auto;
        }

        .Login{ /*로그인 제목*/
            font-size: large;
            font-weight: bolder;
            text-align: center;
        }

        .sLogin{ /*간편로그인 버튼공간*/
            width: 300px;
            height: 100px;
            margin: auto;
            border: 1px solid rgb(247, 202 , 201);
        }
        .bLogin{
            text-align: center;
        }
        .inputForm{
            border: 1px solid rgb(247, 202 , 201);
            width : 400px;
            height: 50px;
            margin: auto;  
            font-size: 15px;
        }

        .btn1 {  /*이메일인증버튼*/
            border: none;
            width: 410px;
            height:50px;
            background-color: rgb(247, 202 , 201) ;   
        }

        .findLogin{
            text-align: center;
        }

        a{
            text-decoration: none;
        }
       
    </style>
</head>
<body>
    <!-- 메뉴바 -->
    <jsp:include page="../common/header.jsp" />
    
    <c:if test="${ not empty errorMsg }">
		<script>
			alert("${errorMsg}");
		</script>
		<c:remove var="errorMsg" scope="session" />
	</c:if>

    <div class="content">
        <div class="innerOuter">
            <div class="simpleLogin">
                <br><br>
                <div class="Login">SNS 간편 로그인</div>
                <br>
                <div class="sLogin"></div>
            </div>
            <br><br><br>
            <form action="login.me" method="post">
	            <div class="basicLogin">
	                <div class="Login">로그인</div><br>
	                <div class="bLogin">
	                    <input type="text" placeholder="아이디" class="inputForm" id="userId" name="userId"> <br>
	                    <br>
	                    <input type="password" placeholder="비밀번호" class="inputForm" id="userPwd" name="userPwd">
	                    <br><br>
	                    <button type="submit" class="btn1">로그인</button>
	                </div>
	            </div>
            </form>
        </div>
        <br>
        <div class="findLogin">
            <a href="">아이디 찾기 </a>  
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="">비밀번호 찾기</a>
        </div>
        <br>
    </div>

     <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>