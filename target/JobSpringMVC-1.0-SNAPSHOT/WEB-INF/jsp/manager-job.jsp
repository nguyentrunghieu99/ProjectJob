<%-- 
    Document   : manager-job
    Created on : Sep 28, 2021, 5:28:14 AM
    Author     : Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container"> 
<section class="p-job">
    <div class="container">
        <div class="filters">
            <form action="">
                <input type="text" name="kw" placeholder="Tìm kiếm"/>
                <input type="submit" value="Tìm kiếm" class="btn btn-danger" />
            </form>


            <form action="">
                <select name="cat">
                    <option value="">Tất cả lĩnh vực</option>
                    <c:forEach items="${categories}" var="c">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="Xác nhận" class="btn btn-danger"/>
            </form>

            <form action="">
                <select name="loca">
                    <option value="">Toàn quốc</option>
                    <c:forEach items="${locations}" var="l">
                        <option value="${l.id}">${l.name}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="Xác nhận" class="btn btn-danger"/>
            </form>
        </div>




        <c:if test="${success != null}">
            <div  class="alert alert-success alert-dismissible " style="text-align: center">
                <h1>${success}</h1>
            </div>
        </c:if>

        <div>
            <ul class="pagination">
                <c:forEach begin="1" end="${Math.ceil(counter/maxIn)}" var="i">
                    <li class="page-item"><a class="page-link" href="<c:url value="/"/>?kw=${param.kw}&page=${i}&cat=${param.cat}&loca=${param.loca}">${i}</a></li>
                    </c:forEach>
            </ul>
        </div>


        <div class="p-job__inner">
            <div class="list-job">
                <c:forEach items="${jobs}" var="j">
                    <a href="<c:url value="/jobs/"/>${j.id}" class="c-itemJob">
                        <div class="c-itemJob__logo">
                            <img src="${j.user.avatar}" alt="null">
                        </div>
                        <div class="c-itemJob__content">
                            <h3>${j.name}</h3>
                            <ul>
                                <c:forTokens items="${j.requirement}" delims="." var="require">
                                    <li>${require}</li>
                                    </c:forTokens>
                            </ul>
                        </div>
                        <div class="c-itemJob__info my-date" >
                            <h3>${j.location.name}</h3>
                            <c:if test="${j.pay != null}">
                                <p>Lương: ${j.pay} VNĐ</p>
                            </c:if>

                            <c:if test="${j.pay == null}">
                                <p>Lương: Thỏa thuận</p>
                            </c:if>
                            <p>${j.createDate}</p>
                        </div>
                    </a>
                    <form method="post" action="/JobSpringMVC/td/detail/applications">
                        <input type="hidden" name="jobId" value="${j.id}">
                        <input type="submit" value="Xem" class="btn btn-danger"/>
                    </form>

                    <form method="post" action="/JobSpringMVC/admin/jobs">
                        <input type="hidden" name="deleteJob" value="${j.id}">
                        <input type="submit" value="Xóa" class="btn btn-danger"/>
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>