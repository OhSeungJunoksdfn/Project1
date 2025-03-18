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
</head>
<body>
<div>
	<section class="ftco-section">
      <div class="container">
        
        <div class="row">
          <div class="col-md-12 text-center mb-5 ftco-animate">
            <h2 class="display-4">자유게시판</h2>
            <table class="table">
			<tr>
				<td><h4 class="text-left" style="float:left;vertical-align:bottom;margin-top:30px">[${vo.tag }] ${vo.subject }</h4></td>
				<td class="text-right">
				<a href="#" class="site-btn">수정</a> 
				<a href="#" class="site-btn">삭제</a> 
				<a href="#" class="site-btn">목록</a> 
				</td>
			</tr>
			</table>
            
            
            <table class="table">
				<tr>
					<th class="text-center item" width=5%>${vo.id }</th>
					<th class="text-left"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd hh:mm:ss"/></th>
					<th class="text-right">조회수 ${vo.hit }</th>
				</tr>
           </table>
           <hr>
           	<iframe class="ifr" src="../community/get_htmlfile.do?htmlfile=${vo.htmlfile }" scrolling="no" style="width:100%;height:${vo.documentheight}px;margin-bottom:200px;border:none;"></iframe>
          
           <!-- <table class="table">
           	
				<tr>
					<td>
						
					</td>
				</tr>
			</table> -->
          </div>
        </div>
        
      </div>
    </section>
</div>
</body>
</html>