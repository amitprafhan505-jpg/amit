<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #6dd5ed, #2193b0);
            color: #fff;
        }

        h1 {
            margin-top: 50px;
            font-size: 3rem;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.3);
        }

        h2 {
            margin-top: 30px;
            font-size: 2rem;
            color: #ffeb3b;
        }

        ul {
            list-style: none;
            padding: 0;
            margin-top: 20px;
        }

        ul li {
            margin: 15px 0;
        }

        ul li a {
            text-decoration: none;
            font-size: 1.3rem;
            background: #fff;
            color: #2193b0;
            padding: 10px 25px;
            border-radius: 25px;
            font-weight: bold;
            transition: 0.3s;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
        }

        ul li a:hover {
            background: #ffeb3b;
            color: #000;
            transform: scale(1.05);
            box-shadow: 0 6px 10px rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>
<center>
    <h1>Welcome to My Store</h1>
    <h2>Categories</h2>
    <ul>
        <li><a href="product.jsp?category=Electronics">Electronics</a></li>
        <li><a href="product.jsp?category=clothing">Fashion</a></li>
        <li><a href="product.jsp?category=Books">Books</a></li>
        <li><a href="product.jsp?category=Groceries">Groceries</a></li>
    </ul>
</center>
</body>
</html>
