<%-- 
    Document   : registry
    Created on : Sep 15, 2021, 3:48:22 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:if test="${jobloca == null}">
    <p>a</p>
</c:if>










<h1 class="text-center text-danger">ĐĂNG KÝ</h1>
<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if>

<form:form method="post" action="${action}" modelAttribute="user" enctype="multipart/form-data">
    <div class="form-group">
        <label for="firstname">Họ và tên lót</label>
        <form:input type="text" id="firstname" path="firstName" cssClass="form-control"/>
    </div>

    <div class="form-group">
        <label for="lastname">Tên</label>
        <form:input type="text" id="lastname" path="lastName" cssClass="form-control"/>
    </div>
    <div class="form-group">
        <label for="age">Tuổi</label>
        <form:input type="text" id="age" path="age" cssClass="form-control"/>
    </div>

    <div class="form-group">
        <label for="email">Email</label>
        <form:input type="text" id="email" path="email" cssClass="form-control"/>
    </div>
    <div class="form-group">
        <label for="phone">Số điện thoại</label>
        <form:input type="text" id="phone" path="phone" cssClass="form-control"/>
    </div>

    <div class="form-group">
        <label for="username">Tên đăng nhập</label>
        <form:input type="text" id="username" path="username" cssClass="form-control"/>
    </div>
    <div class="form-group">
        <label for="password">Mật khẩu</label>
        <form:input type="password" id="password" path="password" cssClass="form-control"/>
    </div>

    <div class="form-group">
        <label for="confirm-password">Xác nhận mật khẩu</label>
        <form:input type="password" id="confirm-password" path="confirmPassword" cssClass="form-control"/>
    </div>
    
    <div>
            <label for="file">Thêm avatar</label>
            <form:input type="file"  path="file" cssClass="form-control" />
    </div>
    
    <div>
            <label for="filecv">Thêm CV</label>
            <form:input type="file"  path="filecv" cssClass="form-control" />
    </div>
    
    <div>
        <input type="submit" value="Đăng Ký" class="btn btn-danger"/>
    </div>
</form:form>
