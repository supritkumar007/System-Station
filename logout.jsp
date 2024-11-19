
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="3;URL=login.html"> <!-- Redirecting to login.html after 3 seconds -->
    <title>Logout Result</title>
</head>
<body>
    <% 
        String confirm = request.getParameter("confirm");
        if (confirm != null && confirm.equals("Yes, Logout")) {
    %>
        <h2>Logout Successful</h2>
        <p>Revisit our site for your Computer Delights</p>
    <% } else { %>
        <% response.sendRedirect("Home.jsp"); %>
    <% } %>
</body>
</html>
