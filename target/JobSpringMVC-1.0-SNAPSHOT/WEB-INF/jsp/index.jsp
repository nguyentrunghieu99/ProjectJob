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

<c:url value="/" var="action"/>
<sec:authorize access="hasAnyRole('ROLE_USER')">
    
    <c:if test="${currentUser.active == null && currentUser.avatar == null}">
        <h1>Vui lòng thiết lập avatar nếu muốn trở thành nhà tuyển dụng</h1>
    </c:if>
    
    <c:if test="${currentUser.active == null && currentUser.avatar != null}">
        <form:form method="post" action="${action}" modelAttribute="currentUser" enctype="multipart/form-data">
            <table border="0" cellpadding="5">
                <tr>
                    <td colspan="2"><input type="submit" class="btn btn-danger" value="ĐĂNG KÝ LÀM NHÀ TUYỂN DỤNG"/></td>
                </tr>
            </table>
        </form:form>
    </c:if>
    <c:if test="${currentUser.active == Boolean.FALSE}">
        <h2 class="alert-success">Bạn đã nộp đơn ứng tuyển NTD</h2>
    </c:if>
</sec:authorize>

<c:if test="${success != null}">
    <div  class="alert alert-success alert-dismissible " style="text-align: center">
        <h1>${success}</h1>
    </div>
</c:if>

<form action="">
    <select name="cat">
        <option value="">Tất cả lĩnh vực</option>
        <c:forEach items="${categories}" var="c">
            <option value="${c.id}">${c.name}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Xác nhận" class="btn btn-danger"/>
</form>

<form action="">
    <select name="loca">
        <option value="">Toàn quốc</option>
        <c:forEach items="${locations}" var="l">
            <option value="${l.id}">${l.name}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Xác nhận" class="btn btn-danger"/>
</form>

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
<br>
<sec:authorize access="hasRole('ROLE_ADMIN')">
    <div>
        <a href="<c:url value="/admin"/>" class="btn btn-danger">Đi đến trang quản trị</a>
    </div>
</sec:authorize>

<div>
    ${counter};
    ${maxIn};
    <ul class="pagination">
        <c:forEach begin="1" end="${Math.ceil(counter/maxIn)}" var="i">

            <li class="page-item"><a class="page-link" href="<c:url value="/"/>?kw=${param.kw}&page=${i}&cat=${param.cat}&loca=${param.loca}">${i}</a></li>
            </c:forEach>
    </ul>
</div>


<div class="job-list-wrapper">
    <c:forEach items="${jobs}" var="j">
        <div class="job-list-wrapper__item">
            <img src="${j.image}" alt="null">
            <div class="job-list-wrapper__item__02">
                <h2><a href="<c:url value="/jobs/"/>${j.id}">${j.name}</a></h2>
                    <c:if test="${j.pay != null}">
                    <p>Lương: ${j.pay}</p>
                </c:if>

                <c:if test="${j.pay == null}">
                    <p>Lương: Thỏa thuận</p>
                </c:if>
            </div>
            <div class="job-list-wrapper__item__03">
                <h2>${j.location.name}</h2>
                <div class="my-date">
                    <span>Đăng vào: </span>
                    <i>${j.createDate}</i>
                </div>
                <a href="<c:url value="/jobs/"/>${j.id}" class="btn btn-danger">Xem thông tin</a>
            </div>
        </div>
    </c:forEach>
</div>
