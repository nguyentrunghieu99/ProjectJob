
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container stats-custom"> 
    <h1>Thống Kê Số Lượng Ứng Tuyển Theo Bài Đăng</h1>
    <div>
        <form action="">
            <div class="form-group">
                <label>Từ khóa</label>
                <input type="text" name="kw" class="form-control"/>
            </div>
            <div class="form-group">
                <label>Từ thời điểm</label>
                <input type="date" name="fromDate" class="form-control"/>
            </div>
            <div class="form-group">
                <label>Đến thời điểm</label>
                <input type="date" name="toDate" class="form-control"/>
            </div>
            <input type="submit" value="Lọc" style="width: 100px" class="btn btn-danger"/>
        </form>
    </div>
    <div class="chars-jobs">
        <canvas id="jobChart"></canvas>
    </div>

    <div>
        <table class="table">
            <tr>
                <th>Mã bài đăng</th>
                <th>Tên bài đăng</th>
                <th>Số lượng ứng tuyển</th>
            </tr>
            <c:forEach items="${jobStats}" var="j">
                <tr>
                    <td>${j[0]}</td>
                    <td>${j[1]}</td>
                    <td>${j[2]}</td>
                </tr>
            </c:forEach>

        </table>
    </div>
</div>
<script>
    let jobLabels = [], jobInfo = [];
    <c:forEach items="${jobStats}" var="j">
    jobLabels.push('${j[1]}')
    jobInfo.push('${j[2]}')
    </c:forEach>

    window.onload = function () {
        jobChart("jobChart", jobLabels, jobInfo);

    }
</script>

