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

        <h1>Thông tin Username: ${user.username}</h1>
        <form:form method="post" action="/JobSpringMVC/admin/user/edit-success" modelAttribute="user" enctype="multipart/form-data">
            <table border="0" cellpadding="5">
                <form:hidden name="userId" path="id"/>
                <form:hidden path="avatar"/>
                <form:hidden path="Cv"/>
                <form:hidden path="active"/>
                <form:hidden path="username"/>
                <form:hidden path="password"/>
                


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
                    <td>Email:</td>
                    <td><form:input path="email"/></td>
                </tr>

                <tr>
                    <td>SDT:</td>
                    <td><form:input path="phone"/></td>
                </tr>

                <tr>
                    <td>Pass Mới:</td>
                    <td><input type="password" name="pass"/>
                </tr>

                <tr>
                    <td>Role:</td>
                <td><form:select path="userRole">
                    <option value="${user.userRole}">${user.userRole}</option>
                    <c:if test="${user.userRole == 'ROLE_USER'}">
                        <option value="ROLE_NTD">ROLE_NTD</option>
                    </c:if>
                    <c:if test="${user.userRole == 'ROLE_NTD'}">
                        <option value="ROLE_USER">ROLE_USER</option>
                    </c:if>
                </form:select>
                </td>
                </tr>
                
                <tr>
                    <td>Danh mục:</td>
                <td><form:select path="category">
                    <option value="${user.category.id}">${user.category.name}</option>    
                        <c:forEach items="${categories}" var="c">
                            <option value="${c.id}">${c.name}</option>
                        </c:forEach>
                </form:select>
                </td>
                </tr>
                
                <tr>
                    <td>Vị trí:</td>
                <td><form:select path="location">
                    <option value="${user.location.id}">${user.location.name}</option>    
                        <c:forEach items="${locations}" var="l">
                            <option value="${l.id}">${l.name}</option>
                        </c:forEach>
                </form:select>
                </td>
                </tr>
                

                <tr>
                    <td>Đổi avatar</td>
                    <td><form:input type="file"  path="file" cssClass="form-control" /></td>
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
