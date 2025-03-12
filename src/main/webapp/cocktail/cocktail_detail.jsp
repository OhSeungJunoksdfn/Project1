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
	<section class="ftco-section bg-light" style="padding:6rem 0" id="section-offer">
      <div class="container d-flex justify-content-center">
        <div class="row col-12">
      <c:forEach var="vo" items="${tags }">
      <div>${vo.ctvo.value }</div>
      </c:forEach>
      </div>
     </div>
   </section>
	<section class="ftco-section bg-light" style="padding:6rem 0" id="section-offer">
      <div class="container d-flex justify-content-center">
        <div class="row col-12">
        	<img class="col-6" src="${vo.image }" style="width:100%; aspect-ratio: 1/1;">
        	<div class="col-6" style="margin-top:50px;">
        		<h2>${vo.name }</h2>
        		<h4>${vo.ename }</h4>
        		<p>${vo.comments }</p>
        		<p>도수:${vo.alc }</p>
        	</div>
        </div>
      </div>
   </section> 
   
    <section class="ftco-section" id="section-menu">
      <div class="container">
        <div class="row">
        <h3 class="pl-5 pb-2 w-100">재료 정보</h3>
          <div class="col-md-12 text-center">
            <div class="tab-content text-left">
              <div class="tab-pane fade show active" id="pills-breakfast" role="tabpanel" aria-labelledby="pills-breakfast-tab">
                <div class="row">
                  	<c:forEach var="vo" items="${list }">
                  <div class="col-md-6 ftco-animate">
                    <div class="media menu-item">
                      <img class="mr-3" src="${vo.civo.ciimage }" class="img-fluid" alt="Free Template by Free-Template.co">
                      <div class="media-body">
                        <h5 class="mt-0">${vo.civo.ingname }</h5>
                        <p>${vo.civo.comments }</p>
                        <h6 class="text-primary menu-price">${vo.crivo.volume }${vo.crivo.unit }</h6>
                      </div>
                    </div>
                  </div>
                 </c:forEach>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <section class="ftco-section" id="section-menu">
      <div class="container">
        <div class="row">
        <h3 class="pl-5 pb-2 w-100">레시피</h3>
          <div class="col-md-12 text-center">
            <div class="tab-content text-left">
              <div class="tab-pane fade show active" id="pills-breakfast" role="tabpanel" aria-labelledby="pills-breakfast-tab">
                <div class="row">
                  <div class="col-md-6 ftco-animate">
                    <div class="media menu-item">
                      ${vo.content }
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
      
     
</body>
</html>