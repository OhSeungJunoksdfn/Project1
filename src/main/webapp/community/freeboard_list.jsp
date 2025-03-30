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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
.button-class{
position:relative;
z-index:1000;
border: 0;
background-color: transparent;
}
</style>
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
	<section class="">
      <div class="container">
        
        <div class="row">
          <div class="col-md-12 text-center mb-5 section-title">
            
	        <div style="vertical-align:bottom;display-flex;justify-content:flex-end;height:50px;width:100%;margin-top:40px;position:relative">
	            <div class="featured__controls" style="vertical-align:bottom;margin:0px;padding:0px;position:absolute;bottom:0;margin-bottom:10px">
	                <ul style="margin:0px;float:left;padding:0px;margin-left:10px;">
	                    <li class="tag <c:if test="${fn:trim(tag) == 'All'}">active</c:if>">All</li>
	                    <li class="tag <c:if test="${fn:trim(tag) == '일상'}">active</c:if>">일상</li>
	                    <li class="tag <c:if test="${fn:trim(tag) == '질문'}">active</c:if>">질문</li>
	                    <li class="tag <c:if test="${fn:trim(tag) == '정보'}">active</c:if>">정보</li>
	                    <li class="tag <c:if test="${fn:trim(tag) == '후기'}">active</c:if>">후기</li>
	                    <li class="tag <c:if test="${fn:trim(tag) == '맛집'}">active</c:if>">맛집</li>
	                    <li class="tag <c:if test="${fn:trim(tag) == '기타'}">active</c:if>">기타</li>
	                </ul>
	            </div>
	           	<div class="hero__search__form" style="float:right;width:40%;">
	               	<form id="myForm" action="#">
	                   	<div class="hero__search__categories" style="width:25%;float:left;text-align:left">
	                    	<select id="selectsearch" style="width:80%;padding:0px;border:none;text-align:center;margin-top:5px">
								<option value="제목" <c:if test="${selectsearch == '제목'}">selected</c:if>>제목</option>
								<option value="내용" <c:if test="${selectsearch == '내용'}">selected</c:if>>내용</option>
								<option value="작성자" <c:if test="${selectsearch == '작성자'}">selected</c:if>>작성자</option>
							</select>
	                   	</div>
	                  	<input id="searchdata" type="text" value="${searchdata }" placeholder="검색어 입력" style="float:left;color:black;width:55%">
	                  	<button id="searchButton" class="site-btn" style="width:20%;">검색</button>
	               	</form>
	           	</div>
            </div>
            <table class="table mt-2 mb-5">
           		<tr>
					<th class="text-center" width=5% onclick="click()">번호</th>
					<th class="text-center" width=5%>분류</th>
					<th class="text-center" width=60%>제목</th>
					<th class="text-center" width=10%>작성자</th>
					<th class="text-center" width=10%>작성일</th>
					<th class="text-center" width=10%>조회수</th>
				</tr>
				<c:forEach var="vo" items="${list }">
				<tr>
					<td class="text-center" width=5%>${vo.board_no }</td>
					<td class="text-center" width=5%>${vo.tag }</td>
					<td  width=60%>
						<a href="../community/freeboard_detail.do?board_no=${vo.board_no }&page=${page}" style="color:black">${vo.subject }</a>
					</td>
					<td class="text-center" width=10%>${vo.id }</td>
					<td class="text-center" width=10%><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
					<td class="text-center" width=10%>${vo.hit }</td>
				</tr>
				</c:forEach>
           </table>
           
           
           <table class="table">
				<tr>
					<td class="product__pagination blog__pagination" style="border:none">
						<a href="../community/freeboard_list.do?page=${curpage>1?curpage-1:curpage }&tag=${tag}&selectsearch=${selectsearch}&searchdata=${searchdata}" class="" style="width:50px;border:none;color:black"
						onmouseover="this.style.color='white'" 
							onmouseout="this.style.color='black';">이전</a>
						<c:set var="underline" value="underline" />
						<c:set var="none" value="" />
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							
                        	<a class="pagelist" href="../community/freeboard_list.do?page=${i }&tag=${tag}&selectsearch=${selectsearch}&searchdata=${searchdata}" style="margin:5px;border:none;text-decoration:${curpage==i?underline:none}">${i }</a>
                        </c:forEach>
						<a href="../community/freeboard_list.do?page=${curpage<totalpage?curpage+1:curpage }&tag=${tag}&selectsearch=${selectsearch}&searchdata=${searchdata}" class="ml-4" style="width:50px;border:none;color:black"
							onmouseover="this.style.color='white'" 
							onmouseout="this.style.color='black';">다음</a>
						
					</td>
					<c:if test="${sessionScope.id!=null }">
						<td class="product__pagination blog__pagination" style="border:none;"><a href="../community/freeboard_insert_newpost.do" class="site-btn" style="border:none;height:40px;width:100px;padding:5px;font-size:17px;color:white">글쓰기</a></td>
					</c:if>
					
				</tr>
			</table>
          </div>
        </div>
      </div>
    </section>
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



</script>
</body>
</html>