<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.product__details__text .cart-icon {
	display: inline-block;
	font-size: 16px;
	color: #6f6f6f;
	padding: 13px 16px 13px;
	background: #f5f5f5;
}

</style>
<script type="text/javascript">
function formatNumber(num) {
	return Number(num).tolocalString('kr-KR')+"원"
}
$(function(){
	var minVal=$(".price-range").data("minPrice")
	var maxVal=$(".price-range").data("maxPrice")
	
	$(".price-range").slider({
            range: true,
            min: minVal,
            max: maxVal,
            values: [minVal, maxVal],
            slide: function(event, ui) {
                $("#minamount").val(formatNumber(ui.values[0]))
                $("#maxamount").val(formatNumber(ui.values[1]))
                $("#hiddenMinPrice").val(ui.values[0])
                $("#hiddenMaxPrice").val(ui.values[1])
            }
	})
	
	$("#minamount").val(formatNumber($(".price-range").slider("values", 0)))
    $("#maxamount").val(formatNumber($(".price-range").slider("values", 1)))
    $("#hiddenMinPrice").val($(".price-range").slider("values", 0))
    $("#hiddenMaxPrice").val($(".price-range").slider("values", 1))
})
</script>
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
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- Breadcrumb Section End -->

<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>주류 스토어</h2>
                        <div class="breadcrumb__option">
                            <a href="cocktail_product_list.do">Home</a>
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
            <!-- 사이드바 시작 -->
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="sidebar__item">
                        <h4>카테고리</h4>
                        <ul>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=1">레드 와인</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=2">화이트 와인</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=3">로제 와인</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=4">스파클링 와인</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=5">아메리칸 위스키</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=6">스카치 위스키</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=7">아이리쉬 위스키</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=8">캐나다 위스키</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=9">일본 위스키</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=10">브랜디</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=11">꼬냑</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=12">알마냑</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=13">리큐르</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=14">진</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=15">럼</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=16">보드카</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=17">데킬라</a></li>
                            <li><a href="../cocktail_product/cocktail_product_list.do?cno=18">전통주</a></li>
                        </ul>
                    </div>
                    <div class="sidebar__item">
                        <h4>가격</h4>
                        <div class="price-range-wrap">
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                data-min="10000" data-max="3000000">
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
                          <h4>오늘 본 상품</h4>
                           <div class="latest-product__slider owl-carousel">
                             <c:forEach var="pageList" items="${cList4 }">
                                <div class="latest-prdouct__slider__item">
                                  <c:forEach var="cvo" items="${pageList }">
                                    <a href="../cocktail_product_detail.do?product_no=${cvo.product_no }&cno=${cvo.cno }" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="${cvo.poster }">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>${cvo.name }</h6>
                                            <span>${cvo.price }</span>
                                        </div>
                                    </a>
                                  </c:forEach>
                                </div>
                            </c:forEach>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 사이드바 끝 -->

            <!-- 상품 목록 시작 -->
            <div class="col-lg-9 col-md-7">
                <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>추천 상품</h2>
                        </div>
                  <div class="row">      
                            <div class="product__discount__slider owl-carousel">
                              <c:forEach var="vo" items="${rList }" varStatus="s">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg">
                                          <a href="../cocktail_product/cocktail_product_detail_before.do?product_no=${vo.product_no }&cno=${vo.cno }"><img src="${vo.poster }" style="width: 100%; height: 200px;"></a>
                                            <ul class="product__item__pic__hover">
                                                <c:if test="${sessionScope.id!=null }"><li><a href="#"><i class="fa fa-heart"></i></a></li></c:if>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <h5><a href="../cocktail_product/cocktail_product_detail_before.do?product_no=${vo.product_no }&cno=${vo.cno }">${vo.name }</a></h5>
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
                                <form method="GET" action="cocktail_product_list.do" id="sortForm">
								   <input type="hidden" name="cno" value="${cno}"/>
								    <input type="hidden" name="page" value="${curpage}"/>
								      <select name="sort" onchange="document.getElementById('sortForm').submit()" style="padding:5px;">
								         <option value="0" <c:if test="${sort == '0'}">selected</c:if>>Default</option>
								         <option value="1" <c:if test="${sort == '1'}">selected</c:if>>Low to High</option>
								         <option value="2" <c:if test="${sort == '2'}">selected</c:if>>Price High to Low</option>
								      </select>
								 </form>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="filter__found">
                                <h6><span>${totalcount }</span>개의 상품</h6>
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
                    <c:forEach var="vo" items="${list}">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg">
                                    <a href="../cocktail_product/cocktail_product_detail_before.do?product_no=${vo.product_no }&cno=${vo.cno }"><img src="${vo.poster}" style="width: 100%; height: 200px;"></a>
                                    <ul class="product__item__pic__hover">
                                        <c:if test="${sessionScope.id!=null }"><li><a href="#"><i class="fa fa-heart"></i></a></li></c:if>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="../cocktail_product/cocktail_product_detail_before.do?product_no=${vo.product_no }&cno=${vo.cno }">${vo.name}</a></h6>
                                    <h5>${vo.price}</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
              <div class="">
                <div class="product__pagination">
                    <ul class="pagination">
                        <c:if test="${startPage>1 }">
                        <a href="../cocktail_product/cocktail_product_list.do?cno=${cno }&page=${startPage-1 }&sort=${sort }"><i class="fa fa-long-arrow-left"></i></a>
                        </c:if>
                        <c:forEach var="i" begin="${startPage }" end="${endPage }">
                        <a class="${i==curpage?'active':'' }" href="../cocktail_product/cocktail_product_list.do?cno=${cno }&page=${i }&sort=${sort }">${i }</a>
                        </c:forEach>
                        <c:if test="${endPage<totalpage }">
                        <a href="../cocktail_product/cocktail_product_list.do?cno=${cno }&page=${endPage+1 }&sort=${sort }"><i class="fa fa-long-arrow-right"></i></a>
                        </c:if>
                    </ul>
                </div>
            </div>
          </div>
        <!-- 상품 목록 끝 -->
      </div>
    </div>
</section>
    <!-- Product Section End -->
</body>
</html>