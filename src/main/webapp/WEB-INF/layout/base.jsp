<%-- 
    Document   : base
    Created on : Sep 13, 2021, 11:50:12 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <tiles:insertAttribute name="title" />
        </title>
        
            <link href="<c:url value="/images/work.jpg"/>" rel="icon"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="<c:url value="/css/format.css"/>"  rel="stylesheet"/>
        <link href="<c:url value="/css/style.css"/>"  rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        <script src="<c:url value="/js/main.js"/>"></script>
        <script src="<c:url value="/js/style.js"/>"></script>
    </head>
    <body>
        <div class="container">
            <!-- HEADER -->
            <tiles:insertAttribute name="header" />

            <!-- CONTENT -->
            <tiles:insertAttribute name="content"/>

            <!-- FOOTER -->
            <tiles:insertAttribute name="footer"/>

        </div>
    </body>
</html>
