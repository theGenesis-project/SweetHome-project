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
	.house_room_info {
		text-align: center;
		/* margin: auto; */
		/* width: 1200px; */
	}
	#att_zone {
		width: 660px;
		min-height: 150px;
		padding: 10px;
	}
	#att_zone:empty:before {
		content: attr(data-placeholder);
		color: #999;
		font-size: .9em;
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div class="outer">
		
		<h1>하우스 등록</h1>
		
		
		<script>	
			// 각 사진에 해당하는 이름 정리
			function filenamecheck() {

				console.log($('#file' + 3));

				if(!($('#file' + 3).length)) {
					console.log("ㅎㅎㅎㅎ");
				}

				var file = $(':file');

				//console.log(file[0]);

				//console.log(file.length);

				// console.log($('#file1').prop('files'));
				
				var files = $('#file1').prop('files');
				
				//console.log(files[0].name);
				
				alert($('#file1'));

				var fileArray = [ 1, 2, 3 ];

				console.log(fileArray);
				console.log()

				$(".add").html("<input type='hidden' name='fileArray' value='" + fileArray + "'>");
				// 다차원배열 사용
				
				alert("ㅇㅇ");

				$("#insertHouse").submit();
			}
		</script>
		

		<form action="insertHouse.ho" method="post" enctype="multipart/form-data" id="insertHouse">
			<div class="form-group">
			
				<%-- 방 이름 추가 --%>
				<div class="add"></div>
				
				<h3>하우스 이름</h3>
				<input type="text" class="form-control" name="houseName" placeholder="하우스 이름 입력" required>
		
				<h3>하우스 주소</h3>

				<input type="text" class="form-control" id="postcode" placeholder="우편번호" readonly>
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>

				<input type="text" id="roadAddress" placeholder="도로명 주소" name="address" size="60" required readonly>
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

				<div class="house_photo_insert_title">

					<h3>대표사진</h3>
					<h4>(첫번째 사진이 대표사진으로 지정됩니다)</h4>
					<button class="button button1">파일첨부</button>
				</div>
				
				<div id='image_preview'>
					<input type='file' id='btnAtt' multiple='multiple' onchange="test1(this);">
					<div id='att_zone' data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
				</div>
				
				<%-- 사진 관련 스크립트 --%>
				<script>

					var attZone = document.getElementById('att_zone');
					console.log(attZone);
					var btnAtt = document.getElementById('btnAtt');
					console.log(btnAtt)
					var sel_files = [];
				
					// 이미지와 체크 박스를 감싸고 있는 div 속성
					var div_style = 'display:inline-block;position:relative;width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
					// 미리보기 이미지 속성
					var img_style = 'width:100%;height:100%;z-index:none';
					// 이미지안에 표시되는 체크박스의 속성
					var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
					
					function test1(inputFile){
						console.log(inputFile.files);
						var files = inputFile.files;
						var fileArr = Array.prototype.slice.call(files)
						for(f of fileArr){
							imageLoader(f);
						}
					}

					/* 첨부된 이미리즐을 배열에 넣고 미리보기 */
					imageLoader = function(file) {
						sel_files.push(file);
						var reader = new FileReader();
						
						reader.onload = function(ee) {
							let img = document.createElement('img')
							img.setAttribute('style', img_style)
							img.src = ee.target.result;
							console.log(attZone);
							attZone.appendChild(makeDiv(img, file));
						}
						
						reader.readAsDataURL(file);
					}

					/* 첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
					makeDiv = function(img, file) {
						var div = document.createElement('div')
						div.setAttribute('style', div_style)
						
						var btn = document.createElement('input')
						btn.setAttribute('type', 'button')
						btn.setAttribute('value', 'x')
						btn.setAttribute('delFile', file.name);
						btn.setAttribute('style', chk_style);
						
						btn.onclick = function(ev) {
							var ele = ev.srcElement;
							var delFile = ele.getAttribute('delFile');
							
							for(var i = 0; i < sel_files.length; i++) {
								if(delFile == sel_files[i].name) {
									sel_files.splice(i, 1);
								}
							}
							
							dt = new DataTransfer();
							
							for(f in sel_files) {
								var file = sel_files[f];
								dt.items.add(file);
							}
							
							btnAtt.files = dt.files;
							var p = ele.parentNode;
							attZone.removeChild(p)
						}
						
						div.appendChild(img)
						div.appendChild(btn)
						
						return div;
					}
				</script>

				<button type="button">방 추가</button>
				
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
				<textarea name="shareSpace" class="form-control" style="resize: none;"></textarea>
				<h4>개인공간</h4>
				<textarea name="personalSpace" class="form-control" style="resize: none;"></textarea>

				<h2>위치/편의시설</h2>

				<h4>교통시설/접근성</h4>
				<textarea name="traffic" class="form-control" style="resize: none;"></textarea>
				<h4>편의시설</h4>
				<textarea name="convenience" class="form-control" style="resize: none;"></textarea>

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