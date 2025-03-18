<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../css/login.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#logBtn').click(function(){
		let id=$('#id').val();
		if(id.trim()==="") {
			alert("아이디를 입력해주세요.");
			$('#id').focus();
			return;
		}
		
		let pwd=$('#pwd').val();
		if(pwd.trim()==="") {
			alert("비밀번호를 입력해주세요.");
			$('#pwd').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../member/login_ok.do',
			data:{"id":id,"pwd":pwd},
			success:function(result) {
				if(result==='NOID') {
					alert("아이디가 존재하지 않습니다.");
					$('#id').val("");
					$('#pwd').val("");
					$('#id').focus();
				}
				else if(result==='NOPWD') {
					alert("비밀번호가 틀렸습니다.");
					$('#pwd').val("");
					$('#pwd').focus();
				}
				else {
					parent.location.href="../main/main.do";
				}
			}
		});
	});
});

</script>
</head>
<body>
   <div class="login-container">
      <img src="../member/cocktail_shaker.png" class="logo" alt="Naver Logo">
      <h2>COCKTAILBAR</h2>
      
      <input type="text" id="id" placeholder="아이디">
      <input type="password" id="pwd" placeholder="비밀번호">
      <button id="logBtn">로그인</button>
      
      <div class="login-options">
         <a href="#">아이디 찾기</a> 
         <a href="#">비밀번호 찾기</a>
         <a href="../member/join.do">회원가입</a>
      </div>
   </div>
</body>
</html>
