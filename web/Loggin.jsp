<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loggin</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
    </head>
    <body>
        <%@ include file="./Header.jsp" %>
        <div class="container mt-3 mb-3 mt-lg-5 mb-lg-5">
            <div class="row justify-content-center">
                <div class="col-md-10 col-lg-7">
                    <div class="bg-white shadow-sm rounded-4 p-4 p-lg-5 pt-4">
                        <div class="d-flex justify-content-between mb-5">
                            <a
                                class="fs-3 fw-semibold text-center text-body border-2 border-bottom border-red pb-3 w-100"
                                href="Loggin.jsp"
                                >Đăng nhập</a
                            ><a
                                class="fs-3 fw-light text-center text-secondary border-2 border-bottom border-light-subtle pb-3 w-100"
                                href="Register.jsp"
                                >Tạo tài khoản mới</a
                            >
                        </div>
                        <form class="js-login-form clearfix" action="Login" method="POST">
                            <div class="form-floating mb-3">
                                <input
                                    type="text"
                                    class="form-control form-control-lg rounded-4 border-secondary-subtle"
                                    id="inputPhoneEmailLogin"
                                    placeholder="Số điện thoại"
                                    minlength="10"
                                    maxlength="100"
                                    name="loginname"
                                    required=""
                                    data-msg="Không được phép để trống"
                                    /><label for="inputPhoneEmailLogin">Email</label>
                            </div>
                            <div class="form-floating mb-4">
                                <input
                                    type="password"
                                    class="form-control form-control-lg rounded-4 border-secondary-subtle"
                                    placeholder="Mật khẩu"
                                    minlength="6"
                                    id="password"
                                    name="password"
                                    required=""
                                    data-msg="Không được phép để trống"
                                    /><label for="password">Mật khẩu</label>
                            </div>
                            <% if (request.getAttribute("errorMessage") != null) { %>
                            <p class="text-danger"><%= request.getAttribute("errorMessage") %></p>
                            <% } %>
                            <div class="d-grid mb-3">
                                <button
                                    type="submit"
                                    name="wp-submit-login"
                                    class="btn btn-red btn-lg rounded-4"
                                    style="color: white; background-color: red"
                                    >
                                    Đăng nhập
                                </button>
                            </div>
                            <p class="mb-2">
                                <a
                                    class="text-decoration-underline"
                                    href="Forgot_Password.jsp"
                                    >Bạn quên mật khẩu?</a
                                >
                            </p>
                            <input
                                type="hidden"
                                name="redirect"
                                value="https://phongtro123.com/dang-ky-tai-khoan"
                                />
                        </form>
                        <p class="fs-10 mt-4 pt-4">
                            Qua việc đăng nhập hoặc tạo tài khoản, bạn đồng ý với các
                            <a
                                class="text-decoration-underline"
                                target="_blank"
                                rel="nofollow"
                                href="/quy-dinh-su-dung"
                                >quy định sử dụng</a
                            >
                            cũng như
                            <a
                                class="text-decoration-underline"
                                target="_blank"
                                rel="nofollow"
                                href="/chinh-sach-bao-mat"
                                >chính sách bảo mật</a
                            >
                            của chúng tôi
                        </p>
                        <p class="fs-10 m-0">Bản quyền © 20242024 - 2025</p>
                    </div>
                </div>
            </div>
        </div>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>