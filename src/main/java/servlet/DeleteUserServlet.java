package servlet;

import dao.userDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private userDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new userDAO();  // initialize DAO
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get user ID from request
            String idParam = request.getParameter("id");
            if (idParam != null) {
                int id = Integer.parseInt(idParam);

                // Call DAO to delete user
                boolean deleted = userDAO.deleteUser(id);

                if (deleted) {
                    System.out.println("✅ User deleted with ID: " + id);
                } else {
                    System.out.println("⚠️ Failed to delete user with ID: " + id);
                }
            }

            // Redirect back to ManageUsersServlet to refresh list
            response.sendRedirect("ManageUsersServlet");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error deleting user", e);
        }
    }
}
