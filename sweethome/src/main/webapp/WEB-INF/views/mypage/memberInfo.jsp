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
        margin-bottom: 10px;
    }
    .mypage-button {
        border-radius: 5px;
        margin: 5px;
        border: 0;
        width: 130px;
        height: 30px;
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
		        <form action="update.me" id="updateForm">
		        <input type="hidden" name="userNo" value="${ loginUser.userNo }">
		        <c:if test="${ loginUser.userType eq 'O' }">
		        	<b>사업자등록번호</b><br>
					<p>${ loginUser.ownerNo }</p>
		            <!-- <input type="text" name="ownerNo" class="memberForm" value="${ loginUser.ownerNo }" readonly><br><br> -->
		        </c:if>	
		            <b>아이디</b><br>
		            <input type="hidden" name="userId" value="${ loginUser.userId }">
		            <p>${ loginUser.userId }</p>
		            <b>비밀번호</b><br>
		            <button type="button" class="mypage-button" data-toggle="modal" data-target="#staticBackdrop">비밀번호 수정</button><br><br>
		            <b>이름</b><br>
		            <input type="text" name="userName" class="memberForm" value="${ loginUser.userName }"><br><br>
		            <b>성별</b>
		            <c:choose>
		            	<c:when test="${ loginUser.gender eq 'M' }">
			            <span>&nbsp;남성👦</span>
			            </c:when>
			            <c:otherwise>
			            <span>&nbsp;여성👧</span>
			            </c:otherwise>
		            </c:choose>
		            <br><br>
		            <b>이메일</b><br>
		            <input type="email" name="email" class="memberForm" value="${ loginUser.email }">
		            <button type="button" class="mypage-button" onclick="sendEmail()" style="display:none;">이메일 인증✉️</button>
		            <div class="cert-num-input" style="display:none;">
		            	<b>인증번호 입력 </b><input type="text" name="certNum" style="width: 195px">
		            	<button type="button" class="mypage-button" onclick="emailCheck()">인증번호 확인</button>
		            	<div id="checkResult" style="font-size:0.7em;"></div>
		            </div>
		            <br><br>
		            <b>휴대전화</b><br>
		            <input type="text" name="phone" class="memberForm" value="${ loginUser.phone }"><br><br>

		            <button type="submit" class="member-button submit" onclick="">내 정보 수정하기</button><br>
		            <button type="button" class="member-button delete">탈퇴하기</button>
		        </form>
		    </div>
		</div>
		<div class="end"></div>
		
		<script>
			$(function(){
				const $email = $('input[name=email]');
				var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
				// 새로운 이메일 등록 시 이메일 인증버튼 활성화 && submit버튼 비활성화
				$email.keyup(function(){
					if($email.val() != '${ loginUser.email }' && $email.val().match(regExp) != null) {
						$('#updateForm :submit').attr({'onclick': 'return notCertified();'});
						$('.mypage-button').show();
					}
				})
			})
		
			// 이메일 인증 안했을 시 나타나는 메시지
			function notCertified() {
				alert("이메일을 인증해주세요");
				return false;
			}
			
			// 인증번호 전송 ajax
			function sendEmail() {
				$("#checkResult").text("");
				$.ajax({
					url: "sendEmail.me",
					type: 'post',
					data: {email: $('input[name=email]').val()},
					success: function(result){
						if(result > 0){
							timer = setInterval("validateTimer()", 1000);
							$('.cert-num-input').show();
						} else {
							alert("메일 전송 실패! 다시 시도해주세요");
						}
					}, error: function(){
						alert("메일 전송 실패! 다시 시도해주세요");
					}
				})
			}
			
			// 인증번호 유효기간을 위한 변수
			var time = 360; // 기준시간 : 6분
			var min = ""; // 분
			var sec = ""; // 초
			
			// 인증번호 유효기간 timer
			function validateTimer() {
				
				min = parseInt(time/60);
				sec = time%60;
				
				$("#checkResult").css("color", "black").text("인증 유효시간 : " + min + "분" + sec + "초");
				time--;
				
				if(time < 0) {
					clearInterval(timer);
					$("#checkResult").css("color", "red").text("인증번호 유효기간이 지났습니다. 다시 시도해주세요.");
					time = 360;
				}
			}
			
			// 인증번호 확인 ajax
			function emailCheck() {
				$.ajax({
					url:"emailCheck.me",
					data: {certNum: $('input[name=certNum]').val()},
					success: function(result) {
						if(result = true) { // 사용 가능
							alert("이메일 인증 완료! 사용 가능한 이메일입니다.");
							$("#updateForm :submit").attr("onclick", null);
							$('.cert-num-input').hide();
						} else { // 사용 불가능
							$("#checkResult").css("color", "red").text("인증번호가 일치하지 않습니다. 다시 시도해주세요.");
						}
					}, error: function() {
						alert("메일 인증 실패! 다시 시도해주세요");
					}
				})
			}
		</script>
		
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
		      	<form action="changePwd.me" id="pwd-change-form">
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
			      			<td colspan="2"><div id="pwdVali" style="font-size:0.7em;"></div></td>
			      		</tr>
			      		<tr>
			      			<td>새로운 비밀번호 확인</td>
			      			<td><input type="password" name="newPwdCheck"></td>
			      		</tr>
			      		<tr>
			      			<td colspan="2"><div id="checkPwd" style="font-size:0.7em;"></div></td>
			      		</tr>
			      	</table>
		      	</form>
		      	<br>
		      </div>
		      <div class="modal-footer">
		        <button type="submit" form="pwd-change-form" class="btn btn-secondary" style="margin:auto">비밀번호 변경</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	
	<script>
		var $newPwd = $('input[name=newPwd]');
		var $pwdCheck = $('input[name=newPwdCheck]');
	
		// 비밀번호 정규표현식 확인
		$newPwd.keyup(function(){
			if($newPwd.val().length >= 8) {
				var regExp = // 정규화 방침 물어보기;
			}
		})
		
		// 비밀번호 일치 여부 확인
		$pwdCheck.keyup(function(){
			if($newPwd.val() === $pwdCheck.val()) {				
				$('#checkPwd').css('color', 'green').text('비밀번호가 일치합니다.');
			} else {
				$('#checkPwd').css('color', 'red').text('비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
			}
		})
	</script>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>