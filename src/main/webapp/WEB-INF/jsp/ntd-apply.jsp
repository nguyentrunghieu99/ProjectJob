<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
<c:forEach items="${jobId}" var="i">
    <h1>Họ tên: ${i.user.firstName} ${i.user.lastName}</h1>
    <p>Tuổi: ${i.user.age }</p>
    <p>Số điện thoại: ${i.user.phone}</p>
    <p>Email: ${i.user.email}</p>
    <p>Nội dung ứng tuyển:${i.content}</p>
    <div class="c-itemJob__logo">
        <a href="${i.user.cv}">
        <img src="${i.user.cv}"/>
        </a>
    </div>
</c:forEach>
</div>
