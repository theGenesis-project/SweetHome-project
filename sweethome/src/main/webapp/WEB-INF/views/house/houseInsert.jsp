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
	input[type=file]{
		display: none;
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div class="outer">
		
		<h1>하우스 등록</h1>

		<form action="insertHouse.ho" method="post" enctype="multipart/form-data" id="insertHouse">
			<div class="form-group">
			
				<%-- 방별 파일 개수 확인 --%>
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

				<input type="text" id="roadAddress" class="form-control" placeholder="도로명 주소" size="60" required readonly>
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
										document.getElementById('latitude').value = result[0].x;
										document.getElementById('longitude').value = result[0].y;
									}
								};

								geocoder.addressSearch(roadAddr, callback);
							}
						}).open();
					}
				</script>

				<%-- 하우스 대표 사진 --%>
				<h3>대표 사진</h3>

				<a class="button btn1">사진 첨부</a>
				<input type='file' id='insert-image-0' name='upfile' multiple='multiple' onchange='insertImage(this)' required>
				<div id='image-0' class='att-image' data-placeholder='사진을 첨부 하려면 사진 첨부 버튼을 클릭하세요'></div>

				<%-- 방 정보 등록 --%>
				<h2>방 정보 등록</h2>

				<div id='room-1'>
					<h3>방 사진</h3>

					<a class='button btn1'>사진 첨부</a>
					<input type='file' id='insert-image-1' name='upfile' multiple='multiple' onchange='insertImage(this);' required>
					<div id='image-1' class='att-image' data-placeholder='사진을 첨부 하려면 사진 첨부 버튼을 클릭하세요'></div>

					<h3>방 정보</h3>
					<table>
						<tr>
							<td>방 이름(호수 등)</td>
							<td><input type='text' name='roomNameArr' class='form-control' required></td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
								<div class='form-group'>
									<select class='form-control' name='genderArr'>
										<option value='M'>남성</option>
										<option value='F'>여성</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td>타입</td>
							<td><input type='number' name='peopleArr' class='form-control' min='1' required></td>
							<td>인실</td>
						</tr>
						<tr>
							<td>면적</td>
							<td><input type='number' name='areaArr' class='form-control' min='1' required></td>
							<td>m2</td>
						</tr>
						<tr>
							<td>보증금</td>
							<td><input type='number' name='depositArr' class='form-control' min='1' required></td>
							<td>원</td>
						</tr>
						<tr>
							<td>월임대료</td>
							<td><input type='number' name='rentArr' class='form-control' min='1' required></td>
							<td>원</td>
						</tr>
						<tr>
							<td>관리비</td>
							<td><input type='number' name='expenseArr' class='form-control' min='1' required></td>
							<td>원</td>
						</tr>
						<tr>
							<td>선불공과금</td>
							<td><input type='number' name='utilityArr' class='form-control' min='1' required></td>
							<td>원</td>
						</tr>
						<tr>
							<td>입주가능일</td>
							<td><input type='date' name='availableDateArr' class='form-control' required></td>
						</tr>
					</table>
				</div>

				<%-- 방 추가 버튼 클릭시, 추가 요소 생성 영역 --%>
				<div id='insert-room'></div>

				<div class="btn-group">
					<button type="button" class='btn btn-primary' id='insert-room-btn'>방 추가</button>
					<button type="button" class='btn btn-danger' id='remove-room-btn'>방 삭제</button>
				</div>

				<%-- 사진 관련 스크립트 --%>
				<script>

					// 방 추가 버튼 클릭시 몇 번째 방인지 확인용 변수
					var roomNum = 2;

					// 방 추가 버튼 클릭시 '#insert-room'에 추가되는 요소
					$(function() {
						$("#insert-room-btn").click(function() {

							var addRoom = "<div id='room-" + roomNum + "'>"
								+ "<h3>방 사진</h3>"
								+ "<a class='button btn1'>사진 첨부</a>"
								+ "<input type='file' id='insert-image-" + roomNum + "' name='upfile' multiple='multiple' onchange='insertImage(this);' required>"
								+ "<div id='image-" + roomNum + "' class='att-image' data-placeholder='사진을 첨부 하려면 사진 첨부 버튼을 클릭하세요'></div>"
								+ "<h3>방 정보</h3>"
								+ "<table>"
								+ "<tr>"
								+ "<td>방 이름(호수 등)</td>"
								+ "<td><input type='text' name='roomNameArr' class='form-control' required></td>"
								+ "</tr>"
								+ "<tr>"
								+ "<td>성별</td>"
								+ "<td>"
								+ "<div class='form-group'>"
								+ "<select class='form-control' name='genderArr'>"
								+ "<option value='M'>남성</option>"
								+ "<option value='F'>여성</option>"
								+ "</select>"
								+ "</div>"
								+ "</td>"
								+ "</tr>"
								+ "<tr>"
								+ "<td>타입</td>"
								+ "<td><input type='number' name='peopleArr' class='form-control' min='1' required></td>"
								+ "<td>인실</td>"
								+ "</tr>"
								+ "<tr>"
								+ "<td>면적</td>"
								+ "<td><input type='number' name='areaArr' class='form-control' min='1' required></td>"
								+ "<td>m2</td>"
								+ "</tr>"
								+ "<tr>"
								+ "<td>보증금</td>"
								+ "<td><input type='number' name='depositArr' class='form-control' min='1' required></td>"
								+ "<td>원</td>"
								+ "</tr>"
								+ "<tr>"
								+ "<td>월임대료</td>"
								+ "<td><input type='number' name='rentArr' class='form-control' min='1' required></td>"
								+ "<td>원</td>"
								+ "</tr>"
								+ "<tr>"
								+ "<td>관리비</td>"
								+ "<td><input type='number' name='expenseArr' class='form-control' min='1' required></td>"
								+ "<td>원</td>"
								+ "</tr>"
								+ "<tr>"
								+ "<td>선불공과금</td>"
								+ "<td><input type='number' name='utilityArr' class='form-control' min='1' required></td>"
								+ "<td>원</td>"
								+ "</tr>"
								+ "<tr>"
								+ "<td>입주가능일</td>"
								+ "<td><input type='date' name='availableDateArr' class='form-control' required></td>"
								+ "</tr>"
								+ "</table>"
								+ "</div>";

							$("#insert-room").append(addRoom);
							roomNum++;
						})
					})
					
					// 방 삭제 버튼 클릭시 마지막에 생성된 방 정보 등록 요소 삭제
					$("#remove-room-btn").click(function() {
						if(roomNum> 2) {
							roomNum--;

							// 삭제할 div의 아이디 생성용 변수
							var rommNo = "room-" + roomNum;
							
							$("#" + rommNo).remove();
						}
					})
					
					var imageBtn = ""; // 클릭한 [input=file] 버튼 요소
					var attImage = ""; // 클릭한 [input=file]에 선택된 이미지의 미리보기 영역 요소

					var sel_files = [];
					var sel_files_obj = {};
					
					// 사진 첨부 버튼 클릭시
					$(function() {
						$("body").on("click", "a", function() {

							// 클릭된 사진 첨부 버튼 아래 [input=file] & 미리보기 생성 영역 가져오기
							imageBtn = ($(this).next())[0];
							attImage = ($(this).next().next())[0];
							
							$(this).next().click();
						})
					})

					// 이미지와 체크박스를 감싸는 div의 속성
					var div_style = 'display: inline-block; position: relative; width: 150px; height: 120px; margin: 5px; border: 1px; solid #00f; z-index: 1;';
					// 미리보기 이미지 속성
					var img_style = 'width: 100%; height: 100%; z-index: none;';
					// 이미지 안 표시되는 체크 박스 속성
					var chk_style = 'width: 30px; height: 30px; position: absolute; font-size: 20px; right: 0px; bottom: 0px; z-index: 999; background-color: rgba(255,255,255,0.1); color: #f00;';
					
					// [input=file] 요소가 변경될 경우
					function insertImage(inputFiles) {

						// 선택된 이미지가 5개 이하인지 확인
						if(inputFiles.files.length > 5) {
							alert("사진은 5개 이하만 선택할 수 있습니다.");
							return inputFiles.value = "";
						}

						// 파일 새로 추가시 기존 미리보기 삭제
						var inputFilesId = inputFiles.getAttribute("id");
						var currentNum = inputFilesId.substring(inputFilesId.length - 1, inputFilesId.length);
						var attImageName = "image-" + currentNum;

						$("#" + attImageName).children().remove();

						// 추가하고자 하는 파일의 배열 만들기
						var files = inputFiles.files;
						var fileArr = Array.prototype.slice.call(files);

						for(f of fileArr){
							imageLoader(f, currentNum);
						}
						
						// 몇 번째 방의 파일인지 확인하는 객체 추가
						sel_files_obj[currentNum] = sel_files;
						sel_files = [];

					}

					// 첨부된 이미지들을 배열에 넣고 미리보기
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

					// 첨부된 파일이 있는 경우 checkbox와 함께 attImage에 추가할 div를 만들어 반환
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
					<button type="button" class="btn btn-warning" onclick="formCheck()">등록 및 결제</button>
					<button class="btn btn-danger" type="reset">취소</button>
					<button type="submit" id="submit-click"></button>
				</div>
						
				<script>
					// 등록 버튼 숨기기
					$(function() {
						$("#submit-click").hide();
					})
					
					// 등록 및 결제 전 확인
					function formCheck() {
						// 도로명 주소 + 상세 주소 합치기
						var address = document.getElementById("roadAddress").value + " " + document.getElementById("detailAddress").value;
						var addressHtml = "<input type='hidden' name='address' value='"+ address +"'>";

						$(".add").append(addressHtml);

						// 각 사진에 해당하는 이름 정리
						var sel_files_obj_length = Object.keys(sel_files_obj).length;
						var fileNumber = []

						// 하우스 수정용
						for(var i = 0; i < sel_files_obj_length; i++) {
							fileNumber.push(sel_files_obj[i].length);
						}

						var fileNumberHtml = "<input type='hidden' name='fileNumber' value='" + fileNumber + "'>";
						$(".add").append(fileNumberHtml);

						$("#submit-click").click();
					}
				</script>
			</div>
		</form>
	</div>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>