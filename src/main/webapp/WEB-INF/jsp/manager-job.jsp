<%-- 
    Document   : manager-job
    Created on : Sep 28, 2021, 5:28:14 AM
    Author     : Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                
<c:forEach items="${location.jobs}" var="l">
    <p>${l.name}</p>
    <p>${location.name}</p>
    <br>
</c:forEach>
