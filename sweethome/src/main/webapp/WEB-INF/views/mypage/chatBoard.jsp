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
	
	<h1>ㅎㅇㅎㅇ</h1>
	<button onclick="connect()">접속</button>
	<button onclick="disconnect()">종료</button>
	
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
				//console.log("메세지가 도착했습니다.");
				//console.log(m.data);
				var div = $("<div></div>");
				div.text("${loginUser.userName} : " + m.data);
				$(".message-wrap").append(div);
				
			}
		}
		
		// 웹소켓 종료함수
		function disconnect() {
			socket.close();
		}
		
		function send() {
			var text = $("#chat-input").val();
			if(!text) {
				return;
			}
			socket.send(text);
			$("#chat-input").val("");
			
		}
	</script>
	
	<hr>
	<input type="text" id="chat-input"> 
	<button onclick="send()">전송</button>
	
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
				</div>
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
		<div class="mesgs scroll">
		  <div class="msg_history">
			<div class="incoming_msg">
			  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
			  <div class="received_msg">
				<div class="received_withd_msg">
				  <p>Test which is a new approach to have all
					solutions</p>
				  <span class="time_date"> 11:01 AM    |    June 9</span></div>
			  </div>
			</div>
			<div class="outgoing_msg">
			  <div class="sent_msg">
				<p>Test which is a new approach to have all
				  solutions</p>
				<span class="time_date"> 11:01 AM    |    June 9</span> </div>
			</div>
			<div class="incoming_msg">
			  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
			  <div class="received_msg">
				<div class="received_withd_msg">
				  <p>Test, which is a new approach to have</p>
				  <span class="time_date"> 11:01 AM    |    Yesterday</span></div>
			  </div>
			</div>
			<div class="outgoing_msg">
			  <div class="sent_msg">
				<p>Apollo University, Delhi, India Test</p>
				<span class="time_date"> 11:01 AM    |    Today</span> </div>
			</div>
			<div class="incoming_msg">
			  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
			  <div class="received_msg">
				<div class="received_withd_msg">
				  <p>We work directly with our designers and suppliers,
					and sell direct to you, which means quality, exclusive
					products, at a price anyone can afford.</p>
				  <span class="time_date"> 11:01 AM    |    Today</span></div>
			  </div>
			</div>
		  </div>
		  <div class="type_msg">
			<div class="input_msg_write">
			  <input type="text" class="write_msg" placeholder="Type a message" />
			  <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
			</div>
		  </div>
		</div>
	  </div>
	</div>
</body>
</html>