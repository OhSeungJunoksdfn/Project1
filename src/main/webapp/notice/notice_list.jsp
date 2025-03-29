<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>로그인</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
	<!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    <link rel="stylesheet" href="../shadow/css/shadowbox.css">
    <link rel="stylesheet" href="../css/login.css">
    <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
    <script type="text/javascript">
    
$(function(){
	$('#all').click(function(){
		if($(this).is(':checked')){
			$('input[name=dbox]').prop("checked",true)
		}
		else
		{
			$('input[name=dbox]').prop("checked",false)
		}
	})
})
</script>
</head>
<body>
<c:if test="${sessionScope.id!=null }">
  <div class="login-container1" style="width: 900px; margin: 0 auto;">
   <div class="checkout__form"> 
  <form method=post action="../admin/notice_delete.do">
        <c:if test="${sessionScope.admin=='y' }">
           <table class="table">
              <tr>
               <td>
                <a href="../admin/notice_insert.do" class="btn btn-danger btn-sm">새글</a>
               </td>
              </tr>
             </table>
             </c:if>
             <table class="table">
              <tr>
                <th width=10% class="text-center">번호</th>
                <th width=45% class="text-center">제목</th>
                <th width=15% class="text-center">이름</th>
                <th width=20% class="text-center">작성일</th>
                <th width=10% class="text-center">조회수</th>
              </tr>
              <c:if test="${sessionScope.admin=='y' }">
                <tr>
                  <td colspan="5">
                   <input type="checkbox" value="all" id="all">전체선택
                   &nbsp;
                   <input type=submit value="삭제" class="btn-sm btn-danger">
                  </td>
                </tr>
               </c:if>
              <c:set var="count" value="${count }"/>
              <c:forEach var="vo" items="${list }">
                <tr>
                 <td width=10% class="text-center">
                 <input type="checkbox" name="dbox" value="${vo.no }">
                 ${count }</td>
                 <td width=45%><a href="../admin/notice_detail.do?no=${vo.no}">[${vo.types}]&nbsp;${vo.subject }</a></td>
                 <td width=15% class="text-center">${vo.name }</td>
                 <td width=20% class="text-center">${vo.dbday }</td>
                 <td width=10% class="text-center">${vo.hit }</td>
               </tr>
               <c:set var="count" value="${count-1 }"/>
              </c:forEach>
             </table> 
             <table class="table">
               <tr>
                <td class="text-right">
                 <a href="../admin/notice_list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-info btn-sm">이전</a>
                  ${curpage } page / ${totalpage } pages
                 <a href="../admin/notice_list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-success btn-sm">다음</a>
                </td>
               </tr>
             </table>
           </form>
            </div>
          </div>
          </c:if>
</body>
</html>