<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            height:250px;
            margin:auto;
            text-align: center;
        }

        .btn{ 
            border: none;
            width: 180px;
            height:40px;
            background-color: rgb(247, 202 , 201) ;   
            font-weight: bolder;
        }
        
        .join{
        	padding-left: 300px;
        }
    </style>
</head>
<body>
    <!-- 메뉴바 -->
    <jsp:include page="../common/header.jsp" />

    <div class="content">
    	<br><br>
    	<div class="join"><h3>회원가입</h3></div>
        <div class="innerOuter">
            <br><br>
            <h3>회원가입 절차가 모두 완료되었습니다.<br>
                로그인 후 모든 기능을 이용할 수 있습니다.<br></h3>
            <br>   
  
            <button class="btn" onclick="">로그인 페이지로 이동</button> &nbsp;
            <button class="btn" onclick="">메인 페이지로 이동</button>
        </div>
        <br>
    </div>

     <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>