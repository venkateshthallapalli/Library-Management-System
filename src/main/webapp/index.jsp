<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Library Management System</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        background: #fff;
        padding: 40px;
        border-radius: 15px;
        text-align: center;
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        width: 400px;
    }

    h1 {
        margin-bottom: 30px;
        color: #333;
    }

    a {
        display: inline-block;
        margin: 10px;
        padding: 12px 25px;
        text-decoration: none;
        color: white;
        background: #4CAF50;
        border-radius: 8px;
        transition: all 0.3s ease;
        font-weight: bold;
    }

    a:hover {
        background: #45a049;
        transform: scale(1.05);
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Library Management System</h1>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
    </div>
</body>
</html>
