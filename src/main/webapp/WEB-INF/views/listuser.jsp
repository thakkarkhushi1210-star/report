<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>List of Users</title>
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-lg p-4">
        <h2 class="text-center mb-4 text-primary">List of Registered Users</h2>

        <table class="table table-bordered table-hover align-middle">
            <thead class="table-dark text-center">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/report", "root", "root");

                    ps = con.prepareStatement("SELECT * FROM users");
                    rs = ps.executeQuery();

                    boolean hasData = false;
                    while (rs.next()) {
                        hasData = true;
            %>
                        <tr>
                            <td class="text-center"><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("password") %></td>
                            <td class="text-center">
                                <a href="EditUser.jsp?userid=<%= rs.getInt("id") %>" class="btn btn-sm btn-warning me-1">Edit</a>
                                <a href="DeleteUser.jsp?userid=<%= rs.getInt("id") %>" class="btn btn-sm btn-danger">Delete</a>
                            </td>
                        </tr>
            <%
                    }
                    if (!hasData) {
            %>
                        <tr>
                            <td colspan="5" class="text-center text-muted">No users found.</td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='5' class='text-danger text-center'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    try { if (rs != null) rs.close(); } catch (Exception e) {}
                    try { if (ps != null) ps.close(); } catch (Exception e) {}
                    try { if (con != null) con.close(); } catch (Exception e) {}
                }
            %>
            </tbody>
        </table>

        <div class="text-center mt-3">
            <a href="AddUser.jsp" class="btn btn-success me-2">Add New User</a>
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>
</div>

</body>
</html>
