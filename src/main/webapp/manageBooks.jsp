<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model1.Book" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .container {
            width: 80%;
            margin: auto;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 30px;
            background: #fff;
            box-shadow: 0px 0px 10px #ddd;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        th {
            background: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background: #f9f9f9;
        }
        .form-box {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px #ddd;
        }
        input[type="text"], input[type="submit"] {
            padding: 10px;
            margin: 5px;
            width: 90%;
        }
        input[type="submit"] {
            background: #28a745;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        input[type="submit"]:hover {
            background: #218838;
        }
        .no-data {
            text-align: center;
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>📚 Manage Books</h2>

    <!-- Book List -->
    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Available</th>
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
            <td colspan="4" class="no-data">⚠️ No books available.</td>
        </tr>
        <% } %>
    </table>

    <!-- Add New Book -->
    <div class="form-box">
        <h3>Add a New Book</h3>
        <form action="AddBookServlet" method="post">
            <input type="text" name="title" placeholder="Enter Book Title" required><br>
            <input type="text" name="author" placeholder="Enter Author" required><br>
            <input type="text" name="available" placeholder="Enter Available Copies" required><br>
            <input type="submit" value="Add Book">
        </form>
    </div>
</div>

</body>
</html>
