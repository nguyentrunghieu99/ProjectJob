<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/login" var="action"/>

<div class="container">

    <div class="login-form">

        <c:if test="${param.accessDenied != null}">
            <div class="alert alert-danger">
                Bạn không có quyền truy cập vào mục này!!!
            </div>
        </c:if>

        <c:if test="${param.error != null}">
            <div class="alert alert-danger">
                Sai thông tin đăng nhập!! vui lòng thử lại!!!
            </div>
        </c:if>
        <form action="" method="post">
            <h1>Đăng nhập vào website</h1>
            <div class="input-box">
                <i ></i>
                <input type="text" id="username" name="username" placeholder="Nhập username">
            </div>
            <div class="input-box">
                <i ></i>
                <input type="password" id="password" name="password" placeholder="Nhập mật khẩu">
            </div>
            <div class="btn-box">
                <button type="submit">
                    Đăng nhập
                </button>
            </div>
        </form>
    </div>
</div>





