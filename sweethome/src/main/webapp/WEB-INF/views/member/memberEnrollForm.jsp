<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            width:800px;
            margin:auto;
            background-color:white;    
        }

        .form-checkbox{
            border: 1px solid rgb(247, 202 , 201);
            width : 350px;
            height: 235px;
            margin: auto;
            font-weight: border;
        }

        label{
           text-align: left;
           padding-left: 150px;
           font-weight: bolder;
          
        }

        .form-control{
            width : 500px;
            height: 50px;
            margin-left: 150px;
            border: 1px solid rgb(247, 202 , 201);
           
        }

        .form-controlemail{
            width : 400px;
            height: 50px;
            margin-left: 150px;
            border: 1px solid rgb(247, 202 , 201);           
        }
        
        .form-controlname{
            width : 230px;
            height: 50px;
            margin-left: 150px;
            border: 1px solid rgb(247, 202 , 201);        
        }

        .btns1 {  /*이메일인증버튼*/
            border: none;
            width: 89px;
            height:55px;
            background-color: rgb(247, 202 , 201) ;
            
        }
        .btns2 {  /*회원가입버튼*/
            border: none;
            background-color: rgb(247, 202 , 201) ;
            width : 510px;
            height: 50px;
            margin-left: 15px;
        }
       
        .join{
        	 padding-left: 200px;
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
            <div style="margin-left:230px; font-weight: bolder;">약관동의</div>
            
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
            <form action="" method="post">
                <input type="hidden" name="userType" value="M">
                
                <div class="form-group">

                    <label for="userId">아이디  </label><br>
                    <input type="text" class="form-control" id="userId" placeholder="영어, 숫자 포함 8자 이하" name="" required> <br>
					<br>
                    <label for="userPwd">비밀번호  </label><br>
                    <input type="password" class="form-control" id="userPwd" placeholder="영어, 숫자 포함 8자 이상" name="" required> <br>
                    <br>
                    <label for="checkPwd">비밀번호 확인  </label><br>
                    <input type="password" class="form-control" id="checkPwd" placeholder="영어, 숫자 포함 8자 이상" required> <br>
                    <br>
                    <br>
                    <div style="float: left;">
                        <label for="userName">이름</label><br>
                        <input type="text" class="form-controlname" id="userName" name="" required> <br>
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
                    <input type="tel" class="form-control" id="phone" placeholder="( - ) 없이 입력해주세요" name=""> <br>
					<br>
                    <label for="email">이메일 </label>
                    <div>
                        <input type="text" class="form-control form-controlemail" id="email" name="" style="float:left; margin-right: 10px;"> 
                    </div>   
                        <button class="btns1">인증하기</button>
                     
                </div> 
                <br><br>
                <div align="center">
                    <button type="submit" class="btns2">회원가입</button>
                </div>
            </form>
            <br>
        </div>    

    </div>


    <script> 
        $(document).ready(function(){  // 약관동의 체크박스
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
    </script>


	<br><br><br>
    <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>