<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 삭제</title>
    <link rel="stylesheet" href="../css/login.css">
    <script src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
<div class="login-container1">
    <h2 style="text-align: center;">회원 삭제 (관리자)</h2>
    
    <form method="post" action="../admin/member_delete.do">
        <div class="checkout__input">
            <p>삭제할 회원 ID</p>
            <input type="text" name="id" placeholder="회원 ID를 입력하세요">
        </div>
        <div style="text-align: center; margin-top: 20px;">
            <button type="submit" class="btn-sm btn-danger">삭제</button>
            <button type="button" class="btn-sm btn-primary" onclick="history.back()">취소</button>
        </div>
    </form>

    <c:if test="${not empty msg}">
        <p style="color:red; text-align:center;">${msg}</p>
    </c:if>
</div>
</body>
</html>