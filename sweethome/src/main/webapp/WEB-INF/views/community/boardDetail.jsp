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
            <br><br><br>

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
            <c:if test="${!empty loginUser }">
            <c:choose>
            	<c:when test="${(loginUser.userId eq cm.userId) || (loginUser.userId eq 'admin')}">                  
	                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->                                 
	                <a class="btn btn-primary" onclick="postFormSubmit(1)">수정하기</a>
	                <a class="btn btn-danger" onclick="postFormSubmit(2)">삭제하기</a>
                </c:when>
                <c:otherwise>
	                <!-- 본인이 작성한 글이 아닌 경우  신고하기 버튼-->
	                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">신고하기</button>
                </c:otherwise>
         
            </c:choose>
           </c:if>
             
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
                	<c:choose>
                    		<c:when test="${ empty loginUser }">
	                    <tr>
	                        <th colspan="4">
	                            <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;" readonly>로그인 후 이용해주세요</textarea>
	                        </th>
	                        <th style="vertical-align:middle"><button class="btn btn-secondary" style="background-color: rgb(247, 202, 201); border: 0ch; disabled" >등록하기</button></th>
	                    </tr>
	               </c:when>
	               <c:otherwise>   
	                     <tr>
	                        <th colspan="4">
	                            <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
	                        </th>
	                        <th style="vertical-align:middle"><button class="btn btn-secondary" style="background-color: rgb(247, 202, 201); border: 0ch;" onclick="addReply()">등록하기</button></th>
	                    </tr>
                   </c:otherwise>
                  </c:choose>
                    <tr>
                        <td colspan="4">댓글란</td>
                    </tr>
                </thead>
                <tbody>
                    <!-- 댓글 리스트 들어갈 영역 -->                 
                </tbody>
            </table>
            </c:if>
        </div>
        <br><br>
    </div>
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
            <form action="reportBoard.co" method="post">
               	<input type="hidden" name="boardNo" value="${cm.boardNo }">
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
    
    <!-- 댓글 신고 -->
    <div class="modal fade" id="reportReply">
        <div class="modal-dialog">
        <div class="modal-content">
        
            <!-- Modal Header -->
            <div class="modal-header">
	            <h4 class="modal-title">신고하기</h4>
	            <button type="button" class="close" data-dismiss="modal">×</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
            <form action="reportReply.co" method="post">
               	<input type="hidden" name="replyNo" class="mReplyNo" value="">
               	<input type="hidden" name="userNo" value="${loginUser.userNo }">
               	<input type="hidden" name="boardNo" value="${cm.boardNo }">
                <select name="reportCate">
                    <option value="1">스팸, 홍보, 도배</option>
                    <option value="2">욕설 및 음란물</option>
                    <option value="3">불법정보</option>
                    <option value="4">개인정보 노출</option>
                </select>
            </div>
            	<button type="submit" id="modal-button">신고하기</button>
            </form> 
        </div>
        </div>
    </div>
    
    <!-- 수정 모달 시작 -->
      <div class="modal" id="updateReply">
                <div class="modal-dialog">
                  <div class="modal-content">
              
                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title">리뷰 수정하기</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    	<!-- 댓글 수정 -->
	              		<form action="updateReply.co" method="post">
		                    <!-- Modal body -->
		                    <div class="modal-body">
		                    	<!-- 같이 보낼 것 : 댓글 넘버 -->
		                    	<input type="hidden" name="replyNo" class="mReplyNo" value="">
		                    	<input type="hidden" name="boardNo" class="mBoardNo" value="">
		                        <textarea class="form-control mContent" name="replyContent" cols="55" rows="2" style="resize:none; width:100%;">댓글 내용 들어있음</textarea>
		                    </div>
		              
		                    <!-- Modal footer -->
		                    <div class="modal-footer">
		                      <button type="submit" class="btn">확인</button>
		                    </div>
              			</form>
              			
                  </div>
                </div>
            </div>
    
    <script>
	    $(function(){
			selectReplyList();
			
			
		})
    	
		function addReply(){//댓글 작성용
			//아무것도 없을 때 요청 불가능하게!		
			if($("#content").val().trim() != 0 ){			
					$.ajax({					
						url : "replyInsert.co",
						data : {
							boardNo : ${ cm.boardNo },
	    					replyContent : $("#content").val(), 
	    					userNo : ${loginUser.userNo }	
						},
						success : function(result){
							if(result == "YY"){
	    					
								selectReplyList();
	    						$("#content").val("");
							}else{
								console.log("???")
							}
						},
						error : function(){
							console.log("댓글 작성 실패");
						}
					})//ajax끝
				}else{
					alertify.alert("댓글을 올바르게 입력해주세요.");			
				}
			}
	    
	    function selectReplyList(){//댓글 불러오기
			$.ajax({
				url : "replyList.co",
				data : {
					boardNo : ${cm.boardNo}
				},
				success : function(list){
					console.log(list)
					let value = "";
					
					for(let i in list){
						value += "<tr>"
									+ "<th class='replyNo' style='display:none'>" + list[i].replyNo + "</th>"
									+ "<th colspan='2'>" + list[i].userId + "</th>"
									+ "<td width='600' class='replyContent'>" + list[i].replyContent+ "</td>"
									+ "<td width='100'>" + list[i].createDate+ "</td>";
									
									
								if(("${loginUser.userId}" == list[i].userId) || ("${loginUser.userId}" == 'admin' )){
	
								value += "<td class='buttons'>" 
										+ "<button type='button' class='btn updateContent' data-toggle='modal' data-target='#updateReply'>" + "수정"  + "</button>"
										+ "<button class='deleteContent'>" + "삭제"  + "</button>"
										+ "</td>";							
								}else{
									value += "<td class='buttons'>" 								
											+ "<button type='button' class='btn reportReply' data-toggle='modal' data-target='#reportReply'>" + "신고"  + "</button>"
											+ "</td>";	
								}	
								value += "</tr>";
			
							
					}
					$("#replyArea tbody").html(value);
				},
				error : function(){
					console.log("조회 실패")
				}				
			})
		}
	    
	    $(function(){
	    
	    	$(document).on("click", ".updateContent", function(){
	    		
	    		//console.log($(this).parents().siblings(".replyContent").text())
    			$(".mContent").val($(this).parents().siblings(".replyContent").text());
    			//console.log($(this).parents().siblings(".replyNo").text())
    			$(".mReplyNo").val($(this).parents().siblings(".replyNo").text());
    			//console.log(${cm.boardNo})
    			$(".mBoardNo").val(${cm.boardNo});
	    		
	    	})
	    	
	    	$(document).on("click", ".deleteContent", function(){
	    			 var rno = $(this).parents().siblings(".replyNo").text();
	    			 var bno = ${cm.boardNo};
	    			 
	    			 var con = confirm("삭제하시겠습니까?");
	    			 
	    			 if(con == true){
	    				 location.href = "deleteReply.co?replyNo=" +  rno + "&boardNo=" + bno;
	    			 }
	    		})
	    
		    $(document).on("click", ".reportReply", function(){
		    		    	 
		    	 $(".mReplyNo").val($(this).parents().siblings(".replyNo").text());
		    	
		    })
		    
	    })
	    
    
    
    </script>
	 
	
	  
	  
	  <jsp:include page="../common/footer.jsp" />

</body>
</html>