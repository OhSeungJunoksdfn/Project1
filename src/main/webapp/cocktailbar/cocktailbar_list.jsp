<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bce0da4aa16d6105ec492eb0855addfd&libraries=services"></script>
<!-- <style type="text/css">
h6{
overflow: hidden;
white-space: nowrap;
text-overflow: ellipsis;
}
</style> -->
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>칵테일바</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <table class="table">
              <tr>
               <td>
                <a href="../cocktailbar/cocktailbarboard_insert.do" class="btn btn-outline-danger btn-sm">새글</a>
               </td>
              </tr>
             </table>
                <div class="col-lg-12 col-md-12">
                    
                    
                    
                    <div class="row">
                    	 <c:forEach var="vo" items="${list }">
                        	<div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg=${vo.image}>
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">${vo.loc }</a></h6>
                                    <h5><a href="../cocktailbar/cocktailbar_detail_before.do?bar_no=${vo.bar_no }">${vo.name}</a></h5>
                                </div>
                            </div>
                        </div>
						</c:forEach>
                    </div>
                    <!-- 
                    <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-3.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                     -->
                    
                  
                    <div class="col-12">
                    <div class="product__pagination">
                        <nav aria-label="#">
                            <ul class="pagination">
                               <c:if test="${startPage>1 }">
                                 <li class="page-item">
                                    <a class="page-link" href="../cocktailbar/cocktailbar_list.do?page=${startPage-1 }">이전 <i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
                                 </li>
                                </c:if>
                                
                                <c:forEach var="i" begin="${startPage }" end="${endPage }">
                                 <li class="page-item ${i==curpage?'active':'' }"><a class="page-link" href="../cocktailbar/cocktailbar_list.do?page=${i }">${i }</a></li>
                                </c:forEach>
                                
                                <c:if test="${endPage<totalpage }">
                                 <li class="page-item">
                                    <a class="page-link" href="../cocktailbar/cocktailbar_list.do?page=${endPage+1 }">다음 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                 </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                    </div>
                    
                      <div class="row">
                       <div class="product__discount__slider owl-carousel">
                   		<c:forEach var="cook" items="${cList }">
                   		 
		                   <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__discount__item">
                                    	<a href="../cocktailbar/cocktailbar_detail.do?bar_no=${cook.bar_no }">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="${cook.image}">
                                        </div>
                                        </a>
                                    </div>
                            </div>
                          </c:forEach>   
                          </div>
                        </div>
                                    
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>