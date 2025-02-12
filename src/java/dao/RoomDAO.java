package dao;

import database.Database;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.Position;
import model.Room;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class RoomDAO {
    public List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT r.room_id, r.room_name, r.description, r.price, r.status, r.image, "
                   + "p.position_id, p.position_name, p.description AS position_desc, "
                   + "u.user_id, u.email, u.phone_number, u.full_name, u.date_of_birth, u.image AS user_image "
                   + "FROM Rooms r "
                   + "JOIN Positions p ON r.position_id = p.position_id "
                   + "JOIN Users u ON r.user_id = u.user_id";

        try (Connection con = Database.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Position position = new Position(
                    rs.getInt("position_id"),
                    rs.getString("position_name"),
                    rs.getString("position_desc")
                );

                Customer customer = new Customer();
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone_number"));
                customer.setFullName(rs.getString("full_name"));
                customer.setBirthDate(rs.getString("date_of_birth"));
                customer.setImage(rs.getString("user_image"));

                Room room = new Room(
                    rs.getInt("room_id"),
                    rs.getString("room_name"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getInt("status"),
                    position,
                    customer,
                    rs.getString("image")
                );

                rooms.add(room);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rooms;
    }

}