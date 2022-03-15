<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인테리어 등록</title>
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<style>
.content{
            margin: auto;
            height: auto;
            width: 1500px;
            display: flex;
        } 
        .content2{
            width: 80%;
            margin: auto;
            margin-top: 50px;
            margin-bottom: 50px;
        }
        .content3_1{
            width: 100%;
            display: flex;
        }
        .content4_1{
            width: 60%;      
        }
        .content4_2{
            width: 40%;
            height: 100%; 
        }
        .content4_3{
            width: 100%;
            height: 500px;
        }

        
        /*세부 크기*/
       
        #interior-content{
            margin: auto;
        }
        #titleImg, .button{
            margin: auto;
        }
     
       
        .interior_title>p{
            font-size: 28px;
            font-weight: 600;
        }
        .interior_price>p{
            font-size: 20px;
            color: rgb(247, 202, 201);
        }
        .interior_post>p{
            font-size: 18px;
        }
        .interior_com{
            margin-top: 20px;
        }
      
        .buttons button{
            color: rgb(255, 255, 255);
            background-color: rgb(247, 202, 201);
            border: 0ch;
            border-radius: 3px;
            font-size: 13px;
            padding: 5px;
            
        }
        button:hover{
            background-color: rgb(240, 240, 240);
            color: #212529;
        }
        .btn{
            color: rgb(255, 255, 255);
            background-color: rgb(247, 202, 201);
            border: 0ch;
            border-radius: 3px;

        }

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/interiorNavi.jsp" />
	
	<div class="content">
         
        <!--메인 시작!!!!!!!!!!!!--------------------------------------------------------->
        <div class="content2">
            <form action="" method="">
                <div class="content3_1">
                    <div class="content4_1">
                        <img id="titleImg" width="450px" height="450px"><!--썸네일-->
                    </div>
                    <div class="content4_2">
                        <div class="interior_com">
                            가구사 : <input type="text" id="" name="">
                        </div>
                        <div class="interior_title">
                            게시글 제목 : <input type="text" id="" name="">
                        </div>
                        <div class="interior_price">
                            가격 : <input type="text" id="" name="">
                            <hr>
                        </div>
                        <div class="interior_post">
                            택배사 : <input type="text" id="" name="">
                            <hr>
                        </div>      
                    </div>
                </div>

                <div class="content3_2">
                    <div class="content4_3">
                        <div class="img-content">
                            <img id=contentImg1 width="150" height="150">
                            <img id=contentImg2 width="150" height="150">
                            <img id=contentImg3 width="150" height="150">
                        </div>
                        <div class="interior-content">
                            <textarea name="ir1" id="ir1" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>

                        </div>

                    </div>
                </div>

                <div class="button">
                    <input type="submit" value="글 작성">
                </div>
            </form>
        </div>   
   
    </div>
    
    <script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
			 oAppRef: oEditors,
			 elPlaceHolder: "ir1",
			 sSkinURI: "../se2/SmartEditor2Skin.html",
			 fCreator: "createSEditor2"
			});
</script>

   
	
	<!--메인 끝!!!----------------------------------------------------------->
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>