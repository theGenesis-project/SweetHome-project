<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

 #content{
 	width:1500px;
 	margin:auto;
 }
 #title{
 text-align:center;
 }
 #box{
 width: 600px;
 
 height: 700px;
 
 margin:auto;
 
 border:1px solid gray;

 }
 #userName{
  width: 300px;
  margin-left:50px;
 }
 .rounded{
  height:40px;
  margin-left:50px;
  margin-top:30px;
 }
 #askContent{
  width:500px;
  height:250px;
 }
 #phone{
  width:500px;
 }
 #email{
  width:500px;
 }
 #date{
  width:500px;
 }
 .gender{
  margin-left:45px;
 }
 .submit{
  background-color: rgb(247, 202, 201);
  border-radius: 10px;
  width:100px;
  height:40px;
  margin-top: 30px;
  margin-left: 150px;
  outline:none;
  border:none;
 }
 .return{
  background-color: rgb(210, 210, 210);
  border-radius: 10px;
  width:100px;
  height:40px;
  margin-left: 80px;
  outline:none;
  border:none;
 }
</style>
<body>
	<jsp:include page="../common/header.jsp" />
	<br>
	<hr>
	<div id="content">
		<h2 id="title">투어(대기)신청 문의</h2>
		<form action="insertTour.to" method="POST">
			<div id="box">
				<input type="text" id="userName" class="rounded" placeholder="이름 *"><input class="gender" type="radio" name="gender" id="gender1" value="M" checked><label class="form-check-label" for="gender1">남자</label><input class="gender" type="radio" name="gender" id="gender2" value="W"><label class="form-check-label" for="gender2">여자</label>
				<input type="text" id="phone" class="rounded" placeholder="핸드폰 번호 -를 제외한 숫자만 입력해주세요 *">
				<input type="text" id="email" class="rounded" placeholder="이메일 *">
				<input type="text" id="date" class="rounded" placeholder="희망일자" >
				<input type="text" id="askContent" class="rounded" placeholder="문의 사항을 입력해주세요">
				<button type="submit" class="submit">신청하기</button><button class="return"onclick="">취소</button>
			</div>
		</form>
	
	
	
	
	</div>
	<hr>	
	<jsp:include page="../common/footer.jsp" />
	

</body>
</html>