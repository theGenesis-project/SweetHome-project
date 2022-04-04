<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인테리어 등록</title>
<script type="text/javascript" src="resources/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
            height: 400px;
        }       
        /*세부 크기*/
       
       
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
        .interior-content{
            margin-top: 30px;
        }
        .content3_2{
            height: 100%;
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
        #insertInterior{
            color: rgb(255, 255, 255);
            background-color: rgb(247, 202, 201);
            border: 0ch;
            border-radius: 3px;
            width: 80px;
            height: 30px;
            float: right;
        }
    
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/interiorNavi.jsp" />
	
	<div class="content">
         
        <!--메인 시작!!!!!!!!!!!!--------------------------------------------------------->
        <div class="content2">
            <form action="insertInterior.in" method="post" enctype="multipart/form-data">
                <div class="content3_1">
                    <div class="content4_1">
                        <img id="titleImg" width="450px" height="450px"><!--썸네일-->
                    </div>
                    <div class="content4_2">
                    	<div class="interior_category">
                    		카테고리 : <select name="inteCate">
                    					<option value="1">침대</option>
                    					<option value="2">매트리스</option>
                    					<option value="3">소파</option>
                    					<option value="4">테이블</option>
                    					<option value="5">거실장</option>
                    					<option value="6">조명</option>
                    					<option value="7">화장대</option>
                    					<option value="8">거울</option>
                    					<option value="9">파티션</option>
                    				</select>
                    	</div>
                        <div class="interior_com">
                           		 가구사 : <input type="text" id="interiorCo" name="interiorCo" required>
                        </div>
                        <div class="interior_title">
                            	게시글 제목 : <input type="text" id="interiorTitle" name="interiorTitle" required>
                        </div>
                        <div class="interior_price">
                           		 가격 : <input type="text" id="interiorPrice" name="interiorPrice" required>
                        <hr>
                        </div>
                        <div class="interior_post">
                           		 택배비: <input type="text" id="interiorPost" name="interiorPost" required>
                            <hr>
                        </div> 
                        <div class="img-content">
                            <p>추가 이미지</p>
                            <img id=contentImg1 width="150" height="150">
                            <img id=contentImg2 width="150" height="150">
                            <img id=contentImg3 width="150" height="150">
                        </div>     
                    </div>
                </div>
                <hr>
                <div class="content3_2">
                    <div class="content4_3">               
                        <div class="interior-content">
                          
                           <textarea name="interiorDetail" id="interiorDetail" rows="10" required></textarea>         
                        </div>                    
                        <div id="file-area">
							<input type="file" id="file1" name="file" onchange="loadImg(this,1);" required>
							<input type="file" id="file2" name="file" onchange="loadImg(this,2);">
							<input type="file" id="file3" name="file" onchange="loadImg(this,3);">
							<input type="file" id="file4" name="file" onchange="loadImg(this,4);">
							<!-- onchange : input태그의 내용물이 변경되었을 때 발생하는 이벤트-->
							<!-- loadImg() 함수를 호출 => 우리가 만들 함수 -->
						</div>
                    </div>
                </div>

                <div class="button">
                    <button type="submit" id="insertInterior">글작성</button>
                </div>
            </form>
        </div>   
   
    </div>
    
    <script type="text/javascript">
    
		    var oEditors = [];
			 nhn.husky.EZCreator.createInIFrame({
			 oAppRef: oEditors,
			 elPlaceHolder: "interiorDetail",
			 sSkinURI: "resources/smartEditor/SmartEditor2Skin.html",
			 htParams : {
			      // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			      bUseToolbar : true,             
			      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			      bUseVerticalResizer : true,     
			      // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			      bUseModeChanger : true
			  }, 
			 fCreator: "createSEditor2"
			 
			});
			
			$(function(){
				
				$("#insertInterior").click(function(){
					// 에디터의 내용이 textarea에 적용된다.
					 oEditors.getById["interiorDetail"].exec("UPDATE_CONTENTS_FIELD", []);
					 
					// 에디터의 내용에 대한 값 검증은 이곳에서
					// document.getElementById("ir1").value를 이용해서 처리한다.
		
				})
				
			})
			
			$(function(){
						$("#file-area").hide();

						$("#titleImg").click(function(){
							$("#file1").click();
						})

						$("#contentImg1").click(function(){
							$("#file2").click();
						})

						$("#contentImg2").click(function(){
							$("#file3").click();
						})

						$("#contentImg3").click(function(){
							$("#file4").click();
						})
					})
			
					
			function loadImg(inputFile, num){

					if(inputFile.files.length == 1){//파일이 있는 경우
						
						var reader = new FileReader();
					
						reader.readAsDataURL(inputFile.files[0]);
						
						reader.onload = function(e){
						
							switch(num){
								case 1 : $("#titleImg").attr("src",e.target.result); break;
								case 2 : $("#contentImg1").attr("src",e.target.result); break;
								case 3 : $("#contentImg2").attr("src",e.target.result); break;
								case 4 : $("#contentImg3").attr("src",e.target.result); break;
							}
						}

					} else{//파일이 없는 경우
							//미리보기 사라지게 하기
							//src = null을 담아서 사라지게 하자
							switch(num){
								case 1 : $("#titleImg").attr("src",null); break;
								case 2 : $("#contentImg1").attr("src",null); break;
								case 3 : $("#contentImg2").attr("src",null); break;
								case 4 : $("#contentImg3").attr("src",null); break;
							}

					}
				}
				
	 
</script>



   
	
	<!--메인 끝!!!----------------------------------------------------------->
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>