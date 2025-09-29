<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Home</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
    }

    /* Header with image */
    header {
        background: url('images/library-header.jpg') no-repeat center center;
        background-size: cover;
        color: white;
        padding: 60px 0;
        text-align: center;
        font-size: 36px;
        font-weight: bold;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.7);
    }

    /* Welcome section */
    .welcome {
        text-align: center;
        margin: 30px 0;
        font-size: 22px;
        color: #333;
    }

    /* Navigation links with icons */
    .nav-links {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 20px;
        margin-bottom: 40px;
    }

    .nav-links a {
        display: flex;
        align-items: center;
        text-decoration: none;
        color: #fff;
        background-color: #4CAF50;
        padding: 12px 20px;
        border-radius: 8px;
        transition: background-color 0.3s, transform 0.2s;
        font-weight: bold;
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
        background-color: #333;
        color: white;
        position: fixed;
        bottom: 0;
        width: 100%;
    }
</style>
</head>
<body>
    <header>Welcome to the Library</header>

    <div class="welcome">
        Hello, <%= session.getAttribute("userName") %>! Explore your library.
    </div>

    <div class="nav-links">
        <a href="editProfile.jsp"><img src="https://tse1.mm.bing.net/th/id/OIP.pKOEFNAdqFCKdkTiznkgJQHaHa?pid=Api&rs=1&c=1&qlt=95&w=121&h=121" alt="Profile">Edit Profile</a>
        <a href="searchBooks.jsp"><img src="https://tse1.mm.bing.net/th/id/OIP.vyhkMafwzVBCCSsgGJfI4wHaHa?pid=Api&rs=1&c=1&qlt=95&w=116&h=116" alt="Search">Search Books</a>
        <a href="viewAllBooks.jsp"><img src="https://tse1.mm.bing.net/th/id/OIP.uhNG7mz3CMNMkLcitU63JgHaLA?pid=Api&rs=1&c=1&qlt=95&w=80&h=119" alt="Books">View All Books</a>
        <a href="borrowRequests.jsp"><img src="https://tse2.mm.bing.net/th/id/OIP.yR_7V46hswfYcbWlKU-jkAHaHa?pid=Api&P=0&h=180" alt="Borrowed">My Borrowed Books</a>
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
