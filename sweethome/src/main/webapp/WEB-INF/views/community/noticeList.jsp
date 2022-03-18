<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<style>
 #main{
            width: 1000px;
            margin: auto;
            margin-top: 50px;     
            margin-bottom: 150px;
        }
        #search{
            margin : 20px 0px 0px 0px;
            height: 30px;
        }
        #search>select{
            height: 100%;
        }
        #search>input[name=search]{
            box-sizing: border-box;
            height: 100%;
        }
        
        #button{
            float: right;   
        
        }
        #button>button{
            background-color: rgb(247, 202, 201);  
            color: white; 
            border: 0ch;
            border-radius: 3px;
            height: 30px;

        }
        #list{
            margin: 40px 0px 40px 0px;          
        }
        table{
            text-align: center;
            margin: auto;
            width: 1000px;
        }
        table tr{
            height: 35px;
        }
        table tr th{
            background-color: rgb(240, 240, 240);
        }
        #paging{
            margin-top: 50px;
            width:fit-content; 
            margin: auto;
        }
        #paging button{
            background-color: rgb(221, 221, 221);
            color: rgb(87, 87, 87);
            padding: 7px;
            border: 0ch;
            border-radius: 3px;
        }

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/communityNavi.jsp" />
	
	<div id="main">
		<div id="title">
		<c:choose>
			<c:when test="${ boardType == 0 }">
				<h2>공지사항</h2>
			</c:when>
			<c:when test="${ boardType == 1 }">
				<h2>정보</h2>
			</c:when>
			<c:when test="${ boardType == 2 }">
				<h2>중고장터</h2>
			</c:when>
			<c:when test="${ boardType == 3 }">
				<h2>메이트 찾기</h2>
			</c:when>
		</c:choose>
		
		
		</div>
		
		<div id="search">
		<c:choose>
			<c:when test="${ boardType == 0 }">
				<form id="searchForm" action="searchNotice.co" method="get">
			</c:when>
			<c:when test="${ boardType == 1 }">
				<form id="searchForm" action="searchInfo.co" method="get">
			</c:when>
			<c:when test="${ boardType == 2 }">
				<form id="searchForm" action="searchFlea.co" method="get">
			</c:when>
			<c:when test="${ boardType == 3 }">
				<form id="searchForm" action="searchMate.co" method="get">
			</c:when>
		</c:choose>
			
				<select name="condition">
				
					<option value="writer">작성자</option>				
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
	            <input type="text" name="keyword">
	            <button type="submit">검색</button>
	          </form>
		</div>

        <div id="button">
            <button onclick="location.href='insertBoardView.co?bType=${boardType}'">글쓰기</button>
        </div>

        <div id="list">
            <table id="boardTable">
            	<thead>
	                <tr>
	                    <th>No.</th>                    
	                    <th>제목</th>
	                    <th>작성자</th>
	                    <th>조회수</th>
	                    <th>작성일</th>
	                </tr>
	            </thead>
	            <tbody>
                
	                <c:choose>
	                	<c:when test="${empty list }">
	                		 <tr>
	                   			 <td colspan="4">게시글이 없습니다.</td>
	                		</tr>
	                	</c:when>
	                	<c:otherwise>
	                		<c:forEach var="n" items="${list }">
			                <tr>
			                    <td>${n.rowNo }</td>
			                    <td class="bno" style="display:none">${n.boardNo }</td>
			                    <td>${n.boardTitle }</td>
			                    <td>${n.userId }</td>  
			                    <td>${n.count }</td>
			                    <td>${n.createDate }</td>
			                </tr>
		                </c:forEach>
	               
	                	</c:otherwise>
	                </c:choose>
                </tbody>
	                
            </table>

        </div>
	<c:if test="${boardType == 0 }">
        <div id="paging">
        	<c:if test="${ pi.currentPage ne 1 }">
        		<c:choose>
        			<c:when test="${empty condition }">
        				<button onclick="location.href='notice.co?npage=${pi.currentPage - 1}'">&lt;</button> 
        			</c:when>
        			<c:otherwise>
        				<button onclick="location.href='searchNotice.co?npage=${pi.currentPage - 1}&condition=${condition }&keyword=${keyword }'">&lt;</button>
        			</c:otherwise>
        		</c:choose>
        	</c:if>
        	
        	<c:forEach var="n" begin="${pi.startPage }" end="${pi.endPage }" step="1">
        		<c:choose>
        			<c:when test="${empty condition }">
        				<button onclick="location.href='notice.co?npage=${n}'">${ n }</button>
        			</c:when>
        			<c:otherwise>
        				<button onclick="location.href='searchNotice.co?npage=${n}&condition=${condition }&keyword=${keyword }'">${n}</button>
        			</c:otherwise>
        		</c:choose>
        	</c:forEach>
        	
        	<c:if test="${ pi.currentPage ne pi.maxPage }">
        		<c:choose>
        			<c:when test="${empty condition }">
        				<button onclick="location.href='notice.co?npage=${pi.currentPage + 1}'">&gt;</button> 
        			</c:when>
        			<c:otherwise>
        				<button onclick="location.href='searchNotice.co?npage=${pi.currentPage + 1}&condition=${condition }&keyword=${keyword }'">&gt;</button>
        			</c:otherwise>
        		</c:choose>
        	</c:if>
  
        </div>
		</c:if>
		
		<c:if test="${boardType == 1 }">
        <div id="paging">
        	<c:if test="${ pi.currentPage ne 1 }">
        		<c:choose>
        			<c:when test="${empty condition }">
        				<button onclick="location.href='info.co?ipage=${pi.currentPage - 1}'">&lt;</button> 
        			</c:when>
        			<c:otherwise>
        				<button onclick="location.href='searchInfo.co?ipage=${pi.currentPage - 1}&condition=${condition }&keyword=${keyword }'">&lt;</button>
        			</c:otherwise>
        		</c:choose>
        	</c:if>
        	
        	<c:forEach var="n" begin="${pi.startPage }" end="${pi.endPage }" step="1">
        		<c:choose>
        			<c:when test="${empty condition }">
        				<button onclick="location.href='info.co?ipage=${n}'">${ n }</button>
        			</c:when>
        			<c:otherwise>
        				<button onclick="location.href='searchInfo.co?ipage=${n}&condition=${condition }&keyword=${keyword }'">${n}</button>
        			</c:otherwise>
        		</c:choose>
        	</c:forEach>
        	
        	<c:if test="${ pi.currentPage ne pi.maxPage }">
        		<c:choose>
        			<c:when test="${empty condition }">
        				<button onclick="location.href='info.co?ipage=${pi.currentPage + 1}'">&gt;</button> 
        			</c:when>
        			<c:otherwise>
        				<button onclick="location.href='searchInfo.co?ipage=${pi.currentPage + 1}&condition=${condition }&keyword=${keyword }'">&gt;</button>
        			</c:otherwise>
        		</c:choose>
        	</c:if>
  
        </div>
		</c:if>
		
	</div>
	
	<script>
		$(function(){
			if(${boardType == 0}){
				$("#boardTable>tbody>tr").click(function(){
					location.href = 'detail.co?bno='+$(this).children(".bno").text();
				})
				
			}if(${boardType == 1}){
				$("#boardTable>tbody>tr").click(function(){
					location.href = 'detail.co?bno='+$(this).children(".bno").text();
				})
			}
			
			
		})
	
		
	</script>
	
	 <jsp:include page="../common/footer.jsp" />
	 
</body>
</html>