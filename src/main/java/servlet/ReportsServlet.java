package servlet;

import java.io.IOException;
import java.util.List;

import dao.BookDAO;
import dao.BorrowedBookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model1.Book;
import model1.BorrowedBook;

@WebServlet("/ReportsServlet")
public class ReportsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private BookDAO bookDAO;
    private BorrowedBookDAO borrowedBookDAO;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
        borrowedBookDAO = new BorrowedBookDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetch all available books
            List<Book> allBooks = bookDAO.getAllBooks();

            // Fetch all borrowed books
            List<BorrowedBook> borrowedBooks = borrowedBookDAO.getAllBorrowedBooks();

            // Set attributes for JSP
            request.setAttribute("allBooks", allBooks);
            request.setAttribute("borrowedBooks", borrowedBooks);

            // Forward to JSP
            request.getRequestDispatcher("viewReports.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3 style='color:red'>Error while generating reports!</h3>");
        }
    }
}
