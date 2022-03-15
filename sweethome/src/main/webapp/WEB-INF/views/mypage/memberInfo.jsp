<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 관리</title>
<link rel="stylesheet" href="resources/css/mypage.css" />
<style>
	.member-info {
		width: 500px;
		margin: auto;
	}
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
        width: 130px;
        height: 25px;
        color: white;
        background-color: rgb(247, 202, 201);
    }
    .pwd-change {
    	margin-left: 10px;
    }
    .pwd-change td{
    	text-align: right;
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="sweethome-container">
		<div class="sub_nav">
			<jsp:include page="../common/mypageNavi.jsp" />
		</div>
		<div class="mypage">
			<div class="member-info">
		        <form action="">
		            <b>아이디</b><br>
		            <input type="text" name="userId" class="memberForm" readonly><br><br>
		            <b>비밀번호</b><br>
		            <button type="button" class="pwd-change-button" data-toggle="modal" data-target="#staticBackdrop">비밀번호 수정</button><br><br>
		            <b>이름</b><br>
		            <input type="text" name="userName" class="memberForm"><br><br>
		            <b>이메일</b><br>
		            <input type="email" name="email" class="memberForm"><br><br>
		            <b>성별</b><br>
		            <input type="radio" name="gender" id="M" value="M"><label for="M">남</label>
		            &nbsp;
		            <input type="radio" name="gender" id="W" value="W"><label for="W">여</label>
		
		            <br><br>
		            <button type="submit" class="member-button submit">내 정보 수정하기</button><br>
		            <button type="button" class="member-button delete">탈퇴하기</button>
		        </form>
		    </div>
		</div>
		<div class="end"></div>
		
		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">비밀번호 변경</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<br>
		      	<form action="changePwd">
			      	<table class="pwd-change">
			      		<tr>
			      			<td>현재 비밀번호</td>
			      			<td><input type="password" name="prePwd"></td>
			      		</tr>
			      		<tr>
			      			<td>새로운 비밀번호</td>
			      			<td><input type="password" name="newPwd"></td>
			      		</tr>
			      		<tr>
			      			<td>새로운 비밀번호 확인</td>
			      			<td><input type="password" name="newPwdCheck"></td>
			      		</tr>
			      	</table>
		      	</form>
		      	<br>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" style="margin:auto">비밀번호 변경</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>