<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>ForumApp - Home</title>
    <style>
        /* Existing styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }

        body {
            background-color: #121212;
            color: #E0E0E0;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0;
            padding: 20px;
        }

        a {
            color: #BB86FC;
            text-decoration: none;
        }

        a:hover,
        a:focus {
            text-decoration: underline;
        }

        /* Navbar styles */
        .navbar {
            width: 100%;
            background-color: #333;
            padding: 10px 0;
            margin-bottom: 20px;
        }

        .navbar ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .navbar li {
            padding: 8px 16px;
        }

        .navbar a {
            transition: color 0.3s ease;
        }

        .navbar a:hover {
            color: #9e77c9;
        }

        /* Create Post Button */
        input[type="button"] {
            margin-bottom: 20px;
            padding: 10px 15px;
            background-color: #BB86FC;
            border: none;
            border-radius: 5px;
            color: #121212;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        input[type="button"]:hover {
            background-color: #9e77c9;
        }

        /* Posts Section */
        .posts {
            width: 100%;
            max-width: 800px;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .post {
            background-color: #333333;
            padding: 15px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            cursor: pointer;
        }

        .post:hover {
            background-color: #424242;
        }

        .post h2 {
            color: #BB86FC;
        }

        .post p {
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <ul>
   			<form action="home.html" method="post">
   			<li><input type="submit" value="home"></li>
   			</form>
   			<form action="login.html" method="post">
   			<li><input type="submit" value="signout"></li>
   			</form>
   			
            
        </ul>
    </nav>

   



    <div class="posts">
        <%
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/vathsav";
            String user = "root";
            String password = "tiger";

            try {
                Class.forName("com.mysql.jdbc.Driver");

                Connection con = DriverManager.getConnection(url, user, password);

                Statement stmt = con.createStatement();

                String sql = "SELECT post_id, description, timestamp, username FROM posts ORDER BY timestamp DESC";
                ResultSet rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    String postId = rs.getString("post_id");
                    Timestamp timestamp = rs.getTimestamp("timestamp");
                    String username = rs.getString("username");
                    String description = rs.getString("description");

                    out.println("<div class='post' onclick=\"location.href='postDetail.jsp?post_id="+ postId +"';\">");
                    out.println("<p>Author: " + username + "</p>");
                    out.println("<p>Author: " + description + "</p>");
                    out.println("<p>" + timestamp + "</p>");
                    out.println("</div>");
                }

                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</body>
</html>
