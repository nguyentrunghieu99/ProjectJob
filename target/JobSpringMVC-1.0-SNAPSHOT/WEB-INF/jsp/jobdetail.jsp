<%-- 
   Document   : info
   Created on : Sep 13, 2021, 3:11:50 PM
   Author     : Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 class="text-center text-danger">Chi Tiết Công Việc</h1>




<div class="text-center">
    <form class="form-group">
        <div class="box-image">
            <img class="img-fluid" src="${job.image}"   alt="${job.name}"/>
        </div>

        <div>
            <h2>${job.name}</h2>
        </div>
        
           
        
        
        <div>
            <c:if test="${job.pay == null}">
                <h4>Lương: Thỏa Thuận</h4>
            </c:if>
            <c:if test="${job.pay != null}">
                <h4>Lương: ${job.pay}</h4>
            </c:if>
        </div>
        
            
        
        
        <div>
            <p>Nhà Tuyển Dụng: ${job.user.firstName} ${job.user.lastName}</p>
        </div>
        
        <div>
            <input type="submit" value="Ứng Tuyển" class="btn btn-danger"/>
        </div>

    </form>

    <form>
        <div class="my-date">
            <p>Địa chỉ:  ${job.address}</p>
            <span>Đăng vào: </span>

        <span>${job.createDate} </span>
</div>
</form>

<form>
    <div>
        <h3>Mô tả công việc</h3>
        <p>${job.description}</p>
    </div>

    <div>
        <h3>Yêu cầu công việc</h3>
        <p>${job.requirement}</p>
    </div>

    <div>
        <h3>Lý do bạn sẽ yêu thích khi làm việc tại đây</h3>
        <p>${job.reason}</p>
    </div>
</form>
</div>

<div class="form-group">
    <textarea class="form-control" id="commentId" placeholder="Nhap danh gia cua ban"></textarea>
    <form:errors path="content" cssClass="alert alert-danger" element="div"/>
    <br>
    <input type="submit" value="Gui danh gia" onclick="addComment(${job.id},${currentUser.id})" class="btn btn-danger"/>
</div>



<form>
    <div>
        ${count}
        ${maxComm}

        <ul class="pagination">

            <c:forEach begin="1" end="${Math.ceil(count/maxComm)}" var="i">

                <c:url value="/jobs/${jobs.id}" var="path">
                    <c:param name="page" value="${i}"></c:param> 
                </c:url>
                <li class="page-item"><a class="page-link" href="${path}">${i}</a></li>
                </c:forEach>
        </ul>
    </div>

</form>


<div id="commentArea">

    <c:forEach items="${comments}" var="com">
        <div class="row">
            <div class="col-md-2" style="padding: 10px">
                <img class="rounded-circle img-fluid" src="<c:url value="/images/null.jpg"/>" alt="name"/>
            </div>
            <div class="col-md-10 my-date">
                <p>${com.user.username}</p>
                <p>${com.content}</p>
                <i>${com.createDate}</i>
            </div>
        </div>
    </c:forEach>

</div>








