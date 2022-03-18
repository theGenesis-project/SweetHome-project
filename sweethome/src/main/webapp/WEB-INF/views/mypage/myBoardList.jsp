<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글/댓글 관리</title>
<link rel="stylesheet" href="resources/css/mypage.css" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<script>
		$(function(){
			$('.myboard').bind("click", function(){
				$('.myboard').css("background-color", "rgb(247, 201, 202)");
				$('.mycomment').css("background-color", "");
				$('.board').show();
				$('.comment').hide();
			})
			
			$('.mycomment').bind("click", function(){
				$('.mycomment').css("background-color", "rgb(247, 201, 202)");
				$('.myboard').css("background-color", "");
				$('.board').hide();
				$('.comment').show();
			})
			
			$('.myboard').trigger("click");
		})
		
	</script>
	<div class="sweethome-container">
		<div class="sub-nav">
			<jsp:include page="../common/mypageNavi.jsp" />
		</div>
		<div class="mypage">
			<div class="inner-nav">
				<div class="inner-nav-area">
					<div class="myboard inner-nav-content">
						<b>게시글📜</b>
					</div>
					<div class="mycomment inner-nav-content">
						<b>댓글💭</b>
					</div>
					<div class="end"></div>
				</div>
			</div>
			<div class="inner-body">
				<div class="board">
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">번호</th>
					      <th scope="col">제목</th>
					      <th scope="col">조회수</th>
					      <th scope="col">작성일</th>	      
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach var="b" items="${ Blist }">
						    <tr class="list-area" onclick="listClick(${ b.boardNo });">
						      <th scope="row">${ b.rowNo }</th>
						      <td>${ b.boardTitle }</td>
						      <td>${ b.count }</td>
						      <td>${ b.createDate }</td>
						    </tr>
					  	</c:forEach>
					  </tbody>
					</table>
				
					<div id="pagingArea">
		                <ul class="pagination">
		                	<!-- 1번 페이지일 경우 비활성화 -->
		                	<c:choose>
		                		<c:when test="${Bpi.currentPage eq 1}">
			                	    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item"><a class="page-link" href="myBoard.my?bpage=${Bpi.currentPage - 1}">Previous</a></li>
		                		</c:otherwise>
		                   	</c:choose> 
		                   
		                    <c:forEach var="p" begin="${ Bpi.startPage }" end="${ Bpi.endPage }">
		                    	<li class="page-item"><a class="page-link" href="myBoard.my?bpage=${ p }">${ p }</a></li>
		                    </c:forEach>
		                    
		                    <!-- 마지막 페이지일 경우 비활성화 -->
		                    <c:choose>
								<c:when test="${Bpi.currentPage eq Bpi.maxPage}">
				                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="myBoard.my?bpage=${Bpi.currentPage + 1}">Next</a></li>
								</c:otherwise>
		                    </c:choose>
		                </ul>
	            	</div>
				</div>
				
				<div class="comment">
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">번호</th>
					      <th scope="col">글제목</th>
					      <th scope="col">댓글내용</th>
					      <th scope="col">작성일</th>	      
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach var="b" items="${ Clist }">
						    <tr class="list-area" onclick="listClick(${ c.boardNo });">
						      <th scope="row">${ c.rowNo }</th>
						      <td>${ c.boardTitle }</td>
						      <td>${ c.replyContent }</td>
						      <td>${ c.createDate }</td>
						    </tr>
					  	</c:forEach>
					  </tbody>
					</table>
				
					<div id="pagingArea">
		                <ul class="pagination">
		                	<!-- 1번 페이지일 경우 비활성화 -->
		                	<c:choose>
		                		<c:when test="${Cpi.currentPage eq 1}">
			                	    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item"><a class="page-link" href="myBoard.my?cpage=${Cpi.currentPage - 1}">Previous</a></li>
		                		</c:otherwise>
		                   	</c:choose> 
		                   
		                    <c:forEach var="p" begin="${ Cpi.startPage }" end="${ Cpi.endPage }">
		                    	<li class="page-item"><a class="page-link" href="myBoard.my?cpage=${ p }">${ p }</a></li>
		                    </c:forEach>
		                    
		                    <!-- 마지막 페이지일 경우 비활성화 -->
		                    <c:choose>
								<c:when test="${Cpi.currentPage eq Cpi.maxPage}">
				                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="myBoard.my?cpage=${Cpi.currentPage + 1}">Next</a></li>
								</c:otherwise>
		                    </c:choose>
		                </ul>
	            	</div>
				</div>
			</div>
		</div>
		<div class="end"></div>
	</div>

	<script>
		function listClick(a) {
			// 게시글 상세 url 받아오기
			location.href='?ano=' + a;
		}
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>