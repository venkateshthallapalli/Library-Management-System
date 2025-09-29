<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: url('images/library-bg.jpg') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 450px;
        margin: 60px auto;
        background-color: rgba(255, 255, 255, 0.95);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 8px 16px rgba(0,0,0,0.3);
        text-align: center;
    }

    h2 {
        color: #4CAF50;
        margin-bottom: 25px;
    }

    input[type=text], input[type=email], input[type=password] {
        width: 90%;
        padding: 12px;
        margin: 8px 0 20px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
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
        font-weight: bold;
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
    <h2>Library Registration</h2>

    <!-- Error message display -->
    <% 
        String error = (String) request.getAttribute("error");
        if (error != null) { 
    %>
        <div class="error"><%= error %></div>
    <% } %>

    <form action="RegisterServlet" method="post">
        <label>Name:</label><br>
        <input type="text" name="name" required><br>

        <label>Email:</label><br>
        <input type="email" name="email" required><br>

        <label>Password:</label><br>
        <input type="password" name="password" required><br>

        <label>Mobile:</label><br>
        <input type="text" name="mobile" pattern="[0-9]{10}" title="Enter 10 digit mobile number" required><br>

        <label>Role:</label><br>
        <input type="text" name="role" ><br>

        <input type="submit" value="Register">
    </form>

    <p>Already registered? <a href="login.jsp">Login here</a></p>
</div>

</body>
</html>
