<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 관리</title>
<style>
	div{
		border: 1px red solid;
	}
	.admin-container{
		height: 100vh;
		width: 100vw;
	}
	.sub_nav {
		width: 15vw;
		float: left;
		height: auto;
	}	
	.mypage {
		float: left;
		width: 75vw;
		position: relative;
	}	
	.end{
		clear: both;
	}
	.content{
            /*border: 1px solid rgb(247, 202 , 201);*/
            width: 1000px;
            margin: auto;           
    }
    .btn{
      		height:35px;
    }
	#main{
            width: 1000px;
            margin: auto;
            margin-top: 50px;     
            margin-bottom: 150px;
        }
        #search{
            margin : 20px 0px 0px 0px;
            height: 30px;
        }
        #search>select{
            height: 100%;
        }
        #search>input[name=search]{
            box-sizing: border-box;
            height: 100%;
        }
        
        #button{
            float: right;   
        
        }
        #button>button{
            background-color: rgb(247, 202, 201);  
            color: white; 
            border: 0ch;
            border-radius: 3px;
            height: 30px;

        }
        #list{
            margin: 40px 0px 40px 0px;          
        }
        table{
            text-align: center;
            margin: auto;
            width: 1000px;
        }
        table tr{
            height: 35px;
        }
        table tr th{
            background-color: rgb(240, 240, 240);
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
	<!-- 메뉴바 -->
	
	
	<div class="admin-container">
		<div class="sub_nav">
			<jsp:include page="adminNavi.jsp"/>
		</div>
		<div class="mypage"> 
			<br><br>
			<div class="content">
				<div id="main">
					<div id="title">
						<h2>주문 내역 관리</h2>
					</div>
					
					<div id="search">
						<select name="" id="">
							<option value="">제목</option>
							<option value="">작성자</option>
							<option value="">내용</option>
						</select>
						<input type="text" id="" name="search">
					</div>				
			
					<div id="list">
						<table id="orderTable">
						<thead>
							<tr>
								<th>No.</th>
								<th>구매자</th>
								<th>분류</th>
								<th>상품명</th>
								<th>주문날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${ empty list }">
									<tr>
					                   <td colspan="4">게시글이 없습니다.</td>
					                </tr>							
								</c:when>
								<c:otherwise>
				                	<c:forEach var="oi" items="${list }">
										<tr>
											<td class="ono">${oi.orderNo }</td>
											<td>${oi.userId }</td>
											<td class="interiorCategory">${oi.orderStatus }</td>
											<td>${oi.interiorTitle }</td>                  
											<td>${oi.orderDate }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>	
						</table>	
					</div><!-- list영역 끝 -->
	
				<div id="paging">
		        	<c:if test="${ pi.currentPage ne 1 }">
		        		<c:choose>
		        			<c:when test="${empty condition }">
		        				<button onclick="location.href='orderList.ad?npage=${pi.currentPage - 1}'">&lt;</button> 
		        			</c:when>
		        			<c:otherwise>
		        				<button onclick="location.href='searchOrderList.ad?npage=${pi.currentPage - 1}&condition=${condition }&keyword=${keyword }'">&lt;</button>
		        			</c:otherwise>
		        		</c:choose>
		        	</c:if>
		        	
		        	<c:forEach var="n" begin="${pi.startPage }" end="${pi.endPage }" step="1">
		        		<c:choose>
		        			<c:when test="${empty condition }">
		        				<button onclick="location.href='orderList.ad?npage=${n}'">${ n }</button>
		        			</c:when>
		        			<c:otherwise>
		        				<button onclick="location.href='searchOrderList.ad?npage=${n}&condition=${condition }&keyword=${keyword }'">${n}</button>
		        			</c:otherwise>
		        		</c:choose>
		        	</c:forEach>
		        	
		        	<c:if test="${ pi.currentPage ne pi.maxPage }">
		        		<c:choose>
		        			<c:when test="${empty condition }">
		        				<button onclick="location.href='orderList.ad?npage=${pi.currentPage + 1}'">&gt;</button> 
		        			</c:when>
		        			<c:otherwise>
		        				<button onclick="location.href='searchOrderList.ad?npage=${pi.currentPage + 1}&condition=${condition }&keyword=${keyword }'">&gt;</button>
		        			</c:otherwise>
		        		</c:choose>
		        	</c:if>
       			 </div>
				
				</div>
			
			</div>
		</div>
	</div>
	
	<script>
	$(function(){
		
		
			var test = $('.interiorCategory').text();
			console.log(test);
			
			for(var i = 0; i < 11; i++){
				
			}
			
			if(test == 1){
				$('.interiorCategory').html("침대");
			}else if(test == 2){
				$('.interiorCategory').html("매트리스");
			}else if(test == 3){
				$('.interiorCategory').html("쇼파");
			}else if(test == 4){
				$('.interiorCategory').html("테이블");
			}else if(test == 5){
				$('.interiorCategory').html("거실장");
			}else if(test == 6){
				$('.interiorCategory').html("조명");
			}else if(test == 7){
				$('.interiorCategory').html("화장대");
			}else if(test == 8){
				$('.interiorCategory').html("거울");
			}else if(test == 9){
				$('.interiorCategory').html("파티션");
			}
			
			console.log($(".ono").text())
			
			$("#orderTable>tbody>tr").click(function(){
				location.href = 'orderInfoDetail.ad?ono='+$(this).children(".ono").text();
			
			})
		
		
	})
    
	
	</script>
	
</body>
</html>