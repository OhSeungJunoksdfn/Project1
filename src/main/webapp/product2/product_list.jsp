<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
 							<li><a href="#">바텐딩 도구</a></li>
                            <li><a href="#">테이블 용품</a></li>
                            <li><a href="#">글라스</a></li>
                            <li><a href="#">식자재</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
     
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>칵테일 용품 목록</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>칵테일용품</span>
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
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                    <div class="sidebar__item">
                            <h4>칵테일 용품</h4>
                            <ul>
                                <li><a href="#">바텐딩 도구</a></li>
                                <li><a href="#">테이블 용품</a></li>
                                <li><a href="#">글라스</a></li>
                                <li><a href="#">식자재</a></li>
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>Price</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="10" data-max="540">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount">
                                        <input type="text" id="maxamount">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Latest Products</h4>
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-1.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-2.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-3.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="latest-prdouct__slider__item">
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-1.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-2.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-3.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>추천상품</h2>
                        </div>
                        <div class="row">
	                         
                            <div class="product__discount__slider owl-carousel">
                            	<c:forEach var="vo" items="${plist }">
	                                <div class="col-lg-4">
	                                    <div class="product__discount__item">
	                                        <div class="product__discount__item__pic set-bg"
	                                            data-setbg="${vo.poster }">
	                                         
	                                            <ul class="product__item__pic__hover">
	                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                                            </ul>
	                                        </div>
	                                        <div class="product__discount__item__text">
	                                         
	                                            <h5><a href="#">${vo.name }</a></h5>
	                                            <div class="product__item__price">${vo.price }</div>
	                                        </div>
	                                    </div>
	                                </div>
                                </c:forEach>
                            </div>
                       
                        </div>
                    </div>
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">Default</option>
                                        <option value="0">Default</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>12</span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    	<c:forEach var="vo" items="${list }">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${vo.poster }">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                 	<h6><a href="../product2/product_detail_before.do?product_no=${vo.product_no }">${vo.name }</a></h6>
                                    <h5>${vo.price }</h5>
                               
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <!--  
                    <div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                    -->
					<div class="col-12">
                    <div class="pagination-area d-sm-flex mt-15">
                        <nav aria-label="#">
                            <ul class="pagination">
                               <c:if test="${startPage>1 }">
                                 <li class="page-item">
                                    <a class="page-link" href="../product2/product_list.do?page=${startPage-1 }">이전 <i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
                                 </li>
                                </c:if>
                                
                                <c:forEach var="i" begin="${startPage }" end="${endPage }">
                                 <li class="page-item ${i==curpage?'active':'' }"><a class="page-link" href="../product2/product_list.do?page=${i }">${i }</a></li>
                                </c:forEach>
                                
                                <c:if test="${endPage<totalpage }">
                                 <li class="page-item">
                                    <a class="page-link" href="../product2/product_list.do?page=${endPage+1 }">다음 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                 </li>
                                </c:if>
                            </ul>
                        </nav>
                        <div class="page-status"  style="margin-left:auto;"">
                            <p>Page ${curpage } of ${totalpage } results</p>
                        </div>
                    </div>
                </div>
            </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

</body>

</html>