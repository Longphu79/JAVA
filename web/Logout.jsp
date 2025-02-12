<%-- 
    Document   : Logout
    Created on : Feb 3, 2025, 12:45:05 AM
    Author     : son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
           HttpSession currentSession = request.getSession(false); 
            // không tạo session mới nếu không tồn tại 
            if(session!=null){
            session.invalidate(); // xóa session hiện tại 
            }
             response.sendRedirect("Header.jsp"); // Chuyển hướng đến trang đăng nhập
        %>
    </body>
</html>