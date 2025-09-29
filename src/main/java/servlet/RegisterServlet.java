package servlet;

import model1.User;

import java.io.IOException;
import dao.userDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String mobile = req.getParameter("mobile");
        String role=req.getParameter("role");

        User u = new User(0, name, email, password, mobile,role);
 
        userDAO dao = new userDAO();
        if (dao.registerUser1(u)) {
        	//se.setAttribute("student", s);
            resp.sendRedirect("login.jsp");
        } else {
            resp.getWriter().println("Registration failed!");
        }
	}
}