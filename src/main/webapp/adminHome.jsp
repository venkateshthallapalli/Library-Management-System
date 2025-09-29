<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: url('images/library-bg.jpg') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
    }

    header {
        background-color: rgba(0, 0, 0, 0.7);
        color: #fff;
        text-align: center;
        padding: 50px 0;
        font-size: 36px;
        font-weight: bold;
        text-shadow: 2px 2px 5px #000;
    }

    .welcome {
        text-align: center;
        margin: 30px 0;
        font-size: 22px;
        color: #fff;
    }

    .nav-links {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin: 40px auto;
        max-width: 900px;
    }

    .nav-links a {
        display: flex;
        align-items: center;
        justify-content: center;
        text-decoration: none;
        color: #fff;
        background-color: #4CAF50;
        padding: 15px 25px;
        border-radius: 10px;
        font-size: 18px;
        font-weight: bold;
        transition: background-color 0.3s, transform 0.2s;
        width: 200px;
        text-align: center;
    }

    .nav-links a img {
        height: 24px;
        width: 24px;
        margin-right: 10px;
    }

    .nav-links a:hover {
        background-color: #45a049;
        transform: scale(1.05);
    }

    footer {
        text-align: center;
        padding: 15px 0;
        background-color: rgba(0,0,0,0.7);
        color: white;
        position: fixed;
        bottom: 0;
        width: 100%;
    }
</style>
</head>
<body>

<header>Library Admin Panel</header>

<div class="welcome">
    Welcome, <%= session.getAttribute("userName") %>!
</div>

<div class="nav-links">
    <a href="manageUsers.jsp"><img src="https://tse1.mm.bing.net/th/id/OIP.9_MptOLxjJEGSGukPt9FWQHaHa?pid=Api&rs=1&c=1&qlt=95&w=117&h=117" alt="Users">Manage Users</a>
    <a href="manageBooks.jsp"><img src="https://tse1.mm.bing.net/th/id/OIP.uhNG7mz3CMNMkLcitU63JgHaLA?pid=Api&rs=1&c=1&qlt=95&w=80&h=119" alt="Books">Manage Books</a>
    <a href="reports.jsp"><img src="https://tse1.mm.bing.net/th/id/OIP.GKjMJqMYSFjXtnpzDYCOVQHaHa?pid=Api&rs=1&c=1&qlt=95&w=104&h=104" alt="Reports">View Reports</a>
    <a href="borrowRequests.jsp"><img src="https://tse1.mm.bing.net/th/id/OIP.yR_7V46hswfYcbWlKU-jkAHaHa?pid=Api&rs=1&c=1&qlt=95&w=121&h=121" alt="Borrow">Borrow Requests</a>
    <a href="LogoutServlet"><img src="https://tse1.mm.bing.net/th/id/OIP.qxMUTNS7hBjrowtLGS8Y9gHaHP?pid=Api&rs=1&c=1&qlt=95&w=123&h=121" alt="Logout">Logout</a>
</div>
<div><center>
    <img  src="https://images.pexels.com/photos/256541/pexels-photo-256541.jpeg?auto=compress&cs=tinysrgb&h=650&w=940">
    </center>
    </div>

<footer>
    &copy; 2025 Library Management System. All rights reserved.
</footer>

</body>
</html>
