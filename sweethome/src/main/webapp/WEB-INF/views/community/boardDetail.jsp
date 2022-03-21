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
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
        table * {margin:5px;}
        table {width:100%;}
        .modal-body>form{
        	text-align:center;
        }
        	
        #bottom-button>button{
            float: right;
            color: white;
            background-color: rgb(247, 202, 201);
            border: 0ch;
            padding: 5px;           
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
        .btn{
            color: white;
            background-color: rgb(247, 202, 201);
            border-radius: 3px;
            border: 0ch;
        }
        .btn:hover{
            background-color: rgb(209, 209, 209);
        }
        .rereply-area{
            background-color: rgb(240, 240, 240);
        }
        .buttons{
        	padding:0px;
        }
        .buttons button{
            color: rgb(255, 255, 255);
            background-color: rgb(247, 202, 201);
            border: 0ch;
            border-radius: 3px;
            font-size: 13px;
            padding: 5px;        
        }
        button:hover{
            background-color: rgb(240, 240, 240);
            color: #212529;
        }
        .btn{
            color: rgb(255, 255, 255);
            background-color: rgb(247, 202, 201);
            border: 0ch;
            border-radius: 3px;
        }
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
                    <th width="100">작성일</th>
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
                		<td colspan="3"><a href="${cf.filePath }" download="${cf.originName }">${cf.originName }</a></td>
                	</c:otherwise>
                	</c:choose>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                	
                    <td colspan="4">
                    	<c:if test="${cf.filePath != null }">
                    		<img src="${cf.filePath }" alt="image">
                    	</c:if>
                    	${cm.boardContent }
                    </td>
                </tr>
            </table>
            <br>

            <div align="center">
            <c:choose>
            	<c:when test="${loginUser.userId eq cm.userId }">                  
	                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->                                 
	                <a class="btn btn-primary" onclick="postFormSubmit(1)">수정하기</a>
	                <a class="btn btn-danger" onclick="postFormSubmit(2)">삭제하기</a>
                </c:when>
                <c:otherwise>
	                <!-- 본인이 작성한 글이 아닌 경우  신고하기 버튼-->
	                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">신고하기</button>
                </c:otherwise>
         
            </c:choose>
           
             
            </div>
            
            <form method="post" action="" id="postForm">
            	<input type="hidden" name="bno" value="${cm.boardNo }">   
            	<input type="hidden" name="filePath" value="${cf.changeName }"> 
            	<input type="hidden" name="boardType" value="${cm.boardType }">
            </form>
            	  
            <script>
	            function postFormSubmit(num){
	        		if(num == 1){//수정하기 클릭
	        			$("#postForm").attr("action", "updateBoardView.co").submit();
	        		}else{//삭제하기 클릭
	        			$("#postForm").attr("action", "deleteBoard.co").submit();
	        		}
	        	}
            
            </script>
            <br><br>
        <!-- 댓글 기능은 정보/장터/메이트찾기 게시판에만  -->
		<c:if test="${ cm.boardType != 0 }">
            <table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                        <th colspan="4">
                            <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
                        </th>
                        <th style="vertical-align:middle"><button class="btn btn-secondary" style="background-color: rgb(247, 202, 201); border: 0ch;">등록하기</button></th>
                    </tr>
                    <tr>
                        <td colspan="4">댓글(<span id="rcount">3</span>)</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    	
                        <th colspan="2">user02</th>
                        <td width="600">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ꿀잼</td>
                        <td width="80">2020-03-12</td>
                        <td class="buttons">
                                <!--본인 작성 댓글일 경우 수정하기/삭제하기 아닌 경우 신고하기만!-->
                                <button type="button" class="btn" data-toggle="modal" data-target="#updateReview">수정</button>
                                <button>삭제</button>
                                <button type="button" class="btn" data-toggle="modal" data-target="#rereply">댓글</button>
                         </td>
                         
                    </tr>
                     <tr class="rereply-area">
                            <th width="30">⤷</th>
                            <th>admin</th>
                            <td>뭐</td>
                            <td width="130">2020-03-12</td>
                            <td class="buttons">
                                <!--본인 작성 댓글일 경우 수정하기/삭제하기 아닌 경우 신고하기만!-->
                                <button type="button" class="btn" data-toggle="modal" data-target="#updateReview">수정</button>
                                <button>삭제</button>
                         	</td>              
                        </tr>
                </tbody>
            </table>
            </c:if>
        </div>
        <br><br>

    </div>
    
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
            <form action="reportBoard.co" method="post">
               	<input type="hidden" name="boardNo" value="${cm.boardNo }">
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
	 
	
	  
	  
	  <jsp:include page="../common/footer.jsp" />

</body>
</html>