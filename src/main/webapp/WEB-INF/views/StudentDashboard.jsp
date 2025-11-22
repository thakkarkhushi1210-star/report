<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            background-color: #198754;
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
            background-color: #146c43;
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
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Student Dashboard</a>
            <div class="d-flex">
                <span class="text-white me-3">
                    Welcome, <c:out value="${student.name}" />
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
                <a href="uploadReport">Upload Report</a>
                <a href="viewMyReports">View My Reports</a>
                <a href="facultyFeedback">Faculty Feedback</a>
                <a href="profile">My Profile</a>
                <a href="settings">Settings</a>
                <a href="logout">Logout</a>
            </div>

            <!-- Content -->
            <div class="col-md-9 col-lg-10 content">
                <h3>Dashboard Overview</h3>
                <p class="text-muted">Here you can upload your project reports, track their status, and view faculty feedback.</p>

                <div class="row g-3">
                    <div class="col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-body text-center">
                                <h5 class="card-title">Reports Submitted</h5>
                                <h2><c:out value="${submittedCount}" /></h2>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-body text-center">
                                <h5 class="card-title">Reports Approved</h5>
                                <h2><c:out value="${approvedCount}" /></h2>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-body text-center">
                                <h5 class="card-title">Pending Reports</h5>
                                <h2><c:out value="${pendingCount}" /></h2>
                            </div>
                        </div>
                    </div>
                </div>

                <hr class="my-4">

                <h4>Recent Submissions</h4>
                <table class="table table-striped table-bordered">
                    <thead class="table-success">
                        <tr>
                            <th>Report Title</th>
                            <th>Date Submitted</th>
                            <th>Status</th>
                            <th>Feedback</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="report" items="${myReports}">
                            <tr>
                                <td><c:out value="${report.title}" /></td>
                                <td><c:out value="${report.date}" /></td>
                                <td><c:out value="${report.status}" /></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty report.feedback}">
                                            <span class="text-success">Given</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="text-muted">Pending</span>
                                        </c:otherwise>
                                    </c:choose>
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
