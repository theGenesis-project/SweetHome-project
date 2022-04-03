<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .sub-nav-area {
    width: 220px;
    border-radius: 13px;
    border: 2px solid lightgray;
    margin-right: 5px;

    }

    .sub-nav-area>div {
    border-bottom: 2px solid lightgray;
    }

    .sub-nav-head {
    height: 100px;
    background-color: rgb(247, 202, 201);
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    color: white;
    text-align: center;
    }

    .sub-nav-head>h4 {
    margin: 0;
    line-height: 100px;
    }

    .sub-nav-list {
    height: 60px;
    font-size: 20px;
    font-weight: bold;
    padding-left: 15px;
    line-height: 60px;
    background-color: white;
    }

    .sub-nav-list:hover {
        color: rgb(247, 202, 201);
        cursor: pointer;
    }

    .sub-nav-bottom {
    padding: 10px;
    border: none;
    background-color: rgb(247, 202, 201);
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
    }
</style>
</head>
<body>
	<div class="sub-nav-area">
        <div class="sub-nav-head">
            <h4 class="font-weight-bold">마이페이지</h4>
        </div>
        <div class="sub-nav-list" onclick="location.href='myPage.me'">
          	 회원정보 관리
        </div>
        <div class="sub-nav-list" onclick="window.open('chat', '하우스톡톡', 'height=100%, menubar=no, status=no, tollbar=no, location=no')">
        	하우스 톡톡
        </div>
        <div class="sub-nav-list" onclick="location.href='userTour.my'">
           	투어 신청 관리
        </div>
        <div class="sub-nav-list" onclick="location.href='dibsList.my'">
        	찜 내역 관리
         </div>
         <div class="sub-nav-list" onclick="location.href='myBoard.my'">
         	게시글/댓글 확인
         </div>
         <div class="sub-nav-list" onclick="location.href='list.ask'">
         	1:1문의 관리
         </div>
         <div class="sub-nav-list" onclick="location.href='orderList.my'">
         	주문내역 관리
         </div>
        <div class="sub-nav-bottom">
        </div>
    </div>
</body>
</html>