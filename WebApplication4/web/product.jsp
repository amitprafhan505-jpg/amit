<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #83a4d4, #b6fbff);
        }

        h1 {
            margin-top: 30px;
            font-size: 2rem;
            color: #333;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.2);
        }

        table {
            margin-top: 20px;
            border-collapse: collapse;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            width: 80%;
        }

        th {
            background: #4a90e2;
            color: white;
            padding: 12px;
            font-size: 1rem;
            text-align: center;
        }

        td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background: #f9f9f9;
        }

        tr:hover {
            background: #e3f2fd;
        }

        input[type="submit"] {
            padding: 6px 15px;
            border: none;
            border-radius: 20px;
            background: #4a90e2;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: #357abd;
            transform: scale(1.05);
        }

        p {
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<center>
<%
    String category = request.getParameter("category");
    if (category == null) category = "";

    out.println("<h1>Products in " + category + "</h1>");

    String url = "jdbc:mysql://localhost:3306/product_app";
    String user = "root";
    String password = "amit9938";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement ps;
        if (!category.equals("")) {
            ps = con.prepareStatement("SELECT * FROM product WHERE category_name=?");
            ps.setString(1, category);
        } else {
            ps = con.prepareStatement("SELECT * FROM product");
        }

        ResultSet rs = ps.executeQuery();
%>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
<%
        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getInt("product_id") %></td>
                <td><%= rs.getString("product_name") %></td>
                <td><%= rs.getString("category_name") %></td>
                <td>?<%= rs.getDouble("price") %></td>
                <td>
                    <form action="cart" method="post">
                        <input type="hidden" name="productId" value="<%= rs.getInt("product_id") %>">
                        <input type="submit" value="Add to Cart">
                    </form>
                </td>
                <td>
                    <form action="buy" method="post">
                        <input type="hidden" name="product_id" value="<%= rs.getInt("product_id") %>">
                        <input type="hidden" name="price" value="<%= rs.getInt("price") %>">
                        <input type="submit" value="Buy Now">
                    </form>

                </td>
            </tr>
<%
        }
        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red'>Error: " + e.getMessage() + "</p>");
    }
%>
        </table>
</center>
</body>
</html>
