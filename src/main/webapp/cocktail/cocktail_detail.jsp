<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.insertBtn').one('click',function(){
			let likesNum = $(".likesNum").text()
			let no = $(".cno").val()
			$.ajax({
			type:'post',
			url:"../cocktail/likes_insert.do",
			data:{"no":no,"type":"cocktail"},
			success:function(){
				$(".likesNum").text(Number(likesNum)+1)
				$(".insertBtn").html("<i class='fa fa-heart' style='color: #ff0000'></i>")
				$(".insertBtn").removeClass("insertBtn")
			},
			error:function(err){
				console.log(err)
				
			}
			
			})
		})
	})
</script>
<style>
	.insertBtn{
	cursor: pointer;
	}
</style>
<body>
    

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="${vo.image }" alt="" style="width:555px; height: 550px; object-fit:corver">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${vo.name }</h3>
 
                        <div class="product__details__price">${vo.ename }</div>
                        <p>${vo.comments }</p>

                        <a href="#" class="primary-btn">즐겨찾기</a>
                        <input type="hidden" class="cno" value="${vo.cocktail_no }">
                        <c:if test="${sessionScope.id!=null }">
                        <c:if test="${likescount==0 }">
                        <a class="heart-icon insertBtn"><span class="icon_heart_alt"></span></a>
                        </c:if>
                        <c:if test="${likescount==1 }">
                        <a class="heart-icon"><i class="fa fa-heart" style="color: #ff0000;"></i></a>
                        </c:if>
                        
                        </c:if>
                        <ul>
                            <li><b>ALC</b> <span>${vo.alc }</span></li>
                            <li><b>태그</b> ㅣ<c:forEach var="tvo" items="${tags }" ><span>${tvo.ctvo.value } </span>ㅣ</c:forEach></li>
                            <li><b>조회수</b> <span>${vo.hit }</span></li>
                            <li ><b>좋아요</b> <i class="fa fa-heart" ></i> <span class="likesNum">${vo.likes }</span> </li>
                            <c:if test="${sessionScope.id==vo.id }">
                            <li><b></b><a href="../cocktail/cocktail_update.do?cno=${vo.cocktail_no }" class="primary-btn">수정하기</a>
                            <a href="../cocktail/cocktail_delete.do?cno=${vo.cocktail_no}" class="primary-btn">삭제하기</a> </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">제조법</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">필요한 재료</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">댓글</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>제조법</h6>
                                    <c:forEach var="tvo" items="${contents }" >
                                    <p> ${tvo }</p>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>필요한 재료</h6>
                                    <div class="row ">
                                    <c:forEach var="tvo" items="${list }">
                                    	<div class="col-6 row align-items-center">
                                    		<div class="col-10 row align-items-center">
                                    			<img src="${tvo.civo.ciimage }" style="width:100px;height:100px" >
                                    			<p>${tvo.civo.ingname }&nbsp;&nbsp;<span style="color:#181b61; font-weight:bold">${tvo.civo.ingtag }</span></p>
                                    		</div>
                                    		<div class="col-2 align-items-center">
                                    			<p>${tvo.crivo.volume }&nbsp;${tvo.crivo.unit }</p>
                                    		</div>
                                    	</div>
                                    </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <jsp:include page="../community/community_comment.jsp" >
							        	<jsp:param name="post_type" value="cocktail"/>
							        	<jsp:param name="post_no" value="${vo.cocktail_no }"/>
							        </jsp:include>
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
