<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .content {
           /* border: 1px solid rgb(247, 202 , 201); */
            width:1200px;
            margin:auto;         
        }
        .innerOuter {
            border: 2px solid rgb(247, 202 , 201);
            width:600px;
            height:300px;
            margin:auto;
            background-color:white;    
        }
        .btn-area{
          /*  border: 1px solid rgb(247, 202 , 201);*/
            margin: auto;
            padding-top: 95px;
            padding-left: 75px;
        }
        .btn1{
            border: none;
            width:200px;
            height: 110px;
            background-color: rgb(247, 202 , 201);;
        }

        .big{
            font-size: large;
            font-weight: bold;
        }

        .small{
            font-weight: bold;
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
            <div class="btn-area">
                <div style="float: left; margin-right: 50px;">
                    <button class="btn1" onclick="">
                        <div class="big">메이트 회원가입</div><br>
                        <div class="small">일반회원</div>
                    </button>
                    
                </div>
                
                <div>            
                    <button class="btn1" onclick="">
                        <div class="big">하우스오너 회원가입</div><br>                
                        <div class="small">사업자 회원</div>
                    </button>               
                </div>
                <div style="clear: both;"></div>
            </div>
        </div>

    </div>
	<br>
    <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />   
</body>
</html>