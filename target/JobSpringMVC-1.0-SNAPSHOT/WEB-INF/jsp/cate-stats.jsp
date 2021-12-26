<%-- 
    Document   : stats
    Created on : Dec 25, 2021, 7:15:21 AM
    Author     : Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container p-top"> 
<div style="width: 500px">
<canvas id="cateChart"></canvas>
</div>

<table class="table">
    <tr>
        <th>Ma Danh Muc</th>
        <th>Ten Danh Muc </th>
        <th>So luong</th>
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
    let cateLabels=[], cateInfo=[];
    <c:forEach items="${cateStats}" var="c">
        cateLabels.push('${c[1]}'),
        cateInfo.push('${c[2]}')
    </c:forEach>
    
    
    window.onload = function(){
        cateChart("cateChart",cateLabels,cateInfo);
    }
</script>
</div>