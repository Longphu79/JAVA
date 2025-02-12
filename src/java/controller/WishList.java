/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDao;
import dao.WishListDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Customer;
import model.Wishlist;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "WishList", urlPatterns = {"/WishList"})
public class WishList extends HttpServlet {

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
            out.println("<title>Servlet WishList</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WishList at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        CustomerDao dao = new CustomerDao();
        Customer c = dao.SelectCustomerByEmail(email);
         WishListDAO wishlistDao = new WishListDAO();
        List<Wishlist> wishlist = wishlistDao.getWishlist(email); // Fetch rooms from database

        if (wishlist != null && !wishlist.isEmpty()) {
            // Setting the rooms attribute in the request
            request.setAttribute("wishlist", wishlist);
        } else {
            // Handling the case where there are no rooms
            request.setAttribute("wishlist", null);
        }

        // Forwarding request to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("WishList.jsp");
        dispatcher.forward(request, response);
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
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        CustomerDao dao = new CustomerDao();
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int roomId = Integer.parseInt(request.getParameter("roomId"));

        // Thêm vào wishlist
        WishListDAO wishlistDao = new WishListDAO();
        boolean isAdded = wishlistDao.addToWishlist(customerId, roomId);

        if (isAdded) {
            response.sendRedirect("WishList.jsp"); // Chuyển hướng đến danh sách wishlist
        } else {
            request.setAttribute("errorMessage", "Không thể thêm vào Wishlist.");
            request.getRequestDispatcher("WishList.jsp").forward(request, response);
        }
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
