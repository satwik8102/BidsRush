<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Profile</title>
    <link rel="stylesheet" href="./css/homepage.css">
    <link rel="stylesheet" href="./css/user_profile.css"> <!-- Ensure you have this CSS file for styling -->
    <link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="./img/favicon.ico" type="image/x-icon">
    <script>
            $(function () {
                $("#header").load("./jsp/header.jsp");
            });
            <% session.removeAttribute("active_tab"); %>
             
        </script>
</head>
<body>
    <div class="header" style="height: auto;">
        <a class="logo" href="homepage.jsp">
            <img alt="homepage" title="biddit" src="./img/logo/logo_350x150.png">
        </a>
        <div class="welcome_box">
            User Profile Page
        </div>
        <div class="icon_list">
            <a href="LogoutServlet"><img  id="exit_icon" src="./img/icons/exit_icon_v2.png"  alt="Sign Out" title="Sign Out"></a>
        </div>
    </div>  
    <div id="header"> </div>
    <div class="center-container">
    <div class="main_body">
        <% 
    // Removed the explicit session declaration
    String loggedUser = (String) session.getAttribute("user"); // Use the implicit 'session' object
    if(loggedUser == null) {
        // Not logged in, redirect to login page
        response.sendRedirect("login.jsp");
    } else {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost/MyEbayDB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "MySQL1234")) {
                PreparedStatement ps = con.prepareStatement("SELECT * FROM Users WHERE uname = ?");
                ps.setString(1, loggedUser);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
%>

<div class="profile-container">
    <div class="user-details">
        <h2>User Profile</h2>
        <!-- User Details -->
        <div class="detail">
            <span class="label">Username:</span>
            <span class="value"><%= rs.getString("uname") %></span>
        </div>
        <div class="detail">
            <span class="label">First Name:</span>
            <span class="value"><%= rs.getString("fname") %></span>
        </div>
        <div class="detail">
            <span class="label">Last Name:</span>
            <span class="value"><%= rs.getString("lname") %></span>
        </div>
        <div class="detail">
            <span class="label">Email:</span>
            <span class="value"><%= rs.getString("email") %></span>
        </div>
        <div class="detail">
            <span class="label">Phone:</span>
            <span class="value"><%= rs.getString("phone") %></span>
        </div>
        <div class="detail">
            <span class="label">Address:</span>
            <span class="value"><%= rs.getString("address") %></span>
        </div>
        <div class="detail">
            <span class="label">TIN:</span>
            <span class="value"><%= rs.getString("tin") %></span>
        </div>
    </div>
</div>
</div>
    </div>

<%
                }
                rs.close();
            } // try-with-resources will auto close Connection
        } catch (Exception e) {
            e.printStackTrace(); // Log or handle the exception
        }
    }
%>

    </div>
</body>
</html>