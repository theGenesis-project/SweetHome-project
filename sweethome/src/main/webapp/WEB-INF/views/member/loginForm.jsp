<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
    .container {
        width: 570px;
        height: 456px;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 100px;
        border: 1px solid lightgray;
        text-align: center;
    }
    .login-api {
        height: 40%;
    }
    .loginform {
        height: 60%;
    }
    .login-input {
        width: 370px;
        height: 40px;
        margin: 5px;
    }
    .login-button {
        background-color: rgb(247, 202, 201);
        border: 0;
        height: 45px;
        width: 375px;
        border-radius: 5px;
    }

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<c:if test="${ not empty errorMsg }">
		<script>
			alert("${errorMsg}");
		</script>
		<c:remove var="errorMsg" scope="session" />
	</c:if>
	
	<div class="container">
        <form action="login.me" method="post">
            <div class="login-api">

            </div>
            <div class="loginform">
                <h3>로그인</h3>
                <input type="text" class="login-input" placeholder="Enter ID" id="userId" name="userId" required> 
                <br> 
                <input type="password" class="login-input" placeholder="Enter Password" id="userPwd" name="userPwd" required>
                <br>
                <button type="submit" class="login-input login-button">로그인</button>
            </div>
        </form>
    </div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>