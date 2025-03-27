<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   int count = (int) request.getAttribute("count");
%>
<% if(count == 0) { %>
  <p style="color:red;"> 기존 비밀번호가 일치하지 않습니다.</p>
<% } else { %>
  <p style="color:green;">비밀번호가 변경되었습니다.<br>잠시 후 로그인 페이지로 이동합니다.</p>
<% } %>
