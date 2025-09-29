<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f0f8ff;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        background: #fff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0px 0px 10px rgba(0,0,0,0.3);
        text-align: center;
        width: 400px;
    }
    h1 {
        color: green;
    }
    a {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        background: green;
        color: white;
        text-decoration: none;
        border-radius: 6px;
    }
    a:hover {
        background: darkgreen;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>✅ Operation Successful!</h1>
        <p>
            <% 
                String userName = (String) session.getAttribute("username"); 
                if(userName != null) {
            %>
                Welcome, <b><%= userName %></b> 🎉
            <% } else { %>
                Your action was completed successfully.
            <% } %>
        </p>
        <a href="memberHome.jsp">Go to Home</a>
    </div>
</body>
</html>
