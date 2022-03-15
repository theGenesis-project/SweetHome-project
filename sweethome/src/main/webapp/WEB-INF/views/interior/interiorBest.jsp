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
        .title>p{
            margin: 30px 30px;
            color: rgb(99, 99, 99);
            margin: auto;
            font-size: 35px;
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
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/interiorNavi.jsp" />
	
	<div class="content">
       
        <div id="interior-area">
            <div class="title">
                <p>역대 베스트</p>
            </div>
            <div class="interior_list">
                   <div class="thumbnail-area">
                       <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FZEhc6%2FbtrvwiEgZqP%2F7M7x4VKdhIZnkKB6EkNREK%2Fimg.jpg" alt="">
                   </div>
                   <div class="interior_com">
                       <p>오트밀 하우스</p>
                   </div>
                   <div class="interior_title">
                       <p class="target">수납/원목/LED/무헤드/벙커타입 침대 수납/원목/LED/무헤드/벙커타입 침대</p>
                   </div>
                   <div class="interior_price">
                       <p>1,000,000 원</p>
                   </div>
            </div>

            <div class="interior_list">
                <div class="thumbnail-area">
                    <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FZEhc6%2FbtrvwiEgZqP%2F7M7x4VKdhIZnkKB6EkNREK%2Fimg.jpg" alt="">
                </div>
                <div class="interior_com">
                    <p>오트밀 하우스</p>
                </div>
                <div class="interior_title">
                    <p class="target">수납/원목/LED/무헤드/벙커타입 침대 수납/원목/LED/무헤드/벙커타입 침대</p>
                </div>
                <div class="interior_price">
                    <p>1,000,000 원</p>
                </div>
            </div>

            <div class="interior_list">
                <div class="thumbnail-area">
                    <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FZEhc6%2FbtrvwiEgZqP%2F7M7x4VKdhIZnkKB6EkNREK%2Fimg.jpg" alt="">
                </div>
                <div class="interior_com">
                    <p>오트밀 하우스</p>
                </div>
                <div class="interior_title">
                    <p class="target">수납/원목/LED/무헤드/벙커타입 침대 수납/원목/LED/무헤드/벙커타입 침대</p>
                </div>
                <div class="interior_price">
                    <p>1,000,000 원</p>
                </div>
            </div>

            <div class="interior_list">
                <div class="thumbnail-area">
                    <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FZEhc6%2FbtrvwiEgZqP%2F7M7x4VKdhIZnkKB6EkNREK%2Fimg.jpg" alt="">
                </div>
                <div class="interior_com">
                    <p>오트밀 하우스</p>
                </div>
                <div class="interior_title">
                    <p class="target">수납/원목/LED/무헤드/벙커타입 침대 수납/원목/LED/무헤드/벙커타입 침대</p>
                </div>
                <div class="interior_price">
                    <p>1,000,000 원</p>
                </div>
         </div>

         <div class="interior_list">
            <div class="thumbnail-area">
                <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FZEhc6%2FbtrvwiEgZqP%2F7M7x4VKdhIZnkKB6EkNREK%2Fimg.jpg" alt="">
            </div>
            <div class="interior_com">
                <p>오트밀 하우스</p>
            </div>
            <div class="interior_title">
                <p class="target">수납/원목/LED/무헤드/벙커타입 침대 수납/원목/LED/무헤드/벙커타입 침대</p>
            </div>
            <div class="interior_price">
                <p>1,000,000 원</p>
            </div>
     	</div>      
      </div>
    </div>
	
	<jsp:include page="../common/footer.jsp" />
	

</body>
</html>