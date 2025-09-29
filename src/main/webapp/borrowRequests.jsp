<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrow Book Request</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #74ebd5, #9face6);
        margin: 0;
        padding: 0;
    }

    .container {
        width: 450px;
        margin: 80px auto;
        background: #fff;
        padding: 25px 30px;
        border-radius: 15px;
        box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
        animation: fadeIn 1s ease-in-out;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
    }

    td {
        padding: 10px;
        font-size: 15px;
        color: #444;
    }

    input[type="text"], input[type="date"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #bbb;
        border-radius: 8px;
        outline: none;
        transition: 0.3s;
    }

    input[type="text"]:focus, input[type="date"]:focus {
        border-color: #6c63ff;
        box-shadow: 0 0 8px rgba(108, 99, 255, 0.4);
    }

    input[type="submit"] {
        background: #6c63ff;
        color: #fff;
        border: none;
        padding: 12px 20px;
        border-radius: 8px;
        cursor: pointer;
        font-size: 16px;
        width: 100%;
        margin-top: 10px;
        transition: 0.3s;
    }

    input[type="submit"]:hover {
        background: #4b47d1;
        box-shadow: 0 4px 12px rgba(0,0,0,0.2);
    }

    a {
        display: block;
        text-align: center;
        margin-top: 15px;
        text-decoration: none;
        font-size: 15px;
        color: #6c63ff;
        font-weight: bold;
        transition: 0.3s;
    }

    a:hover {
        color: #4b47d1;
        text-decoration: underline;
    }

    @keyframes fadeIn {
        from {opacity: 0; transform: translateY(-20px);}
        to {opacity: 1; transform: translateY(0);}
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Borrow a Book</h2>

        <form action="BorrowServlet" method="post">
            <table>
                <tr>
                    <td>Book ID:</td>
                    <td><input type="text" name="bookId" required></td>
                </tr>
                <tr>
                    <td>User ID:</td>
                    <td><input type="text" name="userId" required></td>
                </tr>
                <tr>
                    <td>Borrow Date:</td>
                    <td><input type="date" name="borrowDate" required></td>
                </tr>
                <tr>
                    <td>Return Date:</td>
                    <td><input type="date" name="returnDate" required></td>
                </tr>
            </table>
            <input type="submit" value="Request Borrow">
        </form>

        <a href="memberHome.jsp">⬅ Back to All Books</a>
    </div>
</body>
</html>
