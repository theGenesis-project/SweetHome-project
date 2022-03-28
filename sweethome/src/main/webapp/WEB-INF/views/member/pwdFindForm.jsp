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
        <div class="findId"><h3>비밀번호 찾기</h3></div>
        <div class="innerOuter">
                <br><br>
               <form action="pwdFindComplete.me" method="post" id="pwdFind" >
	                <div class="findForm">
	                    <br>
	                    <input type="text" placeholder="회원가입시 사용한 이메일을 입력해주세요" class="inputForm" id="email" name="email">
	                    <br><br>
	                    <button type="button" class="btn1" onclick="pwdSendEmail()">임시비밀번호 발급받기</button>
	                </div>
                </form>      
        </div>
        <br><br>
    </div>
    
    <script>
    	// 임시비밀번호 전송
    	function pwdSendEmail(){
    		$.ajax({
    			url:"pwdSendEmail.me",
    			type: 'post',
    			data: {email: $('input[name=email]').val()},
    			success: function(result){
    				alert("입력하신 이메일로 임시 비밀번호가 발송되었습니다.")
    			}, error : function(){
    				alert("메일 전송 실패")
    			}
    			
    		})
    	}
    
    </script>

     <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>