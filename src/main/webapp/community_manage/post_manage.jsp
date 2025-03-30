<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.comment-button{
	padding:3px;
	padding-left:7px;
	padding-right:7px;
	font-size:12px;
	color:white;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<table class="table mt-2" style="margin-bottom:31px">
		<tr>
		<th class="text-center" width=7%>번호</th>
		<th class="text-center" width=7%>분류</th>
		<th class="text-center" width=50%>제목</th>
		<td  width=10%><input type="checkbox" id="checkboxall"/></td>
	</tr>
	<c:forEach var="vo" items="${list }">
	<tr>
		<td class="text-center" width=7%>${vo.board_no }</td>
		<td class="text-center" width=7%>${vo.tag }</td>
		<td  width=50%>
			<a href="../community/freeboard_detail.do?board_no=${vo.board_no }&page=${page}" style="color:black">${vo.subject }</a>
		</td>
		<td  width=10%>
			<input type="checkbox" class="check ${vo.board_no }"/>
		</td>
	</tr>
	</c:forEach>
	</table>
	
	<table class="table" style="border:none">
		<tr style="text-align:center">
			<td class="product__pagination blog__pagination" style="border:none">
				<a href="../community_manage/post_manage.do?page=${curpage>1?curpage-1:curpage }&id=${sessionScope.id}" class="" style="width:50px;border:none;color:black"
				onmouseover="this.style.color='white'" 
					onmouseout="this.style.color='black';">이전</a>
				<c:set var="underline" value="underline" />
				<c:set var="none" value="" />
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
                	<a class="pagelist" href="../community_manage/post_manage.do?page=${i }&id=${sessionScope.id}" style="margin:5px;border:none;text-decoration:${curpage==i?underline:none}">${i }</a>
                </c:forEach>
				<a href="../community_manage/post_manage.do?page=${curpage<totalpage?curpage+1:curpage }&id=${sessionScope.id}" class="ml-4" style="width:50px;border:none;color:black"
					onmouseover="this.style.color='white'" 
					onmouseout="this.style.color='black';">다음</a>
			</td>
			
			<td class="product__pagination blog__pagination" style="border:none;">
				<button class="site-btn delete-btn" style="border:none;height:40px;width:100px;padding:5px;font-size:17px;color:white">삭제</button>
			</td>
		</tr>
	</table>
<script type="text/javascript">
$("#checkboxall").click(function(){
	if ($(this).prop("checked")) {
      $(".check").prop("checked", true); 
    } else {
      $(".check").prop("checked", false);
    }
})

$(".delete-btn").click(function(){
	const deleteList = []
	$(".check:checked").each(function(){
		let classList = $(this).attr("class").split(" ")[1];
		deleteList.push(classList)
	})
	if(deleteList.toString()!=="")
	if (confirm("삭제하시겠습니까?")) {
        alert("삭제되었습니다")
        window.location.href = "../community_manage/post_delete.do?delete_list="+deleteList.toString()+"&page=${page}&id=${sessionScope.id}";
    } else {
    } 
})
</script>
</body>
</html>