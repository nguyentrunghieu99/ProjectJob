<%-- 
    Document   : header
    Created on : Sep 13, 2021, 11:49:52 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<header class="c-header">
<div class="container">
    <div class="c-header__main">

        <div class="c-header__left">
            <img src="${currentUser.avatar}" alt="${currentUser.username}">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <p>
                    <a href="<c:url value="/userdetail"/>">
                        Xin Chào: ${currentUser.firstName} ${currentUser.lastName}
                    </a>
                    <a href="<c:url value="/"/>"><p>${currentUser.userRole}</p></a>
                        </c:if>
                    </p>
        </div>

        <div class="c-header__right">
            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <a href="<c:url value="/login"/>" class="c-btn c-btn--login">Đăng nhập</a>
                <a href="<c:url value="/register"/>" class="c-btn c-btn--register">Đăng ký</a>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <a href="/JobSpringMVC/logout" class="c-btn c-btn--register">Đăng Xuất</a>
            </c:if>

            <sec:authorize access="hasAnyRole('ROLE_NTD','ROLE_ADMIN')">
                <a href="<c:url value="/td/jobs"/>" class="c-btn c-btn--recruitment">Đăng Tuyển</a>
            </sec:authorize>

            <sec:authorize access="hasRole('ROLE_NTD')">
                <a href="<c:url value="/td/detail"/>" class="c-btn c-btn--recruitment">Quản lí Tin</a>
            </sec:authorize>

            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <a href="<c:url value="/admin"/>" class="c-btn c-btn--login">Quản Trị</a>
            </sec:authorize>

            <sec:authorize access="hasAnyRole('ROLE_USER')">
                <c:if test="${currentUser.active == null && currentUser.avatar != null}">
                    <form:form method="post" action="" modelAttribute="currentUser">
                        <input type="submit" class="c-btn c-btn--recruitment" value="Đăng Ký Nhà Tuyển Dụng"/></td
                    </form:form>
                </c:if>
                <c:if test="${currentUser.active == Boolean.FALSE}">
                    <h2 class="c-btn c-btn--login">Đang Đợi Xét Duyệt</h2>
                </c:if>
            </sec:authorize>


        </div>
    </div>
</div>
</header>
