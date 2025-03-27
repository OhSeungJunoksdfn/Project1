<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 삭제</title>
    <link rel="stylesheet" href="../css/login.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <style>
      .input-wrapper {
        display: flex;
        justify-content: center;
      }
      .input-wrapper input {
        width: 250px;
        text-align: center;
        padding: 8px;
        border-radius: 5px;
        border: 1px solid #ccc;
      }
      .btn-box {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 10px;
        margin-top: 20px;
      }
      .btn-box button {
        width: 250px;
        padding: 10px;
        font-size: 14px;
        font-weight: bold;
        background-color: navy;
        color: white;
        border: none;
        border-radius: 6px;
        cursor: pointer;
      }
    </style>
</head>
<body>
<div class="login-container">
    <h2 style="text-align: center; color: navy;">회원 삭제 (관리자)</h2>

    <form method="post" action="../admin/member_delete.do">
        <div class="checkout__input">
            <p style="text-align: center;">삭제할 회원 ID</p>
            <div class="input-wrapper">
              <input type="text" name="id" placeholder="회원 ID를 입력하세요">
            </div>
        </div>

        <div class="btn-box">
            <button type="submit">삭제</button>
            <button type="button" onclick="history.back()">취소</button>
        </div>
    </form>

    <c:if test="${not empty msg}">
        <p style="color:red; text-align:center;">${msg}</p>
    </c:if>
</div>
</body>
</html>
