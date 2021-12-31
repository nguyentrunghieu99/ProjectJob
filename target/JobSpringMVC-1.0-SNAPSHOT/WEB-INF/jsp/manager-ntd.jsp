<%-- 
    Document   : manager-ntd
    Created on : Oct 10, 2021, 12:44:42 PM
    Author     : Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/admin/ntd" var="action"/>

<div class="form-group container" align="center" >
    <table border="1" cellpadding="5" style="background-color: activeborder" class="table-longer form-data">
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
                <td><img class="img-fluid" src="${u.avatar}" alt="avt"/></td>
                <td>${u.firstName} ${u.lastName}</td>
                <td>${u.age}</td>
                <td>${u.email}</td>
                <td>${u.phone}</td>
                <td>${u.username}</td>


                <td>
                    <form method="post" action="/JobSpringMVC/admin/ntd/agree">
                        <input type="hidden" name="agreeNTD" value="${u.id}">
                        <input type="submit" value="Đồng ý" class="btn btn-danger"/>
                    </form>
                    <br>
                    <form method="post" action="/JobSpringMVC/admin/ntd/refuse">
                        <input type="hidden" name="refuseNTD" value="${u.id}">
                        <input type="submit" value="Từ chối" class="btn btn-danger"/>
                    </form>
                </td>
            </tr>
        </c:forEach>    
    </table>


</div>