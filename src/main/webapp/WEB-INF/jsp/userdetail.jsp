<%-- 
    Document   : userdetail
    Created on : Oct 9, 2021, 11:52:58 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/userdetail" var="action"/>

<c:if test="${currentUser.avatar != null && currentUser.avatar != ''}">
    <div style="width: 150px">
        <img class="img-fluid" src="${currentUser.avatar}" alt="imgAvatar"/>
    </div>
</c:if>

<c:if test="${currentUser.avatar == null || currentUser.avatar == ''}">
    <div style="width: 150px">
        <img class="img-fluid" src="<c:url value="/images/avatar.jpg"/>" alt="imgAvatar"/>
    </div>
</c:if>


<form:form method="post" action="${action}" modelAttribute="currentUser" enctype="multipart/form-data">
    <table border="0" cellpadding="5">
        <tr>
            <td><form:hidden path="id"/></td>
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
            <td><h4>${currentUser.username}</h3></td>
            <td><form:hidden path="username"/></td>
        </tr>

        <tr>
            <td>Pass:</td>
            <td><form:input path="password"/></td>
        </tr>

        <tr>
            <td>Role:</td>
            <td><h4>${currentUser.userRole}</h3></td>
            <td><form:hidden path="userRole"/></td>
        </tr>

        <tr>
            <td><form:hidden path="avatar"/></td>
        </tr>

        <tr>
            <c:if test="${currentUser.avatar == null}">
                <td>Thêm avatar</td>
            </c:if>

            <c:if test="${currentUser.avatar != null}">
                <td>Đổi avatar</td>
            </c:if>

            <td><form:input type="file"  path="file" cssClass="form-control" /></td>
        </tr>


        <tr>
            <td><form:hidden path="cv"/></td>
        </tr>

        <tr>
            <c:if test="${currentUser.cv == null}">
                <td>Thêm cv</td>
            </c:if>

            <c:if test="${currentUser.cv != null}">
                <td>Đổi cv</td>
            </c:if>

            <td><form:input type="file"  path="filecv" cssClass="form-control" /></td>
        </tr>

        <tr>
            <td colspan="2"><input type="submit" value="Lưu" /></td>
        </tr>
    </table>
</form:form>

<c:if test="${currentUser.cv != null}">
    <div style="width: 400px">
        <a href="${currentUser.cv}">
            <img class="img-fluid" src="${currentUser.cv}" alt="imgCV"/>
        </a>
    </div
</c:if>
