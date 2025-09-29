package servlet;

import dao.UserDAO1;
import dao.userDAO;
import model1.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO1 userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO1();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Step 1: Get user ID from request
        String idParam = request.getParameter("id");
        if (idParam != null) {
            int id = Integer.parseInt(idParam);
            User existingUser = userDAO.getUserById(id);

            // Step 2: Forward user data to editUser.jsp
            request.setAttribute("user", existingUser);
            request.getRequestDispatcher("editUser.jsp").forward(request, response);
        } else {
            response.sendRedirect("ManageUsersServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Step 3: Collect updated data from form
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String mobile = request.getParameter("mobile");
            String role = request.getParameter("role");

            // Step 4: Update user object
            User user = new User();
            user.setId(id);
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            user.setMobile(mobile);
            user.setRole(role);

            // Step 5: Update DB
            boolean updated = userDAO.updateProfile(user);

            if (updated) {
                System.out.println("✅ User updated: " + id);
            } else {
                System.out.println("⚠️ Failed to update user: " + id);
            }

            // Step 6: Redirect to ManageUsersServlet
            response.sendRedirect("ManageUsersServlet");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error updating user", e);
        }
    }
}

