<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>결제 완료~</h1>

<button onclick="orderInfoDetail()">주문 확인하러 가기~</button>

<script>
	function orderInfoDetail(){
		
		location.href = "orderInfoDetail.in?orderNo=3";
		
		
	}

</script>


</body>
</html>