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
           	<iframe class="ifr" src="../community/get_htmlfile.do?htmlfile=${vo.htmlfile }" scrolling="no" style="width:100%;height:${vo.documentheight}px;border:none;"></iframe>
          
           <!-- <table class="table">
           	
				<tr>
					<td>
						
					</td>
				</tr>
			</table> -->
			<%-- <div style="margin:0px;padding:0px;text-align:left;padding:10px;border-top:solid rgb(235, 235, 235) 1px;font-size:15px">총 댓글  ${number_of_comment }</div>
			<div class="comment-container">
				<form method="post" action="../comment/comment_insert.do">
				<div class="comment-box " style="display:flex">
					<input type="hidden" name="board_no" value="${vo.board_no }"/>
					
					<!-- 유저아이디 세션에서 가져오도록 처리 -->
					<c:set var="userid" value="user"/>
					<input type="hidden" name="id" value="${userid }"/>
					
					<input type="hidden" name="is_reply" value="${0 }"/>
					<textarea placeholder="댓글을 입력하세요" name="content" required></textarea>
					<button class="site-btn comment-save" style="margin-left:10px" >확인</button>
				</div>
				</form>
				<c:forEach var="comment" items="${comment_list }" varStatus="status">
					<c:choose>
					<c:when test="${comment.content!=null }">
					<div class="comment-box ${comment.is_reply==1?'comment-replybox':'' }">
						<p class="comment-writer">${comment.is_reply==1?'':''} 
						 	<c:if test="${comment.is_reply==1 }"><span style="position:relative;top:-4px">↳&nbsp;</span></c:if>
						${comment.id }</p>
						
						<div class="comment-content ">${comment.content }</div>
						<div class="comment-date">
							<span style="margin-right:2px"><fmt:formatDate value="${comment.regdate }" pattern="yyyy-MM-dd"/></span>
							<span><fmt:formatDate value="${comment.regdate }" pattern="hh:mm:ss"/></span>
						</div>
						<c:if test="${comment.is_reply==0 }">
							<button class="site-btn write-button comment-button comment-${status.index } reply">답글</button>
							
							
						</c:if>
						<!-- 수정 삭제 아이디 세션에서 가져오도록 처리 -->
						<button class="site-btn comment-button write-button comment-${status.index } update">수정</button>
						<a href="../comment/comment_delete.do?comment_no=${comment.comment_no }&board_no=${vo.board_no}" class="site-btn comment-button ">삭제</a>
						
						
						<!-- 답글 쓰기 -->
						<form method="post" action="../comment/comment_insert_reply.do">
						<div class="comment-reply reply-${status.index } reply" style="display:none" >
							<input type="hidden" name="board_no" value="${vo.board_no }"/>
					
							<!-- 유저아이디 세션에서 가져오도록 처리 -->
							<c:set var="userid" value="user"/>
							<input type="hidden" name="id" value="${userid }"/>
							
							<input type="hidden" name="is_reply" value="${1 }"/>
							<input type="hidden" name="group_id" value="${comment.comment_no }"/>
							<textarea placeholder="답글을 입력하세요" style="" name="content" required></textarea>
							<button class="site-btn comment-save" style="margin-left:10px" >확인</button>
						</div>
						</form>
						<!-- 댓글 수정하기 -->
						<form method="post" action="../comment/comment_update.do">
						<div class="comment-reply reply-${status.index } update" style="display:none" >
							<input type="hidden" name="board_no" value="${vo.board_no }"/>
					
							<!-- 유저아이디 세션에서 가져오도록 처리 -->
							<c:set var="userid" value="user"/>
							<input type="hidden" name="id" value="${userid }"/>
							
							<input type="hidden" name="comment_no" value="${comment.comment_no }"/>
							<input type="hidden" name="group_id" value="${comment.comment_no }"/>
							<textarea placeholder="내용을 입력하세요" style="" name="content" required></textarea>
							<button class="site-btn comment-save" style="margin-left:10px" >확인</button>
						</div>
						</form>
					</div>
					</c:when>
					
					<c:otherwise>
			            <div class="delete-box">삭제된 댓글입니다.</div>
			        </c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			
          </div>
        </div> --%>
        
        <jsp:include page="community_comment.jsp" >
        	<jsp:param name="post_type" value="freeboard"/>
        </jsp:include>
        	
        
      </div>
    </section>
</div>
<script type="text/javascript">
//답글버튼 보이기/숨기기
$(".write-button").click(function (){
	const commentNo = $(this).prop('classList')[3].split("-")[1]
	const buttontype= $(this).prop('classList')[4]
	let replystate = $(".reply-"+commentNo+"."+buttontype).css('display')==='none'
	
	$(".comment-reply").hide()
	
	
	if(replystate)
	{
		$(".reply-"+commentNo+"."+buttontype).css({"display":"flex"})
		
	}else
	{
		$(".reply-"+commentNo+"."+buttontype).hide()
	}
})


</script>
</body>
</html>