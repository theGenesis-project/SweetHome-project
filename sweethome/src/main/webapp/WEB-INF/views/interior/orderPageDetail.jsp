<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 상세</title>
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
                            <td><button>주소찾기</button></td>
                        </tr>
                        <tr>
                            <td rowspan="2"></td>
                            <td><input type="text" name="postCode" id="postCode" value="${oi.postCode }"></td>
                        </tr>
                         <tr>                	
                        	<td><input type="text" name="roadAddress" id="roadAddress" value="${oi.roadAddress }" placeholder="주소"></td>
                        </tr>
                        <tr>
                        	<td></td>              
                            <td><input type="text" name="detailAddress" id="detailAddress" value="${detailAddress }" placeholder="상세주소"></td>
                        </tr>
                        <tr>
                            <td>배송요청</td>
                            <td><textarea style="width:250px;" id="orderReQ" name="orderReQ">${oi.orderReQ }</textarea></td>
                        </tr>         
                    </table>
                </div>

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
                                <td>${oi.sumPrice}</td>                         	
                        	</tr>                       	
                        	<tr>
                            	<td></td>
                            	<td>빨라 택배</td>
                            	<td></td>
                            	<td>                          		
                            		${oi.interiorPost} 원                                           	
                            	</td>
                            </tr>     
                            <tr>
                                <td colspan="3" style="height: 50px">합계</td>                             
                                <td>${oi.sumPrice} + ${oi.interiorPost } 원</td>
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
    		
    		var test = $('#orderStatus').html();
    		console.log(test);
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
    	})
    
    
    </script>
	
	<!--메인 끝!!!----------------------------------------------------------->
	
	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>