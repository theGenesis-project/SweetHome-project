<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 페이지</title>
<style>
  /*메인 시작!!!!---------*/
        .content{
            width: 1500px;
            margin: auto;
        }
        .title{
            width: 100%;
            text-align: center;   
            margin-top: 50px;
            margin-bottom: 50px;
        }
        .title>.searchTitle{
            margin: 30px 30px;
            color: rgb(99, 99, 99);
            margin: auto;
            font-size: 25px;
        }
      
       
        #interior-area{
            width: 1000px;
            margin: auto;
        }
        .interior_list{
            width: 25%;
            height: auto;
            margin: 50px 30px;
            display: inline-block;
        }
        .thumbnail-area{
            width: 100%;
            height: 100%;
             
        }
        .thumbnail-area>img{
            width: 240px;
            height: 240px;
           
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
        #paging{
            margin-top: 50px;
            width:fit-content; 
            margin: auto;
            margin-bottom: 50px;
        }
        #paging button{
            background-color: rgb(221, 221, 221);
            color: rgb(87, 87, 87);
            padding: 7px;
            border: 0ch;
            border-radius: 3px;
        }
        #notList{
        	width :500px;
        	height : 100%;
        	margin-top : 100px;
        	margin-bottom : 200px;
        	margin-left : 430px;
        	display : inline-block;
        }
        .interior_price>p{
            display: inline-block;
        }
        

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/interiorNavi.jsp" />
	
	<div class="content">
       
        <div id="interior-area">
            <div class="title">
                <p class="searchTitle">"${keyword}"에 대한 검색 결과입니다</p>
                
            </div>
            
            <c:choose>
	            <c:when test="${empty list }">           		
	                <div id="notList">게시글이 없습니다.</div> 		
	            </c:when>
	             <c:otherwise>
	                <c:forEach var="i" items="${list}">
	                	<div class="interior_list">
					         <div class="thumbnail-area">
					               <img src="${i.filePath }" alt="logo">
					         </div>
					         <div class="interior_com">
					                <p>${i.interiorCo }</p>
					          </div>
					          <div class="interior_title">
					                <p class="target">${i.interiorTitle }</p>
					          </div>
					          <div class="ino2" style="display:none;">
			                  		<p class="ino">${i.interiorNo }</p>
			                  	</div>  
					          <div class="interior_price">
					                 <p>${i.interiorPrice }</p> 원
					          </div>
					     </div>		
	                </c:forEach>
            	</c:otherwise>
            </c:choose>

	</div>
	
	
     	 <c:if test="${!empty list }">           		
	          <div id="paging">
	            <c:if test="${ pi.currentPage ne 1 }">	
        			<button onclick="location.href='searchInterior.in?siPage=${pi.currentPage - 1}&condition=${condition }&keyword=${keyword }'">&lt;</button>
        		</c:if>
        	
        		<c:forEach var="n" begin="${pi.startPage }" end="${pi.endPage }" step="1">	
        				<button onclick="location.href='searchInterior.in?siPage=${n}&condition=${condition }&keyword=${keyword }'">${n}</button>
        		</c:forEach>
        	
        		<c:if test="${ pi.currentPage ne pi.maxPage }">	    			
        				<button onclick="location.href='searchInterior.in?siPage=${pi.currentPage + 1}&condition=${condition }&keyword=${keyword }'">&gt;</button>
        		</c:if>
        	</div>
		</c:if>
	</div>		
	
       
	<script>
	$(".interior_list").click(function(){
		location.href = 'detail.in?ino='+ $(this).children().children('.ino').text();
		
	})
	
	</script>


	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>