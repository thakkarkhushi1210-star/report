<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Student List</h2>

    <div class="mb-3 text-end">
        <a href="AddStudent.jsp" class="btn btn-success">Add New Student</a>
    </div>

    <table class="table table-bordered table-striped table-hover">
        <thead class="table-dark text-center">
        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Department</th>
            <th>Contact</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="student" items="${studentList}">
            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.email}</td>
                <td>${student.department}</td>
                <td>${student.contact}</td>
                <td class="text-center">
                    <a href="editStudent?id=${student.id}" class="btn btn-primary btn-sm">Edit</a>
                    <a href="deleteStudent?id=${student.id}" class="btn btn-danger btn-sm"
                       onclick="return confirm('Are you sure you want to delete this student?');">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>

        <c:if test="${empty studentList}">
            <tr>
                <td colspan="6" class="text-center text-muted">No student records found.</td>
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
