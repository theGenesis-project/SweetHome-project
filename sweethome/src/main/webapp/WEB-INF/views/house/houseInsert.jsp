<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하우스 등록하기</title>
<%-- Daum 우편번호 서비스 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%-- Kakao Map API: services 라이브러리 --%>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc26f4f2ac186a2ad635ddbe87b694c6&libraries=services"></script>
<style>
	.outer {
		width: 1500px;
		margin: auto;
	}
	div {
		border: 1px solid red;
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
	.button:hover {
  		color: white;
  		text-decoration: none;
	}
	.house_room_info {
		text-align: center;
		/* margin: auto; */
		/* width: 1200px; */
	}
	.att-image {
		width: 100%;
		min-height: 150px;
		padding: 10px;
	}
	.att-image:empty:before {
		content: attr(data-placeholder);
		color: #999;
		font-size: .9em;
	}
	/* input[type=file]{
		display: none;
	} */
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div class="outer">
		
		<h1>하우스 등록</h1>
		
		
		<script>	
			// 각 사진에 해당하는 이름 정리
			function filenamecheck() {

				console.log(sel_files_obj);
				console.log(sel_files_obj[0][0].name);







				$(".add").html("<input type='hidden' name='fileObj' value='" + sel_files_obj + "'>");
				// 다차원배열 사용
				
				alert("ㅇㅇ");

				// $("#insertHouse").submit();
			}
		</script>


		<form action="insertHouse.ho" method="post" enctype="multipart/form-data" id="insertHouse">
			<div class="form-group">
			
				<%-- 방 이름 추가 --%>
				<div class="add"></div>
				
				<h3>하우스 이름</h3>
				<input type="text" class="form-control" name="houseName" placeholder="하우스 이름 입력" required>
		
				<h3>하우스 주소</h3>

				<div class="input-group mb-3">
					<input type="text" class="form-control" id="postcode" placeholder="우편번호" readonly>

					<div class="input-group-append">
						<input type="button" class="btn btn-success" onclick="execDaumPostcode()" value="우편번호 찾기">
					</div>
				</div>

				<input type="text" id="roadAddress" class="form-control" placeholder="도로명 주소" name="address" size="60" required readonly>
				<input type="text" id="detailAddress" class="form-control" placeholder="상세 주소 입력">

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

				<h3>대표사진</h3>
				<h4>(첫번째 사진이 대표사진으로 지정됩니다)</h4>

				<a class="button btn1">사진 첨부</a>
				<input type='file' id='insert-image-0' name='upfile' multiple='multiple' onchange='insertImage(this)'>
				<div id='image-0' class='att-image' data-placeholder='사진을 첨부 하려면 사진 첨부 버튼을 클릭하세요'></div>

				<h3>방 사진</h3>
				<input type='text' name='roomName' class='form-control' placeholder='해당 방 이름을 입력하세요'>

				<a class='button btn1'>사진 첨부</a>
				<input type='file' id='insert-image-1' name='upfile' multiple='multiple' onchange='insertImage(this);'>
				<div id='image-1' class='att-image' data-placeholder='사진을 첨부 하려면 사진 첨부 버튼을 클릭하세요'></div>

				<%-- 방 추가 버튼 클릭시, 추가 요소 생성 영역 --%>
				<div id='insert-room'></div>

				<a class='btn' id='insert-room-btn'>방추가</a>


				<%-- 사진 관련 스크립트 --%>
				<script>

					// 방 추가 버튼 클릭시 몇 번째 방인지 확인
					var imageNum = 2;

					// 방 추가 버튼
					$(function() {
						$("#insert-room-btn").click(function() {
							var addRoom = "<h3>방 사진</h3>"
								+ "<input type='text' name='roomName' class='form-control' placeholder='해당 방 이름을 입력하세요'>"
								+ "<a class='button btn1'>사진 첨부</a>"
								+ "<input type='file' id='insert-image-" + imageNum + "' name='upfile' multiple='multiple' onchange='insertImage(this);'>"
								+ "<div id='image-" + imageNum + "' class='att-image' data-placeholder='사진을 첨부 하려면 사진 첨부 버튼을 클릭하세요'></div>";

							$("#insert-room").append(addRoom);
							imageNum++;
						})
					})
					
					var attImage = "";
					var imageBtn = "";
					var sel_files = [];
					var sel_files_obj = {};
					
					// 사진 첨부 버튼 클릭
					$(function() {
						$("body").on("click", "a", function() {
							attImage = ($(this).next().next())[0];
							imageBtn = ($(this).next())[0];
							// 사진 첨부 버튼 다음 input[type=file] 요소 클릭
							$(this).next().click();
						})
					})

					// 이미지와 체크 박스를 감싸고 있는 div 속성
					var div_style = 'display: inline-block; position: relative; width: 150px; height: 120px; margin: 5px; border: 1px; solid #00f; z-index: 1;';
					// 미리보기 이미지 속성
					var img_style = 'width: 100%; height: 100%; z-index: none;';
					// 이미지안에 표시되는 체크박스의 속성
					var chk_style = 'width: 30px; height: 30px; position: absolute; font-size: 20px; right: 0px; bottom: 0px; z-index: 999; background-color: rgba(255,255,255,0.1); color: #f00;';
					
					// <input type='file'> 태그 변화 감지시
					function insertImage(inputFiles) {

						// 업로드 하려는 이미지가 5개 이하인지 확인
						if(inputFiles.files.length > 5) {
							alert("사진은 5개 이내로 업로드할 수 있습니다.");
							return inputFiles.value = "";
						}

						// 파일 새로 추가시 기존 미리보기 삭제
						var getId = inputFiles.getAttribute("id");
						var currentNum = getId.substring(getId.length - 1, getId.length);
						var name = "image-" + currentNum;

						$("#" + name).children().remove();

						var files = inputFiles.files;
						var fileArr = Array.prototype.slice.call(files);

						for(f of fileArr){
							imageLoader(f, currentNum);
						}
						
						sel_files_obj[currentNum] = sel_files;
						sel_files = [];

					}

					/* 첨부된 이미지들을 배열에 넣고 미리보기 */
					imageLoader = function(file, currentNum) {
						sel_files.push(file);
						var reader = new FileReader();
						
						reader.onload = function(ee) {
							var img = document.createElement('img');
							img.setAttribute('style', img_style);
							img.src = ee.target.result;
							attImage.appendChild(makeDiv(img, file, currentNum));
						}
						
						reader.readAsDataURL(file);
					}

					/* 첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
					makeDiv = function(img, file, currentNum) {
						var div = document.createElement('div');
						div.setAttribute('style', div_style);
						
						var btn = document.createElement('input');
						btn.setAttribute('type', 'button');
						btn.setAttribute('value', 'x');
						btn.setAttribute('class', 'img' + currentNum);
						btn.setAttribute('delFile', file.name);
						btn.setAttribute('style', chk_style);
						
						btn.onclick = function(ev) {
							var ele = ev.srcElement;
							var delFile = ele.getAttribute('delFile');

							console.log(ele);
							
							for(var i = 0; i < sel_files_obj[currentNum].length; i++) {
								if(delFile == sel_files_obj[currentNum][i].name) {
									sel_files_obj[currentNum].splice(i, 1);
								}
							}
							
							dt = new DataTransfer();
							
							for(f in sel_files_obj[currentNum]) {
								var file = sel_files_obj[currentNum][f];
								dt.items.add(file);
							}

							console.log("왜 들어옴");

							var className = ele.getAttribute("class");
							attImage = ($("." + className).parent().parent())[0];

							var attId = attImage.getAttribute("id");
							imageBtn = ($("#" + attId).prev())[0];

							imageBtn.files = dt.files;
							
							var p = ele.parentNode;
							attImage.removeChild(p);
						}
						
						div.appendChild(img);
						div.appendChild(btn);
						
						return div;
					}
				</script>

				
				<h2>방 정보 등록</h2>
				
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
				
				<h2>하우스 소개</h2>
				<textarea name="houseTitle" class="form-control" placeholder="간략한 하우스 소개를 입력해주세요." style="resize: none;" required></textarea>
				<textarea name="houseIntroduce" class="form-control" placeholder="하우스에 대한 정보를 자세히 입력해주세요." style="resize: none;" required></textarea>
				
				<h2>제공 서비스</h2>

				<h4>공용공간</h4>
				<textarea name="shareSpace" class="form-control" placeholder="공용공간 소개를 입력해주세요." style="resize: none;"></textarea>
				<h4>개인공간</h4>
				<textarea name="personalSpace" class="form-control" placeholder="개인공간 소개를 입력해주세요." style="resize: none;"></textarea>

				<h2>위치/편의시설</h2>

				<h4>교통시설/접근성</h4>
				<textarea name="traffic" class="form-control" placeholder="교통시설/접근성 소개를 입력해주세요." style="resize: none;"></textarea>
				<h4>편의시설</h4>
				<textarea name="convenience" class="form-control" placeholder="편의시설 소개를 입력해주세요." style="resize: none;"></textarea>

				<div class="btn-group">
					<button class="btn btn-warning" onclick="filenamecheck()">등록 및 결제</button>
					<button class="btn btn-danger" type="reset">취소</button>
				</div>

			</div>
		</form>
	</div>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>