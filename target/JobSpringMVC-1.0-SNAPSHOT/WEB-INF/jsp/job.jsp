
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:url value="/td/jobs" var="action"/>

<div class="container">

    <div class="login-form">
        <c:if test="${errMsg != null}">
            <div class="alert alert-danger">${errMsg}</div>
        </c:if>
        <form:form method="post" action="${action}" modelAttribute="job">
            <h1>Đăng Tin Tuyển Dụng</h1>
            <form:hidden path="user" value= "${currentUser.id}"/>
            <div class="input-box">
                <label for="name">Tên công việc</label>
                <form:input type="text" id="name" path="name" cssClass="form-control" />
                <form:errors path="name" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="input-box">
                <label for="description">Mô tả công việc</label>
                <form:textarea id="description" path="description"  cssClass="form-control" />
                <form:errors path="description" cssClass="alert alert-danger" element="div"/>
            </div>
            <div class="input-box">
                <label for="requirement">Yêu cầu công việc</label>
                <form:textarea id="requirement" path="requirement"  cssClass="form-control" />
                <form:errors path="requirement" cssClass="alert alert-danger" element="div"/>
            </div>
            <div class="input-box">
                <label for="reason">Lý do bạn sẽ yêu thích khi làm việc tại đây</label>
                <form:textarea id="reason" path="reason"  cssClass="form-control" />
                <form:errors path="reason" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="input-box">
                <label for="pay">Lương</label>
                <form:input type="text" id="pay" path="pay" cssClass="form-control" placeholder="Lương thỏa thuận" />
                <form:errors path="pay" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="input-box">
                <label for="quantily">Số lượng tuyển</label>
                <form:input type="text" id="quantily" path="quantily" cssClass="form-control"/>
                <form:errors path="quantily" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="input-box">
                <label for="timework">Hình thức làm việc</label>
                <form:input type="text" id="timework" path="timework" cssClass="form-control"/>
                <form:errors path="timework" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="input-box">
                <label for="level">Cấp bậc</label>
                <form:input type="text" id="level" path="level" cssClass="form-control"/>
                <form:errors path="level" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="input-box">
                <label for="experience">Yêu cầu kinh nghiệm</label>
                <form:input type="experience" id="experience" path="experience" cssClass="form-control" placeholder="Không yêu cầu" />
                <form:errors path="experience" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="input-box">
                <label for="gender">Yêu cầu giới tính</label>
                <form:input type="text" id="gender" path="gender" cssClass="form-control" placeholder="Không yêu cầu" />
                <form:errors path="gender" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="input-box">
                <label for="cate">Danh Mục</label>
                <form:select id="cate" path="category" cssClass="form-control">
                    <c:forEach var="cat" items="${categories}">
                        <option value="${cat.id}">${cat.name}</option>
                    </c:forEach>
                </form:select>
                <form:errors path="category" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="input-box">
                <label for="loca">Địa điểm</label>
                <form:select id="loca" path="location" cssClass="form-control">
                    <c:forEach var="loca" items="${locations}">
                        <option value="${loca.id}">${loca.name}</option>
                    </c:forEach>
                </form:select>
            </div>

            <div class="input-box">
                <label for="address">Địa chỉ</label>
                <form:textarea id="address" path="address"  cssClass="form-control" />
                <form:errors path="address" cssClass="alert alert-danger" element="div"/>
            </div>

            <div class="btn-box">
                <input type="submit" value="Thêm" class="btn btn-danger""/>
            </div>
        </form:form>
    </div>
</div>