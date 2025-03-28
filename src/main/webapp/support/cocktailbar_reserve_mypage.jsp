<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<tr>
			<th></th>
			<th>업체명</th>
			<th>예약일</th>
			<th>시간</th>
			<th>인원</th>
			<th>확인</th>
		</tr>
		<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.cbvo.image }</td>
			<td>${vo.cbvo.name }</td>
			<td>${vo.day }</td>
			<td>${vo.time }</td>
			<td>${vo.inwon }</td>
			<td>
			<c:if test="${vo.isok=='y' }">
			<input type="button" class="btn btn-sm btn-success" id="check" value="예약성공" >
			</c:if>
			<c:if test="${vo.isof=='n' }">
			<span class="btn btn-sm btn-default"  >대기중</span>
			</c:if>
			<input type="button" class="btn btn-sm btn-danger" id="cancle" value="취소" >
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>