

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="p-top container">
<table class="table container ">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Age</th>
                    <th>Phone</th>
                    <th>Username</th>
                    <th>ROLE</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${currentUser.id}</td>
                    <td>${currentUser.firstName} ${currentUser.lastName}</td>
                    <td>${currentUser.age}</td>
                    <td>${currentUser.phone}</td>
                    <td>${currentUser.username}</td>
                    <td>${currentUser.userRole}</td>
                </tr>
 

                
            </tbody>
        </table>
</div>

