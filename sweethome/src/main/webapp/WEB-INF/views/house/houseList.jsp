<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
		#map{
			margin: auto;
		}
		#keyword{
			margin-left: 120px;
			width:300px;
			float:left;
		}
		#search{
			margin-left:10px;
			background-color: rgb(247, 202, 201) !important;
			border: 0;
			color:white;
		}
		.img-box{
			width: 150px;
			height: 150px;
		}
		.house, .title, .txt {
			display: inline-block;
		}
		.house-wrap{
            width:1500px;
			margin-left: 75px;
        }
        .w1500 {
            width: 1500px;
            margin: auto;
        }
        ul { 
            list-style: none;
        }
        .mtb3{
            margin: 3px 0;
        }
        .house-item {
            width: 250px;
            display: inline-block;
            margin-right: 198px;
            margin-left: 29px;
            margin-top:30px;
        }
        
        
        .thumbnail {
            width: 100%;
            height: 150px;
            border-radius: 15px;
        }
        .thumb-title {
            font-size: 18px;
            font-weight: bold;
        }
        .thumb-desc li:first-child {
            font-weight: bold;
            border-right: 1px solid #aaa;
            padding-right: 8px;
        }
        .thumb-desc li {
            display: inline-block;
        }
        .status1 {
            display: inline-block;
            width: 80%;
            height: 30px;
            background-color: rgb(247, 202, 201);
            border-radius: 15px;
            color: white;
            text-align: center;
            line-height: 30px;
            margin-left:25px;
        }
        .status2 {
            display: inline-block;
            width: 80%;
            height: 30px;
            background: none;
            border-radius: 15px;
            border: 1px solid rgba(0,211,170,1);
            color: rgba(0,211,170,1);
            text-align: center;
            line-height: 30px;
            margin-left:25px;
        }
        a {
            color: inherit;
            text-decoration: none;
        }
        #text-box{
        	width:1500px;
        	margin:auto;
        }
        
        #pagingArea {width:fit-content; margin:auto;}
        
        
</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
	
	
	<body>
	<jsp:include page="../common/header.jsp" />
		<hr>
	<div id="text-box">
					<form onsubmit="searchPlaces(); return false;">
	   				<input type="text" id="keyword" value="이태원"class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="역 ,학교이름을 입력 해주세요"> 
                   <button type="submit" id="search" class="btn btn">검색</button>
                   </form>
		</div>
	  <br><br>
		<div id="map" style="width:1300px;height:450px;"></div>
	<br><br>
		<div class="w1500">
        <ul class="house-wrap">
            <li class="house-item">
                <a href="">
                <img class="thumbnail" src="https://www.dgdr.co.kr/upload/jijum/238342658_ZC6fgFLl_20211028123745.jpg" alt="썸네일 이미지">
                <span class="thumb-title mtb3">MY04 서울역</span>
                <ul class="thumb-desc mtb3">
                    <li>마이룸(원룸)</li>
                    <li>월 53만원 ~</li>
                </ul>
                <span class="status1 mtb3">1명 입주가능</span>
                </a>
            </li>
            <li class="house-item">
                <a href="">
                <img class="thumbnail" src="https://www.dgdr.co.kr/upload/jijum/238342658_BY3ZNQk7_20211028123916.jpg" alt="썸네일 이미지">
                <span class="thumb-title mtb3">MY04 서울역</span>
                <ul class="thumb-desc mtb3">
                    <li>마이룸(원룸)</li>
                    <li>월 53만원 ~</li>
                </ul>
                <span class="status1 mtb3">1명 입주가능</span>
                </a>
            </li>
            <li class="house-item">
                <a href="">
                <img class="thumbnail" src="https://www.dgdr.co.kr/upload/jijum/238342658_v1UFODwL_20211028123616.jpg" alt="썸네일 이미지">
                <span class="thumb-title mtb3">MY04 서울역</span>
                <ul class="thumb-desc mtb3">
                    <li>마이룸(원룸)</li>
                    <li>월 53만원 ~</li>
                </ul>
                <span class="status2 mtb3">3개월 입주가능</span>
                </a>
            </li>
            <li class="house-item">
                <a href="">
                <img class="thumbnail" src="https://www.dgdr.co.kr/upload/jijum/238342658_ZC6fgFLl_20211028123745.jpg" alt="썸네일 이미지">
                <span class="thumb-title mtb3">MY04 서울역</span>
                <ul class="thumb-desc mtb3">
                    <li>마이룸(원룸)</li>
                    <li>월 53만원 ~</li>
                </ul>
                <span class="status1 mtb3">1명 입주가능</span>
                </a>
            </li>
            <li class="house-item">
                <a href="">
                <img class="thumbnail" src="https://www.dgdr.co.kr/upload/jijum/238342658_BY3ZNQk7_20211028123916.jpg" alt="썸네일 이미지">
                <span class="thumb-title mtb3">MY04 서울역</span>
                <ul class="thumb-desc mtb3">
                    <li>마이룸(원룸)</li>
                    <li>월 53만원 ~</li>
                </ul>
                <span class="status1 mtb3">1명 입주가능</span>
                </a>
            </li>
            <li class="house-item">
                <a href="">
                <img class="thumbnail" src="https://www.dgdr.co.kr/upload/jijum/238342658_v1UFODwL_20211028123616.jpg" alt="썸네일 이미지">
                <span class="thumb-title mtb3">MY04 서울역</span>
                <ul class="thumb-desc mtb3">
                    <li>마이룸(원룸)</li>
                    <li>월 53만원 ~</li>
                </ul>
                <span class="status2 mtb3">3개월 입주가능</span>
                </a>
            </li>
            
        </ul>
        <br>
    </div>
    
    <div id="pagingArea">
        <ul class="pagination">
        <c:choose>
            <c:when test="${ pi.currentPage eq 1 }">
            <li class="page-item none"><a class="page-link" href="#">&laquo;</a></li><!-- 1번 페이지일경우 -->
            </c:when>
            <c:otherwise>
            <li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage - 1 }">&laquo;</a></li>
            </c:otherwise>
        </c:choose>
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            <li class="page-item"><a class="page-link" href="list.bo?cpage=${ p }">${ p }</a></li>
            </c:forEach>
            
            
        <c:choose>
            <c:when test="${ pi.currentPage eq pi.maxPage }">
            <li class="page-item none"><a class="page-link" href="#">&raquo;</a></li>
            </c:when>
            <c:otherwise>
            <li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage + 1 }">&raquo;</a></li>
            </c:otherwise>
        </c:choose>
        </ul>
    </div>
	<hr>
	<jsp:include page="../common/footer.jsp" />

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc26f4f2ac186a2ad635ddbe87b694c6&libraries=services"></script>
	<script>
	// 마커를 담을 배열입니다
	var markers = [];
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	// 키워드로 장소를 검색합니다
	searchPlaces();
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
	
	    var keyword = document.getElementById('keyword').value;
	
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);

	
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
	        alert('검색 결과가 존재하지 않습니다.');
	        return;
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;
	
	    }
	}
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i)
	
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	
	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });
	
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });
	
	         
	        })(marker, places[i].place_name);
	
	    }
	
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}
	
	
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	
	</script>
	
		
		
</body>
</html>