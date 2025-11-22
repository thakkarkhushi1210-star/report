<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the current session if it exists
    session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light text-center">

    <div class="container mt-5">
        <div class="card shadow-sm mx-auto" style="max-width: 400px;">
            <div class="card-body">
                <h3 class="card-title text-success mb-3">Logged Out Successfully</h3>
                <p class="card-text">You have been logged out of your session.</p>
                <a href="login.jsp" class="btn btn-primary">Login Again</a>
                <a href="index.jsp" class="btn btn-secondary">Go to Home</a>
            </div>
        </div>
    </div>

</body>
</html>
