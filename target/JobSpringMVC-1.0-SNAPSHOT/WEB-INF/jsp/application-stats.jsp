

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container stats-custom">
    <h1>Thống Kê Số Lượng Ứng Tuyển Theo Ngày Tháng</h1>
    <form action="">
        <div class="form-group">
            <label>Từ thời điểm</label>
            <input type="date" name="fromDate" class="form-control"/>
        </div>
        <div class="form-group">
            <label>Đến thời điểm</label>
            <input type="date" name="toDate" class="form-control"/>
        </div>
        <input type="submit" value="Lọc" style="width: 100px"class="btn btn-danger"/>
    </form>

    <div class="chars-jobs">
        <canvas id="appliChart"></canvas>
    </div>

    <table class="table">
        <tr>
            <th>Mốc thời gian</th>
            <th>Số lượng ứng tuyển</th>
        </tr>
        <c:forEach items="${appliStats}" var="a">
            <tr>
                <td>${a[0]}/${a[1]}</td>
                <td>${a[2]}</td>
            </tr>
        </c:forEach>

    </table>

    <script>
        let jobLabels = [], jobInfo = [];
        <c:forEach items="${appliStats}" var="a">
        jobLabels.push('${a[0]}/${a[1]}')
            jobInfo.push('${a[2]}')
        </c:forEach>

            window.onload = function () {
                appliChart("appliChart", jobLabels, jobInfo);

            }
    </script>
</div>