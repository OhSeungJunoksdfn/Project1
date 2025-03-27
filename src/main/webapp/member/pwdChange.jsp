<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="../css/login.css">
<script src="http://code.jquery.com/jquery.js"></script>
<script>
$(function () {
  $('#changeBtn').click(function () {
    const oldPwd = $('#old_pwd').val();
    const newPwd = $('#new_pwd').val();

    if (oldPwd.trim() === "" || newPwd.trim() === "") {
      alert("기존 비밀번호와 새 비밀번호를 모두 입력해주세요.");
      return;
    }

    $.ajax({
      type: 'POST',
      url: '../member/pwdChange_ok.do',
      data: {
        old_pwd: oldPwd,
        new_pwd: newPwd
      },
      success: function (res) {
        $('.result-box').html(res);

        // 비밀번호 변경 성공 시 자동 로그아웃
        if (res.includes("비밀번호가 성공적으로 변경")) {
          setTimeout(function () {
        	  location.href = '../member/logout.do?redirect=login';
          }, 2500); // 2.5초 후 로그아웃
        }
      },
      error: function () {
        alert("서버 오류 발생");
      }
    });
  });
});
</script>
</head>
<body>
<div class="login-container">
  <h2 style="text-align:center;">비밀번호 변경</h2>

  <div class="checkout__input">
    <p>기존 비밀번호</p>
    <input type="password" id="old_pwd" name="old_pwd" placeholder="기존 비밀번호">
  </div>

  <div class="checkout__input">
    <p>새 비밀번호</p>
    <input type="password" id="new_pwd" name="new_pwd" placeholder="새 비밀번호">
  </div>

  <div class="checkout__input" style="text-align: center; margin-top: 15px;">
    <button type="button" id="changeBtn" class="btn-sm btn-danger">비밀번호 변경</button>
    <button type="button" class="btn-sm btn-primary" onclick="history.back()">취소</button>
  </div>

  <div class="result-box" style="margin-top: 30px; text-align: center;"></div>
</div>
</body>
</html>
