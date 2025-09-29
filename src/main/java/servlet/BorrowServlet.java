package servlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/BorrowServlet")
public class BorrowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection con;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/librarydb", 
                "root", 
                "tiger"
            );
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("DB connection failed in BorrowServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookIdStr = request.getParameter("bookId");
        String userIdStr = request.getParameter("userId");

        try {
            int bookId = Integer.parseInt(bookIdStr);
            int userId = Integer.parseInt(userIdStr);

            // 1. Check availability of book
            String checkSql = "SELECT title, available FROM books WHERE id=?";
            PreparedStatement ps = con.prepareStatement(checkSql);
            ps.setInt(1, bookId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String bookTitle = rs.getString("title");
                int available = Integer.parseInt(rs.getString("available"));

                if (available > 0) {
                    // 2. Insert into borrowed_books
                    String insertSql = "INSERT INTO borrowed_books (user_id, book_id, book_title) VALUES (?, ?, ?)";
                    PreparedStatement psInsert = con.prepareStatement(insertSql);
                    psInsert.setInt(1, userId);
                    psInsert.setInt(2, bookId);
                    psInsert.setString(3, bookTitle);
                    psInsert.executeUpdate();

                    // 3. Update book availability
                    String updateSql = "UPDATE books SET available=? WHERE id=?";
                    PreparedStatement psUpdate = con.prepareStatement(updateSql);
                    psUpdate.setString(1, String.valueOf(available - 1));
                    psUpdate.setInt(2, bookId);
                    psUpdate.executeUpdate();

                    // 4. Redirect to success page
                    response.sendRedirect("success.jsp");
                } else {
                    // Book not available
                    response.sendRedirect("notavailable.jsp");
                }
            } else {
                // Book ID not found
                response.sendRedirect("error.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    public void destroy() {
        try {
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
