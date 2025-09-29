package servlet;

import dao.UserDAO1;
import model1.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/ManageUsersServlet")
public class ManageUsersServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO1 userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO1(); // make sure UserDAO has DB connection setup
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetch all users from DB
            List<User> usersList = userDAO.getAllUsers();

            // Send list to JSP
            request.setAttribute("usersList", usersList);

            // Forward to manageUsers.jsp
            request.getRequestDispatcher("manageUsers.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error retrieving users", e);
        }
    }
}
