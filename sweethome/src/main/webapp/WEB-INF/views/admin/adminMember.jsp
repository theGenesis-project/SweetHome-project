<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<style>
	.admin-container{
		height: 100vh;
		width: 100vw;
	}
	.sub_nav {
	width: 15vw;
	float: left;
	height: auto;
	}
	
	.mypage {
		float: left;
		width: 75vw;
		position: relative;
	}
	
	.end{
		clear: both;
	}

	 .content{
            /*border: 1px solid rgb(247, 202 , 201);*/
            width: 1000px;
            margin: auto;
            
      }
      .memberList{
      		/*border: 1px solid black;*/
      		width : 800px;
      		text-align : center;
      }
      tr th{
      		background-color:rgb(247, 202 , 201);
      }
      .memberM{
      		padding-left: 100px;
      		font-wight : bold;
      		font-size : 20px
      }
      .btn{
      		height:35px;
      }
      #pagingArea {width:fit-content; margin:auto;}
     

</style>
</head>
<body>
 	<!-- 메뉴바 -->
	<jsp:include page="../common/header.jsp" />
	
	<div class="admin-container">
		<div class="sub_nav">
			<jsp:include page="adminNavi.jsp"/>
		</div>
		<div class="mypage"> 
			<br><br>
			<div class="content">
				<br><br>
				<div class="memberM">회원관리</div>
					<table id="memberList" class="memberList" align="center">
						<thead>
							<tr>
								<th>회원번호</th>
			                    <th>회원구분</th>
			                    <th>아이디</th>
			                    <th>이름</th>
			                    <th>이메일</th>
			                    <th>가입</th>
			                    <th>상태(Y/N)</th>
			                    <th>관리</th>
			                 </tr>
			            </thead>
			            <tbody>
			            	<c:forEach var="m" items="${Mlist}">
			               	<tr>
			               		<td>${m.userNo }</td>
			                    <td>${m.userType }</td>
			                    <td>${m.userId }</td>
			                    <td>${m.userName }</td>
			                    <td>${m.email }</td>
			                    <td>${m.enrollDate }</td>
			                    <td>Y</td>
			                    <td>
									&nbsp;<button class="btn update" style="background-color:lightblue;">수정</button> &nbsp;
									<button type="button" class="member-button delete btn" data-toggle="modal" data-target="#deleteModal" style="background-color:rgb(250, 150 , 150);">삭제</button>
								<td>
			                </tr>
			                </c:forEach>
			                 
			           	</tbody>
					</table>
					<br><br>
					<div id="pagingArea">
						<ul class="pagination">
							<!-- 1번 페이지일 경우 비활성화 -->
						    <c:choose>
						    	<c:when test="${pi.currentPage eq 1}">
							    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
						        </c:when>
						        <c:otherwise>
						             <li class="page-item"><a class="page-link" href="memberList.me?mpage=${pi.currentPage - 1}">Previous</a></li>
						        </c:otherwise>
						    </c:choose> 
						                   
						    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						        <li class="page-item"><a class="page-link" href="memberList.me?mpage=${ p }">${ p }</a></li>
						    </c:forEach>
						                    
						    <!-- 마지막 페이지일 경우 비활성화 -->
						    <c:choose>
						    	<c:when test="${pi.currentPage eq pi.maxPage}">
						    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="memberList.me?mpage=${pi.currentPage + 1}">Next</a></li>
								</c:otherwise>
						    </c:choose>
						 </ul>
					 </div>
				</div>
			</div>
		<div class="end">
		</div>
	</div>	
	
	<!-- 회원 삭제 모달창 -->
	<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
			<div align="center">
				회원을 삭제하시겠습니까?<br>
			</div>
			<br>
			<form action="" id="delete-form">
				<input type="hidden" name="userNo" value="">
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="submit" form="delete-form" class="btn btn-danger">탈퇴</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
