<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글상세보기</title>
<style>
 .content {
            background-color:white;
            width:1200px;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
        table * {margin:5px;}
        table {width:100%;}
</style>
</head>
<body>
	 <jsp:include page="../common/header.jsp" />
	 <jsp:include page="../common/communityNavi.jsp" />
	 
	  <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 상세보기</h2>
            <br>

            <a class="btn btn-secondary" style="float:right;" href="">목록으로</a>
            <br><br>

            <table id="contentArea" align="center" class="table">
                <tr>
                	<c:if test="${ cm.boardType == 2 }" >              	
		                <th width="80">분류</th> 
		                <td width="50">${cm.categoryName }</td>
	                </c:if>           	
                    <th width="100">제목</th>
                    <td colspan="3">${cm.boardTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${cm.userId }</td>
                    <th>작성일</th>
                    <td>${cm.createDate }</td>
                </tr>
                <tr>
                	<th>첨부파일</th>
                    <c:choose>
                    <c:when test="${empty cf.originName}">
                    <!-- 첨부파일이 없을 경우 -->
                	<td colspan="3">
                  			첨부파일이 없습니다.</td>
                  	</c:when>
                  	<c:otherwise>
                		<td colspan="3"><a href="${cf.changeName }" download="${cf.originName }">${cf.originName }</a></td>
                	</c:otherwise>
                	</c:choose>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4">${cm.boardContent }</td>
                </tr>
            </table>
            <br>

            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 
                                           본인이 작성한 글이 아닌 경우  신고하기 버튼-->
                <a class="btn btn-primary" onclick="postFormSubmit(1)">수정하기</a>
                <a class="btn btn-danger" onclick="postFormSubmit(2)">삭제하기</a>
                <!-- 신고하기 만들기 -->
            </div>
            
            <form method="post" action="" id="postForm">
            	<input type="hidden" name="bno" value="${cm.boardNo }">   
            	<input type="hidden" name="filePath" value="${cf.changeName }"> 
            </form>
            	  
            <script>
	            function postFormSubmit(num){
	        		if(num == 1){//수정하기 클릭
	        			$("#postForm").attr("action", "updateBoardView.co").submit();
	        		}else if(num == 2){//삭제하기 클릭
	        			$("#postForm").attr("action", "deleteBoard.co").submit();
	        		}else{
	        			//신고 만들기~
	        			
	        		}
	        	}
            
            </script>
            <br><br>
        <!-- 댓글 기능은 정보/장터/메이트찾기 게시판에만  -->
		<c:if test="${ cm.boardType != 0 }">
            <table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                        <th colspan="2">
                            <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
                        </th>
                        <th style="vertical-align:middle"><button class="btn btn-secondary" style="background-color: rgb(247, 202, 201); border: 0ch;">등록하기</button></th>
                    </tr>
                    <tr>
                        <td colspan="3">댓글(<span id="rcount">3</span>)</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>user02</th>
                        <td>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ꿀잼</td>
                        <td>2020-03-12</td>
                    </tr>
                    <tr>
                        <th>user01</th>
                        <td>재밌어요</td>
                        <td>2020-03-11</td>
                    </tr>
                    <tr>
                        <th>admin</th>
                        <td>댓글입니다!!</td>
                        <td>2020-03-10</td>
                    </tr>
                </tbody>
            </table>
            </c:if>
        </div>
        <br><br>

    </div>
	 
	  
	  
	  
	  <jsp:include page="../common/footer.jsp" />

</body>
</html>