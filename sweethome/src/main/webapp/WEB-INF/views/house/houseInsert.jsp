<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하우스 등록하기</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<%-- Daum 우편번호 서비스 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%-- Kakao Map API: services 라이브러리 --%>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc26f4f2ac186a2ad635ddbe87b694c6&libraries=services"></script>

<style>
	.outer {
		width: 1500px;
		/* border: 1px solid red; */
		margin: auto;
	}
	/* div {
		border: 1px solid red;
	} */
	.house_name {
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
	textarea {
		width: 1000px;
		height: 400px;
		resize: none;
	}

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div class="outer">

		<div class="title">
			<h1>하우스 등록</h1>
		</div>

		<form action="insertHouse.ho" method="post" enctype="multipart/form-data">

			<div class="subtitle">
				<div class="house_name">
					<h3>하우스 이름</h3>
					&nbsp&nbsp <input type="text" name="houseName" placeholder="하우스 이름 입력" required>
				</div>
			</div>

			<div class="house_address">
				<h3>하우스 주소</h3>

				<input type="text" id="postcode" placeholder="우편번호" readonly>
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>

				<input type="text" id="roadAddress" placeholder="도로명 주소" name="address">
				<%-- 예상 주소 출력란 --%>
				<%-- <span id="guide" style="color:#999;display:none"></span> --%>
				<input type="text" id="detailAddress" placeholder="상세 주소 입력">

				<%-- 위도/경도 자동 입력 --%>
				<input type="hidden" id="latitude" name="latitude">
				<input type="hidden" id="longitude" name="longitude">

				<script>
					// Daum 우편번호 서비스
					function execDaumPostcode() {
						new daum.Postcode({
							oncomplete: function(data) {
								// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
								// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

								var roadAddr = data.roadAddress; // 도로명 주소 변수
								var extraRoadAddr = ''; // 참고 항목 변수

								// 건물명이 있고, 공동주택일 경우 추가한다.
								if(data.buildingName !== '' && data.apartment === 'Y') {
									extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
								}

								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('postcode').value = data.zonecode;
								document.getElementById("roadAddress").value = roadAddr;

								// var guideTextBox = document.getElementById("guide");

								// // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
								// if(data.autoRoadAddress) {
								// 	var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
								// 	guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
								// 	guideTextBox.style.display = 'block';

								// } else if(data.autoJibunAddress) {
								// 	var expJibunAddr = data.autoJibunAddress;
								// 	guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
								// 	guideTextBox.style.display = 'block';
								// } else {
								// 	guideTextBox.innerHTML = '';
								// 	guideTextBox.style.display = 'none';
								// }

								// Kakao API: 검색한 주소 정보(상세 주소 제외)에 해당하는 좌표값 요청
								var geocoder = new kakao.maps.services.Geocoder();
								
								var callback = function(result, status) {
									if (status === kakao.maps.services.Status.OK) {
										document.getElementById('latitude').value = result[0].x
										document.getElementById('longitude').value = result[0].y
									}
								};

								geocoder.addressSearch(roadAddr, callback);
							}
						}).open();
					}
				</script>
			</div>

			<div class="house_photo_insert_title">
				<div class="photo_insert_title_01">
					<h3>대표사진</h3>
				</div>
				<div class="photo_insert_title_02">
					<h4>(첫번째 사진이 대표사진으로 지정됩니다)</h4>
				</div>
				
				<br><br>

				
				<div class="house_photo_insert">
					<div class="house_photo" id="house_photo1_1">
						<img id="houseImg1_1" src="" alt="" width="100%" height="100%">
					</div>
					<div class="house_photo" id="house_photo1_2">
						<img id="houseImg1_2" src="" alt="">
					</div>
					<div class="house_photo" id="house_photo1_3">
						<img id="houseImg1_3" src="" alt="">
					</div>
					<div class="house_photo" id="house_photo1_4">
						<img id="houseImg1_4" src="" alt="">
					</div>
					<div class="house_photo" id="house_photo1_5">
						<img id="houseImg1_5" src="" alt="">
					</div>
				</div>

				<div id="file-area1_1">
					<input type="file" id="file1_1" name="file" onchange="loadImg(this, 1);" required>
					<input type="file" id="file1_2" name="file" onchange="loadImg(this, 2);" >
					<input type="file" id="file1_3" name="file" onchange="loadImg(this, 3);" >
					<input type="file" id="file1_4" name="file" onchange="loadImg(this, 4);" >
					<input type="file" id="file1_5" name="file" onchange="loadImg(this, 5);" >
					<!-- onchange: input 태그의 내용물이 변경되었을 때 발생하는 이벤트 -->
					<!-- loadImg() 함수를 호출 => 우리가 만들 함수 -->
				</div>
				
				<!-- <input type="file" multiple id="gallery-photo-add" class="photo_insert_title_03">
				<div class="gallery"></div>	 -->

				<!-- <script>
					$(function() {
						// Multiple images preview in browser
						var imagesPreview = function(input, placeToInsertImagePreview) {

							if(input.files) {
								var filesAmount = input.files.length;

								for(i = 0; i < filesAmount; i++) {
									var reader = new FileReader();

									reader.onload = function(event) {
										$($.parseHTML('<img>')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
									}

									reader.readAsDataURL(input.files[i]);
								}
							}

						};

						$('#gallery-photo-add').on('change', function() {
							imagesPreview(this, 'div.gallery');
						});
					});
				</script> -->


				<script>
				
					$(function() {
						$("#file-area1_1").hide();
	
						$("#house_photo1_1").click(function() {
							$("#file1_1").click();
						})
	
						$("#house_photo1_2").click(function() {
							$("#file1_2").click();
						})
	
						$("#house_photo1_3").click(function() {
							$("#file1_3").click();
						})
	
						$("#house_photo1_4").click(function() {
							$("#file1_4").click();
						})

						$("#house_photo1_5").click(function() {
							$("#file1_5").click();
						})
					})
	
					function loadImg(inputFile, num) {
	
	
						// inputFile: 현재 변화가 생긴 <input type="file"> 요소 객체
						// num: 몇번째 input 요소인지 확인 후, 해당 영역에 미리보기 하기 위한 변수
	
						// console.log(inputFile.files.length);
						// inputFile.files.length: 파일 선택시 1, 파일 선택 취소시 0이 찍힘
						// 파일의 존재 유무를 알 수 있따(inputFile.files[0]에 선택된 파일이 담겨있다)
	
						// files 속성: 업로드된 파일의 정보들을 배열 형식으로 여러개 묶어서 반환
						// 				length는 배열의 크기를 의미
	
						if(inputFile.files.length == 1) { // 파일이 있는 경우
							
							// 선택된 파일을 읽어들여서 그 영역에 맞는 곳에 미리보기
	
							// 파일을 읽어들일 FileReader 객체 생성
							var reader = new FileReader();
	
							// FileREader 객체로부터 파일을 읽어들이는 메소드를 호출
							// 어느 파일을 읽어들이건지 인자로 넣어줘야함!!
							reader.readAsDataURL(inputFile.files[0]);
							// => 해당 파일을 읽어들이는 순간
							//	  읽어들인 파일만의 고유한 url이 부여됨
							// => 해당 url을 src 속성으로 부여할 것!! (attr)
	
							// 파일 읽기가 완료되었을 때 실행할 함수를 정의
							reader.onload = function(e) {
								// e의 target => e.target => 이벤트 당한 객체(this)
	
								// e의 target.result에 각 파일의 url이 담긴다.
								// e.target.result
	
								// 각 영역에 맞춰서 이미지 미리보기
								switch(num) {
									case 1: $("#houseImg1_1").attr("src", e.target.result); break;
									case 2: $("#houseImg1_2").attr("src", e.target.result); break;
									case 3: $("#houseImg1_3").attr("src", e.target.result); break;
									case 4: $("#houseImg1_4").attr("src", e.target.result); break;
									case 5: $("#houseImg1_5").attr("src", e.target.result); break;
								}
	
							}
	
						}
						else {
							switch(num) {
								case 1: $("#houseImg1_1").attr("src", null); break;
								case 2: $("#houseImg1_2").attr("src", null); break;
								case 3: $("#houseImg1_3").attr("src", null); break;
								case 4: $("#houseImg1_4").attr("src", null); break;
								case 5: $("#houseImg1_5").attr("src", null); break;
							}
	
						}
	
					}
	
	
	
				</script>
	



			</div>

			<div class="house_photo_insert_title">
				<div class="photo_insert_title_01"><h3>방 이름</h3></div>
				<div class="photo_insert_title_02"><button class="button button1">파일첨부</button></div>
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

			<button type="button">방 추가</button>


			<div>
				<div class="title">
					<h2>방 정보 등록</h2>
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
							<td><input type="text" name="roomName" required></td>
							<td>
								<input type="radio" name="gender" value="M" required>남성
								<input type="radio" name="gender" value="F" required>여성
							</td>
							<td><input type="text" name="people" required>인실</td>
							<td><input type="text" name="area" required>m2</td>
							<td><input type="text" name="deposit" required>원</td>
							<td><input type="text" name="rent" required>원</td>
							<td><input type="text" name="expense" required>원</td>
							<td><input type="text" name="utility" required>원</td>
							<td><input type="date" name="date" required></td>
							</tr>
					</tbody>
				</table>
			</div>

			<div>
				
				<div class="title">
					<h2>하우스 소개</h2>
				</div>

				<div class="house_intro">
					<textarea name="houseTitle" placeholder="간략한 하우스 소개를 입력해주세요." required></textarea>
				</div>


				<div>
					<textarea name="houseIntroduce" placeholder="하우스에 대한 정보를 자세히 입력해주세요." required></textarea>
				</div>

				<div>
					<div class="title">
						<h2>제공 서비스</h2>
					</div>

					<table>
						<tr>
							<td>공용공간</td>
						</tr>
						<tr>
							<textarea name="shareSpace"></textarea>
						</tr>
						<tr>
							개인공간

						</tr>
						<tr>
							<textarea name="personalSpace"></textarea>
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
							<textarea name="traffic"></textarea>
						</tr>
						<tr>
							편의시설

						</tr>
						<tr>
							<textarea name="convenience"></textarea>
						</tr>
					</table>
				</div>
				
				<div>
					<button type="submit">등록 및 결제</button>
					<button type="reset">취소</button>
				</div>
			</div>
		</form>
	</div>

	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>