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

        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <jsp:include page="my_menu.jsp"></jsp:include>
                </div>
                <div class="col-sm-10">
                 <jsp:include page="${my_jsp }"></jsp:include>
             </div>
            </div>
         </div>

    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
   
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
   
    <!-- Featured Section End -->


    <!-- Latest Product Section Begin -->
    
    <!-- Latest Product Section End -->

    <!-- Blog Section Begin -->
    
</body>
</html>