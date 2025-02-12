<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
        <link
            href="https://fonts.googleapis.com/icon?family=Material+Icons"
            rel="stylesheet"
            />
        <link href="./css/header.css" rel="stylesheet" />
    </head>
    <body>
        <header class="bg-white text-body shadow-sm sticky-top z-1021" id="header">
            <div class="container-xl">
                <div
                    class="d-flex justify-content-between border-bottom"
                    style="--bs-border-color: #f1f1f1"
                    >
                    <div class="d-flex">
                        <a href="#"
                           ><img
                                class="object-fit-contain"
                                style="width: 190px; height: 60px"
                                src="${pageContext.request.contextPath}/images/anhthuetro.png" 
                                alt="Kênh thông tin cho thuê phòng trọ số 1 Việt Nam"
                                title="Phongtro123.com"
                                /></a>
                        <div class="d-none d-md-flex ms-4">
                            <div class="filter__bar pb-2">
                                <div class="w-100">
                                    <div class="d-flex position-relative bg-white">
                                        <div
                                            data-bs-toggle="offcanvas"
                                            data-bs-target="#offcanvasLocation"
                                            aria-controls="offcanvasLocation"
                                            class="btn__search d-flex align-items-center"
                                            >
                                            <span class="material-icons me-2">location_on</span>
                                            <span
                                                class="fw-normal flex-grow-1 line-clamp-1 text-body"
                                                >
                                                Tìm theo khu vực
                                            </span>
                                        </div>

                                        <button
                                            type="button"
                                            data-bs-toggle="offcanvas"
                                            data-bs-target="#offcanvasAdvance"
                                            aria-controls="offcanvasAdvance"
                                            class="btn btn__funnel"
                                            >
                                            <i class="icon funnel size-14 me-1"></i>
                                            <span>Bộ lọc</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="d-flex js-reload-html-header">
                            <!-- <a
                              class="btn btn-white d-none d-lg-flex align-items-center text-body rounded-4"
                              href="https://phongtro123.com/tin-da-luu.html"
                              ><i class="icon heart size-16 me-2"></i>Tin đã lưu</a
                            > -->
                            <!-- <a
                              class="btn btn-white d-none d-xl-flex align-items-center text-body rounded-4 me-4"
                              href="https://phongtro123.com/quan-ly/tin-dang.html"
                              ><i class="icon folder size-18 me-2"></i>Quản lý</a
                            > -->
                            <div class="dropdown d-none d-lg-block">
                                <button
                                    class="btn border-0 text-body d-flex align-items-center dropdown-toggle"
                                    type="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    aria-label="Tài khoản"
                                    >
                                    <img
                                        class="avatar rounded-circle me-2"
                                        src="${pageContext.request.contextPath}/images/default_user.jpg" 
                                        alt="Ảnh đại diện tài khoản"
                                        width="33"
                                        height="33"
                                        />
                                    <span class="fs-6">Tài khoản</span>
                                </button>
                                <ul
                                    class="dropdown-menu dropdown-menu-end shadow border-0 pt-3 pb-3"
                                    >
                                    <li>
                                        <a
                                            class="dropdown-item d-flex justify-content-between pt-1 pb-1 pe-5"
                                            rel="nofollow"
                                            href="Loggin.jsp"
                                            >
                                            <div class="d-flex">
                                                <span
                                                    class="d-flex size-30 bg-light rounded-circle justify-content-center me-2"
                                                    ><i class="icon register size-16"></i
                                                    ></span>
                                                Tạo tài khoản mới
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                            class="dropdown-item d-flex justify-content-between pt-1 pb-1 pe-5"
                                            rel="nofollow"
                                            href="Register.jsp"
                                            >
                                            <div class="d-flex">
                                                <span
                                                    class="d-flex size-30 bg-light rounded-circle justify-content-center me-2"
                                                    ><i class="icon login size-16"></i
                                                    ></span>
                                                Đăng nhập
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <a
                                class="btn btn-red text-white rounded-4 align-items-center justify-content-center ms-4"
                                style="
                                background-color: red;
                                width: 150px;
                                height: 40px;
                                display: flex;
                                align-items: center;
                                justify-content: center;
                                "
                                rel="nofollow"
                                href="#"
                                >
                                <i class="icon posting white me-2"></i>Đăng tin
                            </a>

                            <div
                                class="offcanvas offcanvas-end"
                                tabindex="-1"
                                id="offcanvasUserMenu"
                                aria-labelledby="offcanvasUserMenuLabel"
                                >
                                <div
                                    class="offcanvas-header shadow-sm align-items-start p-2 px-4"
                                    >
                                    <a
                                        id="pt123__logo"
                                        class="ms-0"
                                        href="https://phongtro123.com"
                                        >Phongtro123.com</a
                                    >
                                    <button
                                        type="button"
                                        class="btn-close mt-1"
                                        data-bs-dismiss="offcanvas"
                                        aria-label="Close"
                                        ></button>
                                </div>
                                <div class="offcanvas-body p-5">
                                    <p>
                                        Xin chào, <span class="d-block fs-3">Khách truy cập</span>
                                    </p>
                                    <p>Bạn cần đăng ký hoặc đăng nhập để tiếp tục</p>
                                    <div class="d-flex">
                                        <a
                                            rel="nofollow"
                                            class="btn btn-lg fs-6 w-100 btn-outline-dark bg-white text-body d-flex rounded-pill justify-content-center me-2"
                                            href="https://phongtro123.com/dang-nhap-tai-khoan"
                                            ><i class="icon login me-2"></i>Đăng nhập</a
                                        >
                                        <a
                                            rel="nofollow"
                                            class="btn btn-lg fs-6 w-100 btn-outline-dark bg-white text-body d-flex rounded-pill justify-content-center ms-2"
                                            href="https://phongtro123.com/dang-ky-tai-khoan"
                                            ><i class="icon register me-2"></i>Đăng ký</a
                                        >
                                    </div>
                                    <img src="/images/login-rafiki-red.svg" />
                                </div>
                            </div>

                            <div
                                class="offcanvas offcanvas-end"
                                tabindex="-1"
                                id="offcanvasRight"
                                aria-labelledby="offcanvasRightLabel"
                                >
                                <div
                                    class="offcanvas-header shadow-sm align-items-start p-2 px-4"
                                    >
                                    <a
                                        id="pt123__logo"
                                        class="ms-0"
                                        href="https://phongtro123.com"
                                        >Phongtro123.com</a
                                    >
                                    <button
                                        type="button"
                                        class="btn-close mt-1"
                                        data-bs-dismiss="offcanvas"
                                        aria-label="Close"
                                        ></button>
                                </div>
                                <div
                                    class="offcanvas-body bg-secondary p-4"
                                    style="--bs-bg-opacity: 0.065"
                                    >
                                    <div class="row gx-2 mb-4">
                                        <div class="col-6">
                                            <a
                                                rel="nofollow"
                                                class="btn btn-lg fs-6 btn-outline-dark bg-white text-body rounded-pill w-100 d-flex justify-content-center"
                                                href="https://phongtro123.com/dang-nhap-tai-khoan"
                                                ><i class="icon login me-2"></i>Đăng nhập</a
                                            >
                                        </div>
                                        <div class="col-6">
                                            <a
                                                rel="nofollow"
                                                class="btn btn-lg fs-6 btn-outline-dark bg-white text-body rounded-pill w-100 d-flex justify-content-center"
                                                href="https://phongtro123.com/dang-ky-tai-khoan"
                                                ><i class="icon register me-2"></i>Đăng ký</a
                                            >
                                        </div>
                                        <div class="col-12 mt-2">
                                            <a
                                                rel="nofollow"
                                                class="btn btn-lg fs-6 btn-red rounded-pill w-100 d-flex justify-content-center"
                                                href="https://phongtro123.com/quan-ly/dang-tin-moi.html"
                                                ><i class="icon posting white me-2"></i>Đăng tin mới</a
                                            >
                                        </div>
                                    </div>
                                    <div class="bg-white p-4 mb-3 rounded">
                                        <ul>
                                            <li>
                                                <a
                                                    class="d-flex justify-content-between text-body fs-5-5 pb-25 pt-25 border-bottom"
                                                    href="/tin-da-luu.html"
                                                    title="Tin đã lưu"
                                                    >
                                                    <div class="d-flex">
                                                        <i class="icon heart size-20 me-3"></i> Tin đã lưu
                                                    </div>
                                                    <i class="icon arrow-right red size-20"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a
                                                    class="d-flex justify-content-between text-body fs-5-5 pb-25 pt-25 border-bottom"
                                                    href="https://phongtro123.com"
                                                    title="Cho thuê phòng trọ"
                                                    >
                                                    <div class="d-flex" id="test">
                                                        <i class="icon houses size-20 me-3"></i> Cho thuê
                                                        phòng trọ
                                                    </div>
                                                    <i class="icon arrow-right red size-20"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a
                                                    class="d-flex justify-content-between text-body fs-5-5 pb-25 pt-25 border-bottom"
                                                    href="/nha-cho-thue"
                                                    title="Cho thuê nhà"
                                                    >
                                                    <div class="d-flex">
                                                        <i class="icon house-door size-20 me-3"></i> Cho
                                                        thuê nhà nguyên căn
                                                    </div>
                                                    <i class="icon arrow-right red size-20"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a
                                                    class="d-flex justify-content-between text-body fs-5-5 pb-25 pt-25 border-bottom"
                                                    href="/cho-thue-can-ho"
                                                    title="Cho thuê căn hộ"
                                                    >
                                                    <div class="d-flex">
                                                        <i class="icon building size-20 me-3"></i> Cho thuê
                                                        căn hộ
                                                    </div>
                                                    <i class="icon arrow-right red size-20"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a
                                                    class="d-flex justify-content-between text-body fs-5-5 pb-25 pt-25 border-bottom"
                                                    href="/tim-nguoi-o-ghep"
                                                    title="Tìm người ở ghép"
                                                    >
                                                    <div class="d-flex">
                                                        <i class="icon people size-20 me-3"></i> Tìm người ở
                                                        ghép
                                                    </div>
                                                    <i class="icon arrow-right red size-20"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a
                                                    class="d-flex justify-content-between text-body fs-5-5 pb-25 pt-25 border-bottom"
                                                    href="/cho-thue-mat-bang"
                                                    title="Cho thuê mặt bằng"
                                                    >
                                                    <div class="d-flex">
                                                        <i class="icon shop-window size-20 me-3"></i> Cho
                                                        thuê mặt bằng
                                                    </div>
                                                    <i class="icon arrow-right red size-20"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a
                                                    class="d-flex justify-content-between text-body fs-5-5 pb-25 pt-25 border-bottom"
                                                    href="/blog.html"
                                                    title="Blog"
                                                    >
                                                    <div class="d-flex">
                                                        <i class="icon newspaper size-20 me-3"></i> Blog
                                                    </div>
                                                    <i class="icon arrow-right red size-20"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a
                                                    class="d-flex justify-content-between text-body fs-5-5 pb-25 pt-25"
                                                    href="/bang-gia-dich-vu"
                                                    title="Bảng giá dịch vụ"
                                                    >
                                                    <div class="d-flex">
                                                        <i class="icon tags size-20 me-3"></i> Bảng giá dịch
                                                        vụ
                                                    </div>
                                                    <i class="icon arrow-right red size-20"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div
                            class="d-flex d-lg-none align-items-center p-2 pe-0 ms-4 text-nowrap text-body cursor-pointer"
                            data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasRight"
                            aria-controls="offcanvasRight"
                            style="
                            border: 1px solid #ddd;
                            border-radius: 4px;
                            background-color: #f8f9fa;
                            transition: background-color 0.3s;
                            "
                            >
                            <i class="icon list size-25 me-2" style="color: #6c757d"></i>
                            <span style="font-size: 14px; font-weight: 500; color: #343a40"
                                  >Danh mục</span
                            >
                        </div>
                    </div>
                </div>
            </div>
            <div class="container d-none d-lg-block">
                <nav class="pt123__nav">
                    <ul class="d-flex h-100" id="cha">
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Cho thuê phòng trọ"
                                href="#"
                                >Phòng trọ</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Cho thuê nhà nguyên căn"
                                href="#"
                                >Nhà nguyên căn</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Cho thuê căn hộ chung cư"
                                href="#"
                                >Căn hộ chung cư</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Cho thuê căn hộ mini"
                                href="#"
                                >Căn hộ mini</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Cho thuê căn hộ dịch vụ"
                                href="#"
                                >Căn hộ dịch vụ</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Tìm người ở ghép"
                                href="#"
                                >Ở ghép</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Cho thuê mặt bằng"
                                href="#"
                                >Mặt bằng</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Blog"
                                href="/blog.html"
                                >Blog</a
                            >
                        </li>
                        <li class="h-100">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Bảng giá dịch vụ"
                                href="/bang-gia-dich-vu"
                                >Bảng giá dịch vụ</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="diendan"
                                href="/blog.html"
                                >Diễn Đàn</a
                            >
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
        <div class="container mt-3 mb-3 mt-lg-5 mb-lg-5">
            <div class="row justify-content-center">
                <div class="col-md-10 col-lg-7">
                    <div class="bg-white shadow-sm rounded-4 p-4 p-lg-5 pt-4">
                        <div class="d-flex justify-content-between mb-5">
                            <a
                                class="fs-3 fw-semibold text-center text-body border-2 border-bottom border-red pb-3 w-100"
                                href="Loggin.jsp"
                                >Đăng nhập</a
                            >
                            <a
                                class="fs-3 fw-light text-center text-secondary border-2 border-bottom border-light-subtle pb-3 w-100"
                                href="Register.jsp"
                                >Tạo tài khoản mới</a
                            >
                        </div>
                        <form class="js-register-form clearfix" action="InsertCustomer" method="POST">
                            <div class="form-floating mb-3">
                                <input
                                    type="text"
                                    class="form-control form-control-lg rounded-4 border-secondary-subtle"
                                    id="inputFullName"
                                    placeholder="Họ tên"
                                    minlength="3"
                                    name="fullname"
                                    required=""
                                    data-msg="Không được phép để trống"
                                    />
                                <label for="inputFullName">Họ tên</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input
                                    type="text"
                                    class="form-control form-control-lg rounded-4 border-secondary-subtle"
                                    id="inputPhone"
                                    placeholder="Số điện thoại"
                                    minlength="10"
                                    maxlength="11"
                                    name="phone_number"
                                    required=""
                                    data-msg="Không được phép để trống"
                                    />
                                <label for="inputPhone">Số điện thoại</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input
                                    type="email"
                                    class="form-control form-control-lg rounded-4 border-secondary-subtle"
                                    id="inputEmail"
                                    placeholder="Email"
                                    name="email"
                                    required=""
                                    data-msg="Không được phép để trống"
                                    />
                                <label for="inputEmail">Email</label>
                                <% String errorMessage = (String) request.getAttribute("errorMessage");
                                   if (errorMessage != null) { %>
                                <p style="color: red;"><%= errorMessage %></p>
                                <% } %>
                            </div>

                            <div class="form-floating mb-3">
                                <input
                                    type="date"
                                    class="form-control form-control-lg rounded-4 border-secondary-subtle"
                                    id="inputDob"
                                    name="date_of_birth"
                                    required=""
                                    data-msg="Không được phép để trống"
                                    />
                                <label for="inputDob">Ngày sinh</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input
                                    type="password"
                                    class="form-control form-control-lg rounded-4 border-secondary-subtle"
                                    placeholder="Mật khẩu"
                                    minlength="6"
                                    id="password"
                                    name="password"
                                    required=""
                                    data-msg="Không được phép để trống"
                                    />
                                <label for="password">Mật khẩu</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input
                                    type="password"
                                    class="form-control form-control-lg rounded-4 border-secondary-subtle"
                                    placeholder="Nhập lại Mật khẩu"
                                    minlength="6"
                                    id="Confirmpassword"
                                    name="Confirmpassword"
                                    required=""
                                    data-msg="Không được phép để trống"
                                    />
                                <label for="Confirmpassword">Nhập lại Mật khẩu</label>
                            </div>

                            <div class="d-grid mb-4">
                                <button
                                    type="submit"
                                    name="wp-submit-register"
                                    class="btn btn-red btn-lg rounded-4"
                                    style="background-color: red; color: white"
                                    >
                                    Tạo tài khoản
                                </button>
                            </div>
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
                        <p class="fs-10 m-0">Bản quyền © 2015 - 2025 Phongtro123.com</p>
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