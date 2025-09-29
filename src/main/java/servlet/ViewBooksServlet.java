package servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model1.Book;


@WebServlet("/ViewBooksServlet")
public class ViewBooksServlet extends HttpServlet {
    private BookDAO bookDAO;

    public void init() {
        bookDAO = new BookDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Book> books = bookDAO.getAllBooks(); 
        Iterator<Book> itr = books.iterator();
        while (itr.hasNext()) {
            Book b = itr.next();
            System.out.println("Book from Servlet: " + b.getTitle());
        }
        request.setAttribute("bookList", books);
        request.getRequestDispatcher("viewAllBooks.jsp").forward(request, response);
    }
}

