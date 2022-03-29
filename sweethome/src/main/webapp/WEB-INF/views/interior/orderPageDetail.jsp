<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 상세</title>
<%-- Daum 우편번호 서비스 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%-- 아임포트 환불 API --%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<style>
	/*main부분!!!_---------------------------------------*/
        .content{
            margin: auto;
            height: auto;
            width: 1500px;
            display: flex;
        } 
        #content2{
            width: 100%;
            margin: 100px;
        }
        #content2>table>td{
            padding-left: 5px;
        }
    
        #content2_1{
            margin-bottom: 20px;
        }
        #content2_2{
            margin-bottom: 20px;
        }
        #content2_1>h2, #content2_2>h2, #content2_3>h2, #content2_4>h2{
            color: rgb(247, 202, 201);
        }
        #content2_3>tbody>tr>td{
            color: rgb(247, 202, 201);
        }
        #content2_1, #content2_2, #content2_3, #content2_4{
            font-size: 20px;
        }
        #orderPageUpdateButton{
        	width : 100%;
        	
        }
        #updateButton{
        	margin-left : 270px;
        }

        #pay-button{
            margin-top: 30px;
        }
        #bottom-button>button{
            float: right;
            color: white;
            background-color: rgb(247, 202, 201);
            border: 0ch;
            padding: 5px;           
        }
        #modal-button{
            width: 90px;
            height: 35px;
            margin: auto;
            margin-top: 20px;
            margin-bottom: 20px;
            color: white;
            background-color: rgb(247, 202, 201);
            border-radius: 3px;
            border: 0ch;
        }

        #modal-body{
            margin: auto;
        }
        .btn{
            color: white;
            background-color: rgb(247, 202, 201);
            border-radius: 3px;
            border: 0ch;
        }
        .btn:hover{
            background-color: rgb(209, 209, 209);
        }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/interiorNavi.jsp" />
	
	<div class="content">
       
            <!--메인 시작!!!!!!!!!!!!--------------------------------------------------------->
            <div id="content2">
                <div id="content2_1">
                    <h2>주문/결제</h2>
                    <hr>
                    <table>
                        <tr>
                            <td style="width:100px;">이름 </td>
                            <td><input type="text" name="senderName" value="${oi.senderName }" readonly></td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td><input type="email"name="senderEmail" value="${oi.senderEmail }"readonly></td>
                        </tr>
                        <tr>
                            <td>휴대전화</td>
                            <td><input type="text" name="senderPhone" value="${oi.senderPhone }" readonly></td>
                        </tr>
                    </table>
                </div>
				<form action="orderPageUpdate.in" method="post" id="orderPageUpdate">
				<input type="hidden" name="orderNo" value="${oi.orderNo }">
                <div id="content2_2">
                    <h2>배송지</h2>
                    <hr>
                    <table>
                        <tr>
                            <td style="width:100px;">받는 사람 </td>
                            <td><input type="text" name="orderRe" id="orderRe" value="${oi.orderRe}"></td>
                        </tr>
                        <tr>
                            <td style="height:30px">연락처</td>
                            <td><input type="text" name="orderPhone" id="orderPhone" value="${oi.orderPhone }"></td>  
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td><button type="button" onclick="execDaumPostcode()">주소찾기</button></td>
                        </tr>
                        <tr>
                            <td rowspan="2"></td>
                            <td><input type="text" name="postcode" id="postcode" value="${oi.postcode }"></td>
                        </tr>
                         <tr>                	
                        	<td><input type="text" name="roadAddress" id="roadAddress" value="${oi.roadAddress }" placeholder="주소"></td>
                        </tr>
                        <tr>
                        	<td></td>              
                            <td><input type="text" name="detailAddress" id="detailAddress" value="${oi.detailAddress }" placeholder="상세주소"></td>
                        </tr>
                        <tr>
                            <td>배송요청</td>
                            <td><textarea style="width:250px;" id="orderReQ" name="orderReQ">${oi.orderReQ }</textarea></td>
                        </tr>         
                    </table>
                </div>
                <div id="orderPageUpdateButton">
                	<input type="submit" name="updateButton" id="updateButton" value="수정하기">
                </div>
                    </form>
                
                
                
                 <script>
                              
					// Daum 우편번호 서비스
					function execDaumPostcode() {
						new daum.Postcode({
							oncomplete: function(data) {
								// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
								// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

								var addr = ''; // 주소 변수
								var extraRoadAddr = ''; // 참고 항목 변수
								
								//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                    addr = data.roadAddress;
				                } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                    addr = data.jibunAddress;
				                }

								// 건물명이 있고, 공동주택일 경우 추가한다.
								if(data.buildingName !== '' && data.apartment === 'Y') {
									extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
								}

								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('postcode').value = data.zonecode;
								document.getElementById("roadAddress").value = addr;
							
							}
						}).open();
					}
				</script>
                
                
                

                <div id="content2_3">
                    <h2>주문목록</h2>
                    <hr>
                    <table>
                        <thead>
                            <tr>
                               <td style="width: 100px;">분류</td>
                               <td style="width: 600px;">상품 </td>
                               <td style="width: 100px;">개수</td>
                               <td style="width: 150px;">가격</td>
                            </tr>
                        </thead>
                        <tbody>
                        	<tr>
                        		<td>${oi.inteCate} </td>
                        		<td>${oi.interiorTitle}</td>
                                <td>${oi.orderQuantity}</td>
                                <td id="orderDetail_sumPrice">${oi.sumPrice}</td> 
                                <td id="orderDetail_sumPrice_hidden" style="display:none">${oi.sumPrice }</td>                        	
                        	</tr>                       	
                        	<tr>
                            	<td></td>
                            	<td>빨라 택배</td>
                            	<td></td>
                            	<td id="orderDetail_interiorPost">${oi.interiorPost}</td>
                            	<td id="orderDetail_interiorPost_hidden" style="display:none">${oi.interiorPost}</td>
                            </tr>     
                            <tr>
                                <td colspan="3" style="height: 50px">합계</td>                             
                                <td id="orderDetail_totalSum"></td>
                            </tr>
                        </tbody>
             
                    </table>
                    
                </div>

                <div id="content2_4">
                    <h2>주문 조회</h2>
                    <hr>
                    <table>
                        <tr>
                            <td style="width:150px;">주문 접수일</td>
                            <td>${oi.orderDate }</td>
                        </tr>
                        <tr>
                            <td>상태</td>
                            <td id="orderStatus">${oi.orderStatus }</td>
                            <c:if test="${loginUser.userId == 'admin' }">
                            	<!--관리자만 보임-->
	                            <td>
	                            	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
	                                	변경하기
	                              	</button>
	                           </td>
                           </c:if>
                        </tr>
                    </table>
                </div>

                <div id="bottom-button">
                    <button>돌아가기</button>
                    <button onclick="cancelPay()">환불하기</button>
                </div>
            </div>

    </div>

      <!-- The Modal -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">주문 조회</h4>
                <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body">
	                <form action="orderStatusUpdate.in" method="post">
	                	<input type="hidden" name="orderNo" value="${oi.orderNo }">
	                   	 주문완료 -> 
	                    <select name="orderStatus">
	                        <option value="0">주문완료</option>
	                        <option value="1">출고완료</option>
	                        <option value="2">배송중</option>
	                        <option value="3">배송완료</option>
	                        <option value="4">환불 신청</option>
	                        <option value="5">환불 완료</option>
	                    </select>
	                	<button type="submit" id="modal-button">상태 변경</button>
	                </form>
                </div>

            </div>
        </div>
    </div>
    
    <script>
    
    
    	$(function(){
    		
    		//orderStatus로 구분해서 보이게 하기
    		var test = $('#orderStatus').html();
    		
    		if(test == 0){
    			$('#orderStatus').html("주문 완료");
    		}else if(test == 1){
    			$('#orderStatus').html("출고완료");
    		}else if(test == 2){
    			$('#orderStatus').html("배송중");
    		}else if(test == 3){
    			$('#orderStatus').html("배송완료");
    		}else if(test == 4){
    			$('#orderStatus').html("환불 신청");
    		}else{
    			$('#orderStatus').html("환불 완료");
    		}
    		
    		//orderStatus 0일때만 주문내역 수정할 수 있게 해줌  		
    		var $orderRe = $("input[name=orderRe]");
			var $orderPhone = $("input[name=orderPhone]");
			var $postcode = $("input[name=postcode]");
			var $roadAddress = $("input[name=roadAddress]");
			var $detailAddress = $("input[name=detailAddress]");
			var $orderReQ = $("input[name=orderReQ]");
			var $updateButton = $("input[name=updateButton]");

    		if(test != '0'){
    			
    			$orderRe.attr("readonly", true);
    			$orderPhone.attr("readonly", true);
    			$postcode.attr("readonly", true);
    			$roadAddress.attr("readonly", true);
    			$detailAddress.attr("readonly", true);
    			$orderReQ.attr("readonly", true); 
    			$updateButton.attr("disabled", true);
	   				
    		}
    		

    		//주문목록 format number
    		var orderDetail_sumPrice = $("#orderDetail_sumPrice");
    		var orderDetail_interiorPost = $("#orderDetail_interiorPost");
    		var orderDetail_totalSum = $("#orderDetail_totalSum");
    		
    		//배송비 뺸 가격
    		n0 = parseInt(orderDetail_sumPrice.text());
    		cn0 = n0.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");//number format
    		
    		orderDetail_sumPrice.text(cn0 + ' 원');
    		//배송비
    		n1 = parseInt(orderDetail_interiorPost.text());
    		cn1 = n1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");//number format
    		
    		orderDetail_interiorPost.text(cn1 + ' 원');
    		//총 금액
    		n2 = (n0 + n1);
    		cn2 = n2.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");//number format
    		
    		orderDetail_totalSum.text(cn2 + ' 원');
    		
    		

    	});
    	
    	/*
    	//환불하기~
    	 function cancelPay() {
    		//환불 가격 불러오기
    		 var orderDetail_sumPrice = $("#orderDetail_sumPrice_hidden");
     		 var orderDetail_interiorPost = $("#orderDetail_interiorPost_hidden");
     		 
	     	 n0 = parseInt(orderDetail_sumPrice.text());
	     	 n1 = parseInt(orderDetail_interiorPost.text());
	     	 n2 = (n0 + n1);
	     	 //보낼 값 가져오기
	     	 var result = {
	     			"merchant_uid" : "${oi.orderNumber}",//주문번호
				    "cancel_request_amount" : "n2" // 환불금액	     			 
	     		 }
	     		
			    jQuery.ajax({
			      url : 'cancelPay.in', // 예: http://www.myservice.com/payments/cancel
			      type : "POST",
			      contentType : "application/json",
			      data : JSON.stringify(result),
			      success: function(result){//ajax 통신 성공
 					
			      },
			      error: function(){//ajax 통신 성공
			    	  console.log("ajax 통신 실패");
			      }
			    }).done(function(result) { // 환불 성공시 로직 
			        alert("환불 성공");
			    }).fail(function(error) { // 환불 실패시 로직
			      alert("환불 실패");
			    });
			  }//ajax 끝

    	*/
    	
    	
    	
    
    
    </script>
	
	<!--메인 끝!!!----------------------------------------------------------->
	
	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>