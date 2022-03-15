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
                            <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FZEhc6%2FbtrvwiEgZqP%2F7M7x4VKdhIZnkKB6EkNREK%2Fimg.jpg" alt="">
                            </div>
                            <div class="carousel-item">
                            <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FZEhc6%2FbtrvwiEgZqP%2F7M7x4VKdhIZnkKB6EkNREK%2Fimg.jpg" alt="">
                            </div>
                            <div class="carousel-item">
                            <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FZEhc6%2FbtrvwiEgZqP%2F7M7x4VKdhIZnkKB6EkNREK%2Fimg.jpg" alt="">
                            </div>
                        </div>
                        
                        <!-- Left and right controls -->
                        <a class="carousel-control-prev" href="#myCarousel">
                            <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#myCarousel">
                            <span class="carousel-control-next-icon"></span>
                        </a>
                        </div>
                    </div>
                </div>
                <div class="content4_2">
                    <div class="interior_com">
                        <p>오트밀 하우스</p>
                    </div>
                    <div class="interior_title">
                        <p>게시글 제목 적는 공간</p>
                    </div>
                    <div class="interior_price">
                        <p>인테리어 가격 적는 공간</p>
                        <hr>
                    </div>
                    <div class="interior_post">
                        <p>배송업체 : 어쩌구택배</p>
                        <hr>
                    </div>
                    <div class="like-order-area">
                        <div class="like-area">
                            <p id="like1"><svg id="i-heart" xmlns="http://www.w3.org/2000/svg" style="cursor:pointer" viewBox="0 0 32 32" width="32" height="32" fill="none" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                <path d="M4 16 C1 12 2 6 7 4 12 2 15 6 16 8 17 6 21 2 26 4 31 6 31 12 28 16 25 20 16 28 16 28 16 28 7 20 4 16 Z" />
                                </svg>
                            </p>
                            <p id="like2">
                                <svg xmlns="http://www.w3.org/2000/svg" style="cursor:pointer" width="30" height="30" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                                  </svg>
                            </p>
                            
                        </div>
                        <div class="orderButton">
                            <button>구매하기</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content3_2">
                <div class="content4_3">
                    <div class="interior-content">

                    </div>

                </div>
            </div>
            
            <div id="review-area">
                <h2>리뷰</h2>
               
                <table id="replyArea" class="table" align="center">
                    <thead>
                        <tr>
                            <th></th>
                            <th colspan="3">
                                <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
                            </th>
                            <th style="vertical-align:middle"><button class="btn btn-secondary" style="background-color: rgb(247, 202, 201); border: 0ch;">댓글등록</button></th>
                        </tr>
                        
                    </thead>
                    <tbody>
                        <tr>
                            <th></th>
                            <th>user02</th>
                            <td width="600">ㅋㅋㅋㅋ</td>
                            <td width="130">2020-03-12</td>
                            <td class="buttons">
                                <!--본인 작성 댓글일 경우 수정하기/삭제하기 아닌 경우 신고하기만!-->
                                <button type="button" class="btn" data-toggle="modal" data-target="#updateReview">수정</button>
                                <button>삭제</button>
                                <button type="button" class="btn" data-toggle="modal" data-target="#rereply">댓글</button><!--관리자만 리뷰 리댓 쓸 수 있음-->
                            </td>
                        </tr>
                        <tr class="rereply-area">
                            <th>⤷</th>
                            <th>admin</th>
                            <td width="550">뭐</td>
                            <td width="130">2020-03-12</td>
                            
                        </tr>
                      
                    </tbody>
                </table>
            </div>

            <div class="modal" id="rereply">
                <div class="modal-dialog">
                  <div class="modal-content">
              
                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title">리뷰 댓글쓰기</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
              
                    <!-- Modal body -->
                    <div class="modal-body">
                        <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;">
                            리뷰 댓글 작성하는 곳
                        </textarea>
                    </div>
              
                    <!-- Modal footer -->
                    <div class="modal-footer">
                      <button type="button" class="btn" data-dismiss="modal">확인</button>
                    </div>
              
                  </div>
                </div>
            </div>

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
                        <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;">
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
                
            // Enable Carousel Controls
            $(".carousel-control-prev").click(function(){
                $("#myCarousel").carousel("prev");
            });
            $(".carousel-control-next").click(function(){
                $("#myCarousel").carousel("next");
            });
        });

        $(function(){
            $("#like1").click(function(){
                $("like1").hide();
                $("#like2").show();

            });
            $("#like2").click(function(){
            
                $("#like1").show();
                $("#like2").hide();
                
            });    

        });

        
        </script>
	
	<!--메인 끝!!!----------------------------------------------------------->
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>