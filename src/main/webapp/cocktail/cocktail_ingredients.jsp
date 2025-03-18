<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="cockstyle.css"> 
<style type="text/css">
.nice-select {
  height: 30px;
  line-height: 30px;
  font-size:16px;
  margin: 0 5px;
  }
  .checked{
  	background-color: #181b61 !important;
  	color:white !important;
  }
</style>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>칵테일 목록</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
	<section class="product spad">
            		<div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6>총&nbsp;<span>${count}</span>개</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__found">
                                    <h6> <span>${curpage}</span>페이지 /&nbsp;<span>${totalpage }</span>총 페이지</h6>
                                </div>
                            </div>
                        </div>
                        </div>
        <div class="container">
            <div class="row">
                    <c:forEach var="vo" items="${list }">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg"  style="background-size: contain; height:350px;" data-setbg="${vo.civo.ciimage }">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="../cocktail/cocktail_ingredient_detail.do?no=${vo.civo.ing_no }">${vo.civo.ingname }</a></h6>
                                    <h5>${vo.civo.ename }</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

           <div class="container">
           		<div class="row justify-content-center">
    	                    <div class="product__pagination">
                        <c:if test="${startPage>1 }">
                        <a href="../cocktail/cocktail_ingredients.do?page=${startPage-1 }"><i class="fa fa-long-arrow-left"></i></a>
                        </c:if>
                        <c:forEach begin="${startPage }" end="${endPage }" var="i" step="1">
                        	<a class="${curpage==i?'checked':'' }" href="../cocktail/cocktail_ingredients.do?page=${i }">${i }</a>
                        </c:forEach>
                        <c:if test="${endPage<totalpage}">
                        <a href="../cocktail/cocktail_ingredients.do?page=${endPage+1 }"><i class="fa fa-long-arrow-right"></i></a>
                        </c:if>
                    </div>
           		</div>
         </div>
                </div>
            </div>
    </section>
</body>
</html>