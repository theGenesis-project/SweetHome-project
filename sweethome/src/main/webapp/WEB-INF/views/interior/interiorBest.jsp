<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>역대 베스트</title>
<style>
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
        .title>.bestTitle{
            margin: 30px 30px;
            color: rgb(99, 99, 99);
            margin: auto;
            font-size: 35px;
        }
        .title>.bestTitle2{
            margin: 30px 30px;
            color: rgb(247, 202, 201);
            margin: auto;
            margin-top: 5px;
            font-size: 14px;
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
            display : inline-block;
        }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/interiorNavi.jsp" />
	
	<div class="content">      
        <div id="interior-area">
            <div class="title">
                <p class="bestTitle">역대 베스트</p>
                <p class="bestTitle2">(역대 베스트는 판매량으로 결정됩니다.)</p>
            </div>
            
            <div id="bestInteriorList">
       		</div>
     	</div>
    </div>
    
    <script>
    	$(function(){
    		BestInteriorList();
    		setInterval(BestInteriorList, 1000);
    	})
    	
    	function BestInteriorList(){		
    		$.ajax({
    			
    		url : "bestList.in",
    		success : function(data){ 
    			
    			let value="";
    			for(let i in data){
    				value += "<div class='interior_list'>" 
    							+"<div class='thumbnail-area'>" 
    								+ "<img src=" + data[i].filePath  + ">"
    							+"</div>"
    							+"<div class='interior_com'>"
    								+ "<p>" + data[i].interiorCo +"</p>"
    							+"</div>"
    							+"<div class='interior_title'>"
    								+ "<p class='target'>" + data[i].interiorTitle  +"</p>"
    							+"</div>"
    							+"<div class='ino2'>"
									+ "<p class='ino'style='display: none;'>" + data[i].interiorNo  +"</p>" 
								+"</div>"
    							+"<div class='interior_price'>"
    								+ "<p>" + data[i].interiorPrice  +"</p>" + " 원"
    							+"</div>"	
    						 +"</div>"
    				}
    			$("#bestInteriorList").html(value);		
    		},
    		error : function(){
    			console.log("에러발생!");
    			} 		
    		}) 
    	}
    	
 
    	
    	$(function(){
    		
    		$(document).on("click", ".interior_list", function(){
    			location.href = 'detail.in?ino='+ $(this).children().children('.ino').text();
   			
    		})
  
    	})
    	
   
    </script>
	
	<jsp:include page="../common/footer.jsp" />
	

</body>
</html>