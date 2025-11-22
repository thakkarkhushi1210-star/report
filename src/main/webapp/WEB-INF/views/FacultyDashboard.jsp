<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Faculty Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            background-color: #0d6efd;
            color: white;
            padding-top: 20px;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 12px 20px;
        }
        .sidebar a:hover {
            background-color: #084298;
        }
        .content {
            padding: 20px;
        }
        .navbar-brand {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <!-- Top Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Faculty Dashboard</a>
            <div class="d-flex">
                <span class="text-white me-3">
                    Welcome, <c:out value="${faculty.name}" />
                </span>
                <a href="logout" class="btn btn-light btn-sm">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Main Layout -->
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 sidebar">
                <h5 class="text-center">Menu</h5>
                <hr style="border-color: rgba(255,255,255,0.3);">
                <a href="viewStudents">View Students</a>
                <a href="uploadReport">Upload Reports</a>
                <a href="viewReports">View Submitted Reports</a>
                <a href="profile">My Profile</a>
                <a href="settings">Settings</a>
                 <a href="logout">Logout</a>
                
            </div>

            <!-- Content -->
            <div class="col-md-9 col-lg-10 content">
                <h3>Dashboard Overview</h3>
                <p class="text-muted">Here you can manage reports, view student submissions, and update your profile.</p>

                <div class="row g-3">
                    <div class="col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-body text-center">
                                <h5 class="card-title">Total Students</h5>
                                <h2><c:out value="${studentCount}" /></h2>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-body text-center">
                                <h5 class="card-title">Reports Submitted</h5>
                                <h2><c:out value="${reportCount}" /></h2>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-body text-center">
                                <h5 class="card-title">Pending Reviews</h5>
                                <h2><c:out value="${pendingCount}" /></h2>
                            </div>
                        </div>
                    </div>
                </div>

                <hr class="my-4">

                <h4>Recent Student Reports</h4>
                <table class="table table-striped table-bordered">
                    <thead class="table-primary">
                        <tr>
                            <th>Student Name</th>
                            <th>Report Title</th>
                            <th>Date Submitted</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="report" items="${recentReports}">
                            <tr>
                                <td><c:out value="${report.studentName}" /></td>
                                <td><c:out value="${report.title}" /></td>
                                <td><c:out value="${report.date}" /></td>
                                <td><c:out value="${report.status}" /></td>
                                <td>
                                    <a href="viewReportDetails?id=${report.id}" class="btn btn-sm btn-outline-primary">View</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
