package servlet;

import java.io.IOException;

import dao.UserDAO1;
import dao.userDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model1.User;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // ✅ Get current user object from session
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        // ✅ Collect updated data from form
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String password = req.getParameter("password");

        // ✅ Update fields
        currentUser.setName(name);
        currentUser.setEmail(email);
        currentUser.setMobile(mobile);
        currentUser.setPassword(password);

        // ✅ DAO call
        UserDAO1 dao = new UserDAO1();
        boolean updated = dao.updateProfile(currentUser);

        if (updated) {
            // ✅ Update session with new user object
            session.setAttribute("currentUser", currentUser);
            resp.sendRedirect("login.jsp");
        } else {
            resp.getWriter().println("❌ Profile update failed!");
        }
    }
}
