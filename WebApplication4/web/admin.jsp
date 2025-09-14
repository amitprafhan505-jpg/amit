<!DOCTYPE html>
<html>
<head>
    <title>Admin - Add Product</title>
    <meta charset="UTF-8">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #ffecd2, #fcb69f);
        }

        h1 {
            margin-top: 40px;
            font-size: 2.5rem;
            color: #333;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.1);
        }

        form {
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            display: inline-block;
            margin-top: 20px;
            text-align: left;
        }

        label {
            font-weight: bold;
            display: inline-block;
            width: 130px;
            margin-bottom: 10px;
            color: #444;
        }

        input[type="text"],
        input[type="number"] {
            padding: 8px;
            width: 220px;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
            transition: 0.3s;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            border-color: #f77f00;
            box-shadow: 0 0 6px rgba(247, 127, 0, 0.5);
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 25px;
            border: none;
            border-radius: 25px;
            background: #f77f00;
            color: #fff;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
        }

        input[type="submit"]:hover {
            background: #ff9e40;
            transform: scale(1.05);
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #f77f00;
            font-weight: bold;
            transition: 0.3s;
        }

        a:hover {
            color: #ff5722;
        }
    </style>
</head>
<body>
    <center>
        <h1>Add New Product</h1>
        <form action="addProduct" method="post">
            
            <label>Product Name:</label>
            <input type="text" name="name" required><br><br>
            
            <label>Category:</label>
            <input type="text" name="category" required><br><br>
            
            <label>Price:</label>
            <input type="number" step="0.01" name="price" required><br><br>
            
            <input type="submit" value="Add Product">
        </form>
        <br>
        <a href="welcome.jsp">Back to Home</a>
    </center>
</body>
</html>
