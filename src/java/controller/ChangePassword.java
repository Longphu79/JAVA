package controller;

import dao.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.EncryptionPasword;

@WebServlet(name = "ChangePassword", urlPatterns = {"/ChangePassword"})
public class ChangePassword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Mã hóa mật khẩu cũ để kiểm tra
        oldPassword = EncryptionPasword.toSHA1(oldPassword);

        CustomerDao cd = new CustomerDao();
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        if (email == null) {
            request.setAttribute("errorMessage", "Lỗi: Không tìm thấy email của bạn.");
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
            return;
        }

        String pass = cd.getPassByEmail(email);

        // Kiểm tra mật khẩu cũ có đúng không
        if (!oldPassword.equals(pass)) {
            request.setAttribute("errorMessage", "Mật khẩu cũ không đúng.");
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
            return;
        }

        // Kiểm tra mật khẩu mới có trùng nhau không
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMessage1", "Mật khẩu mới không khớp.");
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
            return;
        }

         // Mã hóa mật khẩu mới và cập nhật
        newPassword = EncryptionPasword.toSHA1(newPassword);
        cd.ChangePasswword(newPassword, email);

         // Điều hướng về trang Profile
        response.sendRedirect("Profile");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}