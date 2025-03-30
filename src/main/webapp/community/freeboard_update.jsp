<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
console.log("no","${temp_board_no}")
const handleBeforeUnload = () => {//페이지를 떠날 때 경고창 띄우기
	const message = "저장하지 않은 내용이 있습니다. 페이지를 떠나시겠습니까?";
    event.returnValue = message;
    return message;
}



$(document).ready(function(){
	window.addEventListener('beforeunload', handleBeforeUnload);
	 $.ajax({
         url: '../community/get_htmlfile.do?htmlfile=${vo.htmlfile }',
         type: 'GET',                   // GET 요청
         success: function(response) {
             quill.root.innerHTML = response;
         }
     });
	 $("#editor").css({"height":'${vo.documentheight}'+'px'})
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
										<option value="일상" <c:if test="${fn:trim(vo.tag) == '일상'}">selected</c:if>>일상</option>
										<option value="질문" <c:if test="${fn:trim(vo.tag) == '질문'}">selected</c:if>>질문</option>
										<option value="정보" <c:if test="${fn:trim(vo.tag) == '정보'}">selected</c:if>>정보</option>
										<option value="후기" <c:if test="${fn:trim(vo.tag) == '후기'}">selected</c:if>>후기</option>
										<option value="맛집" <c:if test="${fn:trim(vo.tag) == '맛집'}">selected</c:if>>맛집</option>
										<option value="기타" <c:if test="${fn:trim(vo.tag) == '기타'}">selected</c:if>>기타</option>
									</select>
                                </div>
                                <input type="text" name="subject" placeholder="제목" value="${vo.subject }" style="float:left;color:black">
                            </form>
                    </div>
					<div id="editor" style="height: 500px;color:black" data-postid="${sessionScope.id }" data-userid="${userid }" data-filename="${vo.htmlfile }">
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
						<span><a href="../community/freeboard_list.do" class="site-btn" style="float:left">목록</a> </span>
						<span><button onclick="save()" class="site-btn ml-3" style="float:right">완료</button> </span>
						<span><button onclick="javascript:history.back()" class="site-btn" style="float:right">취소</button> </span>
					</div>
				
				</div>
			</div>
		</div>
	</section>
</body>
</html>