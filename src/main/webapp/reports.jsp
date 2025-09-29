<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model1.BorrowedBook" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrowed Books Report</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f4f6f9;
        margin: 0;
        padding: 0;
    }
    h2 {
        text-align: center;
        padding: 20px;
        color: #333;
    }
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background: #fff;
        box-shadow: 0 2px 6px rgba(0,0,0,0.2);
    }
    th, td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    th {
        background: #007BFF;
        color: white;
    }
    tr:hover {
        background: #f1f1f1;
    }
    .back-btn {
        display: block;
        width: 200px;
        margin: 20px auto;
        padding: 10px;
        text-align: center;
        background: #28a745;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
    }
    .back-btn:hover {
        background: #218838;
    }
</style>
</head>
<body>

    <h2>Borrowed Books Report</h2>

    <%
        List<BorrowedBook> reportList = (List<BorrowedBook>) request.getAttribute("reportList");
        if (reportList != null && !reportList.isEmpty()) {
    %>
        <table>
            <tr>
                <th>ID</th>
                <th>User ID</th>
                <th>Book ID</th>
                <th>Book Title</th>
                <th>Borrow Date</th>
            </tr>
            <%
                for (BorrowedBook bb : reportList) {
            %>
            <tr>
                <td><%= bb.getId() %></td>
                <td><%= bb.getUserId() %></td>
                <td><%= bb.getBookId() %></td>
                <td><%= bb.getBookTitle() %></td>
                <td><%= bb.getBorrowDate() %></td>
            </tr>
            <% } %>
        </table>
    <%
        } else {
    %>
        <p style="text-align:center; color:red; font-size:18px;">No borrowed books found!</p>
    <%
        }
    %>

    <a href="ManageBooksServlet" class="back-btn">⬅ Back to Manage Books</a>

</body>
</html>
