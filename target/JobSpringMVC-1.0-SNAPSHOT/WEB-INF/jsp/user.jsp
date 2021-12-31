
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="functions">
    <form action="">
        <div class="search">
                <input class="form-control" type="text" name="username" placeholder="Nhập từ khóa"/>
                <input type="submit" value="Tìm kiếm" class="btn btn-danger" />
        </div>
    </form>
    <div>
        <form action="">
            <select name="username">
                <option value="">Tất cả User</option>
                <option value="role_user">Role User</option>
                <option value="role_ntd">Role Nhà TD </option>
                <option value="role_admin">Role Admin</option>
            </select>
            <input type="submit" value="Xác nhận" class="btn btn-danger"/>
        </form>

        <div align="center" class="form-group form-group--btn">
            <a class="btn btn-danger" href="<c:url value="/register"/>">Add User</a>
        </div>
    </div>
</div>


<div class="form-group" align="center">
    <table class="table">
        <thead>
            <tr class="red">
                <th>ID</th>
                <th>Username</th>
                <th>ROLE</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="u">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.username}</td>
                    <td>${u.userRole}</td>
                    <td class="td-action">
                        <form method="post" action="/JobSpringMVC/admin/user/edit">
                            <input type="hidden" name="updateUser" value="${u.id}">
                            <input type="submit" value="Sửa" class="btn btn-danger"/>
                        </form>
                        <form method="post" action="/JobSpringMVC/admin/user">
                            <input type="hidden" name="deleteUser" value="${u.id}">
                            <input type="submit" value="Xóa" class="btn btn-danger"/>
                        </form>
                    </td>
                </tr>
            </c:forEach>


        </tbody>
    </table>
</div>
