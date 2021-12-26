<%-- 
    Document   : index
    Created on : Sep 12, 2021, 10:05:11 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="page-header p-top">
    <div class="container">
        <div class="page-header__banner">
            <div class="page-header__title">
                Best Free Website Builders of 2021
            </div>
            <div class="page-header__desc">
                Build a free website with no technical skills required & bring your vision to life. <br>
                With free website setup, you can launch a professional, customized site within hours.
            </div>
        </div>
    </div>
</div>

    
<c:forEach items="${jobForUser}" var="u">
    <h1>${u.id}</h1>
</c:forEach>

<c:forEach items="${jobForNTD}" var="u">
    <h1>${u.id}</h1>
</c:forEach>


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
                            <img src="${currentUser.avatar}" alt="null">
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
                            <p class="c-btn">Chi Tiết</p>
                        </div>
                    </a>
                </c:forEach>
            </div>
            <div class="new">
                <div class="new-item--job">
                        <h3>Việc làm dành cho bạn</h3>
                </div>
                <c:forEach items="${jobForUser}" var="j">
                    <div class="new-item">
                        
                        <h3>${j.name}</h3>
                        <p>${j.location.name}</p>
                        <p>Lương: ${j.pay} Triệu</p>
                        
                    </div>
                        
                    
                </c:forEach>
            </div>
        </div>

        
</section>

