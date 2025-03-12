<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="cockstyle.css"> 
</head>
<body>
 <section class="bg-light" >
      <div class="container">
        <div class="row">
						<c:forEach var="vo" items="${list }">
							<div class="col-md-3 col-sm-6 mb-4" style="cursor:pointer">
  							<img  src="${vo.image }" alt="Card image" style="width:100%;height:250px;" >
 									<div>
    								<h4 class="">${vo.name }</h4>
    								<p style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${vo.comments }</p>
  								</div>
							</div>
						</c:forEach>
        </div>
      </div>
 </section>
 
    <section class="ftco-section bg-light" style="padding:0 0 3rem" id="section-offer">
      <div class="container">
        <div class="row justify-content-center">
                    <div class="pagination-area d-sm-flex mt-15">
                        <nav aria-label="#">
                            <ul class="pagination">
                            <c:if test="${curpage>1 }">
                            	<li class="page-item">
                                    <a class="page-link" href="../cocktail/cocktail_list.do?page=${curpage-1 }"><i class="fa fa-angle-double-left" aria-hidden="true"></i> 이전</a>
                                </li>
                                </c:if>
																	<div class="page-status px-3 align-items-center">
                            				<p style="margin:0; line-height:35px">Page ${ curpage } of ${totalpage } results</p>
                        					</div>
																<c:if test="${curpage<totalpage }">
                                <li class="page-item">
                                    <a class="page-link" href="../cocktail/cocktail_list.do?page=${curpage+1 }">다음 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                </li>
                                </c:if>
                            </ul>
                        </nav>
                 
                    </div>
                </div>
        </div>
   	</section>
      
   
</body>
</html>