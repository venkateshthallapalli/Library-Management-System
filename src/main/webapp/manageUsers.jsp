<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model1.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Users</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 85%;
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
            margin-bottom: 25px;
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
            background-color: #ff6f61;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #ffe6e1;
            transition: 0.3s;
        }

        td {
            color: #444;
        }

        .action-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            margin: 2px;
            transition: 0.3s;
        }

        .edit-btn {
            background-color: #4caf50;
            color: #fff;
        }

        .edit-btn:hover {
            background-color: #388e3c;
        }

        .delete-btn {
            background-color: #f44336;
            color: #fff;
        }

        .delete-btn:hover {
            background-color: #d32f2f;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            font-size: 15px;
            color: #ff6f61;
            font-weight: bold;
            transition: 0.3s;
        }

        .back-link:hover {
            color: #d84315;
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
        <h2>👥 Manage Users</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
            <%
                List<User> users = (List<User>) request.getAttribute("usersList");
                if (users != null && !users.isEmpty()) {
                    for (User u : users) {
            %>
            <tr>
                <td><%= u.getId() %></td>
                <td><%= u.getName() %></td>
                <td><%= u.getEmail() %></td>
                <td><%= u.getMobile() %></td>
                <td><%= u.getRole() %></td>
                <td>
                    <form action="EditUserServlet" method="get" style="display:inline;">
                        <input type="hidden" name="id" value="<%= u.getId() %>">
                        <input type="submit" value="Edit" class="action-btn edit-btn">
                    </form>
                    <form action="DeleteUserServlet" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= u.getId() %>">
                        <input type="submit" value="Delete" class="action-btn delete-btn" 
                               onclick="return confirm('Are you sure you want to delete this user?');">
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="6">⚠️ No users found in the system.</td>
            </tr>
            <% } %>
        </table>

        <a class="back-link" href="adminHome.jsp">⬅ Back to Admin Home</a>
    </div>
</body>
</html>
