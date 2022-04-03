<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/mypage.css" />
<style>
	ul {
		list-style: none;
	}
	a {
		text-decoration: none;
	}
	.order-group-item {
		display: table;
		width: 100%;
		min-height: 161px;
		padding: 0px;
		table-layout: fixed;
		border-bottom: 1px solid #a5a5a5;
	}
	.order-group-item>div{
		display: table-cell;
		vertical-align: middle;
	}
	.item-area {
		position: relative;
	}
	.item-thumb {
		overflow: hidden;
		width: 100px;
		height: 100px;
		text-align: center;
		float: left;
		margin-right: 30px;
		line-height: 100px;
	}
	.item-thumb img {
		vertical-align: middle;
	}
	.item-info {
		font-size: 13px;
		float: left;
	}
	.items {
		display: block;
	}
	.name {
		max-width: 100%;
		overflow: hidden;
		color: black;
		font-size: 16px;
		white-space: nowrap;
		text-overflow: ellipsis;
		text-decoration: none;
	}
	.info {
		margin: 8px 0px 12px;
		padding: 0;
	}
	.info>li {
		display: inline-block;
		color: black;
		font-size: 14px;
		line-height: 18px;
	}
	.date {
		position: relative;
		color: #a5a5a5 !important;
		margin: 0 0 0 8px !important;
		padding-left: 11px;
	}
	.guide {
		margin-top: 10px;
		padding-top: 10px;
		color: #646465;
		line-height: 18px;
		border-top: 1px solid #f4f6f7;
		margin-bottom: 0px;
	}
	.seller-area {
		width: 150px;
	}
	.seller-area > * {
		display: block;
	}
	.seller {
		overflow: hidden;
		max-width: 100%;
		white-space: nowrap;
		text-overflow: ellipsis;
		margin-bottom:5px;
		text-align: center;
		font-size: 15px;
	}
	.tel {
		text-align: center;
		margin-bottom: 5px;
		color: #a5a5a5;
		font-size: 11px;
	}
	.ask-button {
		text-align: center;
		border: 0;
		height: 20px;
		margin: 0 auto;
		color: #a5a5a5;
		font-size: 12px;
		line-height: 18px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="sweethome-container">
		<div class="sub-nav">
			<jsp:include page="../common/mypageNavi.jsp"/>
		</div>
		<!-- 마이페이지 시작 -->
		<div class="mypage"> 
			<!-- 이너바디 시작 -->
			<div class="order">
				<%-- 아이템 리스트 시작 --%>
				<ul class="order-group-list">
				<!-- 리스트 아이템 시작 -->
				<c:forEach var="o" items="${ orderlist }">
				  <li class="order-group-item active" aria-current="true">
				  	<div class="item-area">
					  	<a href="#" class="item-thumb">
					  		<img src="${ o.filePath }" alt="이미지 준비중...🖼️">
					  	</a>
					  	<div class="item-info">
					  		<a href="#" class="items">
					  			<span class="name">
					  				${ o.interiorTitle }
					  			</span>
					  			<ul class="info">
					  				<li>${ o.interiorPrice }</li>
					  				<li class="date">${ o.orderDate }</li>
					  			</ul>
					  		</a>
					  		<c:choose >
					  			<c:when test="${ o.orderStatus eq 0 }">
							  		<span>배송준비중</span>
							  		<p class="guide">주문하신 상품은 배송 준비중입니다.</p>
					  			</c:when>
					  			<c:when test="${ o.orderStatus eq 1 }">
					  				<span>출고 완료</span>
							  		<p class="guide">주문하신 상품은 배송 준비중입니다.</p>
					  			</c:when>
					  			<c:when test="${ o.orderStatus eq 2 }">
					  				<span>배송중</span>
							  		<p class="guide">주문하신 상품은 배송 준비중입니다.</p>
					  			</c:when>
					  			<c:when test="${ o.orderStatus eq 3 }">
					  				<span>배송 완료</span>
							  		<p class="guide">구매가 완료되었습니다. 이용해주셔서 감사합니다.</p>
					  			</c:when>
					  		</c:choose>
					  	</div>
				  	</div> 
				  	<div class="seller-area">
				  		<span class="seller">${ o.interiorCo }</span>
				  		<span class="tel">${ o.interiorPost }</span>
				  		<button type="button" class="ask-button" onclick="location.href='askForm'">문의하기</button>
				  	</div>
				  	<div class="button-area">
				  	</div>
				  </li>
				</c:forEach>
				  <!-- 리스트 아이템 끝 -->
				</ul>
				<%-- 아이템 리스트 끝 --%>
				<%-- 페이징 처리 시작 --%>
				<div id="pagingArea">
	                <ul class="pagination">
	                	<!-- 1번 페이지일 경우 비활성화 -->
	                	<c:choose>
	                		<c:when test="${pi.currentPage eq 1}">
		                	    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item"><a class="page-link" href="myBoard.my?bpage=${pi.currentPage - 1}">Previous</a></li>
	                		</c:otherwise>
	                   	</c:choose> 
	                   
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<li class="page-item"><a class="page-link" href="myBoard.my?bpage=${ p }">${ p }</a></li>
	                    </c:forEach>
	                    
	                    <!-- 마지막 페이지일 경우 비활성화 -->
	                    <c:choose>
							<c:when test="${pi.currentPage eq pi.maxPage}">
			                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="myBoard.my?bpage=${pi.currentPage + 1}">Next</a></li>
							</c:otherwise>
	                    </c:choose>
	                </ul>
            	</div>
            	<%-- 페이징처리 끝 --%>
			</div>
			<!-- 이너바디 끝 -->
		</div>
		<!-- 마이페이지 끝 -->
		<div class="end">
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>