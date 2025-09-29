<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: url('images/library-bg.jpg') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 400px;
        margin: 80px auto;
        background-color: rgba(255, 255, 255, 0.95);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 8px 16px rgba(0,0,0,0.3);
        text-align: center;
    }

    h1 {
        color: #4CAF50;
        margin-bottom: 25px;
    }

    input[type=email], input[type=password] {
        width: 90%;
        padding: 12px;
        margin: 8px 0 20px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    input[type=submit] {
        width: 95%;
        background-color: #4CAF50;
        color: white;
        padding: 14px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s, transform 0.2s;
    }

    input[type=submit]:hover {
        background-color: #45a049;
        transform: scale(1.03);
    }

    a {
        text-decoration: none;
        color: #4CAF50;
        font-weight: bold;
    }

    a:hover {
        color: #388E3C;
    }

    .error {
        color: red;
        margin-bottom: 15px;
    }
</style>
</head>
<body>

<div class="container">
    <h1>Library Login</h1>

    <!-- Error message if login fails -->
    <% 
        String error = (String) request.getAttribute("error");
        if (error != null) { 
    %>
        <div class="error"><%= error %></div>
    <% } %>

    <form action="LoginServlet" method="post">
        <label for="email">Email:</label><br>
        <input type="email" name="email" id="email" required><br>

        <label for="password">Password:</label><br>
        <input type="password" name="password" id="password" required><br>

        <input type="submit" value="Login">
    </form>

    <p>New user? <a href="register.jsp">Register here</a></p>
</div>

</body>
</html>
