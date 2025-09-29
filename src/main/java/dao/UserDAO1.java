package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model1.User;

public class UserDAO1 {

    private Connection con;

    
    public UserDAO1() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/librarydb", "root", "tiger");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Register User
    public boolean registerUser1(User u) {
        boolean result = false;
        String query = "INSERT INTO users(name, email, password, mobile, role) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getMobile());
            ps.setString(5, u.getRole());
            int rows = ps.executeUpdate();
            result = rows > 0;
        } catch (Exception e) {
            System.out.println("Error in registration: " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    // Login User
    public User login(String email, String password) {
        User user = null;
        String query = "SELECT * FROM users WHERE email=? AND password=?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setMobile(rs.getString("mobile"));
                    user.setPassword(rs.getString("password"));
                    user.setRole(rs.getString("role"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
 // Update user profile
    public boolean updateProfile(User u) {
        boolean result = false;
        String query = "UPDATE users SET name=?, email=?, password=?, mobile=? WHERE id=?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getMobile());
            ps.setInt(5, u.getId());

            int rows = ps.executeUpdate();
            result = rows > 0;
        } catch (Exception e) {
            System.out.println("Error in updateProfile: " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb", "root", "tiger");
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setMobile(rs.getString("mobile"));
                u.setRole(rs.getString("role"));
                users.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    public User deleteUser(int id) {
        User user = null;
        String sql = "SELECT * FROM users WHERE id = ?";
        try (Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/librarydb", "root", "tiger");
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setMobile(rs.getString("mobile"));
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public User getUserById(int id) {
        User user = null;
        String sql = "SELECT * FROM users WHERE id = ?";
        try (Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/librarydb", "root", "tiger");
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setMobile(rs.getString("mobile"));
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }




}
