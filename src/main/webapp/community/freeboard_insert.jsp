<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript">
console.log("adfasdf")
let isSaving = false
/* $(window).on('beforeunload', function() {
	alert("페이지가 언로드됩니다!");
	console.log("jstl","${temp_board_no}")
	$.ajax({
		type:'post',
		url:'../community/freeboard_delete_unsaved.do',
		data:{"board_no":"${temp_board_no}"},
		success:function(result){
			
		}
	}) */
window.addEventListener('beforeunload', function (event) {
            // 여기서 alert 메시지를 표시할 수 있습니다
            alert("페이지를 떠나려고 합니다!");

            // 경고창 메시지 추가 (브라우저에 따라 다르게 동작)
            event.returnValue = "정말 떠나시겠습니까?";  // 브라우저가 표시할 경고 메시지

            // 사용자가 페이지를 떠나려고 할 때 보여지는 메시지 처리
            // 브라우저마다 동작이 다를 수 있음.
        });
});
</script>
</head>
<body>
	<section class="">
		<div class="container">
			
			<div class="row">
				<div class="col-md-12 text-center mb-5">
					<h2 class="display-4" onclick="handleTest()">자유게시판</h2>
					
					<div class="hero__search__form" style="float:none;width:100%;margin-bottom:20px">
                            <form action="#">
                                <div class="hero__search__categories" style="width:120px;float:left;text-align:left;">
                                    <select class="" style="width:80px;padding:0px;border:none;text-align:center">
										<option value="일상">일상</option>
										<option value="질문">질문</option>
										<option value="정보">정보</option>
										<option value="후기">후기</option>
										<option value="맛집">맛집</option>
										<option value="기타">기타</option>
									</select>
                                </div>
                                <input type="text" placeholder="제목" style="float:left;color:black">
                            </form>
                    </div>
                    
					<div id="editor" style="height: 500px;color:black">
						<p>Hello World!</p>
						<p>
							Some initial <strong>bold</strong> text
						</p>
						<p>
							<br />
						</p>
					</div>
					<script type="text/javascript" src="quil.js?v=<%=System.currentTimeMillis() %>"></script>
					<div style="margin-top:20px">
						<span><a href="#" class="site-btn" style="float:left">목록</a> </span>
						<span><button onclick="javascript:history.back()" class="site-btn ml-3" style="float:right">완료</button> </span>
						<span><button onclick="javascript:history.back()" class="site-btn" style="float:right">취소</button> </span>
						
					</div>
					
					
				</div>
			</div>
		</div>
	</section>
</body>
</html>