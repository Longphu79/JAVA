package controller;

import dao.RoomDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Room;

@WebServlet(name = "RoomServlet", urlPatterns = {"/"})
public class RoomServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetching room data from RoomDAO
        RoomDAO roomDao = new RoomDAO();
        List<Room> rooms = roomDao.getAllRooms(); // Fetch rooms from database

        if (rooms != null && !rooms.isEmpty()) {
            // Setting the rooms attribute in the request
            request.setAttribute("rooms", rooms);
        } else {
            // Handling the case where there are no rooms
            request.setAttribute("rooms", null);
        }

        // Forwarding request to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("Index.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // You can handle POST requests if needed
    }

    @Override
    public String getServletInfo() {
        return "RoomServlet handling room data display.";
    }
}