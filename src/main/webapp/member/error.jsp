<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 발생</title>
</head>
<body>
<h2 style="color:red;">오류 발생</h2>
  <p>${error_message}</p>
  <button onclick="self.close()">닫기</button>
</body>
</html>