<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="form-group container" align="center">
    <table border="1" cellpadding="5" style="background-color: activeborder" class="form-data">
        <tr style="background-color: activecaption">
            <th>Ảnh đại diện</th>
            <th>Họ tên</th>
            <th>Tuổi</th>
            <th>Email</th>
            <th>SĐT</th>
            <th>Nội dung</th>
            <th>Cv</th>
        </tr>

        <c:forEach items="${jobId}" var="j">
            <tr>            
                <td><img style="width: 200px"  class="img-fluid" src="${j.user.avatar}" alt="avt"/></td>
                <td>${j.user.firstName} ${j.user.lastName}</td>
                <td>${j.user.age}</td>
                <td>${j.user.email}</td>
                <td>${j.user.phone}</td>
                <td>${j.content}</td>
                <td><a href="${j.user.cv}">Xem Cv</a></td>
            </tr>
        </c:forEach>    
    </table>
</div>