<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/chat.css" />
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<button onclick="connect()">접속</button>
	<button onclick="disconnect()">종료</button>
	<div class="message-wrap"></div>
	
	<script>
		var socket;		
		
		// 웹소켓 접속 함수
		function connect() {
			var uri = "ws://localhost:8706/sweethome/groupchat"
			socket = new WebSocket(uri);
			
			// 연결이 되었는지 안되었는지 확인할 수 있도록 예약작업(콜백)을 설정
			socket.onopen = function() {
				console.log("서버와 연결되었습니다.");
			}
			socket.onclose = function() {
				console.log("서버와 연결이 종료되었습니다.");
			}
			socket.onerror = function(e) {
				console.log("오타 내지마세요.");
			}
			socket.onmessage = function(m) {
				var text = m.data;
				var arr = text.split(",", 4);
				//console.log("${loginUser.userId}" == arr[2]);
				//console.log(arr);
				
				// 화면에 띄우기
				if("${loginUser.userId}" != arr[2]) {
					var income = $("<div class='incoming_msg'></div>");
					var received = $("<div class='received_msg'></div>");
					var msg = $("<div class='received_withd_msg'></div>");
					
					msg.html("<p>" + arr[3] + "</p> <span class='time_date'>" + arr[1] + "</span>");
					received.append(msg);
					income.append(received);
					
					$(".msg_history").append(income);				
				}
				
				if("${loginUser.userId}" == arr[2]) {
					var outgoing = $("<div class='outgoing_msg'></div>");
					var sent = $("<div class='sent_msg'></div>");
					
					sent.html("<p>" + arr[3] + "</p> <span class='time_date'>" + arr[1] + "</span>");
					outgoing.append(sent);
					
					$(".msg_history").append(outgoing);
				}
				
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
				
			}
		}
		
		// 웹소켓 종료함수
		function disconnect() {
			socket.close();
		}
		
		// 메시지 전송 함수
		function send() {
			var text = $(".write_msg").val();
			// 텍스트 없으면 안보냄
			if(!text) {
				return;
			}
			
			// 시간 구하기
			var today = new Date();
			
			var year = today.getFullYear(); // 년도
			var month = today.getMonth() + 1; // 월
			var date = today.getDate(); // 날짜
			var day = today.getDay(); // 요일
			
			switch(day) {
			case 0 : day = "일";
						break;
			case 1 : day = "월";
						break;
			case 2 : day = "화";
						break;
			case 3 : day = "수";
						break;
			case 4 : day = "목";
						break;
			case 5 : day = "금";
						break;
			case 6 : day = "토";
						break;
			}
			
			var hour = today.getHours(); // 시
			var min = today.getMinutes(); // 분
			var ampm;
			
			if(hour < 12) {
				if(hour < 10) {					
					hour = '0' + hour;
				}
				ampm = "AM";
			} else {
				hour = hour - 12;
				ampm = "PM";
			}
			
			if(min < 10) {
				min = '0' + min;
			}
			
			// 소켓에 메세지 전송
			socket.send(year + "년 " + month + "월 " + date + "일 " + day + "," 
					+ hour + ":" + min + " " + ampm + "," +"${loginUser.userId}," + text);
			// 메세지 전송 부분 비우기
			$(".write_msg").val("");
		}
		
		// 엔터키로 메시지 보내기
		function msgSend() {
			if(event.keyCode == 13)			
			$(".msg_send_btn").trigger("click");
		}
	</script>
	<!-- 
	<hr>
	<input type="text" id="chat-input"> 
	<button onclick="send()">전송</button>
	 -->
	
	
	<!-- 수신된 메시지가 출력될 영역 -->
	<div class="messaging">
	  <div class="inbox_msg">
		<div class="inbox_people">
		  <div class="headind_srch">
			<div class="recent_heading">
			  <h4>Recent</h4>
			</div>
			<div class="srch_bar">
              <div class="stylish-input-group">
                <input type="text" class="search-bar"  placeholder="Search" >
                <span class="input-group-addon">
                <button type="button">🔍</button>
                </span> </div>
            </div>
		  </div>
		  <div class="inbox_chat scroll">
			<div class="chat_list active_chat">
			  <div class="chat_people">
				<div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
				<div class="chat_ib">
				  <h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
				  <p>Test, which is a new approach to have all solutions 
					astrology under one roof.</p>
				</div>
			  </div>
			</div>
			<div class="chat_list">
			  <div class="chat_people">
				<div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
				<div class="chat_ib">
				  <h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
				  <p>Test, which is a new approach to have all solutions 
					astrology under one roof.</p>
				</div>
			  </div>
			</div>
		  </div>
		</div>
		<div class="mesgs">
		  <div class="msg_history">
		  <div class="hr-sect">2022년 03월 23일</div>
		  </div>
		  <div class="type_msg">
			<div class="input_msg_write">
			  <input type="text" class="write_msg" placeholder="Type a message" onkeypress="msgSend();"/>
			  <button class="msg_send_btn" type="button" onclick="send()"><img src="resources/image/Daco_4358108.png" style="width: 100%;"></button>
			</div>
		  </div>
		</div>
	  </div>
	</div>
</body>
</html>