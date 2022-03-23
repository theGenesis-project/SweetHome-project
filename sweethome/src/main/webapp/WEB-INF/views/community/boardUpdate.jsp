<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
<script type="text/javascript" src="resources/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
        .category{
            width: 100%;
            height: 35px;
            border-radius: 3px;
        }
         #boardContent{
        	height : 100%;	
        }

</style>
</head>
<body>
	 <jsp:include page="../common/header.jsp" />
	 <jsp:include page="../common/communityNavi.jsp" />

 <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 수정하기</h2>
            <br>

            <form id="updateForm" method="post" action="update.co" enctype="multipart/form-data">
                <table align="center">
                 <input type="hidden" id="boardType" name="boardType" value="${cm.boardType }">
                 <input type="hidden" id="userNo" name="userNo" value="${loginUser.userNo }">
                 <input type="hidden" id="boardNo" name="boardNo" value="${cm.boardNo }">
                    <tr>
                        <th><label for="title">제목</label></th>
                       <c:if test="${boardType == 2 }">
                        <td><select name="categoryNo" id="categoryNo" class="category">
                            <option value="2">판매</option>
                            <option value="3">구매</option>
                            </select>
                        </td>
                       </c:if>
                        <td><input type="text" id="title" class="form-control" value="${cm.boardTitle }" name="boardTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td colspan="2"><input type="text" id="writer" class="form-control" value="${cm.userId }" name="userId" readonly></td>
                    </tr>
                    <tr>
                    	<th>첨부파일</th>
                    	<td colspan="2"><input type="file" id="upfile" name="reupfile">
                    	<c:if test="${not empty cf.originName }">
                    		현재 업로드된 파일 : <a href="${cf.changeName }" download="${cf.originName }">${cf.originName }</a>
                    		<input type="hidden" value="${cf.fileNo }" name="fileNo">
                    		<input type="hidden" value="${cf.originName }" name="originName">
                    		<input type="hidden" value="${cf.changeName }" name="changeName">           		
                    		<input type="hidden" value="${cf.filePath }" name="filePath">           		
                    	</c:if>
                    	</td>
                    </tr>
                    <tr>
                        <th><label for="boardContent">내용</label></th>
                        <td colspan="2"><textarea id="boardContent" rows="10" name="boardContent" required>${cm.boardContent }</textarea></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" id="updateBoard" class="btn btn-primary">수정하기</button>
                    <button type="reset" onclick="history.back()" class="btn btn-danger">이전으로</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    
     <script type="text/javascript">
     /*네이버 에디터 */
		 var oEditors = [];
		 nhn.husky.EZCreator.createInIFrame({
		 oAppRef: oEditors,
		 elPlaceHolder: "boardContent",
		 sSkinURI: "resources/smartEditor/SmartEditor2Skin.html",
		 htParams : {
		      // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		      bUseToolbar : true,             
		      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		      bUseVerticalResizer : true,     
		      // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		      bUseModeChanger : true
		  }, 
		 fCreator: "createSEditor2"
		 
		});
		
		$(function(){
			//네이버 에디터
			$("#updateBoard").click(function(){
				// 에디터의 내용이 textarea에 적용된다.
				 oEditors.getById["boardContent"].exec("UPDATE_CONTENTS_FIELD", []);
				 oEditors.getById["boardContent"].exec("LOAD_CONTENTS_FIELD");
				 
				// 에디터의 내용에 대한 값 검증은 이곳에서
				// document.getElementById("ir1").value를 이용해서 처리한다.
				
			})
			//판매 구매 카테고리 셋
			 $('#categoryNo option').each(function(){
	               if($(this).val() == ${cm.categoryNo}){
	                $(this).attr("selected", true);
	               }
	             })
	   })
			
	
	
		
		 
		
	</script>
    
    
     <jsp:include page="../common/footer.jsp" />
	

</body>
</html>