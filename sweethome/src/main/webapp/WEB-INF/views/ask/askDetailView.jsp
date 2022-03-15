<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 상세</title>
<link rel="stylesheet" href="resources/css/mypage.css" />
<link rel="stylesheet" href="resources/css/ask.css" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
    <div class="sweethome-container">
		<div class="sub_nav">
			<jsp:include page="../common/mypageNavi.jsp" />
		</div>
		<div class="mypage">
			<div class="ask-container" style="margin-left: 0">
				<table class="Qform">
					<tr>
						<th width="10%">제목</th>
						<td>${ a.askTitle }</td>
						<th width="10%">답변 여부</th>
						<td width="20%">
							<c:choose>
								<c:when test="${ a.askComment eq 'N' }">
									답변 대기
								</c:when>
								<c:otherwise>
									답변 완료
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td colspan="3">${ a.askDate }</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td class="Qanswer" colspan="3">
							<img src="${ aFile.filePath }" alt="첨부사진">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td class="Qcontent" colspan="3">
							${ a.askContent }
						</td>
					</tr>
					<c:if test="${ not empty commentDate }">
						<tr>
							<th>답변 내용</th>
							<td colspan="3">
								${ a.askComment }
							</td>
						</tr>
					</c:if>
				</table>
				<button type="submit" class="Qbutton" onclick="location.href='list.ask'" style="float:none; display:block; margin:10px auto 0px auto;">목록가기 </button>
			</div>
		</div>
		<div class="end"></div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>