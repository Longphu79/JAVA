
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;
import util.Email;
import util.EncryptionPasword;

@WebServlet(name = "InsertCustomer", urlPatterns = {"/InsertCustomer"})
public class Register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InsertCustomer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertCustomer at " + request.getContextPath() + "</h1>");
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
        System.out.println(email);
        String fullName = request.getParameter("fullname");
        System.out.println(fullName);
        String passWord = request.getParameter("password");
        System.out.println(passWord);
        String date = request.getParameter("date_of_birth");
        System.out.println(date);
        String phone = request.getParameter("phone_number");
        System.out.println(phone);
        // mã hóa mật khẩu
        String image = "default_user.jsp";
        passWord = EncryptionPasword.toSHA1(passWord);
        Customer cter = new Customer(email, passWord, phone, fullName, date, image);
        CustomerDao cusd = new CustomerDao();
        if (cusd.exitEmail(email) != null) {
            request.setAttribute("errorMessage", "Email đã tồn tại!");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        } else {
            cusd.inserintoCustomer(cter);
            Email.sendEmail(cter.getEmail(), "Xác thực tài khoản tại QuickRent.vn", getContent(cter));
            response.sendRedirect("Loggin.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public static String getContent(Customer cter) {
        String link = "http://localhost:8082/DoAnSWP/authenticate?email=" + cter.getEmail();
        String noiDung = "<p>Bạn đã đăng ký thành công. Vui lòng không cung cấp email và mã xác thực cho ai.</p>\n"
                + "<p>Để kích hoạt tài khoản, vui lòng nhấp vào liên kết sau:</p>\n"
                + "<a href='" + link + "'>Kích hoạt tài khoản</a>\n"
                + "<p>Đây là email tự động, vui lòng không phản hồi email này.</p>\n"
                + "<p>Trân trọng cảm ơn.</p>";
        return noiDung;
    }
}
