<%-- 
    Document   : manager-ntd
    Created on : Oct 10, 2021, 12:44:42 PM
    Author     : Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/admin/ntd" var="action"/>

<div class="form-group container p-top" align="center">
    <table border="1" cellpadding="5" style="background-color: activeborder" class="table">
        <tr style="background-color: activecaption">
            <th>ID</th>
            <th>Avatar</th>
            <th>Name</th>
            <th>Age</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Username</th>
            <th>Action</th>
        </tr>

        <c:forEach items="${users}" var="u">
            <tr>
                <td>${u.id}</td>

                <c:if test="${u.avatar != null && u.avatar != ''}">
                    <td><img style="width: 200px"  class="img-fluid" src="${u.avatar}" alt="avt"/></td>
                    </c:if>

                <c:if test="${u.avatar == null || u.avatar == ''}">
                    <td><img style="width: 200px" class="img-fluid" src="<c:url value="/images/avatar.jpg"/>" alt="avt"/></td>
                    </c:if>

                <td>${u.firstName} ${u.lastName}</td>
                <td>${u.age}</td>
                <td>${u.email}</td>
                <td>${u.phone}</td>
                <td>${u.username}</td>


                 <td>
                     <a class="btn btn-danger" href="<c:url value="/admin/ntd/"/>${u.id}?result=true">Đồng ý</a>
                     <a class="btn btn-danger" href="<c:url value="/admin/ntd/"/>${u.id}?result=false">Từ chối</a>
                 </td>
            </tr>
        </c:forEach>    
    </table>
    
    
</div>