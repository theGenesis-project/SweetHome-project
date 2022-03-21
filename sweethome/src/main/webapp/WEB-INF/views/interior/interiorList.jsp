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
        .interior_list{
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
       /*
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

        #search-area{
            margin: 50px 0px;
        }
        #search{
            margin : auto;
            height: 30px;
            width: fit-content;
        }
        #search>select{
            height: 100%;          
        }
        #search>input[name=search]{
            box-sizing: border-box;
            height: 100%;
        }
        #search>button{
            border: 0ch;
            border-radius: 3px;
            color: white;
            background-color: rgb(247, 202, 201);
            padding: 3px 10px 3px 10px;
        }
        */
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/interiorNavi.jsp" />
	<div id="search-area">
	 		rjatorasdf
	 </div>
	
	 <div class="content">
	 	
         <!--네비2 시작~!!------------------------------------------------------------------>
        <div id="interiorCategory">
            <ul>
                <li style="font-size: 30px;">카테고리</li><br>
                <li><a href=""><svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg> 침대</a></li>
                <li><a href=""><svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg> 매트리스</a></li>
                <li><a href=""><svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg> 쇼파</a></li>
                <li><a href=""><svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg> 테이블</a></li>
                <li><a href=""><svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg> 거실장</a></li>
                <li><a href=""><svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg> 조명</a></li>
                <li><a href=""><svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg> 화장대</a></li>
                <li><a href=""><svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg> 거울</a></li>
                <li><a href=""><svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg> 파티션</a></li>

            </ul>

        </div>
        <!--네비2 끝~!!------------------------------------------------------------------>
        <!--메인 시작!!!!!!!!!!!!--------------------------------------------------------->
        <div id="content2">
            <div id="title-area">
                <h2>침대</h2>
            </div>

            <div id="buttons">
                <!--only 관리자만 보임-->
                <button>가구등록</button>
                <button>가구삭제</button>
            </div>
            <div id="interior-area">
             <div class="interior_list">
                    <div class="thumbnail-area">
                        <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FZEhc6%2FbtrvwiEgZqP%2F7M7x4VKdhIZnkKB6EkNREK%2Fimg.jpg" alt="">
                    </div>
                    <div class="interior_com">
                        <p>오트밀 하우스</p>
                        <input type="checkbox">
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
                        <input type="checkbox">
                    </div>
                    <div class="interior_title">
                        <p>수납/원목/LED/무헤드/벙커타입 침대</p>
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
                        <input type="checkbox">
                    </div>
                    <div class="interior_title">
                        <p>수납/원목/LED/무헤드/벙커타입 침대</p>
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
                        <input type="checkbox">
                    </div>
                    <div class="interior_title">
                        <p>수납/원목/LED/무헤드/벙커타입 침대</p>
                    </div>
                    <div class="interior_price">
                        <p>1,000,000 원</p>
                    </div>
                </div>

            </div>
			<!--  
            <div id="paging-area">
                <div id="paging">
                    <button>&lt;</button> 
                    <button>1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>4</button>
                    <button>&gt;</button>
                </div>
            </div>

            <div id="search-area">
                <div id="search">
                    <select name="" id="">
                        <option value="">제목</option>
                        <option value="">작성자</option>
                        <option value="">내용</option>
                    </select>
                    <input type="text" id="" name="search">
                    <button>검색</button>
                </div>
            </div>
		-->
        </div>
        
       
    </div>
	
	<!--메인 끝!!!----------------------------------------------------------->
	
	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>