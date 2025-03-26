<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>블랙리스트 관리</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <h4>블랙리스트 관리</h4>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>사용자 ID</th>
                        <th>차단 사유</th>
                        <th>등록 날짜</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${blacklist}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.reason}</td>
                        <td>${user.created_at}</td>
                        <td>
                            <form action="blacklist_remove.do" method="post">
                                <input type="hidden" name="id" value="${user.id}">
                                <button type="submit" class="btn btn-danger btn-sm">해제</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <h4>블랙리스트 추가</h4>
            <form method="post" action="blacklist_add.do" class="form-inline">
                <div class="form-group mb-2">
                    <label for="id" class="sr-only">ID</label>
                    <input type="text" name="id" placeholder="사용자 ID" class="form-control" required>
                </div>
                <div class="form-group mx-sm-3 mb-2">
                    <label for="reason" class="sr-only">사유</label>
                    <input type="text" name="reason" placeholder="차단 사유" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary mb-2">추가</button>
            </form>
        </div>
    </div>
</section>

<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>