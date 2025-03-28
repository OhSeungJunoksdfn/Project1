<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.item {
          position: relative;
}
.item::after {
          content: "";
          width: 1px;
          height: 19px;
          position: absolute;
          top: 50%;
          right: 0;
          transform: translateY(-50%);
          background-color: #858894;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
<body>
<div>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>자유 게시판</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<section class="ftco-section">
      <div class="container">
        
        <div class="row">
          <div class="col-md-12 text-center mb-5 ftco-animate">
            <table class="table" style="border:none;margin:0px">
			<tr style="border:none">
				<td style="vertical-align:bottom;border:none"><h4 class="text-left" style="float:left">[${vo.tag }] ${vo.subject }</h4></td>
				<td class="text-right" style="border:none">
				<!-- 유저아이디 세션에서 가져오도록 처리 -->
                <c:if test="${sessionScope.id==vo.id }">
				<a href="../community/freeboard_update.do?board_no=${vo.board_no}&id=${sessionScope.id}" class="site-btn" style="">수정</a> 
				<button class="site-btn delete-post" style="">삭제</button> 
				</c:if>
				<a href="../community/freeboard_list.do?page=${page }" class="site-btn" style="">목록</a> 
				</td>
			</tr>
			</table>
            
            
            <table class="table" style="">
				<tr style="">
					<td class="text-center item" width=5% style=""><strong>${vo.id }</strong></td>
					<td class="text-left" width=20% style="font-size:13px;padding-top:15px"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
					<td class="text-right" width=75% style=""><strong>조회수</strong>  ${vo.hit }</td>
				</tr>
				<tr><td colspan="3"></td></tr>
           </table>
           	<iframe class="ifr" src="../community/get_htmlfile.do?htmlfile=${vo.htmlfile }" scrolling="no" style="width:100%;height:${vo.documentheight}px;border:none;"></iframe>
          
        
        <jsp:include page="community_comment.jsp" >
        	<jsp:param name="post_type" value="freeboard"/>
        	<jsp:param name="post_no" value="${vo.board_no }"/>
        </jsp:include>
        	
        
      </div>
    </section>
</div>
<script type="text/javascript">
//답글버튼 보이기/숨기기
$('.delete-post').on('click',function(){
	if (confirm("삭제하시겠습니까?")) {
        alert("삭제되었습니다")
        window.location.href = "../community/freeboard_delete.do?board_no=${vo.board_no}&id=${sessionScope.id}";
    } else {
    }
})


</script>
</body>
</html>