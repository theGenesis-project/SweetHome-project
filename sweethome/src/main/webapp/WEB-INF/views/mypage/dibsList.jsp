<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 내역 관리</title>
<link rel="stylesheet" href="resources/css/mypage.css" />
<link rel="stylesheet" href="resources/css/house.css" />
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
		
		// 더보기 버튼 클릭 시 추가되는 게시물에 대한 함수
		function moreHouse(id, limit) {
			// 현재 페이지에 있는 content 갯수
			var list_length = $("." + id).children('li').length
			
			$.ajax({
				url: "getMoreHouse.my",
				type: "post",
				data: {
					"listCount": ${listCount},
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
				}, error: function(result){
					alert("게시글을 불러오는데 실패했습니다. 다시 시도해주세요.");
				}
			})
		}
	</script>
	<div class="sweethome-container">
		<div class="sub-nav">
			<jsp:include page="../common/mypageNavi.jsp"/>
		</div>
		<div class="mypage"> 
			<div class="inner-nav">
				<div class="inner-nav-area">
					<div class="myHouse inner-nav-content">	
						<b>하우스🏡</b>
					</div>
					<div class="myInterior inner-nav-content">
						<b>인테리어🛋️</b>
					</div>
					<div class="end"></div>
				</div>
			</div>
			<div class="inner-body">
				<div class="house">
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
			        <br>
			        <!-- 추가 게시물이 더 있을 때 -->
			        <c:if test="${ listCount gt 0 }">
						<div class="more_btn_area" align="center">
							<button class="btn btn-outline-info" type="button" 
								onclick="moreHouse('myhouse-wrap', 6)">더보기(More)</button>
						</div>
			        </c:if>
					
				</div>
				<div class="interior">
				인테리어
				</div>
			</div>
		</div>
		<div class="end">
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>