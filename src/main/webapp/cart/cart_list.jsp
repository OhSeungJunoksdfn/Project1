<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cocktail</title>
<style type="text/css">

.quantity {
	width: 120px;
	height: 50px;
	background-color: #f5f5f5;
	background-position: center;
	display: inline-block;
	margin-bottom: 5px;
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
    function updateTotal(tr){
        let rawPrice = tr.find('.shoping__cart__price').data('price')
        let price = Number(String(rawPrice).replace(/[^0-9]/g, ''))
        
        let qtyInput = tr.find('.text-qty')
        let quantity = Number(qtyInput.val())
        
        if(isNaN(quantity) || quantity <= 1)
        {
            quantity = 1
            qtyInput.val(quantity)
        }
        
        let total = price * quantity
        tr.find('.shoping__cart__total').text(total.toLocaleString() + "원")
        
        var grandTotal = 0
        $('.shoping__cart__total').each(function(){
            var totalText = $(this).text()
            var numValue = parseFloat(totalText.replace(/원/g, '').replace(/,/g, '').trim())
            if(!isNaN(numValue))
            {
                grandTotal += numValue
            }
        })
        
        $('.price__endTotal').text(grandTotal.toLocaleString() + "원")
    }
    
    // 플러스 버튼 클릭
    $(document).on('click', '.p-qty', function(){
        let tr = $(this).closest('tr')
        let qtyInput = tr.find('.text-qty')
        let quantity = Number(qtyInput.val())
        
        if(quantity < 10)
        {
            qtyInput.val(quantity + 1)
            updateTotal(tr)
            sendAjaxUpdate(tr)
        }
        else
        {
            alert("최대 수량은 10개 입니다.")
        }
    })
    
    // 마이너스 버튼 클릭
    $(document).on('click', '.m-qty', function(){
        let tr = $(this).closest('tr')
        let qtyInput = tr.find('.text-qty')
        let quantity = Number(qtyInput.val())
        
        if(quantity > 1)
        {
            qtyInput.val(quantity - 1)
            updateTotal(tr)
            sendAjaxUpdate(tr)
        }
        else
        {
            alert("최소 수량은 1개 입니다.")
        }
    })
    
    // 직접 입력 시 정수 1~10 
    $(document).on('input change', '.text-qty', function(){
        let tr = $(this).closest('tr')
        let val = $(this).val()
        val = val.replace(/[^0-9]/g, '')

        if(val === "" || Number(val) < 1)
        {
            val = 1
        } 
        else if(Number(val) > 10)
        {
            val = 10
            alert("최대 수량은 10개 입니다.")
        }

        $(this).val(val)
        updateTotal(tr)
        sendAjaxUpdate(tr)
    })

    // 페이지 로드시 각 행마다 총액과 hidden 필드 값 갱신
    $('tr').each(function(){
        updateTotal($(this))
    })
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
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>장바구니</h2>
                        <div class="breadcrumb__option">
                            <span>장바구니</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                              <c:forEach var="vo" items="${cartList }">
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="${vo.cpvo.poster }" style="width: 100px; height: 100px">
                                        <h5>${vo.cpvo.name }</h5>
                                    </td>
                             <td class="shoping__cart__price" 
                               data-price="${fn:replace(fn:replace(vo.cpvo.price, ',', ''), '원', '')}">
                               ${vo.cpvo.price }
                             </td>
                               <td class="shoping__cart__quantity">
                                <div class="quantity">
                                  <button type="button" class="m-qty">-</button>
                                   <input type="text" class="text-qty" id="in-qty" value="${vo.account }">
                                  <button type="button" class="p-qty">+</button>
                                </div>
                               </td>
                                  <td class="shoping__cart__total" 
                                    data-price="${fn:replace(fn:replace(vo.cpvo.price, ',', ''), '원', '')}">
    							    ${vo.cpvo.price}
                                  </td>
                                   <td class="shoping__cart__item__close">
                                      <a href="../cart/cart_delete.do?cno=${vo.cno}" onclick="return confirm('삭제하시겠습니까?');">
                                       <span class="icon_close"></span>
                                      </a>
                                   </td>
                                 </tr>
                               </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="../cocktail_product/cocktail_product_list.do" class="primary-btn cart-btn">상품 더 둘러보기</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>총 금액</h5>
                        <ul>
                            <li>
                            <span class="price__endTotal" 
                              data-price="${fn:replace(fn:replace(fn:replace(vo.cpvo.price, ',', ''), '원', ''), ' ', '')}">
                              ${vo.cpvo.price}
                            </span>
                            </li>
                        </ul>
                        <a href="#" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
</body>
</html>