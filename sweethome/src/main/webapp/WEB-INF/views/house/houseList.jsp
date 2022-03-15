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
		#search-text{
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
	  <input type="text" id="search-text"class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="역 ,학교이름을 입력 해주세요"><button type="button" id="search" class="btn btn">검색</button>
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
            <li class="page-item none"><a class="page-link" href="#">◀</a></li><!-- 1번 페이지일경우 -->
            </c:when>
            <c:otherwise>
            <li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage - 1 }">◀</a></li>
            </c:otherwise>
        </c:choose>
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            <li class="page-item"><a class="page-link" href="list.bo?cpage=${ p }">${ p }</a></li>
            </c:forEach>
            
            
        <c:choose>
            <c:when test="${ pi.currentPage eq pi.maxPage }">
            <li class="page-item none"><a class="page-link" href="#">▶</a></li>
            </c:when>
            <c:otherwise>
            <li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage + 1 }">▶</a></li>
            </c:otherwise>
        </c:choose>
        </ul>
    </div>
	<hr>
	<jsp:include page="../common/footer.jsp" />

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc26f4f2ac186a2ad635ddbe87b694c6"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커를 표시할 위치입니다 
		var position =  new kakao.maps.LatLng(33.450701, 126.570667);
		

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		  position: position
		});
		
		// 마커를 지도에 표시합니다.
		marker.setMap(map);

		
		// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
		var iwContent = '<div style="padding:5px;"><a href=""><img class="thumbnail" src="https://www.dgdr.co.kr/upload/jijum/238342658_ZC6fgFLl_20211028123745.jpg" alt="썸네일 이미지"><span class="thumb-title mtb3">MY04 서울역</span><ul class="thumb-desc mtb3"><li>마이룸(원룸)</li><li>월 53만원 ~</li></ul><span class="status1 mtb3">1명 입주가능</span></a></div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent
		});
		
		// 마커에 마우스오버 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseover', function() {
		  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		    infowindow.open(map, marker);
		});
		
		// 마커에 마우스아웃 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseout', function() {
		    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
		    infowindow.close();
		});
		
		kakao.maps.event.addListener(marker, 'click', function() {
		      // 마커 위에 인포윈도우를 표시합니다
		      console.log("ㅎㅎㅎㅎ");  
		});
	</script>
</body>
</html>