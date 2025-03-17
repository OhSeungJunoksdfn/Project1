<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script>

</script>
</head>
<body>
<div>
	<section class="">
      <div class="container">
        
        <div class="row">
          <div class="col-md-12 text-center mb-5 section-title">
            <h2 class="display-4">자유게시판</h2>
            <table class="table mt-5 mb-5" >
           		<tr>
					<th class="text-center" width=5%>번호</th>
					<th class="text-center" width=5%>분류</th>
					<th class="text-center" width=45%>제목</th>
					<th class="text-center" width=15%>작성자</th>
					<th class="text-center" width=20%>작성일</th>
					<th class="text-center" width=10%>조회수</th>
				</tr>
				<c:forEach var="vo" items="${list }">
				<tr>
					<td class="text-center" width=5%>${vo.board_no }</td>
					<td class="text-center" width=5%>${vo.tag }</td>
					<td  width=45%>
						<a href="../community/freeboard_detail.do?board_no=${vo.board_no }" style="color:black">${vo.subject }</a>
					</td>
					<td class="text-center" width=15%>${vo.id }</td>
					<td class="text-center" width=20%><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
					<td class="text-center" width=10%>${vo.hit }</td>
				</tr>
				</c:forEach>
           </table>
           
           
           <table class="table">
				<tr>
					<td class="product__pagination blog__pagination" style="border:none">
						<a href="../community/freeboard_list.do?page=${curpage>1?curpage-1:curpage }" class="" style="width:50px;border:none;color:black"
						onmouseover="this.style.color='white'" 
							onmouseout="this.style.color='black';">이전</a>
						<c:set var="underline" value="underline" />
						<c:set var="none" value="" />
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							
                        	<a class="pagelist" href="../community/freeboard_list.do?page=${i }" style="margin:5px;border:none;text-decoration:${curpage==i?underline:none}">${i }</a>
                        </c:forEach>
						<a href="../community/freeboard_list.do?page=${curpage<totalpage?curpage+1:curpage }" class="ml-4" style="width:50px;border:none;color:black"
							onmouseover="this.style.color='white'" 
							onmouseout="this.style.color='black';">다음</a>
						
					</td>
					<td class="product__pagination blog__pagination" style="border:none;"><a href="../community/freeboard_insert_newpost.do" class="site-btn" style="border:none;height:40px;width:100px;padding:5px;font-size:17px;color:white">글쓰기</a></td>
				</tr>
			</table>
          </div>
        </div>
      </div>
    </section>
</div>
</body>
</html>