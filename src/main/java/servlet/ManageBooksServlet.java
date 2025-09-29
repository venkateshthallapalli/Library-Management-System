package servlet;

import java.io.IOException;
import java.util.List;

import dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model1.Book;

@WebServlet("/ManageBooksServlet")
public class ManageBooksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookDAO bookDAO;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch all books from database
        List<Book> allBooks = bookDAO.getAllBooks();

        // Set them as a request attribute
        request.setAttribute("bookList", allBooks);

        // Forward to manageBooks.jsp
        request.getRequestDispatcher("manageBooks.jsp").forward(request, response);
    }
}
