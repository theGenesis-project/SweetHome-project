<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 관리</title>
<link rel="stylesheet" href="resources/css/mypage.css" />
<link rel="stylesheet" href="resources/css/ask.css" />
<style>
#pagingArea {
	width: fit-content; 
	margin:auto;	
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="sweethome-container">
		<div class="sub_nav">
			<jsp:include page="../common/mypageNavi.jsp" />
		</div>
		<div class="mypage">
			<button type="button" class="ask-button" onclick="location.href='askForm';">1:1 문의 작성</button>
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">번호</th>
			      <th scope="col">문의제목</th>
			      <th scope="col">작성일</th>
			      <th scope="col">답변 여부</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="a" items="${ list }">
				    <tr class="list-area" onclick="listClick(${a.askNo});">
				      <th scope="row" class="askNo">${ a.askNo }</th>
				      <td>${ a.askTitle }</td>
				      <td>${ a.askDate }</td>
				      <td>
				      	<c:choose>
				      		<c:when test="${ a.askComment eq 'Y' }">
				      			<span class="badge badge-pill badge-success">답변 완료</span>
				      		</c:when>
				      		<c:otherwise>
				      			<span class="badge badge-pill badge-light">답변 대기</span>
				      		</c:otherwise>
				      	</c:choose>
				      </td>
				    </tr>
			    </c:forEach>
			  </tbody>
			</table>
			
			<div id="pagingArea">
                <ul class="pagination">
                	<!-- 1번 페이지일 경우 비활성화 -->
                	<c:choose>
                		<c:when test="${pi.currentPage eq 1}">
	                	    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage - 1}">Previous</a></li>
                		</c:otherwise>
                   	</c:choose> 
                   
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="list.bo?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <!-- 마지막 페이지일 경우 비활성화 -->
                    <c:choose>
						<c:when test="${pi.currentPage eq pi.maxPage}">
		                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1}">Next</a></li>
						</c:otherwise>
                    </c:choose>
                </ul>
            </div>
            
            <script>
				// 메뉴바 높이 지정
				if(${list.size() lt 7}) {
					$(".mypage").height('550');
					$("#pagingArea").css({'position': 'absolute'
										, 'bottom': '0px'
										, 'left': '0px'
										, 'right':'0px'});
				}
				
				function listClick(a) {
					location.href='detail.ask?ano=' + a;
				}
				
			</script>
		</div>
		<div class="end"></div>
	</div>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>