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
<script type="text/javascript">
</script>
<style type="text/css">
.comment-container{
	padding:10px;
	border-top:solid black 1px;
	border-bottom:solid black 1px;
	overflow:auto
}
.comment-box{
	text-align:left;
	padding:10px;
	float:left;
	color:black;
	border-bottom:solid black 1px;
	width:100%
}
.comment-box:last-child{
	border-bottom:none;

}
.comment-writer{
	color:black;
	font-size:17px;
	font-weight:bold;
}
.comment-content{
}
.comment-date{
	font-size: 15px;
	color:gray
}
.comment-button{
	margin:10px;
	padding:5px;
	padding-left:10px;
	padding-right:10px;
}
</style>
</head>
<body>
<div>
	<section class="ftco-section">
      <div class="container">
        
        <div class="row">
          <div class="col-md-12 text-center mb-5 ftco-animate">
            <h2 class="display-4">자유게시판</h2>
            <table class="table" style="border:none;margin:0px">
			<tr style="border:none">
				<td style="vertical-align:bottom;border:none"><h4 class="text-left" style="float:left">[${vo.tag }] ${vo.subject }</h4></td>
				<td class="text-right" style="border:none">
				<!-- 유저아이디 세션에서 가져오도록 처리 -->
                <c:set var="userid" value="user"/>
				<a href="../community/freeboard_update.do?board_no=${vo.board_no}&id=${userid}" class="site-btn" style="">수정</a> 
				<a href="../community/freeboard_delete.do?board_no=${vo.board_no}&id=${userid}" class="site-btn" style="">삭제</a> 
				<a href="../community/freeboard_list.do?page=${page }" class="site-btn" style="">목록</a> 
				</td>
			</tr>
			</table>
            
            
            <table class="table" style="">
				<tr style="">
					<th class="text-center item" width=5% style="">${vo.id }</th>
					<td class="text-left" width=20% style=""><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
					<td class="text-right" width=75% style="">조회수 ${vo.hit }</td>
				</tr>
				<tr><td colspan="3"></td></tr>
           </table>
           	<iframe class="ifr" src="../community/get_htmlfile.do?htmlfile=${vo.htmlfile }" scrolling="no" style="width:100%;height:${vo.documentheight}px;margin-bottom:200px;border:none;"></iframe>
          
           <!-- <table class="table">
           	
				<tr>
					<td>
						
					</td>
				</tr>
			</table> -->
			<div class="comment-container">
				<div class="comment-box">
					<p class="comment-writer">작성자</p>
					<div class="comment-content">내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</div>
					<div class="comment-date">2025-01-01 12:12:12</div>
					<button class="site-btn comment-button">답글</button>
				</div>
				
				<div class="comment-box">
					<p class="comment-writer">작성자</p>
					<div class="comment-content">내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</div>
					<div class="comment-date">2025-01-01 12:12:12</div>
					<button class="site-btn comment-button">답글</button>
				</div>
				
				<div class="comment-box">
					<p class="comment-writer">작성자</p>
					<div class="comment-content">내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</div>
					<div class="comment-date">2025-01-01 12:12:12</div>
					<button class="site-btn comment-button">답글</button>
				</div>
			</div>
          </div>
        </div>
        
      </div>
    </section>
</div>
</body>
</html>