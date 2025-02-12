
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.Database;
import model.Customer;

public class CustomerDao {

    public void inserintoCustomer(Customer cter) {
//        String email,String hoten,String password
        Connection con = null;
        PreparedStatement st = null;
        try {
            con = Database.getConnection();
            // Step 2: Create SQL statement
            String sql = "INSERT INTO Users (email, password, role_id, phone_number, full_name, date_of_birth,entity_state,image)  VALUES (?,?,?,?,?,?,?,?)";
            int trangthai = 0;
            int role = 2;

            st = con.prepareStatement(sql);
            st.setString(1, cter.getEmail());
            st.setString(2, cter.getPassword());
            st.setInt(3, role);
            st.setString(4, cter.getPhone());
            st.setString(5, cter.getFullName());
            st.setString(6, cter.getBirthDate());
            st.setInt(7, trangthai);
            st.setString(8, cter.getImage());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateState(String email) {
        Connection con = null;
        PreparedStatement st = null;
        try {
            con = Database.getConnection();
            // Step 2: Create SQL statement
            String sql = "UPDATE Users SET entity_state = 1 WHERE email = ?";
            st = con.prepareStatement(sql);
            st.setString(1, email);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Customer getCustomer(String email, String password) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            // Get a connection from your connection utility
            con = Database.getConnection();

            // SQL query to fetch customer details based on username and password
            String sql = "SELECT  email, password, phone_number, full_name, date_of_birth,image FROM Users where email=? and password=?and entity_state=1";
            pr = con.prepareStatement(sql);
            pr.setString(1, email);
            pr.setString(2, password);

            re = pr.executeQuery();
            if (re.next()) {
                // Retrieve values by their index in the table (ensure these match the table schema)
                String email1 = re.getString(1);
                String password1 = re.getString(2);
                String phone = re.getString(3);
                String fullName = re.getString(4);
                String date = re.getString(5);
                String image = re.getString(6);
                return new Customer(email1, password1, phone, fullName, date, image);
            }
        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
        return null; // Return null if no customer is found or an error occurs
    }

    // check email đã tồn tại 
    public Customer exitEmail(String email) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            // Get a connection from your connection utility
            con = Database.getConnection();

            // SQL query to fetch customer details based on username and password
            String sql = "SELECT  email, password, phone_number, full_name, date_of_birth,image FROM Users where email=?";
            pr = con.prepareStatement(sql);
            pr.setString(1, email);

            re = pr.executeQuery();
            if (re.next()) {
                // Retrieve values by their index in the table (ensure these match the table schema)
                String email1 = re.getString(1);
                String password1 = re.getString(2);
                String phone = re.getString(3);
                String fullName = re.getString(4);
                String date = re.getString(5);
                String image = re.getString(6);
                return new Customer(email1, password1, phone, fullName, date, image);
            }
        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
        return null;
    }

    public void ChangePasswword(String passwword, String email) {
        Connection con = null;
        PreparedStatement st = null;
        try {
            con = Database.getConnection();
            // Step 2: Create SQL statement
            String sql = "UPDATE Users \n"
                    + "SET password = ? \n"
                    + "WHERE email = ?;";
            st = con.prepareStatement(sql);
            st.setString(1, passwword);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Customer SelectCustomerByEmail(String email) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            // Get a connection from your connection utility
            con = Database.getConnection();

            // SQL query to fetch customer details based on username and password
            String sql = "SELECT  email, phone_number, full_name, date_of_birth,image FROM Users where email=?";
            pr = con.prepareStatement(sql);
            pr.setString(1, email);

            re = pr.executeQuery();
            if (re.next()) {
                // Retrieve values by their index in the table (ensure these match the table schema)
                String email1 = re.getString(1);
                String phone = re.getString(2);
                String fullName = re.getString(3);
                String date = re.getString(4);
                String image = re.getString(5);
                return new Customer(email1, phone, fullName, date, image);
            }
        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
        return null;
    }

    public boolean updateAvatar(String email, String imagePath) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement pr = null;

        try {
            String sql = "UPDATE Users SET image = ? WHERE email = ?";
            con = Database.getConnection();
            pr = pr = con.prepareStatement(sql);
            pr.setString(1, imagePath);
            pr.setString(2, email);
            return pr.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public void UpdateCustomer(String email,String phone, String date, String fullName){
        Connection con = null;
        PreparedStatement st = null;
        try {
            con = Database.getConnection();
            // Step 2: Create SQL statement
            String sql = "update Users set full_name=? , phone_number=?, date_of_birth=? where email = ?";
            st = con.prepareStatement(sql);
            st.setString(1, fullName);
            st.setString(2, phone);
            st.setString(3, date);
            st.setString(4, email);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public String getPassByEmail(String email){
        Connection con = null;
        PreparedStatement pr = null;
         ResultSet re = null;
         try {
            // Get a connection from your connection utility
            con = Database.getConnection();

            // SQL query to fetch customer details based on username and password
            String sql = "select password  from users where email=?";
            pr = con.prepareStatement(sql);
            pr.setString(1, email);

            re = pr.executeQuery();
            if (re.next()) {
                // Retrieve values by their index in the table (ensure these match the table schema)
               String pass = re.getString(1);
               return pass;
            }
        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
        return null;
    }
}
