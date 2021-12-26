<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/jobs/{jobId}/apply" var="action"/>

<div class="p-top container">
    
    <c:url value="/apply/{jobId}" var="action"/>
<form:form method="post" action="${action}" modelAttribute="application">
    <form:hidden path="user" value="${currentUser.id}"/>
    
    <form:hidden path="job" value="${job.id}"/>
    
    <div class="form-group">
        <label for="content">Noi dung</label>
        <form:textarea type="text" id="content" path="content" cssClass="form-control" />
    </div>
    <div class="form-group">
        <input type="submit" value="Apply" class="btn btn-danger""/>
    </div>
</form:form>
</div>


