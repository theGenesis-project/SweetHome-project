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

<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc26f4f2ac186a2ad635ddbe87b694c6&libraries=services"></script>

<style>
	.outer {
		width: 1500px;
		/* border: 1px solid red; */
		margin: auto;
	}
	/* div {
		border: 1px solid red;
	} */
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

			<form action="insertHouse.ho" method="post" onsubmit="">
				<div class="subtitle">
					<div class="house_name_insert">
						<h3>하우스 이름</h3>
						&nbsp&nbsp <input type="text" name="houseName" oninvalid="this.setCustomValidity('하우스 이름을 입력해주세요')" required>
					</div>
				</div>

				<div class="house_address">
                    <h3>하우스 주소</h3>

                    <%-- Daum 우편번호 서비스 --%> 
                    <input type="text" id="postcode" placeholder="우편번호" readonly>
                    <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                    <!-- <input type="text" id="roadAddress" placeholder="도로명주소" name="address" oninvalid="this.setCustomValidity('주소를 입력해주세요')" required readonly> -->
                    <span id="guide" style="color:#999;display:none"></span>
                    <input type="text" id="detailAddress" placeholder="상세주소">

                    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                    <script>
                        function execDaumPostcode() {
                            new daum.Postcode({
                                oncomplete: function(data) {
                                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                                    // var extraRoadAddr = ''; // 참고 항목 변수

                                    // 건물명이 있고, 공동주택일 경우 추가한다.
                                    if(data.buildingName !== '' && data.apartment === 'Y'){
                                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                    }

                                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                    document.getElementById('postcode').value = data.zonecode;
                                    document.getElementById("roadAddress").value = roadAddr;

                                    var guideTextBox = document.getElementById("guide");
                                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                                    if(data.autoRoadAddress) {
                                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                                        guideTextBox.style.display = 'block';

                                    } else if(data.autoJibunAddress) {
                                        var expJibunAddr = data.autoJibunAddress;
                                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                                        guideTextBox.style.display = 'block';
                                    } else {
                                        guideTextBox.innerHTML = '';
                                        guideTextBox.style.display = 'none';
                                    }
                                }
                            }).open();
                        }
                        
						// $(function() {

						// 	function address() {

								
						// 			var address = $("#roadAddress").val() + " " + $("#detailAddress").val();
						// 			$(".house_address").html("<input type='hidden' name='address' value='" + address + "'>");
						// 			console.log(address);
						// 			return false;
									
	
								
						// 	}
						// })


                        
                       /*$(function() {
                        	
                        	$("#submitclick").on("click", function() {
	                            var geocoder = new kakao.maps.services.Geocoder();
	
	                            var callback = function(result, status) {
	                                if (status === kakao.maps.services.Status.OK) {
	                                    console.log(result);
	                                    $(".house_address").html("<input type='hidden' name='x' value='" + result[0].x + "'>");
	                                    $(".house_address").html("<input type='hidden' name='y' value='" + result[0].y + "'>");
	                                }
	                            };
	                            
	                            geocoder.addressSearch(document.getElementById('roadAddress'), callback);
                        		
                        	})
                        	
                        	
                        	
	                            
                        		
                        	
                        	
                        	
                        })*/

                        
                        
                    </script>
                    

                    
                    
                    
                </div>



				<div class="house_photo_insert_title">
					<div class="photo_insert_title_01"><h3>대표사진</h3></div>
					<div class="photo_insert_title_02"><h4>(첫번째 사진이 대표사진으로 지정됩니다)</h4></div>
					<div class="photo_insert_title_03">

					</div>

				<input type="file" multiple id="gallery-photo-add">
<div class="gallery"></div>



					



					
					<script>
					
					$(function() {
					    // Multiple images preview in browser
					    var imagesPreview = function(input, placeToInsertImagePreview) {

					        if (input.files) {
					            var filesAmount = input.files.length;

					            for (i = 0; i < filesAmount; i++) {
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
					</script>
					
					
					
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
						<td><input type="text" name="roomName"></td>
						<td>
							<input type="radio" name="gender">남성
							<input type="radio" name="gender">여성
						</td>
						<td><input type="text" name="people">인실</td>
						<td><input type="text" name="area">m2</td>
						<td><input type="text" name="deposit">원</td>
						<td><input type="text" name="rent">원</td>
						<td><input type="text" name="expense">원</td>
						<td><input type="text" name="utility">원</td>
						<td><input type="date" name="date"></td>
					</tr>
				</tbody>
			</table>

			- 투어신청은 입주가능일 30일 전부터 신청 가능합니다. <br>
			- 대기신청을 하시면 입주 신청이 가능한 시기에 문자로 연락을 드립니다.

		</div>

		<div>
			
			<div class="title">
				<h2>지점 소개</h2>
			</div>
			<div class="house_intro">
				<textarea></textarea>
			</div>

		</div>

		<div>
			<textarea name="houseIntroduce" id="hi"></textarea>
			
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
			<button type="submit" id="submitclick">등록 및 결제</button>
			<button type="reset">취소</button>
		</div>

	</form>

	</div>

	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>