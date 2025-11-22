<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container">
  <div class="row justify-content-center mt-5">
    <div class="col-md-5">
      <div class="card shadow-sm">
        <div class="card-body">
          <h3 class="text-center mb-4">Login</h3>

          <!-- Display message (success/error) -->
          <c:if test="${not empty message}">
            <div class="alert alert-info">${message}</div>
          </c:if>

          <form method="post" action="LoginServlet" novalidate>

            <div class="mb-3">
              <label for="username" class="form-label">Username or Email</label>
              <input type="text" class="form-control" id="username" name="username" value="${param.username}" required>
            </div>

            <div class="mb-3">
              <label for="password" class="form-label">Password</label>
              <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <div class="mb-3 form-check">
              <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
              <label class="form-check-label" for="rememberMe">Remember me</label>
            </div>

            <div class="d-grid gap-2">
              <button type="submit" class="btn btn-primary">Login</button>
            </div>

            <div class="text-center mt-3">
              <small>Don’t have an account? <a href="signup.jsp">Sign up</a></small>
            </div>

          </form>
        </div>
      </div>

      <p class="text-muted text-center mt-3 small">
        Ensure your <strong>LoginServlet</strong> validates credentials, checks user roles, creates a session, and redirects users (e.g., to StudentDashboard.jsp or FacultyDashboard.jsp).
      </p>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Optional validation -->
<script>
  (function () {
    'use strict'
    var forms = document.querySelectorAll('form')
    Array.prototype.slice.call(forms).forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }
        form.classList.add('was-validated')
      }, false)
    })
  })()
</script>

</body>
</html>
