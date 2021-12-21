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
                <a class="nav-link text-danger" href="<c:url value="/userdetail"/>">
                    Xin Chào: ${currentUser.firstName} ${currentUser.lastName}
                </a>
                    <a class="nav-link" href="<c:url value="/"/>"><p>${currentUser.userRole}</p></a>
            </li>
            
            <li class="nav-item active" style="width: 150px">
                <c:if test="${currentUser.avatar != null}">
                <a href="http://localhost:8080/JobSpringMVC/userdetail">
                    <img class="img-fluid" src="${currentUser.avatar}" alt="${currentUser.username}"/>
                </a> 
                </c:if>
                
                <c:if test="${currentUser.avatar == null || currentUser.avatar == ''}">
                <a href="http://localhost:8080/JobSpringMVC/userdetail">
                    <img class="img-fluid" src="<c:url value="/images/avatar.jpg"/>" alt="${currentUser.username}"/>
                </a> 
                </c:if>

            </li>

            <li class="nav-item active">
                <a class="nav-link text-danger" href="/JobSpringMVC/logout">Đăng Xuất</a>
            </li>
        </c:if>

    </ul>
</nav>
