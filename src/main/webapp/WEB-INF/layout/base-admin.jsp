<%-- 
    Document   : base-admin
    Created on : Dec 30, 2021, 11:29:04 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <tiles:insertAttribute name="title" />
        </title>

        <link href="<c:url value="/images/logo.png"/>" rel="icon"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="<c:url value="/css/main.css"/>"  rel="stylesheet"/>
        <link href="<c:url value="/css/form.css"/>"  rel="stylesheet"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;700&display=swap" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="<c:url value="/js/main.js"/>"></script>
        <script src="<c:url value="/js/style.js"/>"></script>

    </head>
    <body>
        
            <!-- HEADER -->
            <tiles:insertAttribute name="header"/>

            <!-- CONTENT -->
            <main>
                <div class="row">
                    <div class="col-md-4 col-xs-12">
                        <tiles:insertAttribute name="left"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8 col-xs-12">
                        <tiles:insertAttribute name="content"/>
                    </div>
                </div>
            </main>
            <!-- FOOTER -->
            <tiles:insertAttribute name="footer"/>

        <script src="<c:url value="/js/stats.js"/>"></script>
    </body>
</html>