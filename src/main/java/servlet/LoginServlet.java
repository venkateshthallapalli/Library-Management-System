package servlet;

import java.io.IOException;

import model1.User;
import dao.userDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException {
		String email = req.getParameter("email");
        String password = req.getParameter("password");

         userDAO dao = new userDAO();
         model1.User user1 = dao.login(email, password);

        if (user1 != null) {
            HttpSession session = req.getSession();
            session.setAttribute("currentUser", user1);
            session.setAttribute("userId", user1.getId());
            session.setAttribute("userName", user1.getName());
            session.setAttribute("userEmail", user1.getEmail());
            session.setAttribute("userPassword", user1.getPassword());
            session.setAttribute("userMobile", user1.getMobile());
            session.setAttribute("role", user1.getRole());

            if (user1.getRole().equals("admin")) {
                resp.sendRedirect("adminHome.jsp");
            } else {
                resp.sendRedirect("memberHome.jsp");
            }
            
        } else {
        	req.setAttribute("error", "Invalid credentials! Please try again.");
        	req.getRequestDispatcher("login.jsp").forward(req, resp);
        }

	}
}
