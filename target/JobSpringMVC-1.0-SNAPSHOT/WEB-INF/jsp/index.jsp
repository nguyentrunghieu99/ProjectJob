<%-- 
    Document   : index
    Created on : Sep 12, 2021, 10:05:11 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:if test="${success != null}">
    <div  class="alert alert-success alert-dismissible " style="text-align: center">
        <h1>${success}</h1>
    </div>
</c:if>

<h1 class="text-center text-danger">Danh Muc Job</h1>
<form action="">
    <div class="row">
        <div class="col-md-11">
            <input class="form-control" type="text" name="kw" placeholder="Nhập từ khóa"/>
        </div>
        <div>
            <input type="submit" value="Tìm kiếm" class="btn btn-danger" />
        </div>
    </div>
</form>
<br>

<sec:authorize access="hasAnyRole('ROLE_NTD','ROLE_ADMIN')">
    <div>
        <a href="<c:url value="/td/jobs"/>" class="btn btn-danger">Đăng tin tuyển dụng</a>
    </div>
</sec:authorize>

<div>
    ${counter};
    ${maxIn};
    <ul class="pagination">
        <c:forEach begin="1" end="${Math.ceil(counter/maxIn)}" var="i">

            <li class="page-item"><a class="page-link" href="<c:url value="/"/>?page=${i}">${i}</a></li>
            </c:forEach>
    </ul>
</div>

<div class="row" >
    <c:forEach var="j" items="${jobs}">
        <div class="card col-md-6 bg-dark text-center">
            <a href="/JobSpringMVC/jobs/${j.id}">
                <div class="box-image">
                    <c:if test="${j.image != null && j.image.startsWith('https')== true}">
                        <div class="card-body ">
                            <img class="img-fluid" src="<c:url value="${j.image}"/>"    alt="${j.name}" />
                        </div>
                    </c:if>
                    <c:if test="${j.image == null || j.image.startsWith('https')!= true}">
                        <div class="card-body ">

                            <img class="img-fluid" src="<c:url value="/images/null.jpg"/>"  alt="${j.name}" />

                        </div>
                    </c:if>
                </div>
            </a>

            <div class=" text-center card-footer" style="color: lightpink"  >
                <h3>${j.name}</h3>

                <c:if test="${j.pay != null}">
                    <p>Lương: ${j.pay}</p>
                </c:if>

                <c:if test="${j.pay == null}">
                    <p>Lương: Thỏa thuận</p>   
                </c:if>  

                <a href="<c:url value="jobs"/>/${j.id}" class="btn btn-danger">Xem chi tiết</a>
            </div>

        </div>
    </c:forEach>
</div>
