/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDao;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;
import model.Customer;
import util.Email;

@WebServlet(name = "Forgot_password", urlPatterns = {"/Forgot_password"})
public class Forgot_password extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Forgot_password</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Forgot_password at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        CustomerDao csd = new CustomerDao();
        Customer cus= csd.exitEmail(email);
        if (cus != null) {
          Email.sendEmail(email, "Xác thực tài khoản tại QuickRent.com", getContent(cus));
           RequestDispatcher re = request.getRequestDispatcher("SendGmail.jsp");
                re.forward(request, response);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
        public static String getContent(Customer cter) {
        String link = "http://localhost:8082/DoAnSWP/change_password.jsp?email=" + cter.getEmail();
        String noiDung = "<p>Bạn đã đăng ký thành công. Vui lòng không cung cấp email và mã xác thực cho ai.</p>\n"
                + "<p>Để đặt lại mật khẩu, vui lòng nhấp vào liên kết sau:</p>\n"
                + "<a href='" + link + "'>Resert Paswword</a>\n"
                + "<p>Đây là email tự động, vui lòng không phản hồi email này.</p>\n"
                + "<p>Trân trọng cảm ơn.</p>";
        return noiDung;
    }
}