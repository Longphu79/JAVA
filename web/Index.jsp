<%-- 
    Document   : Index
    Created on : Feb 10, 2025, 5:57:17 PM
    Author     : anleq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Room" %>
<%@ page import="model.Position" %>
<%@ page import="model.Customer" %>

<%
    List<Room> rooms = (List<Room>) request.getAttribute("rooms");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quick Rent</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
        <!-- Bootstrap 5 CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <%@ include file="./Header.jsp" %>
        <main>
            <div>
                <div class="row">
                    <div class="col-md-9 col-lg-8">
                        <header class="mt-2 mb-3">
                            <h1 class="fs-4 fw-medium mb-2 lh-sm">Kênh thông tin Phòng trọ số 1 Việt Nam</h1>
                            <p class="fs-7 m-0">Có 3.490 tin đăng cho thuê</p>
                        </header>

                        <ul class="list-unstyled">
                            <% if (rooms != null && !rooms.isEmpty()) { %>
                                <% for (Room room : rooms) { %>
                                    <li class="d-flex bg-white shadow-sm rounded p-3 mt-3">
                                        <figure class="post__thumb__vip2">
                                            <a href="RoomDetails.jsp?roomId=<%= room.getRoomId() %>">
                                                <img class="lazy_done" src="<%= room.getImage() %>" 
                                                    alt="<%= room.getRoomName() %>" width="150">
                                            </a>
                                        </figure>
                                        <div class="flex-grow-1 ps-3">
                                            <h3 class="fs-6 fw-medium text-uppercase mb-2">
                                                <a href="RoomDetails.jsp?roomId=<%= room.getRoomId() %>"><%= room.getRoomName() %></a>
                                            </h3>
                                            <div class="mb-2">
                                                <span class="text-price fw-semibold fs-6"><%= room.getPrice() %> triệu/tháng</span>
                                                <span class="dot mx-2">•</span>
                                                <span>45 m<sup>2</sup></span>
                                                <span class="dot mx-2">•</span>
                                                <a href="#"><%= room.getPosition().getPositionName() %></a>
                                            </div>
                                            <p class="fs-8 text-secondary">
                                                <%= room.getDescription() %>
                                            </p>
                                            <div class="d-flex justify-content-between">
                                                <div class="d-flex w-50">
                                                    <img class="avatar size-35 me-2" src="<%= room.getCustomer().getImage() %>" 
                                                        alt="<%= room.getCustomer().getFullName() %>" width="35">
                                                    <div>
                                                        <span><%= room.getCustomer().getFullName() %></span>
                                                        <time class="fs-9 text-secondary" title="Hôm nay">Hôm nay</time>
                                                    </div>
                                                </div>
                                                <div class="w-auto d-flex align-items-center">
                                                  <form action="WishList" method="post">
                                                     <input type="hidden" name="roomId" value="<%= room.getRoomId() %>">
                                                          <button type="submit" class="btn btn-white btn__save d-flex px-2">
                                                         <i class="icon heart size-18"></i> Lưu tin này
                                                            </button>
                                                         </form>
                                                    </div>
                                            </div>
                                        </div>
                                    </li>
                                <% } %>
                            <% } else { %>
                                <li class="text-center">No rooms available.</li>
                            <% } %>
                        </ul>
                        <ul class="pagination">
                            <li class="page-item disabled"><span class="page-link">« Trang trước</span></li>
                            <li class="page-item active"><span class="page-link">1</span></li>
                            <li class="page-item"><a class="page-link" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?page=2">2</a></li>
                            <li class="page-item"><a class="page-link" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?page=3">3</a></li>
                            <li class="page-item"><a class="page-link" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?page=4">4</a></li>
                            <li class="page-item disabled"><span class="page-link">...</span></li>
                            <li class="page-item"><a class="page-link" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?page=175" rel="next">»»</a></li>
                            <li class="page-item"><a class="page-link" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?page=2" rel="next">Trang sau »</a></li>
                        </ul>
                    </div>
                                            <div class="col-md-9 col-lg-4">
                        <div class="bg-white shadow-sm rounded p-3 mb-3">
                            <div class="fs-5-5 fw-medium mb-1">Xem theo khoảng giá</div>
                            <ul class="list-type-arrow fs-7 row gx-0">
                                <li class="col-6"><a class="text-link-body" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?gia_den=1000000">Dưới 1 triệu</a></li>
                                <li class="col-6"><a class="text-link-body" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?gia_tu=1000000&amp;gia_den=2000000">Từ 1 - 2 triệu</a></li>
                                <li class="col-6"><a class="text-link-body" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?gia_tu=2000000&amp;gia_den=3000000">Từ 2 - 3 triệu</a></li>
                                <li class="col-6"><a class="text-link-body" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?gia_tu=3000000&amp;gia_den=5000000">Từ 3 - 5 triệu</a></li>
                                <li class="col-6"><a class="text-link-body" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?gia_tu=5000000&amp;gia_den=7000000">Từ 5 - 7 triệu</a></li>
                                <li class="col-6"><a class="text-link-body" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?gia_tu=7000000&amp;gia_den=10000000">Từ 7 - 10 triệu</a></li>
                                <li class="col-6"><a class="text-link-body" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?gia_tu=10000000&amp;gia_den=15000000">Từ 10 - 15 triệu</a></li>
                                <li class="col-6"><a class="text-link-body" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?gia_tu=15000000">Trên 15 triệu</a></li>
                            </ul>
                            <div class="fs-5-5 fw-medium mb-1 mt-4">Xem theo diện tích</div>
                            <ul class="list-type-arrow fs-7 row gx-0">
                                <li class="col-6"><a class="text-link-body" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?dien_tich_den=20">Dưới 20 m<sup>2</sup></a></li>
                                <li class="col-6"><a class="text-link-body" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?dien_tich_tu=20&amp;dien_tich_den=30">Từ 20 - 30m<sup>2</sup></a></li>
                                <li class="col-6"><a class="text-link-body" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?dien_tich_tu=30&amp;dien_tich_den=50">Từ 30 - 50m<sup>2</sup></a></li>
                                <li class="col-6"><a class="text-link-body" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?dien_tich_tu=50&amp;dien_tich_den=70">Từ 50 - 70m<sup>2</sup></a></li>
                                <li class="col-6"><a class="text-link-body" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?dien_tich_tu=70&amp;dien_tich_den=90">Từ 70 - 90m<sup>2</sup></a></li>
                                <li class="col-6"><a class="text-link-body" href="https://phongtro123.com/cho-thue-can-ho-chung-cu-mini?dien_tich_tu=90">Trên 90m<sup>2</sup></a></li>
                            </ul>
                        </div>
                    </div>
                    
                        <!-- here -->
                </div>
            </div>
            <div class="container mt-4">
                <div class="bg-white shadow-sm rounded">
                    <div class="row">
                        <div class="col-md-6"><img class="d-block object-fit-contain mx-auto" src="/images/contact-us-pana-orange.svg" style="max-height: 390px;" alt="Hỗ trợ chủ nhà đăng tin"></div>
                        <div class="col-md-6 text-center p-5"><i class="icon headset size-30 d-block mx-auto"></i>
                            <div class="fs-2 mt-2" id="offcanvasSupportLabel">Hỗ trợ chủ nhà đăng tin</div>
                            <p class="mt-3 lead">Nếu bạn cần hỗ trợ đăng tin, vui lòng liên hệ số điện thoại bên dưới:</p>
                            <div class="rounded-4 p-4 mb-4 text-center"><a class="btn btn-red btn-lg text-white d-flex justify-content-center rounded-4" target="_blank" rel="nofollow" href="tel:0909316890"><i class="icon telephone-fill white me-2"></i>ĐT: 0909316890 </a><a class="btn btn-primary btn-lg text-white d-flex justify-content-center rounded-4 mt-2" target="_blank" rel="nofollow" href="https://zalo.me/0909316890"><i class="icon chat-text white me-2"></i>Zalo: 0909316890 </a></div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>