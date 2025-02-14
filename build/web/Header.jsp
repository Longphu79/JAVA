<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
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
                            <%
    HttpSession sessionUser = request.getSession(false); // Không tạo session mới nếu chưa tồn tại
    String username = (sessionUser != null) ? (String) sessionUser.getAttribute("email") : null;
     String userImage = (sessionUser != null && sessionUser.getAttribute("userImage") != null) 
                        ? (String) sessionUser.getAttribute("userImage") 
                        : "default_user.jpg"; // Mặc định nếu không có ảnh
                            %>
                            <div class="dropdown d-none d-lg-block">
                                <button class="btn border-0 text-body d-flex align-items-center dropdown-toggle"
                                        type="button" data-bs-toggle="dropdown" aria-expanded="false" aria-label="Tài khoản">
                                    <img class="avatar rounded-circle me-2"
                                         src="${pageContext.request.contextPath}/images/<%= userImage %>" 
                                         alt="Ảnh đại diện tài khoản" width="33" height="33" />
                                    <span class="fs-6">
                                        <%= (username != null) ? username : "Tài khoản" %>
                                    </span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end shadow border-0 pt-3 pb-3">
                                    <% if (username == null) { %>
                                    <!-- Chưa đăng nhập -->
                                    <li>
                                        <a class="dropdown-item d-flex justify-content-between pt-1 pb-1 pe-5" rel="nofollow" href="Register.jsp">
                                            <div class="d-flex">
                                                <span class="d-flex size-30 bg-light rounded-circle justify-content-center me-2">
                                                    <i class="icon register size-16"></i>
                                                </span>
                                                Tạo tài khoản mới
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item d-flex justify-content-between pt-1 pb-1 pe-5" rel="nofollow" href="Loggin.jsp">
                                            <div class="d-flex">
                                                <span class="d-flex size-30 bg-light rounded-circle justify-content-center me-2">
                                                    <i class="icon login size-16"></i>
                                                </span>
                                                Đăng nhập
                                            </div>
                                        </a>
                                    </li>
                                    <% } else { %>
                                    <!-- Đã đăng nhập -->
                                    <li>
                                        <a class="dropdown-item d-flex justify-content-between pt-1 pb-1 pe-5" rel="nofollow" href="Profile">
                                            <div class="d-flex">
                                                <span class="d-flex size-30 bg-light rounded-circle justify-content-center me-2">
                                                    <i class="icon user size-16"></i>
                                                </span>
                                                Cập nhật thông tin
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item d-flex justify-content-between pt-1 pb-1 pe-5" rel="nofollow" href="ChangePassword.jsp">
                                            <div class="d-flex">
                                                <span class="d-flex size-30 bg-light rounded-circle justify-content-center me-2">
                                                    <i class="icon logout size-16"></i>
                                                </span>
                                                Thay Đổi Mật Khẩu
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item d-flex justify-content-between pt-1 pb-1 pe-5" rel="nofollow" href="Logout.jsp">
                                            <div class="d-flex">
                                                <span class="d-flex size-30 bg-light rounded-circle justify-content-center me-2">
                                                    <i class="icon logout size-16"></i>
                                                </span>
                                                Đăng xuất
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item d-flex justify-content-between pt-1 pb-1 pe-5" rel="nofollow" href="WishList_v.jsp">
                                            <div class="d-flex">
                                                <span class="d-flex size-30 bg-light rounded-circle justify-content-center me-2">
                                                    <i class="icon user size-16"></i>
                                                </span>
                                                Wish List
                                            </div>
                                        </a>
                                    </li>
                                    <% } %>
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

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>