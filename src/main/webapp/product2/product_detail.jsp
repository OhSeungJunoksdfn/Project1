<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.a{
	    white-space:nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}
	#image{
		width: 100%;
		height: 350px;
		border-radius: 20px;
	}
	#title{
		font-size: 25px;
		font-weight: bold;
	}
	#sub{
		color:grey;
		text-align: center;
	}
	#percent{
		font-size: 25px; /*h3*/
		color: pink;
		font-weight: bold;
	}
	#price{
		font-size: 25px; /*h3*/
		font-weight: bold;
	}
	#psub{
		font-size: 12px;
		color: #999;
	}
	#star{
		color: orange;
		font-weight: bold;
	}
	#blod{
		font-weight: bold;
	}
	#count{
		color:gray
	}
	#sel{
		width: 100%;
		height: 40px;
	}
	#cart,#buy,#list{
		width: 150px;
		height: 70px;
		border: 2px green solid;
		font-size: 20px;
		font-weight: bold;
		border-radius: 10px;
		box-shadow: 5px 5px 5px #A9A9A9;
	}
	#cart:hover , #buy:hover{
		cursor: pointer;
	}
	#cart{
		
		background-color: white;
		color:green;
	}
	#buy{
		background-color: green;
		color:white;
	}
	#list{
		background-color: blue;
		color:white;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let bClick=false
$(function(){
	$('.updates').click(function(){
		let rno=$(this).attr("data-rno")
		$('.ups').hide()
		$(".updates").text("수정")
		if(bClick===false)
		{
			$(this).text("취소")
			$('#up'+rno).show()
			bClick=true
		}
		else
		{
			$(this).text("수정")
			$('#up'+rno).hide()
			bClick=false
		}
	})
})
//----- cart
let sel=0;
var IMP = window.IMP; 
IMP.init("imp68206770"); 
function requestPay(json,name,price) {
    IMP.request_pay({
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "ORD20180131-0000011",   // 주문번호
        name: name,
        amount: price,         // 숫자 타입
        buyer_email: json.email,
        buyer_name: json.name,
        buyer_tel:json.phone,
        buyer_addr: json.address,
        buyer_postcode: json.post
    }, function (rsp) { // callback
    	location.href='http://localhost/JSPLastProject/mypage/mypage_buy_list.do' 
    });
}
$(function(){
	
	$('#sel').change(function(){
		let account=$('#sel').val()
		if(account==='수량선택')
		{
			alert("수량을 선택하세요")
			return
		}
		let price=$('#sel').attr("data-price")
		let total=Number(price)*Number(account)
		$('#total').text(total.toLocaleString()+"원")
		$('#account').val(account)
        sel=1		
	})
	$('#cart').click(function(){
		if(sel===0)
		{
		  alert("수량을 선택하세요")
		  return;
		}
		$('#frm').submit()
	})
	$('#buy').click(function(){
		if(sel===0)
		{
			alert("수량 선택하세요")
			return
		}
		let gno=$('#pno').val();
		let price=$('#price2').val();
		let account=$('#account').val();
		let name=$('#title').text()
		$.ajax({
			type:'post',
			url:'../cart/buy_insert.do',
			data:{"pno":pno,"price":price,"account":account},
			success:function(result)
			{
				alert(result)
				let json=JSON.parse(result)
				requestPay(json,name,price)
			}
		})
	})
})
</script>
<style>

</style>
</head>
<body>
<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>상품 상세보기</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <a href="./index.html">shop</a>
                            <span>상세페이지</span>
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
                                src="${vo.poster}" alt="이미지에대한 설명">
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${vo.name }</h3>

                        <div class="product__details__price">${vo.price }</div>
                        
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div>
                        <a href="#" class="primary-btn">ADD TO CARD</a>
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <p>${vo.delivery_fee }</p>
                        <ul>
                            <li><b>Availability</b> <span>In Stock</span></li>
                            <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
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
                    <div>
						 <tr>
					         <td class="text-right">
					          <c:if test="${sessionScope.id!=null }">
					            <!-- <button id="likeBtn">-->
								<img src="../product2/heart.png" id="likeBtnIcon" style="width:35px;height: 35px">
								<span id="likeCount">&nbsp;&nbsp;&nbsp;${vo.likecount }
								</span>
								<!-- </button>--> 
						        <c:if test="${jCount==0 }">
						          <a href="../jjim/jjim_insert.do?rno=${vo.product_no }&type=2" 
						             class="btn btn-sm btn-outline-info">찜하기</a>
						        </c:if>
						        <c:if test="${jCount!=0 }">
						          <span 
						             class="btn btn-sm btn-outline-danger">찜하기</span>
						        </c:if>
					          </c:if>
					          <a href="javascript:history.back()" 
					             class="btn btn-sm btn-primary">목록</a>
					         </td>
						  </tr>                    
                </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="true">Reviews <span>(1)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
             
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
                                        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
                                        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
                                        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
                                        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
                                        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
                                        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
                                        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
                                        Proin eget tortor risus.</p>
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
                        <h2>관련 칵테일</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:forEach var="evo" items="${elist }">
	                <div class="col-lg-3 col-md-4 col-sm-6">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="${evo.image }">
	                            <ul class="product__item__pic__hover">
	                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="product__item__text">
	                            <h6><a href="../cocktail/cocktail_detail_before.do?cno=${evo.cocktail_no }">${evo.name }</a></h6>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->
    
                   <!-- Comment Area Start -->
                            <div class="comment_area section_padding_50 clearfix">
                                <h4 class="mb-30">댓글(${count })</h4>

                                <ol>
                                   <c:forEach var="rvo" items="${rList }">
                                    <li class="single_comment_area">
                                        <div class="comment-wrapper d-flex">
                                            <!-- Comment Meta -->
                                            <div class="comment-author">
                                                <c:if test="${rvo.sex=='남자' }">
                                                 <img src="../img/images/man.png" alt="">
                                                </c:if>
                                                <c:if test="${rvo.sex=='여자' }">
                                                 <img src="../img/images/woman.png" alt="">
                                                </c:if>
                                            </div>
                                            <!-- Comment Content -->
                                            <div class="comment-content">
                                                <span class="comment-date text-muted">${rvo.dbday}</span>
                                                <h5>${rvo.name }</h5>
                                                <p>${rvo.msg }</p>
                                                <c:if test="${sessionScope.id!=null }">
                                               
                                                   <c:if test="${sessionScope.id==rvo.id }">
                                                     <a class="active updates" data-rno="${rvo.cno }">수정</a>
                                                     <a href="../reply/reply_delete.do?cno=${rvo.cno }&rno=${rvo.rno}&type=2" class="active">삭제</a>
                                                   </c:if>
                                                </c:if>
                                                
                                                <div class="comment-form ups" style="display:none" id="up${rvo.cno }">
                                  
				                                    <form action="../reply/reply_update.do" method="post">
				                                        
				                                        <div class="form-group">
				                                            <textarea name="msg" id="msg" cols="50" rows="3" placeholder="Message" style="float: left" required>${rvo.msg }</textarea>
				                                            <input type=hidden name="type" value="2">
				                                            <input type=hidden name="rno" value="${vo.product_no }">
				                                            <input type=hidden name="cno" value="${rvo.cno }">
				                                            <button type="submit" class="btn btn-primary" style="width:100px;height: 85px;float: left">댓글수정</button>
				                                        </div>
				                                        
				                                    </form>
				                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    </c:forEach>
                                </ol>
                            </div>

                            <!-- Leave A Comment -->
                            <c:if test="${sessionScope.id!=null }">
                            <div class="leave-comment-area section_padding_50 clearfix">
                                <div class="comment-form">
                                  
                                    <form action="../reply/reply_insert.do" method="post">
                                        
                                        <div class="form-group">
                                            <textarea name="msg" id="msg" cols="70" rows="4" placeholder="Message" style="float: left" required></textarea>
                                            <input type=hidden name="type" value="1">
                                            <input type=hidden name="rno" value="${vo.product_no }">
                                            <button type="submit" class="btn btn-primary" style="width:100px;height: 95px;float: left">댓글쓰기</button>
                                        </div>
                                        
                                    </form>
                                </div>
                            </div>
                            </c:if>
        
    
</body>
</html>