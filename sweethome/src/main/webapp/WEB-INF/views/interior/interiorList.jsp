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
    #keyword-area{
        height: 100%;
        width: 300px;
    }
	/*navi2 시작----------------------------------------*/
        #interiorCategory{
            width: 20%;
            height: 100%;   
            margin-bottom: 200px;       
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
        .interior_nolist{
            margin-top: 150px;
            margin-left: 380px;
            
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
        .interior_price>p{
            display: inline-block;
        }
         #paging-area{
            margin: 50px 0px;
        }
        #paging{
            margin-top: 50px;
            width:fit-content; 
            margin: auto;
        }
        #paging button{
            background-color: rgb(221, 221, 221);
            color: rgb(87, 87, 87);
            padding: 7px;
            border: 0ch;
            border-radius: 3px;
        }
        
     
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/interiorNavi.jsp" />
	<!-- search-area -->
	<div id="search2">
        <div id="search-area">
        <form id="searchForm" action="searchInterior.in" method="get">
            <div id="search">
                <select name="condition">
                    <option value="company">가구사</option>
                    <option value="productName">제품명</option>
                </select>
                <input type="search" name="keyword" id="keyword-area">
                <button type="submit">검색</button>
            </div>
        </form>
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
		    <c:if test="${loginUser.userId eq 'admin' }">
                <div id="buttons">
                    <!--only 관리자만 보임-->
                    <button onclick="location.href='insertInteriorView.in'">가구등록</button>
                    <button onclick="checkboxArr()">가구삭제</button>
                </div>
            </c:if>
            <c:choose>
	            <c:when test="${empty list }">
		            <div class="interior-area">
		             <div class="interior_nolist">
		               	등록되어 있는 가구가 없습니다.
		             </div>
		            </div>
	             </c:when>
	             <c:otherwise>
	             <form action="" method="post">
	             	<c:forEach var="i" items="${list}">
	             		<div class="interior_checkbox">
                            <c:if test="${loginUser.userId eq 'admin' }">
	             			<input type="hidden" name="checkBoxList" id="checkBoxList">
	             			<input type="checkbox" name="checkList" value="${i.interiorNo}">   
                            </c:if>
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
			                        <p>${i.interiorPrice }</p> 원
			                    </div>
		                	</div> 
	                	</div>           	
	             	</c:forEach>
	             	</form>
	             </c:otherwise>
             </c:choose>
             
             <c:if test="${!empty list }">
             <div id="paging-area">
                 <div id="paging">
		        	<c:if test="${ pi.currentPage ne 1 }">       		       			
		        		<button onclick="location.href='interiorList.in?inpage=${pi.currentPage - 1}&intCate=${inteCate}'">&lt;</button>      				        		
		        	</c:if>
		        	
		        	<c:forEach var="n" begin="${pi.startPage }" end="${pi.endPage }" step="1">        	
		        		<button onclick="location.href='interiorList.in?inpage=${n}&intCate=${inteCate}'">${ n }</button>       			
		        	</c:forEach>
		        	
		        	<c:if test="${ pi.currentPage ne pi.maxPage }">       		
		       			<button onclick="location.href='interiorList.in?inpage=${pi.currentPage + 1}&intCate=${inteCate}'">&gt;</button>         			
		        	</c:if>
        		</div>
            </div>
            </c:if>
      
       </div>
       
    </div>
	
	<!--메인 끝!!!----------------------------------------------------------->
	<script>
	$(function(){
		
		var test = $('#title-area>h2').html();
		
		if(test == 1){
			$('#title-area>h2').html("침대");
		}else if(test == 2){
			$('#title-area>h2').html("매트리스");
		}else if(test == 3){
			$('#title-area>h2').html("쇼파");
		}else if(test == 4){
			$('#title-area>h2').html("테이블");
		}else if(test == 5){
			$('#title-area>h2').html("거실장");
		}else if(test == 6){
			$('#title-area>h2').html("조명");
		}else if(test == 7){
			$('#title-area>h2').html("화장대");
		}else if(test == 8){
			$('#title-area>h2').html("거울");
		}else if(test == 9){
			$('#title-area>h2').html("파티션");
		}
		
		
		
		$(".interior_list").click(function(){
			location.href = 'detail.in?ino='+ $(this).children().children('.ino').text();
			
		})
			
        console.log($('.interior_price>p').eq(0).text());
	
			
		
		
		})//끝
	
	 /* 체크박스 선택 시  값이 잘 넘어가는지 확인*/
       $(function(){
           $("input:checkbox[name=checkList]").on('click', function(){
               var uno = $(this).val();
               console.log(uno);           
           })
        })
        
    function checkboxArr() {//checkbox으로 삭제할 interior의 interiorNo넘겨주기

	    var checkArr = [];
	
	    $("input[name='checkList']:checked").each(function() {//체크된 체크박스의 value 
	        checkArr.push($(this).val());// 체크된 것만 값을 뽑아서 배열에 push
	        //console.log(checkArr);
	        
	    });
	    console.log(checkArr);
	    $("#checkBoxList").val(checkArr);
	    $("form").attr("action", "deleteInterior.in");
	    $("form").submit();
	    
	}
	
	


	
	</script>

	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>