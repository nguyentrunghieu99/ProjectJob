<%-- 
    Document   : login
    Created on : Sep 15, 2021, 2:55:07 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
<meta content="Coderthemes" name="author">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<c:url value="/login" var="action"/>
<h1 class="text-center text-danger ">ĐĂNG NHẬP</h1>

<c:if test="${param.accessDenied != null}">
    <div class="alert alert-danger">
        Bạn không có quyền truy cập vào mục này!!!
    </div>
</c:if>

<c:if test="${param.error != null}">
    <div class="alert alert-danger">
        Sai thông tin đăng nhập!! vui lòng thử lại!!!
    </div>
</c:if>

<body class="authentication-bg authentication-bg-pattern p-top">
    <div class="account-pages mt-5 mb-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">
                    <div class="card">

                        <div class="card-body p-4">

                            <h5 class="auth-title">Sign In</h5>
                            </br>

                            <form method="post" action="${action}">

                                <div class="form-group mb-3">
                                    <label for="username">Username</label>
                                    <input type="text" id="username" name="username" class="form-control" />
                                </div>

                                <div class="form-group mb-3">
                                    <label for="password">PassWord</label>
                                    <input type="password" id="password" name="password" class="form-control" />
                                </div>

                                <div class="form-group mb-0 text-center">
                                    <button class="btn btn-danger btn-block" type="submit"> Log In </button>
                                </div>

                            </form>
                        </div> 
                    </div>

                </div>
            </div>

        </div>

    </div>

    <script src="css/assets\js\vendor.min.js"></script>
    <script src="css/assets\js\app.min.js"></script>
</body>
</html>





