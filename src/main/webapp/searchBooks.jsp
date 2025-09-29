<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model1.Book" %>
<%
    // If servlet forwarded search results, fetch them
    List<Book> books = (List<Book>) request.getAttribute("bookList");
    String keyword = request.getParameter("keyword") != null ? request.getParameter("keyword") : "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Books</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f0f2f5;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        margin: 50px auto;
        background: #fff;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0px 6px 20px rgba(0,0,0,0.15);
    }
    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }
    form {
        text-align: center;
        margin-bottom: 25px;
    }
    input[type="text"] {
        padding: 10px;
        width: 250px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 14px;
    }
    input[type="submit"] {
        padding: 10px 20px;
        margin-left: 10px;
        border: none;
        border-radius: 8px;
        background: #007bff;
        color: #fff;
        cursor: pointer;
        font-weight: bold;
    }
    input[type="submit"]:hover {
        background: #0056b3;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        padding: 12px;
        border: 1px solid #ddd;
        text-align: center;
    }
    th {
        background: #007bff;
        color: #fff;
    }
    tr:nth-child(even) {
        background: #f9f9f9;
    }
    .no-result {
        text-align: center;
        margin-top: 20px;
        font-size: 16px;
        color: red;
    }
    a {
        display: inline-block;
        margin-top: 20px;
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Search Books</h2>
        
        <!-- Search Form -->
        <form action="SearchBookServlet" method="get">
            <input type="text" name="keyword" value="<%= keyword %>" placeholder="Enter book title or author..." required>
            <input type="submit" value="Search">
        </form>

        <!-- Results -->
        <%
            if (books != null) {
                if (books.isEmpty()) {
        %>
                    <div class="no-result">No books found for "<%= keyword %>"</div>
        <%
                } else {
        %>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Availability</th>
                        </tr>
                        <%
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
                        %>
                    </table>
        <%
                }
            }
        %>

        <a href="memberHome.jsp">⬅ Back to Home</a>
    </div>
</body>
</html>
