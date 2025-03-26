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

<style type="text/css">
.comment-container{
	padding:10px;
	border-top:solid rgb(235, 235, 235) 1px;
	border-bottom:solid rgb(235, 235, 235) 1px;
	overflow:auto;
	background-color:rgb(248, 248, 248);
}

.comment-box{
	text-align:left;
	padding:10px;
	float:left;
	color:black;
	border-bottom:solid rgb(235, 235, 235) 1px;
	width:100%;
	
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
	color:gray;
	margin:10px;
	margin-left:2px
}

.comment-button{
	padding:5px;
	padding-left:10px;
	padding-right:10px;
}

textarea{
	height:100px;
	float:left;
	width:100%;
	padding:10px;
	font-size:15px;
	resize:none;
	
}

.comment-save{
	height:100px;
	aspect-ratio:1;
	padding:0px;
	
}

.comment-reply{
	margin-top:10px;
	padding-top:15px;
	border-top:dotted rgb(200, 200, 200) 1px;

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
					<td class="text-center item" width=5% style=""><strong>${vo.id }</strong></td>
					<td class="text-left" width=20% style="font-size:13px;padding-top:15px"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
					<td class="text-right" width=75% style=""><strong>조회수</strong>  ${vo.hit }</td>
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
			<div style="margin:0px;padding:0px;text-align:left;padding:10px;border-top:solid rgb(235, 235, 235) 1px;font-size:15px">총 댓글 5</div>
			
			
			<div class="comment-container">
				
				<div class="comment-box" style="display:flex">
					<textarea placeholder="댓글을 입력하세요"></textarea>
					<button class="site-btn comment-save" style="margin-left:10px" >확인</button>
				</div>
				
				<c:forEach var="i" begin="1" end="5">
					<div class="comment-box">
						<p class="comment-writer">작성자</p>
						<div class="comment-content">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>
						<div class="comment-date">2025-01-01 12:12:12</div>
						<button class="site-btn comment-button comment-${i }">답글</button>
						
						
						<div class="comment-reply reply-${i }" style="display:none" >
							<textarea placeholder="답글을 입력하세요" style=""></textarea>
							<button class="site-btn comment-save" style="margin-left:10px" >확인</button>
						</div>
					</div>
				</c:forEach>
				
				
				
			</div>
          </div>
        </div>
        
      </div>
    </section>
</div>
<script type="text/javascript">
//답글버튼 보이기/숨기기
$(".comment-button").click(function (){
	const commentNo = $(this).prop('classList')[2].split("-")[1]
	
	let replystate = $(".reply-"+commentNo).css('display')==='none'
	$(".comment-reply").hide()
	
	if(replystate)
	{
		$(".reply-"+commentNo).css({"display":"flex"})
	}else
	{
		$(".reply-"+commentNo).hide()
	}
})
</script>
</body>
</html>