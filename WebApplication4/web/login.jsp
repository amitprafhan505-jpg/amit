<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <meta charset="UTF-8">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #36d1dc, #5b86e5);
        }

        h1 {
            margin-top: 40px;
            font-size: 2.5rem;
            color: #fff;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.2);
        }

        form {
            background: #fff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            display: inline-block;
            margin-top: 20px;
            text-align: left;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
            color: #444;
        }

        input[type="email"],
        input[type="password"] {
            padding: 10px;
            width: 250px;
            border: 1px solid #ccc;
            border-radius: 8px;
            margin-bottom: 15px;
            outline: none;
            transition: 0.3s;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #5b86e5;
            box-shadow: 0 0 6px rgba(91,134,229,0.5);
        }

        input[type="submit"] {
            margin-top: 10px;
            padding: 10px 25px;
            border: none;
            border-radius: 25px;
            background: #5b86e5;
            color: #fff;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
            width: 100%;
        }

        input[type="submit"]:hover {
            background: #36d1dc;
            transform: scale(1.05);
        }

        p {
            margin-top: 15px;
            color: #fff;
            font-size: 1rem;
        }

        a {
            color: #ffeb3b;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        a:hover {
            color: #fff176;
            text-decoration: underline;
        }

        .error-msg {
            color: red;
            margin-top: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <center>
        <h1>User Login</h1>
        <form action="login" method="post">
            <label>Email:</label>
            <input type="email" name="email" placeholder="Enter email" required><br>
            
            <label>Password:</label>
            <input type="password" name="password" placeholder="Enter password" required><br>
            
            <input type="submit" value="Login">
        </form>
        
        <% if (request.getParameter("error") != null) { %>
            <p class="error-msg">Invalid Email or Password!</p>
        <% } %>
        
        <p>Don?t have an account? <a href="index.html">Register Here</a></p>
      
    </center>
</body>
</html>
