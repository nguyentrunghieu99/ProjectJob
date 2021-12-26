<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="container p-top"> 
<c:url value="/td/detail/apply" var="action"/>

<div class="p-job__inner">
    <div class="list-job">
        <c:forEach items="${jobForNTD}" var="j">
            <a href="<c:url value="/td/detail/"/>${j.id}" class="c-itemJob">
                <div class="c-itemJob__logo">
                    <img src="${currentUser.avatar}" alt="null">
                </div>
                <div class="c-itemJob__content">
                    <h3>${j.name}</h3>
                    <ul>
                        <c:forTokens items="${j.requirement}" delims="." var="require">
                            <li>${require}</li>
                            </c:forTokens>
                    </ul>
                </div>
                <div class="c-itemJob__info my-date" >
                    <h3>${j.location.name}</h3>
                    <c:if test="${j.pay != null}">
                        <p>Lương: ${j.pay} VNĐ</p>
                    </c:if>

                    <c:if test="${j.pay == null}">
                        <p>Lương: Thỏa thuận</p>
                    </c:if>
                    <p>${j.createDate}</p>
                    <p class="c-btn">Xem danh sách</p>  
                </div>
            </a>
            <form method="post" action="/JobSpringMVC/td/detail/applications">
                <input type="hidden" name="jobId" value="${j.id}">
                <input type="submit" value="Xem" class="btn btn-danger"/>
            </form>

            <form method="post" action="/JobSpringMVC/td/detail">
                <input type="hidden" name="deleteJob" value="${j.id}">
                <input type="submit" value="Xóa" class="btn btn-danger"/>
            </form>
        </c:forEach>
    </div>
</div>
</div>