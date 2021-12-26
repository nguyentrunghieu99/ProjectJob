   

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="p-top container">
<c:forEach items="${jobId}" var="i">
    <h1>${i.user.firstName} ${i.user.lastName}</h1>
    <p>${i.user.age}</p>
    <p>${i.user.phone}</p>
    <p>${i.user.email}</p>
    <p>${i.content}</p>
    <img src="${i.user.cv}"/>
</c:forEach>
</div>
