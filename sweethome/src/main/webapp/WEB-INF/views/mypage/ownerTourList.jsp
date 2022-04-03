<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투어 신청 관리</title>
<link rel="stylesheet" href="resources/css/mypage.css" />
<style>
	.tour-detail>span{
		font-size: 0.8em;
		font-weight: bold;
		margin-bottom: 20px;
		color: gray;
	}
	.tour-detail>p{
		font-weight: 400;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<script>
		$(function(){
			var status = $('input[name=statusVal]').val();
			var select = $('select[name=status]')
			
			// 현재 상태를 select 기본값으로 지정
			if(status == 'N') {
				select.val('N').prop('selected', true);
			} else if (status == 'Y') {
				select.val('Y').prop('selected', true);
			} else {
				select.val('R').prop('selected', true);
			}
			
			// select값 바꾸면 바꿔서 저장하기
			select.on('change', function(){
				$.ajax({
					url: "tourStatusChange.my",
					type: "post",
					data: {
							status: select.val(),
							tourNo: $(this).prev().val()
						},
					success: function(result){
						if(result > 0){
							window.location.reload();
						} else {
							alert("데이터 전송 실패! 다시 시도해주세요.");								
							window.location.reload();
						}
					}, error: function(){
						alert("데이터 전송 실패! 다시 시도해주세요.");
						window.location.reload();
					}
				})
				
				// ajax 끝
			})
			// select.on 끝
		})
		// function 끝
		
		// modal 창 띄우기
		function modalOpen(e){
			// select 이외의 tr 태그 클릭 시 모달창 띄우기
			if(event.target.name != 'status') $('#exampleModal').modal('show');
		}
	</script>
	
	<div class="sweethome-container">
		<div class="sub-nav">
			<jsp:include page="../common/mypageNavi.jsp"/>
		</div>
		<!-- 마이페이지 시작 -->
		<div class="mypage"> 
			<%-- 투어 신청 내역이 없을 경우 --%>
			<c:choose>
				<c:when test="${empty Tlist}">
					<div class="empty-list">
						<p>
		        			신청한 투어 내역이 없습니다😢<br>
		        			<a href="house.se"><b>투어 신청하러 가기>></b></a>
		        		</p>
					</div>
				</c:when>
				<c:otherwise>
				<button type="button" class="house-button btn-pink btn-right" onclick="location.href='house.se';">투어 승인하기</button>
					<%-- 승인 테이블 시작 --%>
					<table class="table">
				        <thead>
				          <tr>
				            <th scope="col">번호</th>
				            <th scope="col">날짜</th>
				            <th scope="col">신청인</th>
				            <th scope="col">승인여부</th>
				            <th scope="col"></th>
				          </tr>
				        </thead>
				        <tbody>
				        	<c:forEach var="t" items="${ Tlist }">
				        		<%-- tr 시작 --%>
				        		<tr class="tour-list" onclick="modalOpen(this);">
								  <th scope="row">${ t.rownum }</th>
								  <td>${ t.timeString }</td>
								  <td>${ t.userName }</td>
								  <c:choose>
								  	<c:when test="${ t.status eq 'Y' }">
									  <td><span class="badge badge-pill badge-info">승인 완료</span></td>
								  	</c:when>
								  	<c:when test="${ t.status eq 'R' }">
								  	  <td><span class="badge badge-pill badge-danger">승인 거절</span></td>
								  	</c:when>
								  	<c:otherwise>
									  <td><span class="badge badge-pill badge-secondary">승인 대기</span></td>
								  	</c:otherwise>
								  </c:choose>
								  <td>
								  	<input type="hidden" name="statusVal" value="${ t.status }">
								  	<input type="hidden" name="tourNo" value="${ t.tourNo }">
								  	<select name="status">
								  		<option value="N">승인 대기</option>
								  		<option value="Y">승인 완료</option>
								  		<option value="R">승인 거절</option>
								  	</select>
								  </td>
								</tr>
								<%-- tr 끝 --%>
								<%-- 승인 모달 시작 --%>
							    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							        <div class="modal-dialog modal-dialog-centered">
							        <div class="modal-content">
							            <div class="modal-header">
							            <h5 class="modal-title" id="exampleModalLabel"><b>투어 신청 내역</b></h5>
							            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							                <span aria-hidden="true">&times;</span>
							            </button>
							            </div>
							            <div class="modal-body">
							            	<div class="tour-detail">
							            		<span>투어일</span>
							            		<p>${ t.timeString }</p>
							            	</div>
							            	<div class="tour-detail">
							            		<span>투어 하우스</span>
							            		<p>
							            			${ t.houseName } ${ t.roomName }
							            		</p>
							            	</div>
							            	<div class="tour-detail">
							            		<span>투어 신청인</span>
							            		<p>${ t.userName } [${ t.age }세 / ${ t.gender }] </p>
							            	</div>
							            	<div class="tour-detail">
							            		<span>전화번호</span>
							            		<p>${ t.phone }</p>
							            	</div>
							            	<div class="tour-detail">
							            		<span>이메일</span>
							            		<p>${ t.email }</p>
							            	</div>
							            	<div class="tour-detail">
							            		<span>문의사항</span>
							            		<p>${ t.askContent }</p>
							            	</div>
							            	<div class="tour-detail">
							            		<span style="color: red;">투어 시 주의사항</span>
							            		<p>
							            			1. 지각 금지(투어 시간 엄수!!) <br>
							            			2. 소란 피우지 않기(이웃을 배려해주세요.) <br>
							            			4. 메이트와 오너 간 대화 시 친절한 어투 사용하기 <br>
							            		</p>
							            	</div>
							            </div>
							            <div class="modal-footer">
							            <button type="button" class="house-button btn-lightgray" data-dismiss="modal">닫기</button>
							            <button type="button" class="house-button btn-pink" onclick="window.open('newChat?other=${t.userNo}&houseName=${ t.houseName }', '하우스톡톡', 'height=100%, menubar=no, status=no, tollbar=no, location=no')">채팅하기</button>
							            </div>
							        </div>
							        </div>
							    </div>
							    <%-- 승인 모달 끝 --%>
				        	</c:forEach>
				        </tbody>
				    </table>
					<%-- 승인테이블끝 --%>
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
								<c:when test="${pi.currentPage eq Bpi.maxPage}">
				                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="myBoard.my?bpage=${pi.currentPage + 1}">Next</a></li>
								</c:otherwise>
		                    </c:choose>
		                </ul>
	            	</div>
	            	<%-- 페이징처리 끝 --%>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 마이페이지 끝 -->
		<div class="end">
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>