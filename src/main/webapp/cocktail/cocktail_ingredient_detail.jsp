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
    <title>Ogani | Template</title>

</head>

<body>
    

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="${vo.civo.ciimage }" alt="" style="width:555px; height: 550px; object-fit:corver">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${vo.civo.ingname }</h3>
 
                        <div class="product__details__price">${vo.civo.ename }</div>
                        <p>${vo.civo.comments }</p>

                        <a href="#" class="primary-btn">즐겨찾기</a>
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <ul>
                        <c:if test="${vo.civo.alc!=null }">
                            <li><b>ALC</b> <span>${vo.civo.alc }</span></li>
                        </c:if>
                            <li><b>태그</b> ${vo.civo.ingtag }</li>
                        </ul>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->
	    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>만들 수 있는 칵테일</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            <c:forEach var="tvo" items="${list }">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${tvo.image }">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="../cocktail/cocktail_detail.do?cno=${tvo.cocktail_no }">${tvo.name }</a></h6>
                            <h5>${tvo.ename }</h5>
                        </div>
                    </div>
                </div>
            	</c:forEach>
            </div>
        </div>
      </section>
    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>다른 칵테일 추천</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:forEach var="tvo" items="${clist }">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${tvo.image }">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="../cocktail/cocktail_detail.do?cno=${tvo.cocktail_no }">${tvo.name }</a></h6>
                            <h5>${tvo.ename }</h5>
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
      