<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
    <style>
        .content {
            /*border: 1px solid rgb(247, 202 , 201);*/
            width:1200px;
            margin:auto;         
        }
        .innerOuter {
            border: 2px solid rgb(247, 202 , 201);
            width:700px;
            margin:auto;
            background-color:white;    
        }

        .form-checkbox{
            border: 1px solid rgb(247, 202 , 201);
            width : 350px;
            height: 280px;
            margin: auto;
            font-weight: border;
        }

        label{
           text-align: left;
           padding-left: 100px;
           font-weight: bolder;
          
        }

        .fcontrol{
            width : 500px;
            height: 50px;
            margin-left: 100px;
            border: 1px solid rgb(247, 202 , 201);
           
        }

        .fcontrolemail{
            width : 400px;
            height: 50px;
            margin-left: 100px;
            border: 1px solid rgb(247, 202 , 201);
            border-radius: 3px; 
        }
        
        .fcontrolname{
            width : 230px;
            height: 50px;
            margin-left: 100px;
            border: 1px solid rgb(247, 202 , 201);
            border-radius: 3px;
        }

        .btns1 {  /*이메일인증버튼*/
            border: none;
            width: 89px;
            height:50px;
            background-color: rgb(247, 202 , 201) ;
            
        }
        .btns2 {  /*회원가입버튼*/
            border: none;
            background-color: rgb(247, 202 , 201) ;
            width : 500px;
            height: 50px;
        }
        
        .join {
       		margin-left: 245px;
        }
        
        .result{
        	margin-left: 100px;
        }
        
        .cert-num-input{
        	margin-left: 100px;
        }
        .btns3{ /*이메일 인증확인 버튼*/
        	border: none;
            width: 120px;
            height:30px;
            background-color: rgb(247, 202 , 201) ;
        }
    </style>
</head>
<body>
    <!-- 메뉴바 -->
    <jsp:include page="../common/header.jsp" />

    <br><br><br><br>
    
    <div class="content">
    	<div class="join"><h3>회원가입</h3></div>
        <div class="innerOuter">
            <br>
            <div style="margin-left:190px; font-weight: bolder;">약관동의</div>
            
            <div class="form-checkbox">
                <br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="checkbox" id="chkAll">&nbsp; 전체동의
                <hr style="width:300px; background-color: rgb(247, 202 , 201);">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="checkbox" name="chk"> &nbsp; (필수)&nbsp; 만 14세 이상입니다.
                <br><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="checkbox" name="chk"> &nbsp; (필수)&nbsp; 이용약관
                <br><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="checkbox" name="chk"> &nbsp; (필수)&nbsp; 개인정보수집 및 이용 동의
                <br><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="checkbox" name="chk"> &nbsp; (선택)&nbsp; 메일 및 SMS 수신
            </div>

            <br><br>
            <form action="insert.me" method="post" id="enrollForm">
                <input type="hidden" name="userType" value="M">
                
                <div class="form-group">

                    <label for="userId">아이디  </label><br>
                    <input type="text" class="fcontrol" id="userId" placeholder="영어, 숫자 포함  5-10자리" name="userId" required>
					<br>
					<div id="checkResult" class="result" style="font-size:0.9em; display:none"></div>
					<br>
                    <label for="userPwd">비밀번호  </label><br>
                    <input type="password" class="fcontrol" id="userPwd" placeholder="영어,숫자,특수문자 포함  8-20자리" name="userPwd" required> <br>
                    <br>
                    <div id="pwdResult" class="result valiPwd" style="font-size:0.9em; display:none"></div>
                    <label for="checkPwd">비밀번호 확인  </label><br>
                    <input type="password" class="fcontrol" id="checkPwd" placeholder="영어,숫자,특수문자 포함  8-20자리" required> 
                    <br>
                    <div id="pwdCheckResult" class="result" style="font-size:0.9em; display:none"></div>
                    <br>
                    <div style="float: left;">
                        <label for="userName">이름</label><br>
                        <input type="text" class="fcontrolname" id="userName" name="userName" required> <br>
                    </div>
                    
                    <div>
                        <label for="gender">성별</label><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" id="Male" value="M" name="gender"> 남자
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" id="Female" value="F" name="gender"> 여자
                    </div>
                   
                    <br><br><br>
                   
                    <div style="clear:both;"></div> 

                    <label for="phone">휴대전화 </label><br>
                    <input type="tel" class="fcontrol" id="phone" placeholder="( - ) 없이 입력해주세요" name="phone"> <br>
					<br>
                    <label for="email">이메일 </label>
                    <div>
                        <input type="text" class="fcontrolemail" id="email" name="email" style="float:left; margin-right: 10px;"> 
                    </div>   
                        <button type="button" class="btns1" onclick="sendEmail()">인증하기</button>
                     <br><br>
                     <div class="cert-num-input" style="display:none;">
		            	<b>인증번호 입력 </b><input type="text" name="certNum" style="width: 195px">
		            	<button type="button" class="btns3" onclick="emailCheck()">인증번호 확인</button>
		            	<div id="emailcheckResult" style="font-size:0.7em;"></div>
		            </div>
                     
                </div> 
                <br>
                <div align="center">
                    <button type="submit" class="btns2">회원가입</button>
                </div>
            </form>
            <br>
        </div>    

    </div>


    <script> 
		// 약관동의 체크박스
        $(document).ready(function(){  
            $("#chkAll").click(function() {
                if($("#chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
                else $("input[name=chk]").prop("checked", false);
            });
            
            $("input[name=chk]").click(function() {
                var total = $("input[name=chk]").length;
                var checked = $("input[name=chk]:checked").length;
                
                if(total != checked) $("#chkAll").prop("checked", false);
                else $("#chkAll").prop("checked", true); 
            });
	    });
        
		// 아이디 
		//var $userId = $("#enrollForm input[name=userId]");
		//var regExp = /^[a-zA-Z0-9]{5,10}$/ ;
	
        // 아이디 중복체크
    	$(function(){
    		const $idInput = $("#enrollForm input[name=userId]");
    		
    		$idInput.keyup(function(){

    			if($idInput.val().length >= 5){
    				
    				$.ajax({
    					url:"idCheck.me",
    					data:{checkId:$idInput.val()},
    					success:function(result){
    						
    						if(result == "NNNNN"){ // 사용불가능
    							$("#checkResult").show();
    							$("#checkResult").css("color","red").text("이미 중복된 아이디가 존재합니다.");
    							$("#enrollForm : submit").attr("disabled",true);
    						
    						}else{ // 사용가능
    							$("#checkResult").show();
    							$("#checkResult").css("color","green").text("멋진 아이디네요!");   							
    						}
    					}, error:function(){
    						console.log("아이디 중복체크용 ajax 통신 실패");
    					}
    				})
    			}else{
    				$("#checkResult").hide();
    			} 
    		})
    	})
    	
    	// 비밀번호
		var $userPwd = $('#userPwd');
		var $checkPwd = $('#checkPwd');
		// 영문 숫자 특수문자 조합 8자리 이상 20자리 이하
		var regExp = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&\*\-_=\+])[a-zA-Z0-9!@#$%^&\*\-_=\+].{8,20}$/;
		
		// 비밀번호 정규표현식 확인
		$userPwd.keyup(function(){
			if($userPwd.val().length >= 8) {
				
				if($userPwd.val().match(regExp) != null){
					$('.valiPwd').css('color', 'green').text('사용 가능한 비밀번호입니다.');
				} else {
					$('.valiPwd').text('');
				}
			} else {
				$('.valiPwd').text('')
			}
		})
		
		// 비밀번호 일치 여부 확인
		$checkPwd.keyup(function(){
			if($userPwd.val() === $checkPwd.val()) {
				$("#pwdCheckResult").show();
				$('#pwdCheckResult').css('color', 'green').text('비밀번호가 일치합니다.');
			} else {
				$("#pwdCheckResult").show();
				$('#pwdCheckResult').css('color', 'red').text('비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
			}
		})	
		
		// 이메일
		
		// 인증번호 전송 ajax
			function sendEmail() {
				$("#emailcheckResult").text("");
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
			
			$("#emailcheckResult").css("color", "black").text("인증 유효시간 : " + min + "분" + sec + "초");
			time--;
			
			if(time < 0) {
				clearInterval(timer);
				$("#emailcheckResult").css("color", "red").text("인증번호 유효기간이 지났습니다. 다시 시도해주세요.");
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
						$("#emailcheckResult").css("color", "red").text("인증번호가 일치하지 않습니다. 다시 시도해주세요.");
					}
				}, error: function() {
					alert("메일 인증 실패! 다시 시도해주세요");
				}
			})
		}		
    </script>

	<br><br><br>
    <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>