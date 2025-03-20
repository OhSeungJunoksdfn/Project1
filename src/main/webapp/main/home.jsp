<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>상품</span>
                        </div>
                        <ul>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=1">레드</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=2">화이트</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=3">로제</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=4">스파클링</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=5">아메리칸 위스키</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=6">스카치 위스키</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=13">리큐르</a></li>
                            <li><a href="#">하이볼 글라스</a></li>
                            <li><a href="#">칵테일 쉐이커</a></li>
                            <li><a href="#">지거/믹싱턴</a></li>
                            <li><a href="#">바 스푼</a></li>
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
                                <input type="text" placeholder="Seach">
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                        </div>

                    </div>
                    <div class="hero__item set-bg" data-setbg="${cbvo.image }" style="padding:0">
                        <div class="hero__text" style="background-color:rgba(0,0,0,0.2);width:100%;height:100%;padding:100px 0 0 75px ">
                            <span>낭만이 흐르는 공간</span>
                            <h2 style="color:#fff">${cbvo.name }</h2>
                            <p>당신의 하루를 더욱 특별하게, ${cbvo.name }에서 만나요.</p>
                            <a href="#" class="primary-btn">예약하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                <c:forEach var="vo" items="${chlist }">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${vo.image }">
                            <h5><a href="#">${vo.name }</a></h5>
                        </div>
                    </div>
                </c:forEach>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".레드">레드</li>
                            <li data-filter=".화이트">화이트</li>
                            <li data-filter=".스파클링">스파클링</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            <c:forEach var="vo" items="${plist }">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges ${vo.type }">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg=${vo.poster }>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${vo.name }</a></h6>
                            <h5>${vo.price }</h5>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>
    </section>
    <!-- Featured Section End -->


    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>칵테일</h4>
                        <div class="latest-product__slider owl-carousel">
                        <c:forEach  var="vo" items="${list }" varStatus="i">
                        <c:if test="${i.count == 1 or i.count == 4 or i.count == 7 or i.count == 10}">
                            <div class="latest-prdouct__slider__item">
                            </c:if>
                                <a href="../cocktail/cocktail_detail_before.do?cno=${vo.cocktail_no }" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${vo.image }" alt="" style="width:110px; height:110px">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${vo.ename }</h6>
                                        <span>${vo.name }</span>
                                    </div>
                                </a>
                         <c:if test="${i.count%3==0}">
                          </div>
                         </c:if>                 
                        </c:forEach>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>재료</h4>
                        <div class="latest-product__slider owl-carousel">
                        <c:forEach  var="vo" items="${inglist }" varStatus="i">
                        <c:if test="${i.count == 1 or i.count == 4 or i.count == 7 or i.count == 10}">
                            <div class="latest-prdouct__slider__item">
                            </c:if>
                                <a href="../cocktail/cocktail_ingredient_detail.do?no=${vo.civo.ing_no }" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${vo.civo.ciimage }" alt="" style="width:110px; height:110px">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${vo.civo.ename }</h6>
                                        <span>${vo.civo.ingname }</span>
                                    </div>
                                </a>
                         <c:if test="${i.count%3==0}">
                          </div>
                         </c:if>                 
                        </c:forEach>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>나만의 칵테일</h4>
                        <div class="latest-product__slider owl-carousel">
                        <c:forEach  var="vo" items="${clist }" varStatus="i">
                        <c:if test="${i.count == 1 or i.count == 4 or i.count == 7 or i.count == 10}">
                            <div class="latest-prdouct__slider__item">
                            </c:if>
                                <a href="../cocktail/cocktail_detail_before.do?cno=${vo.cocktail_no }" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${vo.image }" alt="" style="width:110px; height:110px">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${vo.ename }</h6>
                                        <span>${vo.name }</span>
                                    </div>
                                </a>
                         <c:if test="${i.count%3==0}">
                          </div>
                         </c:if>                 
                        </c:forEach>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Product Section End -->

    <!-- Blog Section Begin -->
    <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>From The magazine</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            <c:forEach var="vo" items="${newslist }" >
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="${vo.image }" alt="" style="width:100%;height:240px">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> ${vo.dbday }</li>
                                <li><i class="fa fa-eye"></i> ${vo.hit }</li>
                            </ul>
                            <h5><a href="#">${vo.title }</a></h5>
                            <p style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${vo.content } </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
                
            </div>
        </div>
    </section>
</body>
</html>