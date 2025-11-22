<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow p-4 col-md-6 offset-md-3">
        <h2 class="text-center mb-4 text-primary">Edit User</h2>

        <!-- Step 1: Search User -->
        <form method="get" class="mb-4">
            <div class="input-group">
                <input type="text" name="userid" class="form-control" placeholder="Enter User ID" required>
                <button class="btn btn-primary" type="submit">Search</button>
            </div>
        </form>

        <%
            String id = request.getParameter("userid");
            String name = "";
            String email = "";
            String password = "";

            if (id != null && request.getParameter("update") == null) {
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/report", "root", "root");

                    ps = con.prepareStatement("SELECT * FROM users WHERE id=?");
                    ps.setString(1, id);
                    rs = ps.executeQuery();
                    if (rs.next()) {
                        name = rs.getString("name");
                        email = rs.getString("email");
                        password = rs.getString("password");
        %>

        <!-- Step 2: Display User Details for Editing -->
        <form method="post">
            <input type="hidden" name="userid" value="<%= id %>">
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" name="name" class="form-control" value="<%= name %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" value="<%= email %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="text" name="password" class="form-control" value="<%= password %>" required>
            </div>
            <button type="submit" name="update" value="true" class="btn btn-success w-100">Update</button>
        </form>

        <%
                    } else {
                        out.println("<div class='alert alert-warning mt-3'>No user found with ID " + id + ".</div>");
                    }
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger mt-3'>Error: " + e.getMessage() + "</div>");
                } finally {
                    try { if (rs != null) rs.close(); } catch (Exception e) {}
                    try { if (ps != null) ps.close(); } catch (Exception e) {}
                    try { if (con != null) con.close(); } catch (Exception e) {}
                }
            }

            // Step 3: Update user details
            if (request.getParameter("update") != null) {
                id = request.getParameter("userid");
                name = request.getParameter("name");
                email = request.getParameter("email");
                password = request.getParameter("password");

                Connection con = null;
                PreparedStatement ps = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/report", "root", "root");
                    ps = con.prepareStatement("UPDATE users SET name=?, email=?, password=? WHERE id=?");
                    ps.setString(1, name);
                    ps.setString(2, email);
                    ps.setString(3, password);
                    ps.setString(4, id);
                    int rows = ps.executeUpdate();
                    if (rows > 0) {
                        out.println("<div class='alert alert-success mt-3'>User updated successfully!</div>");
                    } else {
                        out.println("<div class='alert alert-warning mt-3'>Failed to update user.</div>");
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
