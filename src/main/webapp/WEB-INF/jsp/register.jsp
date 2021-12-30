
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="container">

    <div class="login-form">
        <c:if test="${errMsg != null}">
            <div class="alert alert-danger">
                ${errMsg}
            </div>
        </c:if>

        <form:form method="post" action="" modelAttribute="user" enctype="multipart/form-data">
            <h1>Đăng Ký Tài Khoản</h1>
            <div class="input-box">
                <label for="firstname">Họ và tên lót (*)</label>
                <form:input type="text" id="firstname" path="firstName" cssClass="form-control"/>
                <form:errors path="firstName" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="input-box">
                <label for="lastname">Tên (*)</label>
                <form:input type="text" id="lastname" path="lastName" cssClass="form-control"/>
                <form:errors path="lastName" cssClass="alert alert-danger" element="div"/>
            </div>
            <div class="input-box">
                <label for="age">Tuổi (*)</label>
                <form:input type="text" id="age" path="age" cssClass="form-control"/>
                <form:errors path="age" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="input-box">
                <label for="email">Email (*)</label>
                <form:input type="text" id="email" path="email" cssClass="form-control"/>
                <form:errors path="email" cssClass="alert alert-danger" element="div"/>
            </div>
            <div class="input-box">
                <label for="phone">Số điện thoại (*)</label>
                <form:input type="text" id="phone" path="phone" cssClass="form-control"/>
                <form:errors path="phone" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="input-box">
                <label for="cate">Nghành nghề quan tâm (*)</label>
                <form:select id="cate" path="category" cssClass="form-control">
                    <c:forEach var="cat" items="${categories}">
                        <option value="${cat.id}">${cat.name}</option>
                    </c:forEach>
                </form:select>
                <form:errors path="category" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="input-box">
                <label for="loca">Thành phố đang sống (*)</label>
                <form:select id="loca" path="location" cssClass="form-control">
                    <c:forEach var="loca" items="${locations}">
                        <option value="${loca.id}">${loca.name}</option>
                    </c:forEach>
                </form:select>
                <form:errors path="location" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="input-box">
                <label for="username">Tên đăng nhập (*)</label>
                <form:input type="text" id="username" path="username" cssClass="form-control"/>
                <form:errors path="username" cssClass="alert alert-danger" element="div"/>
            </div>
            <div class="input-box">
                <label for="password">Mật khẩu (*)</label>
                <form:input type="password" id="password" path="password" cssClass="form-control"/>
                <form:errors path="password" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="input-box">
                <label for="confirm-password">Xác nhận mật khẩu (*)</label>
                <form:input type="password" id="confirm-password" path="confirmPassword" cssClass="form-control"/>
                <form:errors path="confirmPassword" cssClass="alert alert-danger" element="div"/>
            </div>

            <div>
                <label for="file">Thêm avatar (*)</label>
                <form:input type="file"  path="file" cssClass="form-control" />
                <form:errors path="file" cssClass="alert alert-danger" element="div"/>
            </div>

            <div>
                <label for="filecv">Thêm CV</label>
                <form:input type="file"  path="filecv" cssClass="form-control" />
                <form:errors path="filecv" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="btn-box">
                <input type="submit" value="Đăng Ký" class="btn btn-danger"/>
            </div>
        </form:form>
    </div>
</div>
