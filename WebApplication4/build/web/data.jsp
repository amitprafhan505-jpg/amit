<%-- 
    Document   : data
    Created on : 10 Sept 2025, 9:56:06 am
    Author     : sukan
--%>
<%@page  import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registered user</title>
        <style></style>
    </head>
    <body>
        <div class="continer">
            <h2>registered user</h2>
            <table>
                <tr>
                    <th>name</th>
                    <th>email</th>
                    <th>mobile</th>
                    <th>password</th>
                </tr>
                       <%
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://localhost:3306/product_app";
                String dbUser = "root";
                String dbPass = "amit9938";

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection(url, dbUser, dbPass);
                    stmt = con.createStatement();
                    rs = stmt.executeQuery("SELECT name, email, password, mobile_no FROM usere ");

                    while(rs.next()) {
            %>
                <tr>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("name") %></td>
                </tr>
              <%
                    }
                } catch(Exception e) {
                    out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>    
              
              
            </table>
        <h1>Hello World!</h1>
    </body>
</html>
