<%-- 
    Document   : edituser
    Created on : Sep 26, 2021, 2:00:41 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table border="1" cellpadding="5" style="background-color: activeborder">
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="container p-top"> 

    <%--<c:url value="/admin/user/edit" var="action"/>
    <c:if test="${errMsg != null}">
    <div class="alert-danger">
        <h3>${errMsg}</h3>
    </div>
    </c:if>--%>

    <!--<form>
        <div style="width: 150px">
            <img class="img-fluid" src="${user.avatar}" alt="imgAvatar"/>
        </div>
    </form>-->


    <form:form method="post" action="/JobSpringMVC/admin/user/edit-success" modelAttribute="user" enctype="multipart/form-data">
        <table border="0" cellpadding="5">
            <tr>
                <td><form:hidden name="userId" path="id"/></td>
            </tr>

            <tr>
                <td>FirstName:</td>
                <td><form:input path="firstName"/></td>
            </tr

            <tr>
                <td>LastName:</td>
                <td><form:input path="lastName"/></td>
            </tr>

            <tr>
                <td>Tuổi:</td>
                <td><form:input path="age"/></td>
            </tr>

            <tr>
                <td>SDT:</td>
                <td><form:input path="phone"/></td>
            </tr>

            <tr>
                <td>UserName:</td>
                <td>${user.username}</td>
                <td><form:hidden path="username"/></td>
            </tr>

            <tr>
                <td>Pass:</td>
                <td><form:input path="password"/></td>
            </tr>

            <tr>
                <td>Role:</td>
                <td><form:input path="userRole"/></td>
            </tr>

            <tr>
                <td><form:hidden path="avatar"/></td>
            </tr>

            <tr>
                <c:if test="${user.avatar == null}">
                    <td>Thêm avatar</td>
                </c:if>

                <c:if test="${user.avatar != null}">
                    <td>Đổi avatar</td>
                </c:if>
                <td><form:input type="file"  path="file" cssClass="form-control" /></td>
            </tr>

            <td>
            <td><form:hidden path="cv"/></td>
            </tr>

            <tr>
                <c:if test="${user.cv == null || user.cv ==''}">
                    <td>Thêm cv</td>
                </c:if>

                <c:if test="${user.cv != null && user.cv !=''}">
                    <td>Đổi cv</td>
                </c:if>
                <td><form:input type="file"  path="filecv" cssClass="form-control" /></td>
            </tr>


            <tr>
                <td colspan="2"><input type="submit" value="Lưu" /></td>
            </tr>
        </table>
    </form:form>

    <!--<form>
        <div style="width: 400px">
            <a href="${user.cv}">
            <img class="img-fluid" src="${user.cv}" alt="imgCV"/>
            </a>
        </div>
    </form>-->
</div>
