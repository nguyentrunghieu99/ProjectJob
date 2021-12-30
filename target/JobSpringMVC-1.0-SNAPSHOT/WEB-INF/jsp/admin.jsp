
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<body>

    <div class="container">            
        <table class="table">
            <thead>
                <tr>
                    <th>Danh sách</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Quản lí người dùng</td>
                    <td>
                        <a href="<c:url value="/admin/user"/>" class="btn btn-danger">Xác nhận</a>
                    </td>
                </tr>

                <tr>
                    <td>Quản lí tin đăng</td>
                    <td>
                        <a href="<c:url value="/admin/jobs"/>" class="btn btn-danger">Xác nhận</a>
                    </td>
                </tr>
                <tr>
                    <td>Danh sách đăng ký NTD</td>
                    <td>
                        <a href="<c:url value="/admin/ntd"/>" class="btn btn-danger">Xác nhận</a>
                    </td>
                </tr>

                <tr>
                    <td>Thống kê</td>
                    <td>
                        <a href="<c:url value="/admin/cate-stats"/>" class="btn btn-danger">Xác nhận</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</body>
</html>
