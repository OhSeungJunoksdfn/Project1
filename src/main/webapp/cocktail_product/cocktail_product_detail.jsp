<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.product__details__text .cart-icon {
	
}
</style>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>주류 스토어</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">스토어 홈</a>
                            <a href="../cocktail_product/cocktail_product_list.do?cno=${cno }">${vo.type }</a>
                            <span>상품 페이지</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
               <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="${vo.poster }">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                      <h3>${vo.name }</h3>
                       <div class="product__details__price">${vo.price }</div>
                         <h6 style="color: red; font-weight: bold; ">해당 상품은 픽업만 가능한 상품입니다!</h6>
                        <c:choose>
                         <c:when test="${vo.cno>=1 && vo.cno<=4 }">
                           <p>상품 상세 참조</p>
                         </c:when>
                         <c:otherwise>
                          <ul>
                           <li><b>종류</b> <span>${vo.type }</span></li>
                           <li><b>용량</b> <span>${vo.volumn }</span></li>
                           <li><b>국가</b> <span>${vo.loc }</span></li>
                           <li><b>도수</b> <span>${vo.alc }</span></li>
                         </ul>
                         </c:otherwise>
                        </c:choose>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div>
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <a href="#" class="heart-icon"><span class="icon_cart_alt"></span></a>
                        <a href="#" class="primary-btn">구매하기</a>
                        <a href="#" class="primary-btn">목록</a>
                        <ul>
                            <li><b>Availability</b> <span>In Stock</span></li>
                            <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                            <li><b>Weight</b> <span>0.5 kg</span></li>
                            <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">상품 상세정보</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6></h6>
                                    <c:choose>
                                      <c:when test="${vo.cno >= 1 && vo.cno <= 4}">
                                        <img src="${vo.content }">
                                      </c:when>
                                      <c:otherwise>
                                        <p>${vo.content }</p>
                                      </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>관련 상품 보기</h2>
                    </div>
                </div>
            </div>
            <div class="row">
              <c:forEach var="vo" items="${rList4 }">
                <div class="col-lg-3 col-md-4 col-sm-6">
                  
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                          <a href="../cocktail_product/cocktail_product_detail_before.do?product_no=${vo.product_no }&cno=${vo.cno }">
                            <img src="${vo.poster }" style="width: 100%; height: 200px;">
                          </a>
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="../cocktail_product/cocktail_product_detail_before.do?product_no=${vo.product_no }&cno=${vo.cno }">${vo.name }</a></h6>
                            <h5>${vo.price }</h5>
                        </div>
                    </div>
                  
                </div>
               </c:forEach>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->
</body>
</html>