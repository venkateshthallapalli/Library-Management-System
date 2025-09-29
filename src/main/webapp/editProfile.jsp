<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model1.User" %>
<%
    // Get user details from session (set during login)
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp"); // Redirect if not logged in
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f0f2f5;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        background: #fff;
        padding: 25px 30px;
        border-radius: 12px;
        box-shadow: 0px 6px 20px rgba(0,0,0,0.15);
        width: 380px;
    }
    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }
    label {
        display: block;
        font-weight: bold;
        margin-top: 12px;
        color: #444;
    }
    input {
        width: 100%;
        padding: 10px;
        margin-top: 6px;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-sizing: border-box;
        font-size: 14px;
    }
    input[type="submit"] {
        background: #007bff;
        color: white;
        border: none;
        cursor: pointer;
        font-weight: bold;
        margin-top: 18px;
    }
    input[type="submit"]:hover {
        background: #0056b3;
    }
    a {
        display: block;
        margin-top: 15px;
        text-align: center;
        text-decoration: none;
        color: #007bff; 
        font-size: 14px;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Edit Profile</h2>
        <form action="EditProfileServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" name="name" value="<%= user.getName() %>" required>

            <label for="email">Email:</label>
            <input type="email" name="email" value="<%= user.getEmail() %>" required>

            <label for="password">Password:</label>
            <input type="password" name="password" value="<%= user.getPassword() %>" required>

            <label for="mobile">Mobile:</label>
            <input type="text" name="mobile" value="<%= user.getMobile() %>" required>

            <label for="role">Role:</label>
            <input type="text" name="role" value="<%= user.getRole() %>" readonly>

            <input type="submit" value="Update Profile">
        </form>
        <a href="memberHome.jsp">⬅ Back to Home</a>
    </div>
</body>
</html>
