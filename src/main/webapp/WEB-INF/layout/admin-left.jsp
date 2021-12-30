<%-- 
    Document   : admin-left
    Created on : Dec 30, 2021, 11:39:20 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<nav class="navbar bg-light">

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/user"/>">Quản lí người dùng</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" <a href="<c:url value="/admin/ntd"/>">Quản lí duyệt NTD</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/jobs"/>">Quản lí bài đăng</a>
    </li>
    
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/cate-stats"/>">Quản lí bài đăng</a>
    </li>
  </ul>
</nav>