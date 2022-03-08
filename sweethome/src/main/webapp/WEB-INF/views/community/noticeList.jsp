<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
			<h2>공지사항</h2>
		</div>
		
		<div id="search">
			<select name="" id="">
				<option value="">제목</option>
				<option value="">내용</option>
			</select>
            <input type="text" id="" name="search">
		</div>

        <div id="button">
            <button>글쓰기</button>
        </div>

        <div id="list">
            <table>
                <tr>
                    <th>No.</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
                <tr>
                    <td>2</td>
                    <td>[공지]고객센터 운영 안내</td>
                    <td>작성자</td>                  
                    <td>2022-02-03</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>[공지]홈페이지 오픈</td>
                    <td>관리자</td>
                    <td>2022-02-03</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>[공지]홈페이지 오픈</td>
                    <td>관리자</td>
                    <td>2022-02-03</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>[공지]홈페이지 오픈</td>
                    <td>관리자</td>
                    <td>2022-02-03</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>[공지]홈페이지 오픈</td>
                    <td>관리자</td>
                    <td>2022-02-03</td>
                </tr>

            </table>

        </div>

        <div id="paging">
            <button>&lt;</button> 
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>&gt;</button>
        </div>
	
	</div>
	
	 <jsp:include page="../common/footer.jsp" />
	 
</body>
</html>