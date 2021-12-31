<%-- 
    Document   : edituser
    Created on : Sep 26, 2021, 2:00:41 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table border="1" cellpadding="5" style="background-color: activeborder">
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <div class="container">
        <div class="login-form">
            <c:if test="${errMsg != null}">
                <div class="alert alert-danger">
                    ${errMsg}
                </div>
            </c:if>

            <form:form method="post" action="/JobSpringMVC/admin/user/edit-success" modelAttribute="user" enctype="multipart/form-data">
                <h1>Thay đổi thông tin User: ${user.username}</h1>
                <form:hidden name="userId" path="id"/>
                <form:hidden path="avatar"/>
                <form:hidden path="Cv"/>
                <form:hidden path="active"/>
                <form:hidden path="username"/>
                <form:hidden path="password"/>

                <div class="input-box">
                    <label for="firstname">Họ và tên lót</label>
                    <form:input id="firstname" path="firstName" cssClass="form-control"/>
                </div>

                <div class="input-box">
                    <label for="lastname">Tên</label>
                    <form:input type="text" id="lastname" path="lastName" cssClass="form-control"/>
                </div>
                <div class="input-box">
                    <label for="age">Tuổi</label>
                    <form:input type="text" id="age" path="age" cssClass="form-control"/>
                </div>

                <div class="input-box">
                    <label for="email">Email</label>
                    <form:input type="text" id="email" path="email" cssClass="form-control"/>
                </div>
                <div class="input-box">
                    <label for="phone">Số điện thoại</label>
                    <form:input type="text" id="phone" path="phone" cssClass="form-control"/>
                </div>

                <div class="input-box">
                    <label for="newpass">Mật khẩu mới</label>
                    <input type="password" name="pass" cssClass="form-control"/>
                </div>

                <div class="input-box">
                    <label for="cate">Nghành nghề quan tâm</label>
                    <form:select path="category">
                        <option value="${user.category.id}">${user.category.name}</option>    
                        <c:forEach items="${categories}" var="c">
                            <option value="${c.id}">${c.name}</option>
                        </c:forEach>
                    </form:select>
                </div>

                <div class="input-box">
                    <label for="role">Quyền hạn Account</label>
                    <form:select path="userRole">
                        <option value="${user.userRole}">${user.userRole}</option>
                        <c:if test="${user.userRole == 'ROLE_USER'}">
                            <option value="ROLE_NTD">ROLE_NTD</option>
                        </c:if>
                        <c:if test="${user.userRole == 'ROLE_NTD'}">
                            <option value="ROLE_USER">ROLE_USER</option>
                        </c:if>
                    </form:select>

                </div>

                <div class="input-box">
                    <label for="loca">Thành phố đang sống</label>
                    <form:select path="location">
                        <option value="${user.location.id}">${user.location.name}</option>    
                        <c:forEach items="${locations}" var="l">
                            <option value="${l.id}">${l.name}</option>
                        </c:forEach>
                    </form:select>
                </div>

                <div>
                    <label for="file">Đổi avatar (*)</label>
                    <form:input type="file"  path="file" cssClass="form-control" />
                </div>
                <div>
                    <c:if test="${currentUser.cv == null || currentUser.cv ==''}">
                        <label for="file">Thêm Cv</label>
                    </c:if>
                    <c:if test="${currentUser.cv != null && currentUser.cv !=''}">
                        <label for="file">Đổi Cv</label>
                    </c:if>
                    <form:input type="file"  path="filecv" cssClass="form-control" />
                </div>
                <div class="btn-box">
                    <input type="submit" value="Thay đổi" class="btn btn-danger"/>
                </div>
            </form:form>
        </div>
    </div>
