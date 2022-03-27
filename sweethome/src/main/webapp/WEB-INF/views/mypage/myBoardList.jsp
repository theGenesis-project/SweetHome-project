<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글/댓글 관리</title>
<link rel="stylesheet" href="resources/css/mypage.css" />
<style type="text/css">
    .delete-button {
        border-radius: 5px;
        margin: 5px;
        border: 0;
        height: 30px;
        color: white;
        background-color: rgb(247, 202, 201);
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<script>
		$(function(){
			// 클릭 시 css 변경 및 내용 변경
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
			
			// 페이지 들어오자마자 myBoard 클릭
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
					      <th><input class="all-checkbox" type="checkbox"></th>
					      <th scope="col">번호</th>
					      <th scope="col">제목</th>
					      <th scope="col">조회수</th>
					      <th scope="col">작성일</th>	      
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach var="b" items="${ Blist }">
						    <tr class="list-area" onclick="return listClick(${ b.boardNo });">
						      <td><input class="checkbox" type="checkbox" value="${ b.boardNo }"></td>
						      <th scope="row">${ b.rowNo }</th>
						      <td>${ b.boardTitle }</td>
						      <td>${ b.count }</td>
						      <td>${ b.createDate }</td>
						    </tr>
					  	</c:forEach>
					  </tbody>
					</table>
					<div class="button-area">
						<button type="button" class="delete-button" data-toggle="modal" data-target="#deleteModal">삭제</button>
					</div>
					<!-- Modal -->
					<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">게시글 삭제</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					      	<p style="text-align: center;">
					      		게시글은 삭제 후 복구할 수 없습니다. <br>
					      		정말 삭제하시겠습니까?	
					      	</p>
					      	<form action="deleteBoard.my" id="deleteMyBoard">
							    <span>&lt;삭제될 게시물&gt;</span>
							    <ul id="deleteList"></ul>
					      	</form>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					        <button type="submit" form="deleteMyBoard" class="btn btn-danger">삭제</button>
					      </div>
					    </div>
					  </div>
					</div>
				
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
					<c:if test="${ not empty Clist }">
						<p style="text-align: center; font-size: 0.8em;">댓글 삭제를 위해서는 게시글 확인이 필요합니다.</p>
					</c:if>
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
			
			console.log($(".list-area").children().eq(0).html() != event.target);
			console.log($(".list-area").children().eq(0).html())
			console.log(event.target)
			
			if($(".checkbox") != $(this).text()){
				// console.log($(this).is(':checked'));
				// $(this).prop("checked", true);
				// return false;
				// location.href='detail.co?bno=' + a;
				
			}
		}
		
		$(function() {
			// 게시글 전체 선택
			$(".all-checkbox").on("change", function() {
				if($(this).is(":checked")) {
					$(".checkbox").prop("checked", true);
				} else {
					$(".checkbox").prop("checked", false);
				}
			})
			
			// 게시글 선택
			$(".checkbox").change("checked", function() {
				// 개별 전체 선택 관련 변수
				var total = $(".checkbox").length;
				var checked = $(".checkbox:checked").length;
				// 삭제 관련 변수
				var deleteNo = $(this).val();
				var deleteTitle = $(this).parent().siblings().eq(1).text();
				
				// 개별 선택으로 모두 선택 시 전체선택 on || 전체 선택 후 개별 취소 시 전체선택 off
				if(checked == total) $(".all-checkbox").prop("checked", true);
				else $(".all-checkbox").prop("checked", false);
				
				// 삭제 modal에 추가
				if($(this).is(":checked")) {
					$("#deleteList").append("<li class='" + deleteNo + "'>" + deleteTitle + "</li>");
					$("#deleteList").append("<input type='hidden' name='boardList' value='" + deleteNo + "'>");
				} else {
					$('#deleteList').find('.'+deleteNo).remove();
				}
			})
			
			// 선택된 게시물 없을 시 삭제 버튼 비활성화
			$(".delete-button").click(function(){
				if($("#deleteList").html() == "") {
					alert("선택된 게시물이 없습니다. 게시글을 선택해주세요.");
					return false;
				}
			})
		})
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>