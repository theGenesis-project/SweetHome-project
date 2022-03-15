<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하우스 등록</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
	.outer {
		width: 1500px;
		border: 1px solid red;
		margin: auto;
	}
	div {
		border: 1px solid red;
	}
	.house_name_insert {
		display: flex;
		font-size: 25px;
		width: 100%;
	}
	.house_photo_insert_title {
		display: flex;
	}
	.house_photo_insert {
		display: flex;
		justify-content: center;
		width: 100%;
		height: 250px;
	}
	.photo_insert_title_01 {
		flex: none;
	}
	.photo_insert_title_02 {
		flex: none;
	}
	.photo_insert_title_03 {
		flex: auto;
	}
	.button {
		background-color: rgb(247, 202, 201);
  		border: none;
  		color: white;
  		padding: 10px 20px;
  		text-align: center;
  		text-decoration: none;
  		display: inline-block;
  		font-size: 16px;
  		margin: 4px 2px;
  		transition-duration: 0.4s;
  		cursor: pointer;
		float: right;
		border-radius: 12px;
	}
	/* .photo_insert_title_03>button:hover {
		background-color: rgb(247, 202, 201);
	} */
	/* .photo_insert_title_03>button {
		float: right;
	} */
	.house_photo {
		display: inline-block;
		border: 1px solid;
		width: 20%;
    }
	.house_room_info {
		text-align: center;
		margin: auto;
		width: 1200px;
	}
	.house_intro {
		text-align: center;
		/* font-size: 40px; */
		background-color: gainsboro;
	}
	.smarteditors {
		align: center;
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="outer">

		<div class="house_insert">

			<div class="title">
				<h1>하우스 등록</h1>
			</div>

			<form action="" method="post">
				<div class="subtitle">
					<div class="house_name_insert">
						<h3>하우스 이름</h3>
						&nbsp&nbsp <input type="text" name="">
					</div>
				</div>
				<div class="house_photo_insert_title">
					<div class="photo_insert_title_01"><h3>대표사진</h3></div>
					<div class="photo_insert_title_02"><h4>(첫번째 사진이 대표사진으로 지정됩니다)</h4></div>
					<div class="photo_insert_title_03"><button class="button button1">파일첨부</button></div>
				</div>
	
				<div class="house_photo_insert">
					<div class="house_photo">
						<img src="" alt="">
	
					</div>
					<div class="house_photo">
						<img src="" alt="">
	
					</div>
					<div class="house_photo">
						<img src="" alt="">
	
					</div>
					<div class="house_photo">
						<img src="" alt="">
	
					</div>
					<div class="house_photo">
						<img src="" alt="">
	
					</div>
				</div>

				<div class="house_photo_insert_title">
					<div class="photo_insert_title_01"><h3>방 이름</h3></div>
					<div class="photo_insert_title_02"><input type="text" name=""></div>
					<div class="photo_insert_title_03"><button class="button button1">파일첨부</button></div>
				</div>
	
				<div class="house_photo_insert">
					<div class="house_photo">
						<img src="" alt="">
	
					</div>
					<div class="house_photo">
						<img src="" alt="">
	
					</div>
					<div class="house_photo">
						<img src="" alt="">
	
					</div>
					<div class="house_photo">
						<img src="" alt="">
	
					</div>
					<div class="house_photo">
						<img src="" alt="">
	
					</div>
				</div>



			<button>방 추가</button>

		</div>

		<div>
			<div class="title">
				
				<h2>입주 현황</h2>
			</div>

			<table class="house_room_info table table-hover">
				<thead>
					<tr>
						<th>구분</th>
						<th>성별</th>
						<th>타입</th>
						<th>면적</th>
						<th>보증금</th>
						<th>월임대료</th>
						<th>관리비</th>
						<th>선불공과금</th>
						<th>입주가능일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" name="" id=""></td>
						<td>
							<input type="radio" name="gender">남성
							<input type="radio" name="gender">여성
						</td>
						<td><input type="text" name="" id="">인실</td>
						<td><input type="text" name="" id="">m2</td>
						<td><input type="text" name="" id="">원</td>
						<td><input type="text" name="" id="">원</td>
						<td><input type="text" name="" id="">원</td>
						<td><input type="text" name="" id="">원</td>
						<td><input type="date" name="" id=""></td>
					</tr>
				</tbody>
			</table>

			- 투어신청은 입주가능일 30일 전부터 신청 가능합니다. <br>
			- 대기신청을 하시면 입주 신청이 가능한 시기에 문자로 연락을 드립니다.

		</div>

		<div>
			
			<div class="title">
				<h2>하우스 등록</h2>
			</div>
			<div class="house_intro">
				<textarea cols="100" style="resize: none;"></textarea>
			</div>

		</div>

		<div>
			<textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
			
		</div>

		<div>
			<div class="title">
				<h2>제공 서비스</h2>
			</div>

			<table>
				<tr>
					공용공간
				</tr>
				<tr>
					<textarea></textarea>
				</tr>
				<tr>
					개인공간

				</tr>
				<tr>
					<textarea></textarea>
				</tr>
			</table>
		</div>

		<div>
			<div class="title">
				<h2>위치/편의시설</h2>
			</div>

			<table>
				<tr>
					교통시설/접근성
				</tr>
				<tr>
					<textarea></textarea>
				</tr>
				<tr>
					편의시설

				</tr>
				<tr>
					<textarea></textarea>
				</tr>
			</table>
		</div>
		
		<div>
			<button type="submit">등록 및 결제</button>
			<button type="reset">취소</button>
		</div>
	</form>

	</div>

	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>