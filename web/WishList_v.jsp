<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Wishlist" %>
<%@ page import="model.Room" %>
<%@ page import="model.Customer" %>
<%@ page import="model.Position" %>

<%
    List<Wishlist> wishlist = (List<Wishlist>) request.getAttribute("wishlist");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wishlist</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .room-image {
            max-width: 150px;
            height: auto;
            border-radius: 8px;
        }
        .wishlist-table {
            margin-top: 20px;
        }
        .status-available {
            color: green;
            font-weight: bold;
        }
        .status-booked {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mt-4 mb-4">My Wishlist</h1>

        <%-- Hiển thị thông báo nếu danh sách rỗng --%>
        <% if (wishlist == null || wishlist.isEmpty()) { %>
            <div class="alert alert-info" role="alert">
                No items found in your wishlist.
            </div>
        <% } else { %>
            <table class="table table-bordered wishlist-table">
                <thead class="table-dark">
                    <tr>
                        <th>Room Image</th>
                        <th>Room Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Position</th>
                        <th>Customer Name</th>
                        <th>Customer Email</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Wishlist item : wishlist) { 
                        Room room = item.getRoom();
                        Customer customer = room.getCustomer();
                        Position position = room.getPosition();
                    %>
                        <tr>
                            <td>
                                <img src="<%= room.getImage() %>" alt="Room Image" class="room-image">
                            </td>
                            <td><%= room.getRoomName() %></td>
                            <td><%= room.getDescription() %></td>
                            <td>$<%= room.getPrice() %></td>
                            <td>
                                <span class="<%= room.getStatus() == 1 ? "status-available" : "status-booked" %>">
                                    <%= room.getStatus() == 1 ? "Available" : "Booked" %>
                                </span>
                            </td>
                            <td><%= position.getPositionName() %></td>
                            <td><%= customer.getFullName() %></td>
                            <td><%= customer.getEmail() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
