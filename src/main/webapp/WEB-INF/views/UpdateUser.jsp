<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-lg p-4 col-md-6 offset-md-3">
        <h2 class="text-center mb-4 text-primary">Update User Details</h2>

        <%
            String id = request.getParameter("userid");
            String name = "";
            String email = "";
            String password = "";

            if (id != null && request.getParameter("update") == null) {
                // Fetch current user details from DB
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
                    } else {
                        out.println("<div class='alert alert-warning text-center'>User not found.</div>");
                    }
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger text-center'>Error: " + e.getMessage() + "</div>");
                } finally {
                    try { if (rs != null) rs.close(); } catch (Exception e) {}
                    try { if (ps != null) ps.close(); } catch (Exception e) {}
                    try { if (con != null) con.close(); } catch (Exception e) {}
                }
            }
        %>

        <% if (id != null && request.getParameter("update") == null) { %>
        <!-- Display user data for editing -->
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
        <% } %>

        <%
            // Handle form submission for update
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
                        out.println("<div class='alert alert-success mt-3 text-center'>User updated successfully!</div>");
                        out.println("<div class='text-center mt-3'><a href='ListUser.jsp' class='btn btn-primary'>Back to User List</a></div>");
                    } else {
                        out.println("<div class='alert alert-warning mt-3 text-center'>Failed to update user.</div>");
                    }
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger mt-3 text-center'>Error: " + e.getMessage() + "</div>");
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
