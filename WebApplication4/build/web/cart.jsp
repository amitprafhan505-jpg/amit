<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Cart</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f2f2f2; }
        h1 { color: #333; }
        table {
            border-collapse: collapse;
            width: 70%;
            margin-top: 20px;
            background: #fff;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th { background: #4CAF50; color: white; }
        tr:hover { background: #f1f1f1; }
    </style>
</head>
<body>
<center>
    <h1>My Cart</h1>
    <%
        ArrayList<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");
        if (cart == null || cart.size() == 0) {
            out.println("<p>Your cart is empty!</p>");
        } else {
    %>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
            </tr>
            <%
                for (String[] item : cart) {
            %>
                <tr>
                    <td><%= item[0] %></td>
                    <td><%= item[1] %></td>
                    <td><%= item[2] %></td>
                    <td>?<%= item[3] %></td>
                </tr>
            <%
                }
            %>
        </table>
    <%
        }
    %>
    <br>
    <a href="home.jsp">Continue Shopping</a>
</center>
</body>
</html>
