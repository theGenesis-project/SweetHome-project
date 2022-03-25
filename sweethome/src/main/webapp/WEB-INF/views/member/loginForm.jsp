<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="652283702805-oe6hd48tmgk4v42uc9t124ge89lld9j2.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<title>로그인</title>
<style>
        .content{
            /*border: 1px solid rgb(247, 202 , 201);*/
            width: 1200px;
            margin: auto;
        }

        .innerOuter{
            border: 2px solid rgb(247, 202 , 201);
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
            /*border: 1px solid rgb(247, 202 , 201);*/
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
    <br><br>
        <div class="innerOuter">
            <div class="simpleLogin">
                <br><br>
                <div class="Login">SNS 간편 로그인</div>
                <br>
                <div class="sLogin">
                <a href="${google_url}"><img src="http://ojsfile.ohmynews.com/STD_IMG_FILE/2015/0902/IE001866788_STD.jpg" width="200px" height="100px" style="margin-left:50px;"></a>   
                <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
                <div class="g-signin2" data-theme="dark" onclick="onSignIn();"></div>
                </div>       
            
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
            <a href="idFind.me" style="color:black">아이디 찾기 </a>  
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="pwdFind.me" style="color:black">비밀번호 찾기</a>
        </div>
        <br>
    </div>
    
    
    <script>
    		function onSignIn(googleUser){
    			var profile = googleUser.getBasicProfile();
    			console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
    			console.log('Name: ' + profile.getName());
    			console.log('Image URL: ' + profile.getImageUrl());
    			console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
    		
    			var id_token = googleUser.getAuthResponse().id_token;
    			console.log("ID Token : " + id_token);
    		}
    		
    </script>

     <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>