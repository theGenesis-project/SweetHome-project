<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/chat.css" />
</head>
<body>

	<button class="connect-button" onclick="connect()" hidden>접속</button>
	
	<script>
		$(function(){
			// 채팅 들어오면 자동 소켓 연결
			$(".connect-button").trigger('click');
			
		})
	
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
			socket.onmessage = function(result) { // 메시지를 받으면 동작
				var result = result.data;
				if(result != null && result.trim() != ""){ // 메시지가 비어있지 않을 때
					var m = JSON.parse(result);
					if(m.type == "message") { // 메시지 보여주기
						if(m.userNo == "${loginUser.userNo}") {
							var outgoing = $("<div class='outgoing_msg'></div>");
							var sent = $("<div class='sent_msg'></div>");
							
							sent.html("<p>" + m.msg + "</p> <span class='time_date'>" + m.nowTime + "</span>");
							outgoing.append(sent);
							
							$(".msg_history").append(outgoing);
						} else {
							var income = $("<div class='incoming_msg'></div>");
							var received = $("<div class='received_msg'></div>");
							var msg = $("<div class='received_withd_msg'></div>");
							
							msg.html("<p>" + m.msg + "</p> <span class='time_date'>" + m.nowTime + "</span>");
							received.append(msg);
							income.append(received);
							
							$(".msg_history").append(income);			
						}
					}
				}

				// 스크롤 맨 아래로
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
				alert("메시지를 입력해주세요");
				return;
			}
			
			// 현재 채팅방번호 가져오기
			var url = new URL(location.href);
			var urlParams = url.searchParams;
			var roomNo = urlParams.get('roomNo');
			
			// 메시지에 들어가는 정보
			// 메시지 타입, userId, 메시지 내용
			var sendInfo = {
					"type": "message",
					"userNo": "${loginUser.userNo}",
					"roomNo": roomNo,
					"msg": text
			}
			
			// 메시지 저장한 뒤 뿌리기
			$.ajax({
				url: "sendMsg.chat",
				type: "post",
				data: JSON.stringify(sendInfo),
				contentType: 'application/json; chatset=UTF-8',
				dataType: 'json',
				success: function(result){
					if(result > 0) {
						// 소켓에 전송
						socket.send(JSON.stringify(sendInfo));
						// 메세지 전송 부분 비우기
						$(".write_msg").val("");
					} else {
						alert("메시지 전송 실패! 다시 시도해주세요");
					}
				},
				error: function(){
					alert("메시지 전송 실패! 다시 시도해주세요");
				}
			})
			
		}
		
		// 엔터키로 메시지 보내기
		function msgSend() {
			if(event.keyCode == 13)			
			$(".msg_send_btn").trigger("click");
		}
		
		// 채팅방 입장 함수
		function goChat(roomNo) {
			console.log(this);
			
			// 채팅내용 불러오기
			$.ajax({
				url: 'getContent.chat',
				type: 'get',
				data: {
					"roomNo": roomNo
				}, 
				success: function(history){
					// 페이지 url 변경
					// 1. 현재 주소 가져오기
					var renewURL = location.href;
					// 2. 현재 주소 중 roomNo 부분 삭제
					renewURL = renewURL.replace(/\?roomNo=([0-9]+)/ig,'');
					// 2. 새로 부여될 데이터 할당
					renewURL += '?roomNo=' + roomNo;
					// 3. 페이지 갱신
					window.history.pushState(null, null, renewURL);
					
					// 채팅방 띄우기
					var msg_history = $("<div class='msg_history'></div>");
					var hr_sect = $("<div class='hr-sect'></div>");
					var input_msg_write = $("<div class='type_msg'>"
											  + "<div class='input_msg_write'>"
													+ "<input type='text' class='write_msg' placeholder='Type a message' onkeypress='msgSend();'/>"
													+ "<button class='msg_send_btn' type='button' onclick='send()'><img src='resources/image/Daco_4358108.png' style='width: 100%;'></button>"
											  + "</div>"
											+ "</div>");
					$(".mesgs").html(msg_history);
					$(".mesgs").append(input_msg_write);
					
					// 받아온 메시지 기록 뿌려주기
					for(let i in history) {
						// 내가 보낸 메시지일 경우 
						if(history[i].userNo == "${loginUser.userNo}") {
							var outgoing = $("<div class='outgoing_msg'></div>");
							var sent = $("<div class='sent_msg'></div>");
							
							sent.html("<p>" + history[i].message + "</p> <span class='time_date'>" + history[i].formatTime + "</span>");
							outgoing.append(sent);
							
							$(".msg_history").append(outgoing);
						} else { // 다른 사람이 보낸 메시지일 경우
							var income = $("<div class='incoming_msg'></div>");
							var received = $("<div class='received_msg'></div>");
							var msg = $("<div class='received_withd_msg'></div>");
							
							msg.html("<p>" + history[i].message + "</p> <span class='time_date'>" + history[i].formatTime + "</span>");
							received.append(msg);
							income.append(received);
							
							$(".msg_history").append(income);	
						}
					}
					
					// 스크롤 맨 아래로
					$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
					
				}, error: function(){
					alert("채팅방에 접근하는 도중 에러가 발생했습니다. 다시 시도해주세요.");
				}
			})
		}

	</script>
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
			<c:if test="${ empty chatList }">
				<div style="margin:50px auto auto auto; text-align: center;">
					<img src="resources/image/Nochat.png" style="width:50px;"><br>
					<b>
					생성된 대화가 없습니다.<br>
					새로운 대화를 시작해보세요! 
					</b>
				</div>
			</c:if>
			<c:forEach var="c" items="${ chatList }">
				<div class="chat_list" onclick="goChat(${c.roomNo});">
				  <div class="chatRoom" hidden>${c.roomNo}</div>
				  <div class="chat_people">
					<div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
					<div class="chat_ib">
					  <h5><b>${ c.roomName }</b> <span class="chat_date">${ c.sendTime }</span></h5>
					  <p>
					  <c:choose>
					  <c:when test="${ fn:length(c.message) lt 20 }">
						  ${ c.message }
					  </c:when>
					  <c:otherwise>
					  	${ fn:substring(c.message, 0, 20) }...
					  </c:otherwise>
					  </c:choose>
					  </p>
					</div>
				  </div>
				</div>
			</c:forEach>
		  </div>
		</div>
		<div class="mesgs">
		  <div class="empty-msg">
		  	<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FewshBz%2Fbtru1asrG4F%2FD4bgCQcDjVHeVEm5ii1KX0%2Fimg.png" alt="logo">
		  </div>
		  <!-- 
		  <div class="msg_history">
		  <div class="hr-sect">2022년 03월 23일</div>
		  </div>
		  <div class="type_msg">
			<div class="input_msg_write">
			  <input type="text" class="write_msg" placeholder="Type a message" onkeypress="msgSend();"/>
			  <button class="msg_send_btn" type="button" onclick="send()"><img src="resources/image/Daco_4358108.png" style="width: 100%;"></button>
			</div>
		  </div>
		   -->
		</div>
	  </div>
	</div>

	
	
</body>
</html>