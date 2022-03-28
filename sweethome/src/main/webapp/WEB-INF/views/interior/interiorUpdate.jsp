<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인테리어 게시글 수정</title>
<script type="text/javascript" src="resources/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
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
<body>
<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/interiorNavi.jsp" />
	
	<div class="content">
         
        <!--메인 시작!!!!!!!!!!!!--------------------------------------------------------->
    <div class="content2">
        <form action="updateInterior.in" method="post" enctype="multipart/form-data">
        <input type="hidden" name="interiorNo" value="${in.interiorNo }">
            <div class="content3_1">
                <div class="content4_1">
                    <img src="${inf.get(0).filePath }" id="titleImg" width="450px" height="450px"><!--썸네일-->
                </div>
                <div class="content4_2">
                	<div class="interior_category">
                		카테고리 : <select name="inteCate">
                					<option value="1">침대</option>
                					<option value="2">매트리스</option>
                					<option value="3">쇼파</option>
                					<option value="4">테이블</option>
                					<option value="5">거실장</option>
                					<option value="6">조명</option>
                					<option value="7">화장대</option>
                					<option value="8">거울</option>
                					<option value="9">파티션</option>
                				</select>
                	</div>
                    <div class="interior_com">
                       		 가구사 : <input type="text" id="interiorCo" name="interiorCo" value="${in.interiorCo }">
                    </div>
                    <div class="interior_title">
                        	게시글 제목 : <input type="text" id="interiorTitle" name="interiorTitle" value="${in.interiorTitle }">
                    </div>
                    <div class="interior_price">
                       		 가격 : <input type="text" id="interiorPrice" name="interiorPrice" value="${in.interiorPrice }">
                    <hr>
                    </div>
                    <div class="interior_post">
                       		 택배사 : <input type="text" id="interiorPost" name="interiorPost" value="${ in.interiorPost}">
                        <hr>
                    </div>      
                </div>
            </div>
            <div class="content3_2">
                <div class="content4_3">
                    <div class="img-content">                
	                        <img src="${inf.get(1).filePath }" id=contentImg1 width="150" height="150">
	                        <img src="${inf.get(2).filePath }" id=contentImg2 width="150" height="150">
	                        <img src="${inf.get(3).filePath }" id=contentImg3 width="150" height="150">
	                              
                    </div>
                    
                    
                    <div class="interior-content">
                       <textarea name="interiorDetail" id="interiorDetail" rows="10" required>${in.interiorDetail}</textarea>         
                    </div>
                    
                    <div id="file-area">
						<input type="file" id="file1" name="reupfile" onchange="loadImg(this,1);" required>								
						<input type="file" id="file2" name="reupfile" onchange="loadImg(this,2);">
						<input type="file" id="file3" name="reupfile" onchange="loadImg(this,3);">
						<input type="file" id="file4" name="reupfile" onchange="loadImg(this,4);">				
					</div>
                </div>
            </div>
            <div class="button">
                <button type="submit" id="updateInterior">글작성</button>
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
			
			$("#updateInterior").click(function(){
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