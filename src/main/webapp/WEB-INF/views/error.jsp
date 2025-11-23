<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>404 - Page Not Found</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #f2f2f2;
        }
        .container {
            width: 60%;
            margin: 80px auto;
            background: #fff;
            padding: 40px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            border-left: 6px solid #ff6b6b;
        }
        h1 {
            font-size: 50px;
            color: #ff4d4d;
            margin-bottom: 10px;
        }
        p {
            font-size: 18px;
            color: #333;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 25px;
            background: #007bff;
            color: white;
            border-radius: 5px;
            text-decoration: none;
        }
        a:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>404</h1>
    <p>Oops! The page you are looking for doesn’t exist.</p>

    <% if (exception != null) { %>
        <p><strong>Error:</strong> <%= exception.getMessage() %></p>
    <% } %>

    <a href="index.jsp">Go Back Home</a>
</div>

</body>
</html>
