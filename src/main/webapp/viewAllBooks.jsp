<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model1.Book" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Books</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
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
            border-collapse: collapse;
            width: 100%;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            font-size: 15px;
        }

        th {
            background-color: #6c63ff;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #e6e6ff;
            transition: 0.3s;
        }

        td {
            color: #444;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            font-size: 15px;
            color: #6c63ff;
            font-weight: bold;
            transition: 0.3s;
        }

        .back-link:hover {
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
    <form action="ViewBooksServlet" method="get">
        <h2>📚 List of All Books</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Available Copies</th>
            </tr>
            <%
                List<Book> books = (List<Book>) request.getAttribute("bookList");
                if (books != null && !books.isEmpty()) {
                    for (Book b : books) {
            %>
            <tr>
                <td><%= b.getId() %></td>
                <td><%= b.getTitle() %></td>
                <td><%= b.getAuthor() %></td>
                <td><%= b.getAvailable() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4">⚠️ No books found in the library.</td>
            </tr>
            <% } %>
        </table>
        </form>

        <a class="back-link" href="memberHome.jsp">⬅ Back to Home</a>
    </div>
</body>
</html>
