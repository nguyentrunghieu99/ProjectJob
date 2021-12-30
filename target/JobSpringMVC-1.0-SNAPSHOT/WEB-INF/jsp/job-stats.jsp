
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container"> 
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
        <input type="submit" value="Loc" class="btn btn-success"/>
    </form>

    <canvas id="jobChart"></canvas>

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

    <div>
        <ul class="pagination">
            <c:forEach begin="1" end="${Math.ceil(counter/maxIn)}" var="i">
                <li class="page-item"><a class="page-link" href="<c:url value="/"/>?kw=${param.kw}&page=${i}&cat=${param.cat}&loca=${param.loca}">${i}</a></li>
                </c:forEach>
        </ul>
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

