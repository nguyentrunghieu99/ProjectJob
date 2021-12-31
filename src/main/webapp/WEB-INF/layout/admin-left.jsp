<%-- 
    Document   : admin-left
    Created on : Dec 30, 2021, 11:39:20 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<nav class="navbar">
  <ul class="navbar-nav">
      <h1>Quản Lí</h1>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/user"/>">Quản lí người dùng</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" <a href="<c:url value="/admin/ntd"/>">Quản lí ứng tuyển NTD</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/jobs"/>">Quản lí bài đăng</a>
    </li>
  </ul>
</nav>
    
   <nav class="navbar">
  <ul class="navbar-nav"> 
    <h1>Thống Kê</h1>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/cate-stats"/>">Thống kê theo danh mục</a>
    </li>
    
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/job-stats"/>">Thống kê theo bài đăng</a>
    </li>
    
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/appli-stats"/>">Thống kê theo đơn ứng tuyển</a>
    </li>
  </ul>
</nav>