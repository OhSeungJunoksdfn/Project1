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
                            <span>관리정보</span>
                        </div>
                        <ul>
                            <li><a href="#">게시판관리</a></li>
                        
		                    <li><a href="#">댓글관리</a></li>
							<li><a href="#">찜관리</a></li>
							<li><a href="#">좋아요관리</a></li>
						    <li><a href="#">장바구니관리</a></li>
							<li><a href="../reserve/cocktailbar_reserve_adminpage.do">예약관리</a></li>
                        </ul>
                    </div>
                    
                    <div class="hero__categories">
                      <div class="hero__categories__all">
                          <i class="fa fa-bars"></i>
                         <span>회원운영정보</span>
                      </div>
                      <ul>
                    <li><a href="../adminpage/blacklist.do">블랙리스트추가</a></li>
                    <li><a href="../member/join_delete.jsp">회원삭제</a></li>
				    <li><a href="../member/pwdChange.do">비밀번호변경</a></li>
                 </ul>
              </div>
                </div>
                <div class="col-lg-9">
                    <jsp:include page="${MP_JSP }"/>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">

                </div>
            </div>
            <div class="row featured__filter">
            
            </div>
        </div>
    </section>
    <!-- Featured Section End -->


    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">

                    </div>
                </div>
                <div class="col-lg-4 col-md-6">

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

                </div>
            </div>
            <div class="row">

            </div>
        </div>
    </section>
</body>
</html>