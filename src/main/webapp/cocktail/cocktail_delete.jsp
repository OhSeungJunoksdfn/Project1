<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
if(confirm("삭제하시겠습니다")){
	alert("정상적으로 삭제되었습니다.");
	let cno=$('#cno').val()
	location.href="../cocktail/cocktail_delete_ok.do?cno="+cno
}else{
	window.history.back();
}
})
</script>
</head>
<body>
<input type="hidden" id="cno" value="${cno }"/>
</body>
</html>