<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.pro-qty_total_box {
    background: #f5f5f5;
    padding: 30px;
    padding-top: 20px;
    margin-top: 50px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.m-qty {
    height: 100%;
	width: 100%;
	font-size: 16px;
	color: #6f6f6f;
	width: 30px;
	border: none;
	background: #f5f5f5;
	text-align: center;
}

.p-qty {
    height: 100%;
	width: 100%;
	font-size: 16px;
	color: #6f6f6f;
	width: 30px;
	border: none;
	background: #f5f5f5;
	text-align: center;
}

.text-qty {
	height: 100%;
	width: 100%;
	font-size: 16px;
	color: #6f6f6f;
	width: 50px;
	border: none;
	background: #f5f5f5;
	text-align: center;
}

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
    // 총 금액 업데이트 함수
    function updateTotal(){
        // data-price에 vo.priceInt 값
        let price = Number($('.product__details__quantity').data('price'))
        let quantity = Number($('#in-qty').val())
        if(isNaN(quantity) || quantity < 1) {
            quantity = 1
            $('#in-qty').val(quantity)
        }
        let total = price * quantity
        
        // 화면에 표시
        $('#total').text(total.toLocaleString() + "원")
        
        // 폼에 넣기 전 확인
    console.log("[form#frm] 총 금액 hidden:", $('#frm #total-price-hidden-cart').val());
    console.log("[form#buy_button] 총 금액 hidden:", $('#buy_button #total-price-hidden-buy').val());
        
        $('#frm #account-hidden').val(quantity)
 		$('#frm #price-hidden').val(price)
        $('#frm #total-price-hidden-cart').val(total)
        
        $('#buy_button #account-hidden').val(quantity)
  		$('#buy_button #price-hidden').val(price)
        $('#buy_button #total-price-hidden-buy').val(total)
    }
    
    // 플러스 버튼 클릭 시
    $('.p-qty').click(function(){
        let quantity = Number($('#in-qty').val())
        if(quantity < 10){
            $('#in-qty').val(quantity + 1)
        } else {
            alert("최대 수량은 10개 입니다.")
        }
        updateTotal()
    })
    
    // 마이너스 버튼 클릭 시
    $('.m-qty').click(function(){
        let quantity = Number($('#in-qty').val())
        if(quantity > 1){
            $('#in-qty').val(quantity - 1)
        } else {
            alert("최소 수량은 1개 입니다.")
        }
        updateTotal()
    })
    
    // 직접 입력 시 1~10 정수
    $('.text-qty').on('input change', function(){
        let val = $(this).val()
        val = val.replace(/[^0-9]/g, '')
        if(val === "" || Number(val) < 1) {
            val = 1
        } else if(Number(val) > 10) {
            val = 10
            alert("최대 수량은 10개 입니다.")
        }
        $(this).val(val)
        updateTotal()
    })
    
    // 장바구니 담기 버튼 클릭 시
    $('.icon_cart_alt').click(function(e){
        e.preventDefault()
        let quantity = Number($('#in-qty').val())
        if(quantity < 1){
            alert("수량을 선택 해주세요.")
            return
        }
        updateTotal() 
        $('#frm').submit()
    })
    
    updateTotal()
})

</script>
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
                            <a href="../cocktail_product/cocktail_product_list.do">스토어 홈</a>
                            <a href="../cocktail_product/cocktail_product_list.do?cno=${cno }">${vo.type }</a>
                            <span>상품 상세</span>
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
                        
                     <hr>
                  
                    <div class="pro-qty_total_box" style="display: flex;">
                        <div class="product__details__quantity" data-price="${vo.priceInt }">
                            <div class="quantity">
                                  <button type="button" class="m-qty">-</button>
                                   <input type="text" class="text-qty" id="in-qty" value="1">
                                  <button type="button" class="p-qty">+</button>
                            </div>
                        </div>
                        <span style="right: 0px; bottom: 0px;">
                          총 금액 : <span id="total"><fmt:formatNumber value="${vo.priceInt}" pattern="#,##0"/>원</span>
                        </span>
                    </div>
                     <c:if test="${sessionScope.id!=null }">
                       
                        <a href="../jjim/jjim_insert.do?rno=${vo.product_no }&type=1" class="heart-icon"><span class="icon_heart_alt"></span></a>
                       <form method="post" action="../cart/cart_insert.do" class="heart-icon" id="frm"> 
                         <input type="hidden" name="pno" id="product_no-hidden" value="${product_no }">
                         <input type="hidden" name="poster" id="poster-hidden" value="${vo.poster }">
                         <input type="hidden" name="username" id="name-hidden" value="${vo.name }">
                         <input type="hidden" name="price" id="price-hidden" value="${vo.priceInt }">
                         <input type="hidden" name="account" id="account-hidden" value="1">
                         <input type="hidden" name="total-price" id="total-price-hidden-cart" value="${priceInt }">
                         <input type="hidden" name="cno" id="cno-hidden" value="${cno }">
                         <button type="button" class="icon_cart_alt" style="background: none; border: none;"></button>
                       </form>
                       <form method="post" action="../cart/buy.do" id="buy_button">
                         <input type="hidden" name="pno" id="product_no-hidden" value="${vo.product_no }">
                         <input type="hidden" name="poster" id="poster-hidden" value="${vo.poster }">
                         <input type="hidden" name="pname" id="name-hidden" value="${vo.name }">
                         <input type="hidden" name="price" id="price-hidden" value="${vo.priceInt }">
                         <input type="hidden" name="account" id="account-hidden" value="1">
                         <input type="hidden" name="total-price" id="total-price-hidden-buy" value="${priceInt }">
                         <input type="hidden" name="cno" id="cno-hidden" value="${cno }">
                         <button type="submit" class="primary-btn">바로 구매</button>
                       </form>
                     </c:if>
                        <a href="javascript:history.back()" class="primary-btn">목록</a>  
                      
                      
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
                                <c:if test="${sessionScope.id!=null }"><li><a href="#"><i class="fa fa-heart"></i></a></li></c:if>
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