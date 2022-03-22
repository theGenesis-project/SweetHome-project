<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/*search-area*/
	#search-area{
		margin : auto;
		width:"100%";
		height:"20%";
	}
	/*navi2 시작----------------------------------------*/
        #interiorCategory{
            width: 20%;
            height: 100%;          
        }    
        #interiorCategory>ul{
            margin-top: 50px;
            list-style-type: none;
        }
        #interiorCategory>ul>li{
            margin-bottom: 5px;
        }
        #interiorCategory>ul>li>a{
            color: black;
            font-size: 20px;           
        }
     /*navi2 끝-------------------------------------------*/
     /*search-area 시작*/
     #search2{
            display: flex;
            width: 1500px;
            height: 150px;
            margin: auto;
        }
        #search{
            margin : auto;
            height: 40px;
            width: fit-content;
            
        }
        #search>select{
            height: 100%;  
            width: 100px;        
        }
        #search>input[name=search]{
            box-sizing: border-box;
            height: 100%;
            width: 300px;
        }
        #search>button{
            border: 0ch;
            border-radius: 3px;
            color: white;
            background-color: rgb(247, 202, 201);
            padding: 3px 20px 3px 20px;
            height: 40px;
        }
        #search-area{
            margin: auto;
        }
     /*search-area 끝*/
	 /*main부분!!!_---------------------------------------*/
        .content{
            margin: auto;
            height: auto;
            width: 1500px;
            display: flex;
        } 
        #content2{
            width: 80%;
        }
        #title-area{
            margin: 20px 0px 0px 10px;
        }

        #buttons{
            float: right;         
        }
        #buttons button{
            color: aliceblue;
            background-color: rgb(247, 202, 201);
            border: 0ch;    
            border-radius: 3px;
            font-size: 15px;
            font-weight: 500;
            height: 35px;
        }     
        #interior-area{
            padding: 40px;
        }
        .interior_checkbox{
        	width: 27%;
            height: auto;
            margin: 15px 10px;
            display: inline-block;
        }
     
        .thumbnail-area{
            width: 100%;
            height: 100%;
             
        }
        .thumbnail-area>img{
            width: 300px;
            height: 300px;
           
        }
        #interior_title{
            margin: 3px;
        }
        .target{       
            overflow: hidden;       
            white-space: nowrap;    
            text-overflow: ellipsis;      
        }
        .interior_com>p{
            font-size: 13px;
            font-weight: 600;
            display: inline;
        }
        .interior_price>p{
            color: rgb(247, 202, 201);
            font-weight: 600;
        }
        .ino2{
        	display:none;
        }
     
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/interiorNavi.jsp" />
	<!-- search-area -->
	<div id="search2">
        <div id="search-area">
            <div id="search">
                <select name="" id="">
                    <option value="">전체</option>
                    <option value="">작성자</option>
                    <option value="">내용</option>
                </select>
                <input type="text" id="" name="search">
                <button>검색</button>
            </div>
        </div>
    </div>
	
    <div class="content">
	 	
         <!--네비2 시작~!!------------------------------------------------------------------>
        <div id="interiorCategory">
            <ul>
                <li style="font-size: 30px;">카테고리</li><br>
                <li><a href="interiorList.in?intCate=1&inpage=1">침대</a></li>
                <li><a href="interiorList.in?intCate=2&inpage=1">매트리스</a></li>
                <li><a href="interiorList.in?intCate=3&inpage=1">쇼파</a></li>
                <li><a href="interiorList.in?intCate=4&inpage=1">테이블</a></li>
                <li><a href="interiorList.in?intCate=5&inpage=1">거실장</a></li>
                <li><a href="interiorList.in?intCate=6&inpage=1">조명</a></li>
                <li><a href="interiorList.in?intCate=7&inpage=1">화장대</a></li>
                <li><a href="interiorList.in?intCate=8&inpage=1">거울</a></li>
                <li><a href="interiorList.in?intCate=9&inpage=1">파티션</a></li>

            </ul>

        </div>
        <!--네비2 끝~!!------------------------------------------------------------------>
        <!--메인 시작!!!!!!!!!!!!--------------------------------------------------------->
        <div id="content2">
        
            <div id="title-area">   	        	
                <h2>${inteCate }</h2>        	
            </div>
		
            <div id="buttons">
                <!--only 관리자만 보임-->
                <button onclick="location.href='insertInteriorView.in'">가구등록</button>
                <button onclick="checkboxArr()">가구삭제</button>
            </div>
         
            <c:choose>
	            <c:when test="${empty list }">
		            <div class="interior-area">
		             <div class="interior_list">
		               	등록되어 있는 가구가 없습니다.
		             </div>
		            </div>
	             </c:when>
	             <c:otherwise>
	             	<c:forEach var="i" items="${list}">
	             		<div class="interior_checkbox">
	             		<input type="checkbox" name="checkList" value="${i.interiorNo}">
	             	
	             		<div class="interior_list">
		                    <div class="thumbnail-area">
		                        <img src="${i.filePath }" alt="interior">
		                    </div>
		                    <div class="interior_com">
		                        <p>${i.interiorCo }</p>
		                        
		                    </div>
		                    <div class="interior_title">
		                        <p>${i.interiorTitle }</p>
		                        
		                    </div>
		                  	<div class="ino2">
		                  		<p class="ino">${i.interiorNo }</p>
		                  	</div>
		                  		        
		                    <div class="interior_price">
		                        <p>${i.interiorPrice } 원</p>
		                    </div>
	                	</div> 
	                	</div>           	
	             	</c:forEach>
	             </c:otherwise>
             </c:choose>
      
       </div>
    </div>
	
	<!--메인 끝!!!----------------------------------------------------------->
	<script>
	$(function(){
		
		var test = $('#title-area>h2').html();
		console.log(test);
		if(test == 1){
			$('#title-area>h2').html("침대");
		}else if(test == 2){
			$('#title-area>h2').html("매트리스");
		}
		
		
		$(".interior_list").click(function(){
			location.href = 'detail.in?ino='+ $(this).children().children('.ino').text();
			console.log($(this).children('.ino').text());
		})
		
		})
	
	 /* 체크박스 선택 시  값이 잘 넘어가는지 확인*/
       $(function(){
           $("input:checkbox[name=checkList]").on('click', function(){
               var uno = $(this).val();
               console.log(uno);
               
           })
        })
        
    function checkboxArr() {

	    var checkArr = [];     // 배열 초기화
	
	    $("input[name='chekboxList']:checked").each(function(i) {
	        checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	    })
	
	    $.ajax({
	
	        url: 'deleteInterior.in'
	        , type: 'post'
	        , data: {
	           valueArrTest : checkArr
	        }
	
	    });

	}
	
	
	
	
	
		

	
	</script>

	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>