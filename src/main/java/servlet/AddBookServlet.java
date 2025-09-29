package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.BookDAO;
import model1.Book;

@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve form data
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            int available = Integer.parseInt(request.getParameter("available")); // since in DB it's VARCHAR

            // Create Book object
            Book book = new Book();
            book.setTitle(title);
            book.setAuthor(author);
            book.setAvailable(available);

            // Save into DB using DAO
            BookDAO dao = new BookDAO();
            boolean result = dao.addBook(book);

            if (result) {
                // Redirect back to manage books page
                response.sendRedirect("ManageBooksServlet");
            } else {
                response.getWriter().println("<h3 style='color:red'>Failed to add book. Please try again.</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3 style='color:red'>Error occurred while adding book!</h3>");
        }
    }
}
