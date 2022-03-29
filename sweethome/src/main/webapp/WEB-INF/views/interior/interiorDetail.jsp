<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인테리어 상세정보</title>
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
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }
        .mt-3{      
            width: 450px;
            height: 450px;
        }
      
        #interior-content{
            margin: auto;
        }
        .like-order-area{
            width: 100%;
            height: 20%;
            display: flex;
        }
        .like-area{
            width: 50%;
        }
        .like-area>p>svg{
        	 color: rgb(247, 202, 201);
        }
        .orderButton{
            width: 50%;
            float: right;
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
        .like-order-area{
            margin-top: 100px;
        }
        .orderButton>button{
            color: rgb(255, 255, 255);
            background-color: rgb(247, 202, 201);
            border: 0ch;
            border-radius: 3px;
            padding: 5px;
            float: right;         
        }
        #updateBtn{           
            display: flex;
            width: 100%;
            height: 100px;
            margin: auto;
        }
        #updateBtn>form{
            margin: auto;
        }
        #updateBtn>form>button{
            background-color: rgb(247, 202, 201);
            color: aliceblue;
            width: 90px;
            height: 40px;
            border-radius: 3px;
            border: 0ch;
        }
        .rereply-area{
            background-color: rgb(240, 240, 240);
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
            <div class="content3_1">
                <div class="content4_1">
                    <div class="container mt-3">
                        <div id="myCarousel" class="carousel slide">
                        
                        <!-- Indicators -->
                        <ul class="carousel-indicators">
                            <li class="item1 active"></li>
                            <li class="item2"></li>
                            <li class="item3"></li>
                        </ul>
	                        <!-- The slideshow -->
	                        <div class="carousel-inner">
	                            <div class="carousel-item active">
	                            <img src="${inf.get(0).filePath }" alt="">
	                            </div>
                       	<c:forEach var="i" begin="1" end="${ infLength }">
	                            <div class="carousel-item">
	                            <img src="${inf.get(i).filePath }" alt="">
	                            </div>
                      	</c:forEach>                          
	                        </div>         
                        </div>
                    </div>
                </div>
	                <div class="content4_2">             	
	                    <div class="interior_com">
	                        <p>${in.interiorCo }</p>
	                    </div>
	                    <div class="interior_title">
	                        <p>${in.interiorTitle }</p>
	                    </div>
	                    <div class="interior_price">
	                        <p>${in.interiorPrice }</p>
	                        <hr>
	                    </div>
	                    <div class="interior_post">
	                        <p>배송비 : ${in.interiorPost }</p>
	                        <hr>
	                    </div>
                   		 <div class="like-order-area">
	                        <div class="like-area">
	                        <c:choose>
		                        <c:when test="${ idCheckHeart eq 'Y'}">
		                            <p id="like" style="cursor:pointer;">
		                          		♥
		                            </p>
		                        </c:when>
		                        <c:otherwise>
		                            <p id="like" style="cursor:pointer;">
		                            	  ♡
		                            </p>
		                        </c:otherwise>
	                         </c:choose>                                      
                        	</div>                	
                        	<div class="orderButton">
                        		<form method="post" action="orderForm.in">
                        			<input type="hidden" name="interiorNo" value="${in.interiorNo }">
                        			<input type="hidden" name="interiorTitle" value="${in.interiorTitle }" >
                        			<input type="hidden" name="interiorPrice" value="${in.interiorPrice }" >
                        			<input type="hidden" name="interiorPost" value="${in.interiorPost }" >
                        			<input type="hidden" name="inteCate" value="${in.inteCate }">                    			
                          	 		<button type="submit">구매하기</button>
                          	 	</form>
                          	 	
                        	</div>
                    	</div>
                	</div>
            </div>

            <div class="content3_2">
                <div class="content4_3">
                    <div class="interior-content">
						${ in.interiorDetail }
                    </div>
                </div>
            </div>

            <div id="updateBtn">
                <form method="post" action="updateInteriorDetail.in" id="postForm">
                    <input type="hidden" name="interiorNo" value="${in.interiorNo }">               
                    <button type="submit">수정하기</button>
                </form>
            </div>
            
            <div id="review-area">
                <h2>리뷰</h2>
               
                <table id="replyArea" class="table" align="center">
                    <thead>
                        <tr>
                            <th></th>
                            <th>${loginUser.userId }</th>
                            <th colspan="2">
                                <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
                            </th>
                            <th style="vertical-align:middle"><button class="btn btn-secondary" style="background-color: rgb(247, 202, 201); border: 0ch;" onclick="addReview()">리뷰등록</button></th>
                        </tr>                      
                    </thead>
                    <tbody>
                       
                        <!--  
                        <tr class="rereply-area">
                            <th>⤷</th>
                            <th>admin</th>
                            <td width="550">뭐</td>
                            <td width="130">2020-03-12</td>             
                        </tr>     
                        -->
                    </tbody>
                </table>
            </div>
	<!-- 
            <div class="modal" id="rereply">
                <div class="modal-dialog">
                  <div class="modal-content">
              
                    -- Modal Header 
                    <div class="modal-header">
                      <h4 class="modal-title">리뷰 댓글쓰기</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
              
                    <!-- Modal body 
                    <div class="modal-body">
                        <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;">
                            	리뷰 댓글 작성하는 곳
                        </textarea>
                    </div>           
                    <!-- Modal footer 
                    <div class="modal-footer">
                      <button type="button" class="btn" data-dismiss="modal">확인</button>
                    </div>           
                  </div>
                </div>
            </div>
 		-->
            <div class="modal" id="updateReview">
                <div class="modal-dialog">
                  <div class="modal-content">
              
                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title">리뷰 수정하기</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
              
                    <!-- Modal body -->
                    <div class="modal-body">
                        <textarea class="form-control mContent" name="" cols="55" rows="2" style="resize:none; width:100%;">
                        		댓글 내용 들어있음
                        </textarea>
                    </div>
              
                    <!-- Modal footer -->
                    <div class="modal-footer">
                      <button type="button" class="btn" data-dismiss="modal">확인</button>
                    </div>
              
                  </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        //이미지 슬라이드
	    $(document).ready(function(){
	        // Activate Carousel
	        $("#myCarousel").carousel();
	            
	        // Enable Carousel Indicators
	        $(".item1").click(function(){
	            $("#myCarousel").carousel(0);
	        });
	        $(".item2").click(function(){
	            $("#myCarousel").carousel(1);
	        });
	        $(".item3").click(function(){
	            $("#myCarousel").carousel(2);
	        });       	       
	    });
		//찜기능
		
		var likeBtn = document.getElementById("like");
		likeBtn.onclick = function(){
			changeHeart();
		}
		
		//하트 클릭
		function changeHeart(){
			
			$.ajax({
				
				url : "changeHeart.in",
				data : {
					interiorNo : ${in.interiorNo},
					userNo : ${loginUser.userNo}					
				},
				success : function(result){
					console.log(result);
					
					if(result == "NN"){
						$("#like").html("♡");
	                       					
					}else{
						$("#like").html("♥");
					}				
				}								
			})						
		}
		
		$(function(){
			selectReviewList();
		})
			
		function addReview(){//댓글 작성용
			//아무것도 없을 때 요청 불가능하게!
			
			if($("#content").val().trim() != 0 ){			
					$.ajax({					
						url : "reviewInsert.in",
						data : {
							interiorNo : ${ in.interiorNo },
	    					reviewContent : $("#content").val(), 
	    					userNo : ${loginUser.userNo }	
						},
						success : function(result){
							if(result == "YY"){
	    						console.log("성공했나?");
								selectReviewList();
	    						$("#content").val("");
							}else{
								console.log("???")
							}
						},
						error : function(){
							console.log("댓글 작성 실패");
						}
					})//ajax끝
				}else{
					alertify.alert("댓글을 올바르게 입력해주세요.");			
				}
			}
		
			function selectReviewList(){//리뷰 리스트 불러오기
				$.ajax({
					url : "reviewList.in",
					data : {
						interiorNo : ${in.interiorNo}
					},
					success : function(list){
						console.log(list)
						let value = "";
						for(let i in list){
							value += "<tr>"
									+"<th>" + "</th>"
									+"<th class='reviewUserId'>" + list[i].userId +"</th>"
									+"<td width='600' class='reviewContent'>" + list[i].reviewContent + "</td>"
									+"<td width='130' class='createDate'>" + list[i].createDate + "</td>"
									+"<td class='buttons'>" 
										+ "<button type='button' class='btn updateContent' data-toggle='modal' data-target='#updateReview'>" + "수정"  +"</button>"
										+ "<button class='deleteContent'>" + "삭제" + "</button>"		
									+ "</td>"
									+"</tr>"
						}
						$("#replyArea tbody").html(value);
					},
					error : function(){
						console.log("조회 실패")
					}				
				})
			}
		
			$(function(){
				
				console.log($(".deleteContent").parents(".reviewUserId").eq(0).text());
				$(".deleteContent").click(function(){
					
					$(this).parents(".reviewUserId").text();
				})
				
				$(".updateContent").click(function(){
					var reviewUserId = $(this).parents(".reviewUserId").val()
					var reviewContent = $(this).parents(".reviewContent").val()
					var createDate = $(this).parents(".createDate").val()
					
					console.log(reviewUserId);
					
				})
				
			})
		
	
	
	
        </script>
	
	<!--메인 끝!!!----------------------------------------------------------->
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>