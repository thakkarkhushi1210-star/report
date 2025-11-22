<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Faculty List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Faculty List</h2>

    <div class="mb-3 text-end">
        <a href="AddFaculty.jsp" class="btn btn-success">Add New Faculty</a>
    </div>

    <table class="table table-bordered table-striped table-hover">
        <thead class="table-dark text-center">
            <tr>
                <th>Faculty ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Department</th>
                <th>Contact</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="faculty" items="${facultyList}">
            <tr>
                <td>${faculty.id}</td>
                <td>${faculty.name}</td>
                <td>${faculty.email}</td>
                <td>${faculty.department}</td>
                <td>${faculty.contact}</td>
                <td class="text-center">
                    <a href="editFaculty?id=${faculty.id}" class="btn btn-primary btn-sm">Edit</a>
                    <a href="deleteFaculty?id=${faculty.id}" class="btn btn-danger btn-sm"
                       onclick="return confirm('Are you sure you want to delete this faculty?');">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>

        <c:if test="${empty facultyList}">
            <tr>
                <td colspan="6" class="text-center text-muted">No faculty records found.</td>
            </tr>
        </c:if>
        </tbody>
    </table>

    <div class="text-center mt-4">
        <a href="FacultyDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
