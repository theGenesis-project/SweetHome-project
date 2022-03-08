<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성하기</title>
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

</style>
</head>
<body>

	 <jsp:include page="../common/header.jsp" />
	 <jsp:include page="../common/communityNavi.jsp" />
	 
 <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 작성하기</h2>
            <br>

            <form id="enrollForm" method="post" action="" enctype="">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><select name="" id="" class="category">
                            <option value="">판매</option>
                            <option value="">구매</option>
                            </select>
                        </td>
                        <td><input type="text" id="title" class="form-control" name="" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td colspan="2"><input type="text" id="writer" class="form-control" value="user01" name="" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td colspan="2"><textarea id="content" class="form-control" rows="10" style="resize:none;" name="" required></textarea></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    
     <jsp:include page="../common/footer.jsp" />
	

</body>
</html>