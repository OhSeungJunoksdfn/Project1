<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.ellipsis-10 {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  max-width: 10em;     /* 10글자 기준 너비 */
  display: inline-block; /* block 요소에만 적용됨 */
  vertical-align: middle;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
let sel=0;
IMP.init("imp68206770"); 
function requestPay(json,name,price) {
 var IMP = window.IMP; 
 IMP.init("imp22605991"); // 아임포트 초기화

 IMP.request_pay({
     channelKey: "channel-key-4ce83a57-9ceb-443a-94ed-2b49fa7e760a",
     pg: name, 
     pay_method: "card",
     merchant_uid: "ORD20180131-0000011",
     name: name,
     amount: 1004,
     buyer_email: email,
     buyer_name: name,
     buyer_tel: phone,
     buyer_addr:  addr,
     buyer_postcode: post
 }, function (rsp) {
     if (rsp.success) 
     {
         alert('결제가 완료되었습니다.')
     } else 
     {
         alert('결제가 실패했습니다.')
     }
 })
}

// AJAX 요청 부분 (클릭 이벤트)
$('#site-btn').ready(function(){
 $('#site-btn').click(function(){
     let cno = $('#cno-hidden').val()
     let price = $('#price-hidden').val()
     let account = $('#account-hidden').val()
     let name = $('#title-hidden').text()

     $.ajax({
         type: 'POST',
         url: '../cart/buy_ok.do',
         data: { "cno": cno, "price": price, "account": account },
         success: function(result) {
             try {
                 console.log("서버 응답: ", result) // 데이터 확인용
                 let json = JSON.parse(result)

                 if (!json.email || !json.name || !json.phone || !json.address || !json.post)
                 {
                     alert("서버에서 유효한 데이터를 받아오지 못했습니다.")
                     console.error("서버에서 받아온 JSON: ", json)
                     return;
                 }
                 
                 alert("서버 응답을 받았습니다.");
                 window.requestPay(json, name, price)
             } catch (e) {
                 alert("서버 응답을 제대로 받지 못했습니다.")
                 console.error(e);
             }
         },
         error: function(xhr, status, error) {
             alert("AJAX 요청 오류 발생: " + error)
             console.error("상태: " + status)
             console.error("에러: " + error)
         }
     })
 })
})

</script>
</head>
<body>
  <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>구매하기</h4>
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>주문자 정보<span>*</span></p>
                                        <a>${name }</a>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p><span></span></p>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>우편 번호<span>*</span></p>
                                <a>${cmvo.post }</a>
                            </div>
                            <div class="checkout__input">
                                <p>주소<span>*</span></p>
                                <a>${cmvo.address }</a>
                            </div>
                            <div class="checkout__input">
                                <p>상세 주소<span>*</span></p>
                                <a>${cmvo.address_detail }</a>
                            </div>
                           <div>
						        <img src="${poster }" style="width:120px; height:100px;">
						        <span class="">${pname}</span>
						        <p class="text-right">${price } X ${account }<span></span></p>
						   </div>
                            <div class="checkout__input">
                                <p>배송 요청사항</p>
                                <input type="text" placeholder="배송 시 요청 사항을 작성 해주세요.">
                            </div>
                          
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                               <div class="checkout__order__products">상품명 </div>
                               <div class="">
                                <ul>
                                    <li>${pname } X ${account }<span><fmt:formatNumber value="${totalPrice }" pattern="#,##0"/>원</span></span></li>
                                </ul>
                               </div>
                                <div class="checkout__order__total">총 금액 <span><fmt:formatNumber value="${totalPrice }" pattern="#,##0"/>원</span></div>
                                <button type="submit" class="site-btn">결제하기</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
</body>
</html>