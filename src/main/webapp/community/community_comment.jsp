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

.delete-box{
	text-align:left;
	padding:10px;
	padding-top:20px;
	padding-bottom:20px;
	float:left;
	color:rgb(200, 200, 200);
	border-bottom:solid rgb(235, 235, 235) 1px;
	width:100%;
}

.delete-box:last-child{
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
	padding:3px;
	padding-left:7px;
	padding-right:7px;
	font-size:12px;
	color:white;
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

.comment-replybox{
	padding-left:30px
}

</style>
</head>
<body>
	
	<div style="margin:0px;padding:0px;text-align:left;padding:10px;border-top:solid rgb(235, 235, 235) 1px;font-size:15px">총 댓글  ${number_of_comment }</div>
	<div class="comment-container">
		<c:if test="${sessionScope.id!=null }">
		<form method="post" action="../comment/comment_insert.do">
		<div class="comment-box " style="display:flex">
			<input type="hidden" name="post_no" value="${param.post_no }"/>
			
			<input type="hidden" name="id" value="${sessionScope.id }"/>
			
			<input type="hidden" name="is_reply" value="${0 }"/>
			<input type="hidden" name="post_type" value="${param.post_type }"/>
			<textarea placeholder="댓글을 입력하세요" name="content" required></textarea>
			<button class="site-btn comment-save" style="margin-left:10px" >확인</button>
		</div>
		</form>
		</c:if>
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
				<c:if test="${comment.is_reply==0 and sessionScope.id!=null}">
					<button class="site-btn write-button comment-button comment-${status.index } reply">답글</button>
				</c:if>
				
				<c:if test="${sessionScope.id==comment.id }">
				<button class="site-btn comment-button write-button comment-${status.index } update">수정</button>
				<button class="site-btn comment-button delete-comment ${comment.comment_no}">삭제</button>
				</c:if>
				
				<!-- 답글 쓰기 -->
				<form method="post" action="../comment/comment_insert_reply.do">
				<div class="comment-reply reply-${status.index } reply" style="display:none" >
					<input type="hidden" name="post_no" value="${param.post_no }"/>
			
					<!-- 유저아이디 세션에서 가져오도록 처리 -->
					<input type="hidden" name="id" value="${sessionScope.id}"/>
					
					<input type="hidden" name="is_reply" value="${1 }"/>
					<input type="hidden" name="post_type" value="${param.post_type }"/>
					<input type="hidden" name="group_id" value="${comment.comment_no }"/>
					<textarea placeholder="답글을 입력하세요" style="" name="content" required></textarea>
					<button class="site-btn comment-save" style="margin-left:10px" >확인</button>
				</div>
				</form>
				<!-- 댓글 수정하기 -->
				<form method="post" action="../comment/comment_update.do">
				<div class="comment-reply reply-${status.index } update" style="display:none" >
					<input type="hidden" name="post_no" value="${param.post_no }"/>
					<input type="hidden" name="post_type" value="${param.post_type }"/>
					<input type="hidden" name="id" value="${sessionScope.id}"/>
					
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
<script type="text/javascript">
$('#myForm').on('keypress', function(event) {
    if (event.which === 13) {//엔터키 기본동작 방지
        event.preventDefault();
    }
});

$('#myForm').on('submit', function(event) {
    event.preventDefault();  // 기본 제출 동작 방지
});

const handleSearch = () => {
	const tag = $('.tag.active').text()
	const selectsearch = $('#selectsearch').val()
	const searchdata = $('#searchdata').val()
	window.location.href = "../community/freeboard_list.do?tag="+tag+"&selectsearch="+selectsearch+"&searchdata="+searchdata;
}

$('#searchButton').on('click',handleSearch)

$('#searchdata').keydown(function(e){
	if(e.keyCode==13)
	{
		handleSearch()
	}
})

$('.tag').on('click',function(){
	const tag = $(this).text()
	const selectsearch = $('#selectsearch').val()
	const searchdata = $('#searchdata').val()
	window.location.href = "../community/freeboard_list.do?tag="+tag+"&selectsearch="+selectsearch+"&searchdata="+searchdata;
	
})

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

$('.delete-comment').on('click',function(){
	const comment_no= $(this).prop('classList')[3]
	if (confirm("삭제하시겠습니까?")) {
        alert("삭제되었습니다")
        window.location.href = "../comment/comment_delete.do?comment_no="+comment_no+"&post_no=${param.post_no}&post_type=${param.post_type}";
    } else {
    } 
})

</script>
</body>
</html>