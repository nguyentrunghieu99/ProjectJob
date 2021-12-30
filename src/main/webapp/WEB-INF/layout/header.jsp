

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<header class="c-header">
    <div class="container">
        <div class="c-header__main">
            <div class="c-header__left">
                <a href="<c:url value="/"/>"><img src="<c:url value="/images/logo.png"/>"/></a>
                
            </div>

            <div class="c-header__right">
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <a href="<c:url value="/login"/>" class="c-btn c-btn--green ">Đăng nhập</a>
                    <a href="<c:url value="/register"/>" class="c-btn c-btn--shadow">Đăng ký</a>
                </c:if>

                <sec:authorize access="hasAnyRole('ROLE_NTD','ROLE_ADMIN')">
                    <a href="<c:url value="/td/jobs"/>" class="c-btn c-btn--color">Đăng Tuyển</a>
                </sec:authorize>

                <sec:authorize access="hasRole('ROLE_NTD')">
                    <a href="<c:url value="/td/detail"/>" class="c-btn c-btn--shadow">Quản lí Tin</a>
                </sec:authorize>

                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <a href="<c:url value="/admin"/>" class="c-btn c-btn--black">Quản Trị</a>
                </sec:authorize>

                <c:if test="${currentUser.active == 0}">
                    <form:form method="post" action="" modelAttribute="currentUser">
                        <input type="submit" class="c-btn c-btn--shadow c-input" value="Đăng Ký Nhà Tuyển Dụng"/>
                    </form:form>
                </c:if>

                <c:if test="${currentUser.active == 1}">
                    <h2 class="c-btn c-btn--shadow">Đang Đợi Xét Duyệt</h2>
                </c:if>
                
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <a href="/JobSpringMVC/logout" class="c-btn c-btn--green">Đăng Xuất</a>
                </c:if>
                
                <sec:authorize access="hasAnyRole('ROLE_NTD','ROLE_ADMIN','ROLE_USER')">
                    <div>
                    <a href="<c:url value="/userdetail"/>">
                        <img src="${currentUser.avatar}" alt="${currentUser.username}">
                    </a>
                    <div>
                        <a class="btn "href="<c:url value="/userdetail"/>">
                        Xin Chào: ${currentUser.firstName} ${currentUser.lastName}
                    </a>
                    </div>
                    </div>
                </sec:authorize>
            </div>
        </div>
    </div>
</header>
