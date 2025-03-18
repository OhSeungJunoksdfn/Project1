<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<link rel="stylesheet" href="cockstyle.css"/>
</head>
<body>
	<jsp:include page="${cocktail_jsp }"></jsp:include>
	<!-- Cookie -->
	<jsp:include page="cocktail_cookie.jsp"></jsp:include>
</body>
</html>