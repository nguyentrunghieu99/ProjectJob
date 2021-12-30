

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="container">
    <div class="form-center">
        <img src="${currentUser.avatar}" alt="${currentUser.username}"/>
        <table class="table-user">
            <tr>
                <th class="th-bold">Họ Tên</th>
                <th class="th-width">${currentUser.firstName} ${currentUser.lastName}</th>
            </tr>
            <tr>
                <th class="th-bold" >Tuổi</th>
                <th>${currentUser.age}</th>
            </tr>
            <tr>
                <th class="th-bold">Email</th>
                <th>${currentUser.email}</th>
            </tr>
            <tr>
                <th class="th-bold">SĐT</th>
                <th>${currentUser.phone}</th>
            </tr>
            <tr>
                <th class="th-bold">Username</th>
                <th>${currentUser.username}</th>
            </tr>
            <tr>
                <th class="th-bold">Role Acount</th>
                <th>${currentUser.userRole}</th>
            </tr>
            <tr>
                <th class="th-bold">Lĩnh vực</th>
                <th>${currentUser.category.name}</th>
            </tr>
            <tr>
                <th class="th-bold">Địa điểm</th>
                <th>${currentUser.location.name}</th>
            </tr>

            <tr>
                <th class="th-bold">CV</th>
                    <c:if test="${currentUser.cv == null || currentUser.cv ==''}">
                    <th>Chưa thêm CV</th>
                    </c:if>
                    <c:if test="${currentUser.cv != null && currentUser.cv !=''}">
                    <th><a href="${currentUser.cv}">Xem</a></th>
                    </c:if>
            </tr>
        </table>
        <a href="<c:url value="/userdetail/edituser"/>" class="btn btn-danger">Thay đổi thông tin</a>
    </div>
</div>