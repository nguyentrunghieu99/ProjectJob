<%-- 
    Document   : cmt
    Created on : Sep 20, 2021, 5:18:44 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>



        <c:forEach items="${cmt}" var="c">
            <p>${c.id}</p>
        <li>${c.content}</li>
        <li>${c.createDate}</li>  
        <h1>${c.user.username}</h1>
        <h1>${c.user.id}</h1>
    </c:forEach>


</body>
</html>
