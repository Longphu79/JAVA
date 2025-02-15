package dao;

import database.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.Position;
import model.Room;
import model.Wishlist;

public class WishListDAO {

    // Lấy danh sách wishlist của khách hàng
    public List<Wishlist> getWishlist(int customerId) {
        List<Wishlist> wishlist = new ArrayList<>();
        String sql = "SELECT w.room_id, w.user_id,"
                + "r.room_name, r.description, r.price, r.status, r.image,"
                + "p.position_id, p.position_name,  "
                + "c.email, c.phone_number, c.full_name, c.date_of_birth, c.image "
                + "FROM wishlist_room w "
                + "JOIN Rooms r ON w.room_id = r.room_id "
                + "JOIN Users c ON w.user_id = c.user_id "
                + "JOIN Positions p ON r.position_id = p.position_id "
                + "WHERE w.user_id = ?;";

        try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, customerId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Wishlist item = new Wishlist();

                    // Tạo đối tượng Room
                    Room room = new Room();
                    room.setRoomId(rs.getInt("room_id"));
                    room.setRoomName(rs.getString("room_name"));
                    room.setDescription(rs.getString("description"));
                    room.setPrice(rs.getDouble("price"));
                    room.setStatus(rs.getInt("status"));
                    room.setImage(rs.getString("image"));

//                     Tạo đối tượng Position
                    Position position = new Position();
                    position.setPositionId(rs.getInt("position_id"));
                    position.setPositionName(rs.getString("position_name"));
                    room.setPosition(position);

                    // Tạo đối tượng Customer
                    Customer customer = new Customer();
                    customer.setEmail(rs.getString("email"));
                    customer.setPhone(rs.getString("phone_number"));
                    customer.setFullName(rs.getString("full_name"));
                    customer.setBirthDate(rs.getString("date_of_birth"));
                    customer.setImage(rs.getString("image"));
                    room.setCustomer(customer);

                    item.setRoom(room);
                    wishlist.add(item);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return wishlist;
    }

    // Thêm phòng vào wishlist
    public void addToWishlist(int customerId, int roomId) {
        String sql = "INSERT INTO wishlist_room (user_id, room_id) VALUES (?, ?)";

        try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, customerId);
            ps.setInt(2, roomId);
            ps.executeUpdate(); // Trả về true nếu thêm thành công
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getUserIdByEmail(String email) {
        String sql = "SELECT user_id FROM Users where email=?";

        try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet result = ps.executeQuery();
            while (result.next()) {
                return result.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    public void deteleWishlistById(int customerId, int roomId){
         String sql = "DELETE FROM wishlist_room where user_id = ? and room_id = ?";
         try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
         ps.setInt(1,customerId);
         ps.setInt(2, roomId);
         ps.executeQuery();
         }catch (Exception e) {
            e.printStackTrace();
        }
    }

//    public int getRoomIdByUserId(int userId){
//    String sql ="SELECT room_id FROM wishlist_room where user_id=?";
//    
//    try(Connection con = Database.getConnection();
//        PreparedStatement ps = con.prepareStatement(sql)){
//        ps.setInt(1, userId);
//        ResultSet result = ps.executeQuery();
//            while (result.next()) {
//                        return result.getInt(1);
//            }
//    }catch (Exception e) {
//            e.printStackTrace();
//        }
//    return -1;
//    }
}
