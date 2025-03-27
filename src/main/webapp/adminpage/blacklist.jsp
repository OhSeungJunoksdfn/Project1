<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<link rel="stylesheet" href="../css/login.css">

<div class="login-container">
  <h2 style="text-align:center;">블랙리스트 목록</h2>
  <table class="table">
    <tr>
      
    </tr>
    <c:forEach var="vo" items="${list}">
      <tr>
        <td>${vo.black_list_no}</td>
        <td>${vo.id}</td>
        <td>${vo.name}</td>
        <td>${vo.email}</td>
        <td>${vo.reason}</td>
        <td>${vo.regdate}</td>
        <td>
          <a href="blacklist_delete.do?black_list_no=${vo.black_list_no}" class="btn btn-sm btn-danger">삭제</a>
        </td>
      </tr>
    </c:forEach>
  </table>

  <hr>

  <h4>블랙리스트 등록</h4>
  <form method="post" action="blacklist_insert.do">
    ID: <input type="text" name="id"><br>
    이름: <input type="text" name="name"><br>
    이메일: <input type="text" name="email"><br>
    사유: <input type="text" name="reason"><br>
    <input type="submit" value="등록" class="btn btn-sm btn-primary">
  </form>
</div>
