<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
<%-- Daum 우편번호 서비스 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- 아임포트 -->
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
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
        #content2_1>h2, #content2_2>h2, #content2_3>h2{
            color: rgb(247, 202, 201);
        }
        #content2_3>tbody>tr>td{
            color: rgb(247, 202, 201);
        }
        #content2_1, #content2_2, #content2_3{
            font-size: 20px;
        }
        
        #orderQuntity{
        	width: 50px;
        }


        #pay-button{
            margin-top: 30px;
        }
        #pay-button>button{
            float: right;
            color: white;
            background-color: rgb(247, 202, 201);
            border: 0ch;
            padding: 5px;         
        }
        #content2_1>table input{
        	background-color : rgb(240, 240, 240);
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
                            <td><input type="text" name="userName" id="userName" value="${loginUser.userName }" readonly></td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td><input type="email" name="email" id="email" value="${loginUser.email }"readonly></td>
                        </tr>
                        <tr>
                            <td>휴대전화</td>
                            <td><input type="text" name="phone" id="phone" value="${loginUser.phone }" readonly></td>
                        </tr>

                    </table>
                </div>

                <div id="content2_2">
                    <h2>배송지</h2>
                    <hr>
                    <table>
                        <tr>
                            <td style="width:100px;">받는 사람 </td>
                            <td><input type="text" name="orderRe" id="orderRe"></td>
                        </tr>
                        <tr>
                            <td style="height:30px">연락처</td>
                            <td><input type="text" name="orderPhone" id="orderPhone"></td>  
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td><button type="button" onclick="execDaumPostcode()">주소찾기</button></td>
                        </tr>
                        <tr>
                            <td rowspan="2"></td>
                            <td><input type="text" name="postcode" id="postcode" placeholder="우편번호" readonly></td>
                        </tr>
                        <tr>                	
                        	<td><input type="text" name="roadAddress" id="roadAddress" placeholder="주소" readonly></td>
                        </tr>
                        <tr>
                        	<td></td>              
                            <td><input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소"></td>
                        </tr>
                        <tr>
                            <td>배송요청</td>
                            <td><textarea style="width:250px;" id="orderReQ" name="orderReQ"></textarea></td>
                        </tr>
          
                    </table>
                </div>
               
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
                                <td style="width: 100px">개수</td>
                                <td style="width: 150px;">가격</td>
                            </tr>                         
                        </thead>
                        <tbody>
                         	<tr>
                                <td>${in.inteCate }</td>
                                <td>${in.interiorTitle }</td>
                                <td><input type="text" size="25" value="1" id="count" class="orderQuantity" readonly>
							          <input type="button" value="-" id="minus" onclick="minus()">
							          <input type="button" value="+" id="plus" onclick="plus()">
							    </td>
                                <td style="width: 150px;" class="interiorPrice">
                                	<input type="text" value="${in.interiorPrice }" id="interiorNo" hidden=hidden readonly/>
                                	<input type="text" value="${in.interiorPrice }" id="interiorNo_number" hidden=hidden readonly/>
           							<input type="text" value="${in.interiorPrice }" id="interiorNo_view" readonly />
                                	원
                                </td>
                            </tr>   
                            <tr>
                            	<td></td>
                            	<td>빨라 택배</td>
                            	<td></td>
                            	<td>                          		
                            		<input type="text" id="interiorPost" value="${in.interiorPost }">원                                               	
                            	</td>
                            </tr>     
                            <tr>
                                <td colspan="3" style="height: 50px">합계</td>                             
                                <td>
									<input type="text" value="" id="total_count" hidden=hidden readonly>
									<input type="text" value="" id="total_count_view" readonly>
								
								</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="pay-button">
                    <button>결제하기</button>
                </div>
            </div>
          
    	</div>
    	
    <script>
    
	    var count = 1;
	    var countEl = document.getElementById("count");
	    var interiorNo = document.getElementById("interiorNo"); 
	    var interiorNo_view = document.getElementById("interiorNo_view"); //개수*가격 합계
	  
	    var interiorPost = document.getElementById("interiorPost");//택배비
	    
	    var total_count = document.getElementById("total_count");//택배비 포함 가격 합계
	    var total_count_view = document.getElementById("total_count_view");
	   
	    $(function(){//로딩 되자마자 뿌려줌
	    	 //배송비 포함 전체 가격
	    	 n0 = parseInt(interiorNo.value) + parseInt(interiorPost.value);
	    	 cn0 = n0.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");//number format
	    	 //배송비 미포함 전체 가격
	    	 n1 = parseInt('${in.interiorPrice }');   	
	    	 cn1 = n1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");//number format
	    	
	    	 total_count_view.value = cn0;
	    	 interiorNo_view.value = cn1;
	    	 
	    	 console.log("뭐지" + $("#userName").val());
	    	 
	    	
	    })
	   
	    
		console.log("들어오거라")
	    function plus(){
	    		    	    	
	        count++;
	        countEl.value = count;
	        
	        n1 = interiorNo.value * countEl.value;//배송비 미포함 가격
            const cn1 = n1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");//number format
          	
            n2 = n1 + parseInt(interiorPost.value);//배송비 포함 가격
            const cn2 = n2.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");//number format
          	
            console.log("가격" + cn2);
            console.log(typeof(n1))
            console.log(typeof(parseInt(interiorPost.value)))
            
            interiorNo_number = n1;
            interiorNo_view.value = cn1;
            total_count_view.value= cn2;
	    }
	    function minus(){
	    
	        if (count > 1) {
	            count--;
	            countEl.value = count;
	            
	            n3 = interiorNo.value * countEl.value;
                const cn3 = n3.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");//number format
                
                n4 = n3 + parseInt(interiorPost.value);//배송비 포함 가격
                const cn4 = n4.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");//number format
                                
                interiorNo_view.value = cn4;
                total_count_view.value= cn4;
	        }  
	    }
	    
	    
    
    	//페이시작!
		$(document).ready(function(){
	   	  
		var IMP = window.IMP;
		var code = "imp75590432"; //가맹점 식별코드
		IMP.init(code);
		

		
		$("#pay-button").click(function(e){
			//결제요청
			IMP.request_pay({
				pg : 'kakaopay',		
				pay_method: 'card',
				merchant_uid : 'SH' + new Date().getTime(),//주문번호
				name : '${in.interiorTitle}', // 상품명
				amount : $("#total_count_view").val(),//지불해야 할 가격 : 택배비 + 전체 가격
				buyer_email : '${loginUser.email}',
				buyer_name : '${loginUser.userName}',
				buyer_tel : '${loginUser.phone}',  //필수항목
				
				
			}, function(rsp){
				
				if(rsp.success){//결제 성공시
					console.log("결제 성공");
					
						var result = {
									        	
								merchant_uid : rsp.merchant_uid,//주문번호
				        		interiorTitle : rsp.name,		        		
				        		amount : rsp.paid_amount,//배송비 포함 금액
				        		userNo : ${loginUser.userNo},
				        		orderRe : $("#orderRe").val(),
				        		orderPhone : $("#orderPhone").val(),
				        		roadAddress: $("#roadAddress").val(),
				        		detailAddress: $("#detailAddress").val(),
				        		orderReQ : $("#orderReQ").val(),
				        		interiorNo : ${in.interiorNo},
				        		postcode : $("#postcode").val(),
				        		orderQuantity : $(".orderQuantity").val(),//개수
				        		interiorPost : ${in.interiorPost}, //배송비
				        		sumPrice : $('#interiorNo_number').val(),//배송비 제외 총 가격	
				        		senderName : $("#userName").val(),
				        		senderPhone : $("#phone").val(),
				        		senderEmail : $("#email").val()        		
								}
					
					
					$.ajax({
						url : 'payment.in', 
				        type :'POST',
				        data : JSON.stringify(result),
				        headers: {"Content-Type": "application/json"},				        
				        success: function(result){//ajax 통신 성공시
				        	
				        	console.log(result);//myPage 주문목록으로
				        	console.log("ajax 통신 성공");
				        	
				        	location.href = result        	
				         
				        },
				        error:function(){//ajax 통신 실패시
				          console.log("ajax 통신 실패");
				        }
					}) //ajax
					
				}
				
				else{//결제 실패시
					var msg = '결제에 실패했습니다';
					msg += '에러 : ' + rsp.error_msg
				}
				console.log(msg);
			});//pay
		}); 
		
		
		
		
		 
		
	}); 
	</script>
	<!--메인 끝!!!----------------------------------------------------------->
	<jsp:include page="../common/footer.jsp" />

</body>
</html>