<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>sidebar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            overflow-x: hidden;
        }
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            color: white;
            padding-top: 20px;
        }
        .sidebar a {
            color: white;
            padding: 10px 20px;
            display: block;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        .sidebar .logo {
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <div class="logo">
        <i class="bi bi-mortarboard"></i> Report App
<jsp:include page="sidebar.jsp" />        
    </div>
    <a href="Welcome.jsp">🏠 Dashboard</a>
    <a href="FacultyDashboard.jsp">👨‍🏫 Faculty Dashboard</a>
    <a href="StudentDashboard.jsp">🎓 Student Dashboard</a>
    <a href="Reports.jsp">📊 Reports</a>
    <a href="Settings.jsp">⚙️ Settings</a>
    <a href="Logout.jsp">🚪 Logout</a>
</div>

<div class="content">
    <!-- Page-specific content goes here -->
    <h2>Welcome to Report App</h2>
    <p>Select an option from the sidebar.</p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
