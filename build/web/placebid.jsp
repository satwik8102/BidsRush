<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" charset=ISO-8859-1">
        <title>Edit bids</title>
        <%@ page import ="java.sql.*" %>
        <%@ page import ="javax.sql.*" %>
        <%@ page import ="java.util.ArrayList" %>
    </head>
    <body>
        <% if (session.getAttribute("user")==null) { 
        response.sendRedirect("/homepage.jsp");
         } %>
        <a href="homepage.jsp">Homepage</a>
        <% if (session.getAttribute("user")!=null) { %>
        <a href="manage.jsp">Manage bids</a>
        <% } %>
        <a href="navigate.jsp">Search/Navigate bids</a>
        <% if (session.getAttribute("user")!=null) { %>
        <a href="LogoutServlet">Log-out</a>
        <% } else{ %>
        <a href="startpage.jsp">Log-in/Sign-up</a>
        <% } %>
        <%
            String idd=request.getParameter("item_id");
            int idf=Integer.parseInt(idd);
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/MyEbayDB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
            Statement st = con.createStatement();
            Statement st_2 = con.createStatement();
            Statement st_3 = con.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM item WHERE item_id = '" + idf + "'");
            if(rs.next()){
            %>
            <!-- output data of bid -->
              </br></br>
              <p> PLACE BID: </p> </b>
              <p> <b><%=rs.getString("name")%></b> </p> </br>
              <table cellspacing='5'>
              <tr>
                  <td valing='top' aling='left'><b>Seller:</b></td>
                  <td valing='top' aling='right'><b><%=rs.getString("seller_id")%></b></td>
              </tr>
              <tr>
                  <td valing='top' aling='left'><b>Best offer:</b></td>
                  <td valing='top' aling='right'><b><%=rs.getString("currently")%></b></td>
              </tr>
              <tr>
                  <td valing='top' aling='left'><b>Buy Price:</b></td>
                  <td valing='top' aling='right'><b><%=rs.getString("buy_price")%></b></td>
              </tr>
              <tr>
                  <td valing='top' aling='left'><b>First Bid:</b></td>
                  <td valing='top' aling='right'><b><%=rs.getString("first_bid")%></b></td>
              </tr>
              <tr>
                  <td valing='top' aling='left'><b>Number of bids:</b></td>
                  <td valing='top' aling='right'><b><%=rs.getString("number_of_bids")%></b></td>
              </tr>
              <tr>
                  <td valing='top' aling='left'><b>Location:</b></td>
                  <td valing='top' aling='right'><b><%=rs.getString("location")%></b></td>
              </tr>
              <tr>
                  <td valing='top' aling='left'><b>Country:</b></td>
                  <td valing='top' aling='right'><b><%=rs.getString("country")%></b></td>
              </tr>
              <tr>
                  <td valing='top' aling='left'><b>Starting date:</b></td>
                  <td valing='top' aling='right'><b><%=rs.getString("started")%></b></td>
              </tr>
              <tr>
                  <td valing='top' aling='left'><b>Ending date:</b></td>
                  <td valing='top' aling='right'><b><%=rs.getString("ends")%></b></td>
              </tr>
              <tr>
                  <td valing='top' aling='left'><b>Description:</b></td>
                  <td valing='top' aling='right'><b><%=rs.getString("description")%></b></td>
              </tr>
              <%
              ResultSet catrs=st_2.executeQuery("SELECT * FROM category WHERE item_id = '" + idf + "'");
              int i=0;
               while(catrs.next()){ 
                    i=i+1;
              %>
              <tr>
                  <td valing='top' aling='left'><b>Category <%=i%>:</b></td>
                  <td valing='top' aling='right'><b><%=catrs.getString("category_name")%></b></td>
              </tr>
              <% }
              %>
              </table>
              </br> </br>
              <%
              ResultSet photors=st_3.executeQuery("SELECT * FROM photo WHERE item_id = '" + idf + "'");      
              while(photors.next()){
                Blob im=photors.getBlob("photo_data");
                %>
                <img src="<%=im %> " width="50"/>
                <%
              }
              Object o=session.getAttribute("user");
              String usr=(String)o;
              Statement st_4 = con.createStatement();
              ResultSet bidrs=st_4.executeQuery("SELECT * FROM bidder WHERE user_id = '" + usr + "'");
              %>
            </br>
            </br>
            <!-- place bid -->
            <form action="confirmbid.jsp" method="post">
            <input name="item_id" type="hidden" value=<%=rs.getString(1)%> />
            <% if(!bidrs.isBeforeFirst()){ %>
                  Location: <input type="text" name="loc" placeholder="ex Athens" required/><br/>
                  Country: <input type="text" name="country" placeholder="ex Greece" required/><br/>   
            <%    } %>
            Buy Price: <input type="number" name="buyp" step="0.01" min=<%=rs.getString("currently")%> max=<%=rs.getString("buy_price")%> placeholder="ex 1.5" required/><br/>
            Place bid:<input type="submit" name="sbm" value="Place bid" />
            </form>
            <button onclick="goBack()">Go Back</button></br>
            <script>
                function goBack(){
                    window.history.back();
                }
            </script>
            <a href="homepage.jsp">Cancel</a>
            <% } %>
    </body>
</html>
