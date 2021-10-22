<%-- 
    Document   : user
    Created on : Sep 24, 2021, 9:43:24 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form action="">
    <div class="row">
        <div class="col-md-11">
            <input class="form-control" type="text" name="username" placeholder="Nhập từ khóa"/>
        </div>
        <div>
            <input type="submit" value="Tìm kiếm" class="btn btn-danger" />
        </div>
    </div>
</form>
<form action="">
    <select name="username">
            <option value="">CHỌN</option>
            <option value="role_user">Role User</option>
            <option value="role_ntd">Role Nhà TD </option>
            <option value="role_admin">Role Admin</option>
    </select>
    <input type="submit" value="Xác nhận" class="btn btn-danger"/>
</form>

<div align="center" class="form-group">
    <div>
    <a class="btn btn-danger" href="<c:url value="/admin/user"/>">Xem tất cả</a>
    </div>
    <br>
    <div>
    <a class="btn btn-danger" href="<c:url value="/register"/>">Add User</a>
    </div>
</div>

<div class="form-group" align="center">
    <table border="1" cellpadding="5" style="background-color: activeborder">
        <tr style="background-color: activecaption">
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Username</th>
            <th>ROLE</th>
            <th>Action</th>
        </tr>

        <c:forEach items="${users}" var="u">
            <tr>
                <td>${u.id}</td>
                <td>${u.firstName} ${u.lastName}</td>
                <td>${u.email}</td>
                <td>${u.username}</td>
                <td>${u.userRole}</td>
                <td>
                    <a href="<c:url value="/admin/user/edit?id="/>${u.id}">Edit</a>
                    &nbsp;&nbsp;&nbsp;
                    <a href="<c:url value="/admin/user/delete?id="/>${u.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>    
    </table>
</div>
