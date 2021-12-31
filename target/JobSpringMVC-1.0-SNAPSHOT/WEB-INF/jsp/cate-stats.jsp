<%-- 
    Document   : stats
    Created on : Dec 25, 2021, 7:15:21 AM
    Author     : Hieu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container"> 
    <div class="stats-custom">
        <h1>Thống Kê Số Lượng Ứng Tuyển Theo Danh Mục</h1>
        <div class="chars-cate">
            <canvas id="cateChart"></canvas>
        </div>

        <table class="table">
            <tr>
                <th>Mã Danh Mục</th>
                <th>Tên Danh Mục</th>
                <th>Số Lượng Ứng Tuyển</th>
            </tr>
            <c:forEach items="${cateStats}" var="c">
                <tr>
                    <td>${c[0]}</td>
                    <td>${c[1]}</td>
                    <td>${c[2]}</td>
                </tr>

            </c:forEach>

        </table>


        <script>
            let cateLabels = [], cateInfo = [];
            <c:forEach items="${cateStats}" var="c">
            cateLabels.push('${c[1]}'),
                    cateInfo.push('${c[2]}')
            </c:forEach>


            window.onload = function () {
                cateChart("cateChart", cateLabels, cateInfo);
            }
        </script>
    </div>
</div>