<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .member-button {
        border-radius: 5px;
        margin: 5px;
        border: 0;
        width: 300px;
        height: 40px;
        font-weight: 600;
        color: white;
    }
    .delete {
        background-color: rgb(224, 224, 224);
    }
    .submit {
        background-color: rgb(247, 202, 201);
    }
    .memberForm {
        width: 300px;
        margin-top: 5px;
    }
    .pwd-change-button {
        border-radius: 30px;
        margin: 5px;
        border: 0;
        width: 110px;
        height: 20px;
        font-weight: 600;
        color: white;
        background-color: rgb(247, 202, 201);
    }
</style>
</head>
<body>
	<div class="member-info">
        <form action="">
            <b>아이디</b><br>
            <input type="text" name="userId" readonly class="memberForm"><br><br>
            <b>비밀번호</b><br>
            <!--
                <input type="password" name="userPwd"><br><br>
            -->
            <button type="button" class="pwd-change-button">비밀번호 수정</button><br><br>
            <b>이름</b><br>
            <input type="text" name="userName" class="memberForm"><br><br>
            <b>이메일</b><br>
            <input type="email" name="email" class="memberForm"><br><br>
            <b>성별</b><br>
            <input type="radio" name="gender" id="M" value="M"><label for="M">남</label>
            <input type="radio" name="gender" id="W" value="W"><label for="W">여</label>

            <br><br>
            <button type="submit" class="member-button submit">내 정보 수정하기</button><br>
            <button type="button" class="member-button delete">탈퇴하기</button>
        </form>
    </div>
</body>
</html>