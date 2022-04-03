<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.thegenesis.sweethome.room.model.vo.*, java.util.ArrayList,com.thegenesis.sweethome.house.model.vo.*"%>

<% 
	ArrayList<Room> room = (ArrayList)request.getAttribute("room");
	ArrayList<HouseFile> file = (ArrayList)request.getAttribute("file");
	System.out.print(file);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .sub-nav-area {
    width: 220px;
    border-radius: 13px;
    border: 2px solid lightgray;
    margin-right: 5px;
    margin-left:100px;
    float:left;
    margin-top:150px;
    }

    .sub-nav-area>div {
    border-bottom: 2px solid lightgray;
    }
    
    .sub-nav-list {
    height: 60px;
    font-size: 20px;
    font-weight: bold;
    line-height: 60px;
    background-color: white;
    text-align: center;
    }

    .sub-nav-list:hover {
        color: rgb(247, 202, 201);
        cursor: pointer;
    }

	 .carousel-inner img {
	   width: 100%;
	   height: 100%;
	  }
	  
	 .carousel-item {
	   width: 1000px;
	   height: 600px;
	 }
	 
	 .content{
	   width:1500px;
	   margin:auto;
	 }
	 
	  #content2{
	   font-size:30px;
	   font-weight: bold;
	   color:rgb(247, 202, 201);
	 }
	 #myCarousel{
	   width:1000px;
	   height:600px;
	   margin-left:500px;
	   margin-top:70px;
	 }
	 
	.carousel-control{
	   height:500px;
	}
	#house-name{
	    font-size: 40px;
	    font-weight: bold;
	    color:rgb(247, 202, 201);
	    text-align: center;
	    height:50px;
	}
	.roomifo1{
	   font-size:30px;
	   font-weight: bold;
	   margin-left:200px;
	   text-align: center;
	   float:left;
	   color:rgb(247, 202, 201);
	  }
	.roomifo2{
	  width:1400px;
	  margin:auto;
	  border-bottom:2px solid rgb(247, 202, 201);
	}
	.roomifo2 th{
	  font-size:25px;
	   font-weight: bold;
	   text-align: center;
	   color:rgb(247, 202, 201);
	   border-top:2px solid rgb(247, 202, 201);
	   border-bottom:2px solid rgb(247, 202, 201);
	}
	.roomifo2 td{
	  font-size:20px;
	   font-weight: bold;
	   text-align: center;
	   height:60px;
	   width:100px;

	}
	.tour{
     width: 80%;
     height: 40px;
     background-color: rgb(247, 202, 201);
     border-radius: 15px;
     vertical-align:middle;
     color: white;
     margin:auto;
     padding:5px;
	}
	.tour1{
     width: 80%;
     height: 40px;
     background-color:rgb(210, 210, 210);
     border-radius: 15px;
     vertical-align:middle;
     color: white;
     margin:auto;
     padding:5px;
	}
	.tour:hover{
     	cursor: pointer;
     }
	.house-title{
	 width:1400px;
	 font-size:30px;
	 font-weight: bold;
	 margin:auto;
	 background-color: rgb(230, 230, 230);
	 border-radius: 40px;
	 height:200px;
	}
	#house-title{
	padding-top:77.5px;	
	text-align:center;
	}
	
	.house-introduce{
	width:1400px;
	margin:auto;
	}
	#space{
	width:1400px;
	height:400px;
	margin:auto;
	}
	#space>.space1{
	float:left;
	width:300px;
	height:100%;
	background-color: rgb(230, 230, 230);
	}
	.space1-1{
	width:100%;
	height:250px;
	}
	#space>.space2{
	float:left;
	width:400px;
	height:400px;
	vertical-align:middle;
	text-align:left;
	}
	.space1-1>svg{
	margin-left:100px;
	margin-top:100px;
	}
	.space1-2{
	font-size:30px;
	font-weight: bold;
	text-align:center;
	height:150px;
	}
	#maps{
	width:1400px;
	height:500px;
	margin:auto;
	}
	.traffic1{
	width:100%;
	height:50px;
	background-color: rgb(230, 230, 230);
	font-size:30px;
	font-weight: bold;
	text-align:center;
	}
	.traffic2{
	width:100%;
	height:200px;
	}
	.box{
	width:1400px;
	height:400px;
	background-color:rgb(230, 230, 230);
	margin:auto;
	}
	#like{
	font-size:50px;
	margin-left: 50px;
	}
	.box1{
	width:290px;
	height:250px;
	float:left;
	padding:60px;
	}
	.box2{
	width:80px;
	height:250px;
	float:left;
	}
	.box1-1{
	width:160px;
	height:160px;
	background-color:white;
	border-radius: 100%;
	}
	.box2>svg{
	margin-top:75px;
	}
	.box1-1>p{
	font-size:15px;
	font-weight:bold;
	margin-top:15px;
	}
	.box1-1>svg{
	margin-left:50px;
	margin-top:20px;
	}
	.box3{
	width:80%;
	margin:auto;
	}
	.box3>pre{
	background-color:rgb(190, 190, 190);
	font-size:13px;
	font-weight:bold;
	color:rgb(209,48,48);
	}
	.box4{
	width:50%;
	margin:auto;
	}
	#chat{
     height: 40px;
     background-color: rgb(247, 202, 201);
     border-radius: 15px;
	 margin-top:5px;
	 margin-left:270px;
     color: white;
     outline:none;
     border:none;
	}
	#return{
	 height: 40px;
     background-color: rgb(247, 202, 201);
     border-radius: 10px;
     color: white;
     border:none;
     outline:none;
     margin-left:1350px;
     }
<<<<<<< HEAD
    .modal-body>form{
     text-align:center;
    }
     #modal-button{
     width: 90px;
     height: 35px;
     margin: auto;
     margin-top: 20px;
     margin-bottom: 20px;
     color: white;
     background-color: rgb(247, 202, 201);
     border-radius: 3px;
     border: 0ch;
    }
	#modal-body{
     margin: auto;
    }
	
=======
>>>>>>> branch 'master' of https://github.com/theGenesis-project/SweetHome-project.git
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<br>
	<hr>
	<div style="width:1500px;margin:auto;text-align:right;">
	
<<<<<<< HEAD
	<c:if test="${!empty loginUser }">
		<c:choose>
			<c:when test="${(loginUser.userId eq room1.userId) || (loginUser.userId eq 'admin')}">   
			<button type="button" class="btn btn-primary" onclick="fixHouse();">정보수정</button>
			<button type="button" class="btn btn-primary"  onclick="deleteHouse();">하우스삭제</button>
			</c:when>
			<c:otherwise>
			<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">신고하기</button>
			</c:otherwise>
		</c:choose>
	</c:if>
	
	<!-- 글 신고 -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
        <div class="modal-content">
        
            <!-- Modal Header -->
            <div class="modal-header">
	            <h4 class="modal-title">신고하기</h4>
	            <button type="button" class="close" data-dismiss="modal">×</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
            <form action="reportRoom.ho" method="post">
               	<input type="hidden" name="houseNo" value="${room.get(0).houseNo }">
               	<input type="hidden" name="userNo" value="${loginUser.userNo }">
                <select name="reportCate">
                    <option value="1">스팸, 홍보, 도배글</option>
                    <option value="2">욕설 및 음란물</option>
                    <option value="3">불법정보</option>
                    <option value="4">개인정보 노출 게시물</option>
                </select>
            </div>
            	<button type="submit" id="modal-button">신고하기</button>
            </form> 
            
        </div>
        </div>
    </div>
	<c:choose>
		<c:when test ="${ loginUser.userType eq 'M'}">
		<button type="button" class="btn btn-danger">하우스신고</button>
		</c:when>
		<c:otherwise>
		<button type="button" class="btn btn-primary">정보수정</button>
		</c:otherwise>
	</c:choose>
	</div>	
	<div class="content">
			<div class="sub-nav-area">
		        <div class="sub-nav-list" onclick="capImg();">
		          	 대표사진
		        </div>
				<c:forEach var="n" items="${ room }">
		        <div id="roomName" class="sub-nav-list" onclick="roomFile(this);">
		        	<span class="rno" style="display:none">${n.roomNo }</span>
		        	 ${n.roomName }
		        </div>
		        </c:forEach>
	    	</div>
				<div id="house-name" >
					${ room.get(0).houseName}
							<c:if test="${!empty loginUser}">
	                        <c:choose>
		                        <c:when test="${ idCheckHeart eq 'Y'}">
		                            <span id="like" style="cursor:pointer;">
		                          		♥
		                            </span>
		                        </c:when>
		                        <c:otherwise>
		                            <span id="like" style="cursor:pointer;">
		                            	  ♡
		                            </span>
		                        </c:otherwise>
	                        </c:choose>   
	                        </c:if>                                   
		        </div>
			<div class="content">
				<div id="myCarousel" class="carousel slide" data-ride="carousel" >
				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <li class="caro" data-target="#myCarousel" data-slide-to="0" class="active"></li>
				    <c:forEach var="e" begin="1" end="${fileLength}">
				    <li class="caro" data-target="#myCarousel" data-slide-to="${e}"></li>
				    </c:forEach>
				  </ul>
				  
					  <!-- The slideshow -->
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img src="${file.get(0).filePath }" alt="이미지" width="500px" height="500px">
					    </div>
					    <c:if test="${fileLength >= 1}">
					    <c:forEach var="f" begin="1" end="${fileLength }">
	                      <div class="carousel-item">
	                      <img src="${file.get(f).filePath }" alt="이미지" width="500px" height="500px">
	                      </div>
                      	</c:forEach>
                      	</c:if>    
					  </div>
				  
					  <!-- Left and right controls -->
					  <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
					    <span class="carousel-control-prev-icon"></span>
					  </a>
					  <a class="carousel-control-next" href="#myCarousel" data-slide="next">
					    <span class="carousel-control-next-icon"></span>
					  </a>
				</div>
				</div>
			</div>
		</div>
	<br><br><br><br>
	
	<div class="content">
			<div class="roomifo">
				<div class="roomifo1">방정보</div>
				<div class="roomifo1">지점소개</div>
				<div class="roomifo1">제공서비스</div>
				<div class="roomifo1">입주절차</div>
			</div>
	</div>

	<br><br>
	
	<hr style="width:1400px;height:2px;background-color:rgb(247, 202, 201);">
	
	<br><br>	
	<div class="content" style="font-size:30px;font-weight: bold;color:rgb(247, 202, 201);">
		입주현황
	</div>
	<div class="content">
		<table class="roomifo2">
			<thead>
				<th>입주신청</th>
				<th>구분</th>
				<th>성별</th>
				<th>타입</th>
				<th>면적</th>
				<th>보증금</th>
				<th>월입대료</th>	
				<th>관리비</th>	
				<th>선불공과금</th>	
				<th>입주가능일</th>	
			</thead>
				<c:forEach var="r" items="${ room }">
				<tbody >
						<c:choose>
						<c:when test="${r.status eq 'N'}">
							<td><div class="tour1"><span class="span">투어불가</span></div></td>
						</c:when>
						<c:otherwise>
							<c:choose>
							<c:when test="${!empty loginUser}">
							<td><div class="tour" onclick="tourForm(this);"><span class="span">투어신청</span></div></td>
							</c:when>
							<c:otherwise>
							<td><div class="tour" ><span class="span" onclick="location.href='loginform.me'">로그인 </span></div></td>
							</c:otherwise>
							</c:choose>
						</c:otherwise>
						</c:choose>
							<td>${r.roomName}</td>
						<c:choose>
						<c:when test="${r.gender eq 'M'}">
							<td>남성</td>
						</c:when>
						<c:otherwise>
							<td>여성</td>
						</c:otherwise>
						</c:choose>
							<td>${ r.people }인실</td>
							<td>${ r.area }㎡</td>
							<td>${ r.deposit }원</td>
							<td>${ r.rent }원</td>	
							<td>${ r.expense }원</td>	
							<td>${ r.utility }원</td>	
							<td>${ r.availableDate }</td>	
							<td class="rno" style="display:none">${ r.roomNo }</td>	
							<td id ="houseNo" class="hno" style="display:none">${ r.houseNo }</td>	
							<td class="uno" style="display:none">${ r.userNo }</td>	
				</tbody>
				</c:forEach>
	
			
		</table>
		<br>
		<div class="content">
			<p style="font-size:15px;font-weight:bold;">
			- 투어신청은 입주가능일 30일 전부터 신청 가능합니다. <br>
			</p>
		</div>
		<br><br>
		<c:forEach var="r" items="${ room }" begin="0" end="0">
		<div class="content" style="font-size:30px;font-weight: bold;color:rgb(247, 202, 201);">
		지점소개
		</div>
		<div class="house-title">	
			
			<div id="house-title"> ${ r.houseTitle }</div>
		</div>
		<div class="house-introduce">
		<br>
		<p style="font-size:15px;font-weight:bold;">
			${ r.houseIntroduce }
		</p>
		</div>
		<br>
		<div class="content" style="font-size:30px;font-weight: bold;color:rgb(247, 202, 201);">
		제공서비스
		</div>
		<div id="space">
			   <div class="space1">
			   		<div class="space1-1">
				   		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="100" height="100" viewBox="0 0 32 33.22800064086914" fill="#000000" data-svg-content="true">
				   			<g>
				   				<path d="M 14,5C 14,2.324, 11.676,0, 9,0S 4,2.324, 4,5C 4,7.676, 6.324,10, 9,10S 14,7.676, 14,5zM 17.5,24c0-8-4.152-12-8.75-12S0,16,0,24C0,29.48, 17.5,29.48, 17.5,24zM 23.5,13.89c 2.676,0, 5-2.324, 5-5s-2.324-5-5-5s-5,2.324-5,5S 20.824,13.89, 23.5,13.89zM 23.25,15.89c-1.382,0-2.706,0.406-3.906,1.13c 0.726,1.952, 1.156,4.266, 1.156,6.98 c0,2.694-1.796,4.792-4.878,5.992C 19.444,33.228, 32,32.538, 32,27.89C 32,19.89, 27.848,15.89, 23.25,15.89z"></path>
				   			</g>
				   		</svg>
			   		</div>
			   		<div class="space1-2"> 
			   		공용공간
			   		<br><br><br>
			   		</div>
			   </div>
			   <div class="space2">
			   		<p style="font-size:15px;font-weight:bold;">
			   			${r.shareSpace}
					</p style="font-size:15px;font-weight:bold;">
			   </div>
			   <div class="space1">
			   		<div class="space1-1">
				   		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="100" height="100" viewBox="0 0 32 33.762001037597656" fill="#000000" data-svg-content="true">
				   			<g>
				   				<path d="M 22,6c0-3.212-2.788-6-6-6S 10,2.788, 10,6c0,3.212, 2.788,6, 6,6S 22,9.212, 22,6zM 16,14c-5.256,0-10,5.67-10,12.716s 20,7.046, 20,0S 21.256,14, 16,14z"></path>
				   			</g>
				   		</svg>
			   		</div>
			   		<div class="space1-2"> 
			   		개인공간
			   		<br><br><br>
			   		</div>
			   	</div>
			   <div class="space2">
			   		<p style="font-size:15px;font-weight:bold;">
			   			${r.personalSpace }
			   		</p>
			   </div>
		</div>
		<br style="clear:both;">
		<br>
		<div class="content" style="font-size:30px;font-weight: bold;color:rgb(247, 202, 201);">
		 위치/편의시설
		</div>
		<div id="maps">
			<div id="map" style="width:750px;height:500px;float:left;"></div>
			<div id="map2"style="width:50px;height:500px;float:left;"></div>
			<div id="map3"style="width:600px;height:500px;float:left;">
				<div class="traffic1">교통시설 / 접근성</div>
				<div class="traffic2">
					<p style="font-size:15px;font-weight:bold;">
			   			${r.traffic }
			   		</p>
				</div>
				<div class="traffic1">편의시설</div>
				<div class="traffic2">
					<p style="font-size:15px;font-weight:bold;">
			   			${r.convenience }
			   		</p>
				</div>
			</div>
		</div>
		<br style="clear:both;">
		<div class="content" style="font-size:30px;font-weight: bold;color:rgb(247, 202, 201);">
		 입주절차
		</div>
		<div class="box">
			<div class="box1">
				<div class="box1-1">
					<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" width="60px" height="60px" viewBox="0 0 32 32" enable-background="new 0 0 32 32" xml:space="preserve" data-svg-content="true" fill="#000000">
						<g>
							<path fill="#828282" d="M1.5,32h29c0.827,0,1.5-0.673,1.5-1.5v-29C32,0.673,31.327,0,30.5,0h-29C0.673,0,0,0.673,0,1.5v29   C0,31.327,0.673,32,1.5,32z M1,1.5C1,1.224,1.225,1,1.5,1h29C30.775,1,31,1.224,31,1.5v29c0,0.276-0.225,0.5-0.5,0.5h-29   C1.225,31,1,30.776,1,30.5V1.5z"></path>
							<path fill="#828282" d="M4,28.479c0.048,0,0.096-0.007,0.143-0.021l10-2.979c0.081-0.024,0.154-0.068,0.213-0.127l10.09-10.205   c0.023-0.024,0.035-0.053,0.052-0.08l3.658-3.658c0.607-0.607,0.607-1.595,0-2.203L22.92,3.972c-0.607-0.607-1.595-0.608-2.202,0   l-3.739,3.739c-0.024,0.024-0.036,0.054-0.054,0.081L6.807,17.911c-0.056,0.056-0.098,0.124-0.122,0.199l-3.16,9.715   c-0.058,0.177-0.012,0.371,0.117,0.504C3.737,28.426,3.867,28.479,4,28.479z M17.359,8.771l1.04,1.04l-8.523,8.563l-1.727-0.392   L17.359,8.771z M10.5,19.165l8.607-8.646l2.434,2.434L12.796,21.5H10.5V19.165z M23.385,14.797l-9.246,9.352l-0.576-1.999   l8.684-8.489L23.385,14.797z M7.493,18.859L9.5,19.315V22c0,0.276,0.224,0.5,0.5,0.5h2.624l0.633,2.2l-8.487,2.528L7.493,18.859z    M21.425,4.679c0.218-0.217,0.572-0.216,0.788,0l5.235,5.235c0.218,0.217,0.218,0.571,0,0.789l-3.372,3.372l-6.023-6.023   L21.425,4.679z"></path>
						</g>
					</svg>
					<p style="margin-left:50px;">
						입주신청
					</p>
				</div>
			</div>
			<div class="box2">
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="80" height="100" viewBox="0 0 32 32" fill="#000000" data-svg-content="true">
					<g>
						<path d="M 13.8,24.196c 0.39,0.39, 1.024,0.39, 1.414,0l 6.486-6.486c 0.196-0.196, 0.294-0.454, 0.292-0.71 c0-0.258-0.096-0.514-0.292-0.71L 15.214,9.804c-0.39-0.39-1.024-0.39-1.414,0c-0.39,0.39-0.39,1.024,0,1.414L 19.582,17 L 13.8,22.782C 13.41,23.172, 13.41,23.806, 13.8,24.196z"></path>
					</g>
				</svg>
			</div>
			<div class="box1">
				<div class="box1-1">
					<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" width="60" height="60" viewBox="0 0 32 32" enable-background="new 0 0 32 32" xml:space="preserve" data-svg-content="true" fill="#000000">
						<g>
							<path fill="#828282" d="M10.5,0C4.71,0,0,4.71,0,10.5S4.71,21,10.5,21c2.725,0,5.203-1.052,7.071-2.76   c0.022,0.039,0.042,0.08,0.076,0.114l2.151,2.151c-0.18,0.304-0.282,0.648-0.282,1.011c0,0.534,0.208,1.036,0.586,1.414   l8.485,8.485C28.964,31.792,29.466,32,30,32s1.036-0.208,1.414-0.586S32,30.534,32,30s-0.208-1.036-0.586-1.414l-8.485-8.485   c-0.634-0.634-1.659-0.729-2.42-0.299l-2.155-2.155c-0.034-0.034-0.074-0.054-0.114-0.076C19.948,15.703,21,13.225,21,10.5   C21,4.71,16.29,0,10.5,0z M22.222,20.808l8.485,8.485C30.896,29.482,31,29.733,31,30s-0.104,0.518-0.293,0.707   c-0.379,0.377-1.035,0.377-1.414,0l-8.485-8.485c-0.188-0.189-0.293-0.44-0.293-0.707s0.104-0.518,0.293-0.707   c0.189-0.188,0.44-0.293,0.707-0.293S22.032,20.619,22.222,20.808z M10.5,20C5.262,20,1,15.738,1,10.5S5.262,1,10.5,1   S20,5.262,20,10.5S15.738,20,10.5,20z"></path>
							<path fill="#828282" d="M10.5,3C6.364,3,3,6.364,3,10.5S6.364,18,10.5,18s7.5-3.364,7.5-7.5S14.636,3,10.5,3z M10.5,17   C6.916,17,4,14.084,4,10.5S6.916,4,10.5,4S17,6.916,17,10.5S14.084,17,10.5,17z"></path>
						</g>
					</svg>
					<p style="margin-left:50px;">지점투어<br>
						  						   &nbsp;인터뷰
					</p>
				</div>
			</div>
			<div class="box2">
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="80" height="100" viewBox="0 0 32 32" fill="#000000" data-svg-content="true">
					<g>
						<path d="M 13.8,24.196c 0.39,0.39, 1.024,0.39, 1.414,0l 6.486-6.486c 0.196-0.196, 0.294-0.454, 0.292-0.71 c0-0.258-0.096-0.514-0.292-0.71L 15.214,9.804c-0.39-0.39-1.024-0.39-1.414,0c-0.39,0.39-0.39,1.024,0,1.414L 19.582,17 L 13.8,22.782C 13.41,23.172, 13.41,23.806, 13.8,24.196z"></path>
					</g>
				</svg>
			</div>
			<div class="box1">
				<div class="box1-1">
					<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" width="60px" height="60px" viewBox="0 0 27 32" enable-background="new 0 0 27 32" xml:space="preserve" data-svg-content="true" fill="#000000">
						<g>
							<path fill="#828282" d="M23.5,32c0.869,0,1.5-0.631,1.5-1.5v-28C25,1.631,24.369,1,23.5,1h-20C2.631,1,2,1.631,2,2.5v1.167   c0,0.276,0.224,0.5,0.5,0.5S3,3.943,3,3.667V2.5C3,2.187,3.187,2,3.5,2h4.562v29H3.5C3.187,31,3,30.813,3,30.5v-0.917   c0-0.276-0.224-0.5-0.5-0.5S2,29.307,2,29.583V30.5C2,31.369,2.631,32,3.5,32H23.5z M9,2h14.5C23.813,2,24,2.187,24,2.5v28   c0,0.313-0.187,0.5-0.5,0.5H9V2z"></path>
							<path fill="#828282" d="M27,29.5v-26C27,3.224,26.776,3,26.5,3S26,3.224,26,3.5v26c0,0.276,0.224,0.5,0.5,0.5S27,29.776,27,29.5z"></path>
							<path fill="#828282" d="M0.5,11h4C4.776,11,5,10.776,5,10.5S4.776,10,4.5,10h-4C0.224,10,0,10.224,0,10.5S0.224,11,0.5,11z"></path>
							<path fill="#828282" d="M0.5,7h4C4.776,7,5,6.776,5,6.5S4.776,6,4.5,6h-4C0.224,6,0,6.224,0,6.5S0.224,7,0.5,7z"></path>
							<path fill="#828282" d="M0.5,15h4C4.776,15,5,14.776,5,14.5S4.776,14,4.5,14h-4C0.224,14,0,14.224,0,14.5S0.224,15,0.5,15z"></path>
							<path fill="#828282" d="M0.5,23h4C4.776,23,5,22.776,5,22.5S4.776,22,4.5,22h-4C0.224,22,0,22.224,0,22.5S0.224,23,0.5,23z"></path>
							<path fill="#828282" d="M0.5,19h4C4.776,19,5,18.776,5,18.5S4.776,18,4.5,18h-4C0.224,18,0,18.224,0,18.5S0.224,19,0.5,19z"></path>
							<path fill="#828282" d="M0.5,27h4C4.776,27,5,26.776,5,26.5S4.776,26,4.5,26h-4C0.224,26,0,26.224,0,26.5S0.224,27,0.5,27z"></path>
						</g>
					</svg>
					<p style="margin-left:40px;">계약서 작성 <br>
						이용료 납부
					</p>
				</div>
			</div>
			<div class="box2">
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="80" height="100" viewBox="0 0 32 32" fill="#000000" data-svg-content="true">
					<g>
						<path d="M 13.8,24.196c 0.39,0.39, 1.024,0.39, 1.414,0l 6.486-6.486c 0.196-0.196, 0.294-0.454, 0.292-0.71 c0-0.258-0.096-0.514-0.292-0.71L 15.214,9.804c-0.39-0.39-1.024-0.39-1.414,0c-0.39,0.39-0.39,1.024,0,1.414L 19.582,17 L 13.8,22.782C 13.41,23.172, 13.41,23.806, 13.8,24.196z"></path>
					</g>
				</svg>
			</div>
			<div class="box1">
				<div class="box1-1">
					<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="60" height="60" viewBox="0 0 32.25 32" fill="#000000" data-svg-content="true">
						<g>
							<path d="M 1.624,17.782L 4,15.882L 4,30 c0,1.104, 0.896,2, 2,2l 6,0 c 1.104,0, 2-0.896, 2-2l0-8 l 4,0 l0,8 c0,1.104, 0.896,2, 2,2l 6,0 c 1.104,0, 2-0.896, 2-2L 28,15.882 l 2.376,1.9C 30.56,17.928, 30.78,18, 31,18c 0.294,0, 0.584-0.128, 0.782-0.376 c 0.344-0.432, 0.274-1.060-0.156-1.406l-15-12c-0.366-0.292-0.884-0.292-1.25,0L 10,8.518L 10,6 c0-1.104-0.896-2-2-2S 6,4.896, 6,6l0,5.718 l-5.624,4.5c-0.43,0.346-0.5,0.974-0.156,1.406C 0.564,18.056, 1.192,18.126, 1.624,17.782z M 16,6.28l 10,8L 26,30 l-6,0 l0-10 L 12,20 l0,10 L 6,30 L 6,14.282 L 16,6.28z "></path>
						</g>
					</svg>
					<p style="margin-left:50px;">
						입주 완료
					</p>
				</div>
			</div>
			<br style="clear:both;">
			<div class="box3">
				<pre>  · 투어신청은 현재 공실이거나 계약종료 두달 전인 방의 신청만 받습니다.    · 월 임대료 및 추가비용은 입주 2일 전까지 납부하셔야 합니다.
  · 계약시 중개수수료는 일체 받지 않습니다.                                · 보증금 납부 후 입주를 취소하실 경우, 보증금의 50%만 반환됩니다.
  · 계약금으로 보증금을 수령하며, 계약종료 후 퇴실시 반환됩니다.           · 계약기간 만료 이전에 중도퇴실할 경우, 절차에 따라 위약금이 발생됩니다.</pre>
			</div>
			<div class="box4">
				<c:choose >
				<c:when test="${empty loginUser}">
				<button id="chat" type="button" onclick="location.href='loginform.me'">오너와 채팅하기 ></button>
				</c:when>
				<c:otherwise>
				<button id="chat" type="button" onclick="window.open('newChat?other=${r.userNo}&houseName=${ r.houseName }', '하우스톡톡', 'height=100%, menubar=no, status=no, tollbar=no, location=no')" >오너와 채팅하기</button>
				</c:otherwise>
				</c:choose>
				
			</div>
		</div>
		<br><br>
		
		<button id="return" onclick="location.href='house.se'">다른 하우스 찾기</button>
		
	</div>
	</c:forEach>
	
	
	
	<hr>	
	<jsp:include page="../common/footer.jsp" />
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc26f4f2ac186a2ad635ddbe87b694c6"></script>
		<script>
		
		var file = [];
		
		<% for (HouseFile hf: file){%>
			file.push("<%= hf.getFilePath()%>");
		<% }%>
		
		function capImg(){
			
			$(".carousel-item").remove();
			$(".caro").remove();
			
				console.log(file.length);
				var cap = '<li class="caro" data-target="#myCarousel" data-slide-to="0" class="active"></li>';
					 	   for(var e = 1; e <= (file.length -1) ; e++){
						   cap +=  '<li class="caro" data-target="#myCarousel" data-slide-to="' + e + '"></li>';
					 	   }
			
				var capImg = '<div class="carousel-item active">'
	      			+'<img src="'+  file[0]  +'" alt="이미지" width="500px" height="500px">'
		    		+'</div>';
			    for(var i = 1; i <= (file.length -1) ; i++){
			    	capImg += '<div class="carousel-item">'
	              	+ '<img src="'+  file[i]  +'" alt="이미지" width="500px" height="500px">'
	              	+ '</div>';
		    		}
		    		
			    	
					$(".carousel-inner").append(capImg);	
					$(".carousel-indicators").append(cap);	
			    
		}
		

		function roomFile(f){
			
			$(".carousel-item").remove();
			$(".caro").remove();
			
			
			$.ajax({
					url:"changeFile.ro",
					data :{
					 hno : <%=room.get(0).getHouseNo()%>,
					 rno : f.getElementsByClassName('rno')[0].innerText
					},
					success:function(fileOne){
						var change = '<div class="carousel-item active">'
					      			+'<img src="'+  fileOne[0].filePath  +'" alt="이미지" width="500px" height="500px">'
						    		+'</div>'
							    	for(var i = 1; i <= (fileOne.length-1); i++){
			                      	change += '<div class="carousel-item">'
			                      	+ '<img src="'+  fileOne[i].filePath  +'" alt="이미지" width="500px" height="500px">'
			                      	+ '</div>'
						    		}
						   
						var changeMove =  '<li class="caro" data-target="#myCarousel" data-slide-to="0" class="active"></li>';
					 	   					for(var h = 1; h <= (fileOne.length-1) ; h++){
					 	   					changeMove +=  '<li class="caro" data-target="#myCarousel" data-slide-to="' + h + '"></li>';
						 	   			  }   		
						    		
						    		
						$(".carousel-inner").append(change);	
						$(".carousel-indicators").append(changeMove);
					}
			})
		
		}

		function tourForm(e){
			
			console.log(e);
			var hno = e.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.innerText;
			
			var rno = e.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.innerText;

			var uno = e.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.innerText;

			 location.href="tour.re?hno=" + hno + "&rno="+ rno  +"&uno=" + uno;
		}
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			 mapOption = { 
			     center: new kakao.maps.LatLng(<%=room.get(0).getLongitude()%>, <%=room.get(0).getLatitude()%>), // 지도의 중심좌표
			     level: 5 // 지도의 확대 레벨
			  };
			
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		map.setMinLevel(2);
		map.setMaxLevel(6);	
		
			// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(<%=room.get(0).getLongitude()%>, <%=room.get(0).getLatitude()%>); 
			
			// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position: markerPosition
		});
			
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
			
		var iwContent = '<div style="padding:5px;width:280px;">' + ("<%=room.get(0).getAddress() %>") + '</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent
		});

		// 마커에 마우스오버 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseover', function() {
		  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		    infowindow.open(map, marker);
		});

		// 마커에 마우스아웃 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseout', function() {
		    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
		    infowindow.close();
		});
		
		   
		      function deleteHouse() {
				
		    	var hno = <%=room.get(0).getHouseNo()%>;
		         var result = confirm("해당 하우스를 삭제하시겠습니까?");
		         
		         if(result) {
		            location.href = "deleteHouse.ho?hno=" + hno;
		         }
		         else {
		            hno = "";
		         }
		      }
		   
		      function fixHouse() {

		    	var hno = <%=room.get(0).getHouseNo()%>;
		         var result = confirm("해당 하우스를 수정하시겠습니까?");
		         
		         if(result) {
		            location.href = "updateHouseForm.ho?hno=" + hno;
		         }
		         else {
		            hno = "";
		         }
		      }
		
		

		      var likeBtn = document.getElementById("like");
				likeBtn.onclick = function(){
				like();
				}	
				
				
					function like(){
					
						$.ajax({
								url : "changeHeart.ho",
								data : {
								houseNo : <%=room.get(0).getHouseNo()%>,
								userNo : '${loginUser.userNo}'			
								},
								success : function(result){
									if(result == "NN"){
										$("#like").html("♡");
					                       					
									}else{
										$("#like").html("♥");
									}				
								}				
							})					
							
					}
				
				
				
				      
		      
		
	</script>
</body>
</html>