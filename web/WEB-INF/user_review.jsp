<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - <% String uname = request.getParameter("profile_uname");
            out.print(uname);%></title>
        <link rel="stylesheet" href="./css/homepage.css">
        <link rel="stylesheet" href="./css/user_review.css">
    </head>
    <body>        
        <div class="header">
            <a class="logo" href="homepage">
                <img alt="homepage" title="biddit" src="./img/logo/logo_350x150.png">
            </a>
            <div class="welcome_box">
                User Administrator Page
            </div>
            <div class="icon_list">
                <a href="LogoutServlet"><img  id="exit_icon" src="./img/icons/exit_icon_v2.png"  alt="Sign Out" title="Sign Out"></a>
            </div>
        </div>
        <div class="main_body">
            <div class="row">
                <div class="column">
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/MyEbayDB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "king", "");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from Users where uname='" + uname + "'");
                        rs.next();
                    %>
                    <table>
                        <tr>
                            <th><h1><%=rs.getString("uname")%> </h1></th>
                        </tr>
                        <tr>
                            <th>Name: </th>
                            <td> <%=rs.getString("fname") + " " + rs.getString("lname")%> </td>
                        </tr>
                        <tr>
                            <th>Email: </th>
                            <td> <%=rs.getString("email")%> </td>
                        </tr>
                        <tr>
                            <th>Phone: </th>
                            <td> <%=rs.getString("phone")%> </td>
                        </tr>
                        <tr>
                            <th>Address: </th>
                            <td> <%=rs.getString("address")%> </td>
                        </tr>
                        <tr>
                            <th>TIN: </th>
                            <td> <%=rs.getString("tin")%> </td>
                        </tr>
                        <%
                            rs.close();
                        %>
                    </table>
                </div>
                <div class="column" id="bid">
                    <h1>Bought items</h1> <br> <br> <br> <br>
                    <h1>Sold items</h1>
                </div>
            </div>
        </div>
    </body>
</html>
