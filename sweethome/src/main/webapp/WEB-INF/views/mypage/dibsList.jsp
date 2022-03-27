<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 내역 관리</title>
<link rel="stylesheet" href="resources/css/mypage.css" />
<link rel="stylesheet" href="resources/css/dibs.css" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<script>
		$(function(){
			// 클릭 시 css 변경 및 내용 변경
			$('.myHouse').bind("click", function(){
				$('.myHouse').css("background-color", "rgb(247, 201, 202)");
				$('.myInterior').css("background-color", "");
				$('.house').show();
				$('.interior').hide();
			})
			
			$('.myInterior').bind("click", function(){
				$('.myInterior').css("background-color", "rgb(247, 201, 202)");
				$('.myHouse').css("background-color", "");
				$('.house').hide();
				$('.interior').show();
			})
			
			// 페이지 들어오자마자 myHouse 클릭
			$('.myHouse').trigger("click");
		})

		// 더보기 버튼 클릭 시 추가되는 하우스에 대한 함수
		function moreHouse(id, limit) {
			// 현재 페이지에 있는 content 갯수
			var list_length = $("." + id).children('li').length
			
			$.ajax({
				url: "getMoreHouse.my",
				type: "post",
				data: {
					"callLength": list_length,
					"limit": limit
				}, 
				success: function(list){
					// 게시물 추가
					for(let i in list.data) {
						console.log(list.data[i].houseGender);
						var item = $('<li class="myhouse-item"></li>');
						var a = $('<a href=""></a>');
						var img = $('<img class="thumbnail" src="https://www.dgdr.co.kr/upload/jijum/238342658_ZC6fgFLl_20211028123745.jpg" alt="썸네일 이미지">');
						var thumb_title = $('<span class="thumb-title mtb3"></span>');
						
						var thumb_desc = $('<ul class="thumb-desc mtb3"></ul>');
						var li1 = $('<li>'+list.data[i].houseGender+'</li>');
						var li2 = $('<li> 월'+ list.data[i].monthly +'만원~</li>');
						
						var status1 = $('<span class="status1 mtb3">입주 가능</span>');
						var status2 = $('<span class="status2 mtb3">입주 대기</span>');
						
						thumb_title.text(list.data[i].houseName);
						thumb_desc.append(li1);
						thumb_desc.append(li2);
						
						a.append(img);
						a.append(thumb_title);
						a.append(thumb_desc);
						if(list.data[i].status == 'Y'){
							a.append(status1);
						} else {
							a.append(status2);
						}
						
						item.append(a);
						$(".myhouse-wrap").append(item);
					}
					
					// 더이상 보여줄 게시물 없으면 더보기버튼 없애기
					if(list.remain == 0){ 
						$(".more_btn_area").hide();
					}
				}, error: function(){
					alert("게시글을 불러오는데 실패했습니다. 다시 시도해주세요.");
				}
			})
		}
		
		// 더보기 버튼 클릭 시 추가되는 인테리어에 대한 함수
		function moreInterior(id, limit) {
			// 현재 페이지에 있는 content 갯수
			var list_length = $("#" + id).children('div').length

			$.ajax({
				url: "getMoreInterior.my",
				data: {
					"callLength": list_length,
					"limit": limit
				}, 
				success: function(result){
					// 게시물 추가
					for(let j in result.data) {
						var interior_list = $('<div class="interior_list"></div>');
						var input = $('<input type="checkbox">');
						
						var thumbnail_area = $('<div class="thumbnail-area"></div>');
						thumbnail_area.html('<img src="'+result.data[j].filePath+'" alt="사진 준비중...🖼️">');
						
						var interior_com = $('<div class="interior_com"></div>');
						interior_com.html("<p>"+result.data[j].interiorCo+"</p>");
						
						var interior_title = $('<div class="interior_title"></div>');
						interior_title.html('<p class="target">'+result.data[j].interiorTitle+'</p>');
						
						var interior_price = $('<div class="interior_price"></div>');
						interior_price.html('<p>'+result.data[j].won+'</p>')
						
						interior_list.append(input);
						interior_list.append(thumbnail_area);
						interior_list.append(interior_com);
						interior_list.append(interior_title);
						interior_list.append(interior_price);
						
						$('#interior-area').append(interior_list);
					}
					// 더이상 보여줄 게시물 없으면 더보기버튼 없애기
					if(result.remain == 0){ 
						$(".more_btn_area").hide();
					}
				}, error: function() {
					alert("게시글을 불러오는데 실패했습니다. 다시 시도해주세요.");
				}
			})

		}
	</script>
	<div class="sweethome-container">
	<!-- 서브네비 -->
		<div class="sub-nav">
			<jsp:include page="../common/mypageNavi.jsp"/>
		</div>
	<!-- 서브네비끝 -->
	<!-- 마이페이지 시작 -->
		<div class="mypage"> 
			<!-- 이너네비 시작 -->
			<div class="inner-nav">
				<!-- 메이트인 경우 찜 목록 두 개 보이기 -->
				<c:if test ="${ loginUser.userType eq 'M'}">
					<div class="inner-nav-area">
							<div class="myHouse inner-nav-content">	
								<b>하우스🏡</b>
							</div>
							<div class="myInterior inner-nav-content">
								<b>인테리어🛋️</b>
							</div>
							<div class="end"></div>
					</div>
				</c:if>
			</div>
			<!-- 이너네비 끝 -->
			<!-- 이너바디 시작 -->
			<div class="inner-body">
				<!-- 하우스 찜 시작 -->
				<c:if test="${ loginUser.userType eq 'M'}">
				<div class="house">
					<%-- 하우스리스트가 없을 경우 --%>
					<c:if test="${ empty Hlist }">
			        	<div class="empty-list">
			        		<p>
			        			아직 찜한 집이 없습니다😢<br>
			        			<a href=""><b>하우스 보러가기>></b></a>
			        		</p>
			        	</div>
			        </c:if>
			        <%-- 하우스 리스트 --%>
			        <ul class="myhouse-wrap">
			        <c:forEach var="h" items="${ Hlist }">
			        	<li class="myhouse-item">
			                <a href="">
			                <img class="thumbnail" src="https://www.dgdr.co.kr/upload/jijum/238342658_ZC6fgFLl_20211028123745.jpg" alt="썸네일 이미지">
			                <span class="thumb-title mtb3">${ h.houseName }</span>
			                <ul class="thumb-desc mtb3">
			                    <li>${ h.houseGender }</li>
			                    <li>월 ${ h.monthly }만원~</li>
			                </ul>
			                <c:choose>
								<c:when test="${ h.status eq 'Y' }">
					                <span class="status1 mtb3">입주 가능</span>
								</c:when>
								<c:otherwise>
									<span class="status2 mtb3">입주 대기</span>
								</c:otherwise>			                
			                </c:choose>
			                </a>
			            </li>
			        </c:forEach>
			        </ul>
			        <%-- 하우스 리스트 끝 --%>
			        <br>
			        <%-- 더보기 버튼 --%>
			        <c:if test="${ HlistCount gt 0 }">
						<div class="more_btn_area" align="center">
							<button class="btn btn-outline-info" type="button" 
								onclick="moreHouse('myhouse-wrap', 6)">더보기(More)</button>
						</div>
			        </c:if>
			        <%-- 더보기 버튼 끝 --%>
			    </div>
				</c:if>
				<!-- 하우스 찜 끝 -->
				<!-- 인테리어 찜 시작 -->
				<div class="interior">
					<!-- 하우스리스트가 없을 경우 -->
					<c:if test="${ empty Ilist }">
			        	<div class="empty-list">
			        		<p>
			        			아직 찜한 인테리어가 없습니다😢<br>
			        			<a href=""><b>인테리어 보러가기>></b></a>
			        		</p>
			        	</div>
			        </c:if>
					<!-- 인테리어 리스트 -->
					<div id="interior-area">
						<c:forEach var="I" items="${ Ilist }">
							<div class="interior_list">
								<input type="checkbox">
							       <div class="thumbnail-area">
							           <img src="${ I.filePath }" alt="사진 준비중...🖼️">
							       </div>
							       <div class="interior_com">
							           <p>${ I.interiorCo }</p>
							       </div>
							       <div class="interior_title">
							           <p class="target">${ I.interiorTitle }</p>
							       </div>
							       <div class="interior_price">
							           <p>${ I.won }</p>
							       </div>
							</div>
						</c:forEach>
		            </div>
		            <!-- 인테리어 리스트 끝 -->
			        <!-- 더보기 버튼 -->
					<c:if test="${ IlistCount gt 0 }">
						<div class="more_btn_area" align="center">
							<button class="btn btn-outline-info" type="button" 
								onclick="moreInterior('interior-area', 8)">더보기(More)</button>
						</div>
					</c:if>
					<!-- 더보기 버튼 끝 -->
				</div>
				<!-- 인테리어 찜 끝 -->
			</div>
			<!-- 이너바디 끝 -->
		</div>
		<!-- 마이페이지 끝 -->
		<div class="end">
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>