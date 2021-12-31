<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/jobs/{jobId}/apply" var="action"/>

<div class="container customarea">

    <c:url value="/apply/{jobId}" var="action"/>
    <form:form method="post" action="${action}" modelAttribute="application" enctype="multipart/form-data">
        <form:hidden path="user" value="${currentUser.id}"/>

        <form:hidden path="job" value="${job.id}"/>

        <h1>Vài điều bạn muốn gửi cho Nhà tuyển dụng</h1>
        <form:textarea type="text" id="content" path="content" cssClass="form-control" />
        <input type="submit" value="Apply" class="btn btn-danger""/>
    </form:form>
</div>


