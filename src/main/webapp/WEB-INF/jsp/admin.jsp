<%-- 
    Document   : admin
    Created on : Sep 27, 2021, 2:08:57 AM
    Author     : Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div align="center">
<table border="1" cellpadding="5" style="background-color: activeborder">
    <tr style="background-color: activecaption">
        <th>Nội dung</th>
        <th>Action</th>
    </tr>
    
        <tr>
    <td>Quản lí người dùng</td>
    <td>
        <a href="<c:url value="/admin/user"/>" class="btn btn-danger">Xác nhận</a>
    </td>
    </tr>
    
    <tr>
    <td>Quản lí tin đăng</td>
    <td>
        <a href="<c:url value="/admin/jobs"/>" class="btn btn-danger">Xác nhận</a>
    </td>
    </tr>
    
    <tr>
    <td>Danh sách đăng ký NTD</td>
    <td>
        <a href="<c:url value="/admin/ntd"/>" class="btn btn-danger">Xác nhận</a>
    </td>
    </tr>
</table>
</div>

