<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>블랙리스트 관리</h2>

<table border="1">
    <tr>
        <th>사용자 ID</th>
        <th>차단 사유</th>
        <th>등록 날짜</th>
        <th>관리</th>
    </tr>
    <c:forEach var="user" items="${blacklist}">
        <tr>
            <td>${user.id}</td>
            <td>${user.reason}</td>
            <td>${user.created_at}</td>
            <td>
                <form action="blacklist_remove.do" method="post">
                    <input type="hidden" name="id" value="${user.id}">
                    <button type="submit">해제</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<h3>사용자 블랙리스트 추가</h3>
<form action="blacklist_add.do" method="post">
    <input type="text" name="id" placeholder="사용자 ID 입력">
    <input type="text" name="reason" placeholder="차단 사유 입력">
    <button type="submit">추가</button>
</form>
</body>
</html>