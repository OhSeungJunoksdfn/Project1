<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항 등록</title>

  <link rel="stylesheet" href="../css/notice.css">
  <script src="http://code.jquery.com/jquery.js"></script>
  
  <script>
    $(function () {
      $('#submitBtn').click(function () {
        const type = $('#type').val();
        const subject = $('#subject').val().trim();
        const content = $('#content').val().trim();

        if (subject === "" || content === "") {
          $('#msgBox').text("제목과 내용을 모두 입력해주세요.").css("color", "red");
          return;
        }

        $.ajax({
          type: "POST",
          url: "../notice/notice_insert_ok.do",
          data: {
            type: type,
            subject: subject,
            content: content
          },
          success: function () {
            $('#msgBox').text("공지사항이 성공적으로 등록되었습니다.");
            setTimeout(function () {
              location.href = "../admin/notice_list.do";
            }, 2000);
          },
          error: function () {
            $('#msgBox').text("서버 오류가 발생했습니다.").css("color", "red");
          }
        });
      });
    });
  </script>
</head>
<body>
  <div class="notice-container">
    <h2>공지사항 등록</h2>

    <div class="form-group">
      <label for="type">공지 유형</label>
      <select name="type" id="type">
        <option value="1">일반공지</option>
        <option value="2">이벤트공지</option>
        <option value="3">제품공지</option>
        <option value="4">정보공지</option>
        <option value="5">레시피공지</option>
      </select>
    </div>

    <div class="form-group">
      <label for="subject">제목</label>
      <input type="text" id="subject" placeholder="제목 입력">
    </div>

    <div class="form-group">
      <label for="content">내용</label>
      <textarea id="content" placeholder="공지 내용을 입력하세요..."></textarea>
    </div>

    <button type="button" class="submit-btn" id="submitBtn">등록하기</button>

    <div class="msg-box" id="msgBox"></div>
  </div>
</body>
</html>
