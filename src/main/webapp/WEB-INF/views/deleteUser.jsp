<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete User</title>
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow p-4 col-md-6 offset-md-3">
        <h2 class="text-center mb-4 text-danger">Delete User</h2>

        <form method="post">
            <div class="mb-3">
                <label for="userid" class="form-label">Enter User ID</label>
                <input type="text" id="userid" name="userid" 
                       class="form-control" required>
            </div>
            <button type="submit" class="btn btn-danger w-100">Delete</button>
        </form>

        <%
            String id = request.getParameter("userid");
            if (id != null) {
                Connection con = null;
                PreparedStatement ps = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/report","root","root");

                    String sql = "DELETE FROM users WHERE id = ?";
                    ps = con.prepareStatement(sql);
                    ps.setString(1, id);
                    int rows = ps.executeUpdate();

                    if (rows > 0) {
                        out.println("<div class='alert alert-success mt-3'>User deleted successfully!</div>");
                    } else {
                        out.println("<div class='alert alert-warning mt-3'>No user found with ID " + id + ".</div>");
                    }
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger mt-3'>Error: " + e.getMessage() + "</div>");
                } finally {
                    try { if (ps != null) ps.close(); } catch (Exception e) {}
                    try { if (con != null) con.close(); } catch (Exception e) {}
                }
            }
        %>
    </div>
</div>

</body>
</html>
