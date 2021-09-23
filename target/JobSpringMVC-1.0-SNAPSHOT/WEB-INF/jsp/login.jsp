<%-- 
    Document   : login
    Created on : Sep 15, 2021, 2:55:07 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/login" var="action"/>
<h1 class="text-center text-danger ">ĐĂNG NHẬP</h1>

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



<form method="post" action="${action}">
    <div class="form-group">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" class="form-control" />
    </div>
    <div class="form-group">
        <label for="password">PassWord</label>
        <input type="password" id="password" name="password" class="form-control" />
    </div>
    <div>
        <input type="submit" value="Đăng Nhập" class="btn btn-danger"/>
    </div>
</form>
