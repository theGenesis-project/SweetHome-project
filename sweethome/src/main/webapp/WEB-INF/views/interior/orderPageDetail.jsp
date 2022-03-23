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
        <form action="" method="" name="" id="">
        <!--메인 시작!!!!!!!!!!!!--------------------------------------------------------->
            <div id="content2">
                <div id="content2_1">
                    <h2>주문/결제</h2>
                    <hr>
                    <table>
                        <tr>
                            <td style="width:100px;">이름 </td>
                            <td><input type="text" name="" id=""></td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td><input type="email" name="" id=""></td>
                        </tr>
                        <tr>
                            <td>휴대전화</td>
                            <td><input type="text" name="" id=""></td>
                        </tr>

                    </table>
                </div>

                <div id="content2_2">
                    <h2>배송지</h2>
                    <hr>
                    <table>
                        <tr>
                            <td style="width:100px;">받는 사람 </td>
                            <td><input type="text" name="" id=""></td>
                        </tr>
                        <tr>
                            <td style="height:30px">연락처</td>
                            <td><input type="text" name="" id=""></td>  
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td><button>주소찾기</button></td>
                        </tr>
                        <tr>
                            <td rowspan="2"></td>
                            <td><input type="text" name="" id=""></td>
                        </tr>
                        <tr>                     
                            <td><input type="text" name="" id="" placeholder="상세주소"></td>
                        </tr>
                        <tr>
                            <td>배송요청</td>
                            <td><textarea style="width:250px;"></textarea></td>
                        </tr>
          
                    </table>
                </div>

                <div id="content2_3">
                    <h2>주문목록</h2>
                    <hr>
                    <table>
                        <thead>
                            <tr>
                                <td style="width: 100px;">침대</td>
                                <td style="width: 600px;">정말 좋고 튼튼하고 비싸고 오래가는 침대</td>
                                <td style="width: 150px;">1,000,000원</td>
                            </tr>
                            <tr>
                                <td style="width: 100px;">침대</td>
                                <td style="width: 600px;">정말 좋고 튼튼하고 비싸고 오래가는 침대</td>
                                <td style="width: 150px;">1,000,000원</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td style="color: rgb(247, 202, 201);">합계</td>
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
                            <td>2020/03/11</td>
                        </tr>
                        <tr>
                            <td>상태</td>
                            <td>주문 완료</td>
                            <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                	변경하기
                              </button></td><!--관리자만 보임-->
                        </tr>
                    </table>
                </div>

                <div id="bottom-button">
                    <button>돌아가기</button>
                </div>
            </div>
        </form> 
         
        
       
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
            <form action="" method="">
                주문완료 -> 
                <select>
                    <option value="">주문완료</option>
                    <option value="">출고완료</option>
                    <option value="">배송중</option>
                    <option value="">배송완료</option>
                    <option value="">환불 신청</option>
                    <option value="">환불 완료</option>
                </select>
            </div>
            <button type="submit" id="modal-button">상태 변경</button>
            </form>
            
           
            
        </div>
        </div>
    </div>
	
	<!--메인 끝!!!----------------------------------------------------------->
	
	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>