

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<main class="container">
    <div class="crumbs container">
        <a href="<c:url value="/"/>" class="crumbs__name">Trang chủ</a>
        <p class="crumbs__name">Chi tiết việc làm</p>
    </div>

    <div class="main-info">
        <div class="container">
            <div class="box">
                <div class="box__logo">
                    <img src="${job.user.avatar}" alt="${currentUser.firstName} ${currentUser.lastName}">
                </div>

                <div class="box__text">

                    <h3>Tên Job: ${job.name}</h3>
                    <p>Người đăng: ${job.user.firstName} ${job.user.lastName}</p>
                </div>
                <sec:authorize access="hasAnyRole('ROLE_USER')">
                    <div class="btn">
                        <c:if test="${currentUser.cv=='' || currentUser.cv==null }">
                            <div>
                                <a href="<c:url value="/userdetail/edituser"/>" class="btn btn-success" >Vui lòng thêm CV để ứng tuyển</a>
                            </div>
                        </c:if>

                        <c:if test="${currentUser.cv!='' && currentUser.cv!=null }">
                            <div>
                                <a href="<c:url value="/apply/"/>${job.id}" class="btn btn-danger">Nộp Đơn Ứng Tuyển</a>
                            </div>
                        </c:if>
                    </div>
                </sec:authorize>
            </div>
            <div class="nav-link">
                <a href="#recruitment" class="is-line">Tin tuyển dụng</a>
                <a href="#related">Việc làm liên quan</a>
            </div>
            <div class="recruitment" id="recruitment">
                <h3>Chi tiết tuyển dụng</h3>
                <div class="recruitment__box">
                    <h4>Thông tin chung</h4>
                    <div class="recruitment__list">
                        <div class="recruitment__item">
                            <img src="https://www.topcv.vn/v4/image/job-detail/icon/1.svg" alt="">
                            <p>
                                <c:if test="${job.pay != null}">
                                    Mức Lương<br><span>${job.pay} Triệu đồng</span>
                                </c:if>
                            </p>
                            <p>
                                <c:if test="${job.pay == null}">
                                    Mức Lương<br><span>Thỏa thuận</span>
                                </c:if>
                            </p> 
                        </div>
                        <div class="recruitment__item">
                            <img src="https://www.topcv.vn/v4/image/job-detail/icon/5.svg" alt="">
                            <p>
                                Số lượng tuyển<br><span>${job.quantily} người</span>
                            </p>
                        </div>
                        <div class="recruitment__item">
                            <img src="https://www.topcv.vn/v4/image/job-detail/icon/2.svg" alt="">
                            <p>
                                Hình thức làm việc<br><span>${job.timework}</span>
                            </p>
                        </div>
                        <div class="recruitment__item">
                            <img src="https://www.topcv.vn/v4/image/job-detail/icon/6.svg" alt="">
                            <p>
                                <strong>Cấp bậc</strong> <br><span>${job.level}</span>
                            </p>
                        </div>
                        <div class="recruitment__item">
                            <img src="https://www.topcv.vn/v4/image/job-detail/icon/3.svg" alt="">
                            <p>
                                Giới tính<br><span>${job.gender}</span>
                            </p>
                        </div>
                        <div class="recruitment__item">
                            <img src="https://www.topcv.vn/v4/image/job-detail/icon/7.svg" alt="">
                            <p>
                                Kinh nghiệm<br><span>${job.experience}</span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="recruitment__box">
                    <h4>Địa điểm làm việc</h4>
                    <ul>
                        <li>
                            - Khu vực: ${job.location.name}
                        </li>
                        <li>
                            - Địa chỉ: ${job.address}
                        </li>
                    </ul>
                </div>
            </div>

            <div class="job-desc">
                <div class="job-desc__item">
                    <h3>Mô tả công việc</h3>
                    <ul>
                        <c:forTokens items="${job.description}" delims="." var="des">
                            <li>${des}</li>
                            </c:forTokens>
                    </ul>
                </div>
                <div class="job-desc__item">
                    <h3>Yêu cầu ứng viên</h3>
                    <ul>
                        <c:forTokens items="${job.requirement}" delims="." var="re">
                            <li>${re}</li>
                            </c:forTokens>
                    </ul>
                </div>
                <div class="job-desc__item">
                    <h3>Cơ hội phát triển:</h3>
                    <ul>
                        <c:forTokens items="${job.reason}" delims="." var="reason">
                            <li>${reason}</li>
                            </c:forTokens>
                    </ul>

                </div>
            </div>

            <sec:authorize access="hasRole('ROLE_USER')">
                <div class="form-group">
                    <textarea class="form-control" id="commentId" placeholder="Nhap danh gia cua ban"></textarea>
                    <form:errors path="content" cssClass="alert alert-danger" element="div"/>
                    <br>
                    <input type="submit" value="Gui danh gia" onclick="addComment(${job.id},${currentUser.id})" class="btn btn-danger"/>
                </div>
            </sec:authorize>

            <form>
                <div>

                    <ul class="pagination">

                        <c:forEach begin="1" end="${Math.ceil(count/maxComm)}" var="i">

                            <c:url value="/jobs/${job.id}" var="path">
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
                        <div class="col-md-2 comment" style="padding: 10px">
                            <img class="rounded-circle img-fluid" src="<c:url value="${com.user.avatar}"/>" alt="${com.user.lastName}"/>
                        </div>
                        <div class="col-md-10 my-date comment">
                            <h2>${com.user.firstName} ${com.user.lastName}</h2>
                            <p>${com.content}</p>
                            <i>${com.createDate}</i>
                        </div>
                    </div>
                </c:forEach>
            </div>     


            <div class="related" id="related">

                <h3>Việc làm liên quan</h3>

                <div class="list-job">
                    <c:forEach items="${jobForUser}" var="j">
                        <a href="<c:url value="/jobs/${j.id}"/>" class="c-itemJob">
                            <div class="c-itemJob__logo">
                                <img src="${j.user.avatar}" alt="${j.user.lastName}">
                            </div>
                            <div class="c-itemJob__content">
                                <h3>${j.name}</h3>
                                <ul>
                                    <c:forTokens items="${j.requirement}" delims="." var="require">
                                        <li>${require}</li>
                                        </c:forTokens>

                                </ul>
                            </div>
                            <div class="c-itemJob__info">
                                <h3>${j.location.name}</h3>
                                <p>${j.pay} Triệu</p>
                                <p>${j.createDate}</p>
                            </div>
                        </a>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
</main>







