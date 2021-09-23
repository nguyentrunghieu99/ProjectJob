<%-- 
    Document   : header
    Created on : Sep 13, 2021, 11:49:52 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <ul class="navbar-nav">
        <li class="nav-item active">
            <a class="nav-link" href="<c:url value="/"/>">Trang chủ</a>
        </li>

        <c:forEach var="cat" items="${categories}" >
            <li class="nav-item">
                <a class="nav-link" href="#">${cat.name}</a>
            </li>
        </c:forEach>

        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <li class="nav-item active">
                <a class="nav-link text-danger" href="<c:url value="/login"/>">Đăng Nhập</a>
            </li>

            <li class="nav-item active">
                <a class="nav-link text-danger" href="<c:url value="/register"/>">Đăng Ký</a>
            </li>
        </c:if>

        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <li class="nav-item active">
                <a class="nav-link text-danger" href="<c:url value="/"/>">Xin Chào:${pageContext.request.userPrincipal.name}</a>
            </li>

            <li class="nav-item active">
                <a class="nav-link text-danger" href="<c:url value="logout"/>">Đăng Xuất</a>
            </li>
        </c:if>

    </ul>
</nav>