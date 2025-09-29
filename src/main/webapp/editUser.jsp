<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="model1.User" %>
<%
    User user = (User) request.getAttribute("user");
    if (user == null) {
%>
    <p style="color:red;">No user found to edit!</p>
    <a href="ManageUsersServlet">⬅ Back to Manage Users</a>
<%
    return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            background: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            width: 300px;
        }
        input, select {
            width: 100%;
            margin: 5px 0;
            padding: 6px;
        }
        button {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
    <h2>Edit User</h2>
    <form action="EditUserServlet" method="post">
        <input type="hidden" name="id" value="<%= user.getId() %>">

        <p>Name:</p>
        <input type="text" name="name" value="<%= user.getName() %>" required>

        <p>Email:</p>
        <input type="email" name="email" value="<%= user.getEmail() %>" required>

        <p>Password:</p>
        <input type="password" name="password" value="<%= user.getPassword() %>" required>

        <p>Mobile:</p>
        <input type="text" name="mobile" value="<%= user.getMobile() %>" required>

        <p>Role:</p>
        <select name="role">
            <option value="admin" <%= "admin".equals(user.getRole()) ? "selected" : "" %>>Admin</option>
            <option value="user" <%= "user".equals(user.getRole()) ? "selected" : "" %>>User</option>
        </select>

        <br><br>
        <button type="submit">Update</button>
    </form>

    <br>
    <a href="ManageUsersServlet">⬅ Back to Manage Users</a>
</body>
</html>
