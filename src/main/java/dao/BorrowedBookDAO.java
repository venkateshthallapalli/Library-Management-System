package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model1.BorrowedBook;

public class BorrowedBookDAO {
    private Connection con;

    public BorrowedBookDAO() {
        this.con = con;
    }

    // Insert a borrowed book record
    public boolean insertBorrowedBook(BorrowedBook b) {
        boolean result = false;
        String sql = "INSERT INTO borrowed_books (user_id, book_id, book_title) VALUES (?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, b.getUserId());
            ps.setInt(2, b.getBookId());
            ps.setString(3, b.getBookTitle());
            int rows = ps.executeUpdate();
            if (rows > 0) result = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Get all borrowed books
    public List<BorrowedBook> getAllBorrowedBooks() {
        List<BorrowedBook> list = new ArrayList<>();
        String sql = "SELECT * FROM borrowed_books ORDER BY borrow_date DESC";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BorrowedBook b = new BorrowedBook();
                b.setId(rs.getInt("id"));
                b.setUserId(rs.getInt("user_id"));
                b.setBookId(rs.getInt("book_id"));
                b.setBookTitle(rs.getString("book_title"));
                b.setBorrowDate(rs.getTimestamp("borrow_date"));
                list.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get borrowed books for a specific user
    public List<BorrowedBook> getBorrowedBooksByUser(int userId) {
        List<BorrowedBook> list = new ArrayList<>();
        String sql = "SELECT * FROM borrowed_books WHERE user_id=? ORDER BY borrow_date DESC";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BorrowedBook b = new BorrowedBook();
                b.setId(rs.getInt("id"));
                b.setUserId(rs.getInt("user_id"));
                b.setBookId(rs.getInt("book_id"));
                b.setBookTitle(rs.getString("book_title"));
                b.setBorrowDate(rs.getTimestamp("borrow_date"));
                list.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<BorrowedBook> getAllBorrowedBooks1() {
        List<BorrowedBook> list = new ArrayList<>();
        String sql = "SELECT * FROM borrowed_books ORDER BY borrow_date DESC";
        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                BorrowedBook b = new BorrowedBook();
                b.setId(rs.getInt("id"));
                b.setUserId(rs.getInt("user_id"));
                b.setBookId(rs.getInt("book_id"));
                b.setBookTitle(rs.getString("book_title"));
                b.setBorrowDate(rs.getTimestamp("borrow_date"));
                list.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
}
