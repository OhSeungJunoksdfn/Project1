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
<section>
	<div class="container">
		<div class="row">
			<div class="categories__slider owl-carousel">
                <c:forEach var="vo" items="${clist }">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${vo.image }">
                            <h5><a href="#">${vo.name }</a></h5>
                        </div>
                    </div>
                </c:forEach>
                    
                </div>
		</div>
	</div>
</section>
</body>
</html>