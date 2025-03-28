<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항 목록</title>
  <link rel="stylesheet" href="../css/login.css">
  <style>
    .notice-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    .notice-table th, .notice-table td {
      border: 1px solid #ccc;
      padding: 12px;
      text-align: center;
    }

    .notice-table th {
      background-color: #f0f0f0;
      color: #333;
    }

    .notice-table td.subject {
      text-align: left;
    }

    .pagination {
      margin-top: 20px;
      text-align: center;
    }

    .pagination a {
      margin: 0 3px;
      padding: 6px 12px;
      border: 1px solid #ccc;
      border-radius: 4px;
      color: #333;
      text-decoration: none;
    }

    .pagination a.active {
      background-color: navy;
      color: #fff;
      border-color: navy;
    }

    .btn-insert {
      display: inline-block;
      margin-top: 20px;
      padding: 10px 20px;
      background-color: navy;
      color: white;
      border: none;
      border-radius: 6px;
      text-decoration: none;
      font-weight: bold;
    }

    .top-bar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 15px;
    }
  </style>
</head>
<body>
<div class="login-container2">
  <div class="top-bar">
    <h2 style="color: navy;">공지사항 목록</h2>
    <c:if test="${sessionScope.id!=null }">
    <c:if test="${sessionScope.admin=='y' }">
    <a href="../notice/notice_insert.do" class="btn-insert">공지 등록</a>
    </c:if>
    </c:if>
  </div>

  <table class="notice-table">
    <thead>
    <tr>
      <th>번호</th>
      <th>구분</th>
      <th>제목</th>
      <th>등록일</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${list}">
      <tr>
        <td>${count}</td>
        <td>${vo.types}</td>
        <td class="subject">${vo.subject}</td>
        <td>${vo.dbday}</td>
      </tr>
      <c:set var="count" value="${count - 1}" />
    </c:forEach>
    </tbody>
  </table>

  <div class="pagination">
    <c:forEach var="i" begin="1" end="${totalpage}">
      <a href="../notice/notice_list.do?page=${i}" class="${i == curpage ? 'active' : ''}">${i}</a>
    </c:forEach>
  </div>
</div>
</body>
</html>
