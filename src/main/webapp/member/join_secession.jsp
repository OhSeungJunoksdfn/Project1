<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>로그인</title>
	
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
	
    <!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    <link rel="stylesheet" href="../css/login.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <script type="text/javascript">
    $(function () {
        $('#secessionBtn').click(function () {
            const pwd = $('#pwd').val();

            if (pwd.trim() === "") {
                alert("비밀번호를 입력해주세요.");
                return;
            }

            $.ajax({
                type: 'POST',
                url: '../member/join_secession_ok.do',
                data: { pwd: pwd },
                success: function (res) {
                    $('#resultMessage').html(`
                        <div class="login-container">
                          <img src="../member/cocktail_shaker.png" class="logo" alt="Logo">
                          <h2>탈퇴 완료</h2>
                          <p style="text-align: center; color: #333; margin-top: 20px;">
                            회원 탈퇴가 정상적으로 처리되었습니다.<br>
                            그동안 이용해주셔서 감사합니다.
                          </p>
                          <div style="text-align: center; margin-top: 30px;">
                            <a href="../main/main.do">
                              <button style="width: 100%;">메인으로</button>
                            </a>
                          </div>
                        </div>
                    `);
                },
                error: function () {
                    alert("정말 회원탈퇴를 진행하시겠습니까?");
                }
            });
        });
    });
    </script>
</head>
<body>
<div class="login-container">
    <h2 style="text-align:center;">회원 탈퇴</h2>
    
    <div class="checkout__input">
        <p style="text-align:center;">비밀번호 입력</p>
        <input type="password" name="pwd" id="pwd" style="text-align:center;" placeholder="비밀번호를 입력해주세요.">
    </div>
    
    <div style="margin-top: 20px; text-align: center;">
        <button type="button" id="secessionBtn">탈퇴하기</button>
    </div>

    <div id="resultMessage" style="margin-top: 30px;"></div>

    <c:if test="${not empty msg}">
        <p style="color:red; text-align:center;">${msg}</p>
    </c:if>
   </div>
</body>
</html>