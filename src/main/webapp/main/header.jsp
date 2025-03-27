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
 <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="../main/main.do"><img src="../img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
            <c:if test="${sessionScope.id!=null }">
                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                <li><a href="../cart/cart_list.do"><i class="fa fa-shopping-bag"></i></a></li>
              </c:if>
            </ul>
        </div>
        <div class="humberger__menu__widget">

            <div class="header__top__right__auth">
			    <a href="../member/login.do"><i class="fa fa-user"></i> 로그인</a>
			    <span>/</span>
			    <a href="../member/join.do">회원가입</a>
			</div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
                      <ul>
                             <li><a href="#">칵테일</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="../cocktail/cocktail_list.do">칵테일 목록</a></li>
                                    <li><a href="../cocktail/cocktail_ingredients.do">재료 목록</a></li>
                                    <li><a href="../cocktail/cocktail_my.do">나만의 칵테일</a></li>
                                    <li><a href="../cocktail/cocktail_find.do">칵테일 검색</a></li>
                                </ul>
                            </li>
                            <li><a href="#">칵테일바</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="../cocktailbar/cocktailbar_list.do">칵테일바 목록</a></li>
                                    <li><a href="./shoping-cart.html">칵테일바 관리</a></li>
                                    <c:if test="${sessionScope.id!=null }">
                                    <li><a href="../reserve/cocktailbar_reserve_main.do">칵테일바 예약</a></li>
                                    </c:if>
                                </ul>
                            </li>
                             <li><a href="#">상품</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="../cocktail_product/cocktail_product_list.do">주류상품 목록</a></li>
                                    <li><a href="../product2/product_list.do">칵테일용품 목록</a></li>
                                    <li><a href="../cocktail_product/cocktail_product_find.do">주류상품 검색</a></li>
                                    <li><a href="../product2/product_find.do">칵테일용품 검색</a></li>
                                </ul>
                            </li>
                            <li><a href="#">커뮤니티</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="../community/freeboard_list.do">자유게시판</a></li>
                                    <li><a href="./shoping-cart.html">묻고 답하기</a></li>
                                    <li><a href="./checkout.html">공지사항</a></li>
                                    <c:if test="${sessionScope.id!=null }">
                                    <li><a href="./checkout.html">실시간 채팅</a></li>
                                    </c:if>
                                </ul>
                            </li>
                            <c:if test="${sessionScope.id!=null }">
                            <c:if test="${sessionScope.admin=='n' }">
                            <li><a href="../mypage/my_main.do">마이페이지</a></li>
                            </c:if>
                            <c:if test="${sessionScope.admin=='y' }">
                            <li><a href="../adminpage/admin_main.do">관리자페이지</a></li>
                            </c:if>
                            </c:if>
                        </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>

        <div class="humberger__menu__contact">
            <ul>
            <c:if test="${sessionScope.id!=null }">
                <li><i class="fa fa-envelope"></i> ${sessionScope.email}&nbsp;&nbsp;</li>
                <li>Free Shipping for all Order of $99</li>
              </c:if>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                            <c:if test="${sessionScope.id!=null }">
                                <li><i class="fa fa-envelope"></i> ${sessionScope.email}&nbsp;&nbsp;</li>
                                <li>${sessionScope.name}(${sessionScope.admin eq 'y' ? "관리자":"회원" })님 환영합니다.❤️&nbsp;&nbsp;</li>
                                <!-- ${sessionScope.name}
                                	<c:if test="${sessionScope.admin eq 'y'}">(관리자)</c:if> == 관리자만 표시 -->
                              </c:if>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
            
                            <div class="header__top__right__auth" style="display:flex; flex-direction: row; justify-content:end">
                            	<c:if test="${sessionScope.id==null }">
                                <a href="../member/login.do"><i class="fa fa-user"></i> 로그인</a>
                                 <span>/</span>
                                <a href="../member/join.do">회원가입</a>
                                </c:if>
                                <c:if test="${sessionScope.id!=null }">
                                <a href="../member/logout.do" class="btn btn-outline-danger">로그아웃</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="../main/main.do"><img src="../img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-7">
                    <nav class="header__menu">
                        <ul>
                             <li><a href="#">칵테일</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="../cocktail/cocktail_list.do">칵테일 목록</a></li>
                                    <li><a href="../cocktail/cocktail_ingredients.do">재료 목록</a></li>
                                    <li><a href="../cocktail/cocktail_my.do">나만의 칵테일</a></li>
                                    <li><a href="../cocktail/cocktail_find.do">칵테일 검색</a></li>
                                </ul>
                            </li>
                            <li><a href="#">칵테일바</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="../cocktailbar/cocktailbar_list.do">칵테일바 목록</a></li>
                                    <li><a href="../cocktailbar/cocktailbar_find.do">칵테일바 검색</a></li>
                                    <c:if test="${sessionScope.id!=null }">
                                    <li><a href="#">칵테일바 예약</a></li>
                                    </c:if>
                                </ul>
                            </li>
                            <li><a href="#">상품</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="../cocktail_product/cocktail_product_list.do">주류상품 목록</a></li>
                                    <li><a href="../product2/product_list.do">칵테일용품 목록</a></li>
                                    <li><a href="../cocktail_product/cocktail_product_find.do">주류상품 검색</a></li>
                                    <li><a href="../product2/product_find.do">칵테일용품 검색</a></li>
                                </ul>
                            </li>
                            <li><a href="#">커뮤니티</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="../community/freeboard_list.do">자유게시판</a></li>
                                    <li><a href="#">묻고 답하기</a></li>
                                    <li><a href="#">공지사항</a></li>
                                    <c:if test="${sessionScope.id!=null }">
                                    <li><a href="#">실시간 채팅</a></li>
                                    </c:if>
                                </ul>
                            </li>
                            <c:if test="${sessionScope.id!=null }">
                            <c:if test="${sessionScope.admin=='n' }">
                             <li><a href="../mypage/my_main.do">마이페이지</a>

                            </c:if>
                            <c:if test="${sessionScope.admin=='y' }">
                            <li><a href="../adminpage/admin_main.do">관리자페이지</a>

                            </c:if>
                            </c:if>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-2">
                    <div class="header__cart">
                        <ul>
                        	<c:if test="${sessionScope.id!=null }">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="../cart/cart_list.do"><i class="fa fa-shopping-bag"></i></a></li>
                          </c:if>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
</body>
</html>