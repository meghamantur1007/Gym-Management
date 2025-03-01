<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Password</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body {
            background: url('https://www.hussle.com/blog/wp-content/uploads/2020/12/Gym-structure-1080x675.png') no-repeat center center fixed;
            background-size: cover;
            background-color: black;
            color: white;
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.95);
            padding: 8px 0; /* Smaller height */
            position: fixed;
            top: 0;
            width: 100%;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.7);
            z-index: 1000;
        }

        .navbar-brand {
            font-size: 20px;
            font-weight: bold;
            color: #f8f9fa !important;
            text-transform: uppercase;
            margin-left: 10px;
        }

        .navbar-nav {
            margin-right: 20px;
        }

        .navbar-nav .nav-item {
            margin-right: 15px;
        }

        .navbar-nav .nav-link {
            font-size: 16px;
            font-weight: 500;
            color: #f8f9fa !important;
            padding: 8px 15px;
            transition: all 0.3s ease-in-out;
            border-radius: 50px;
        }

        .navbar-nav .nav-link:hover {
            background-color: #f8f9fa;
            color: #000 !important;
            font-weight: bold;
        }

        .navbar-nav .active .nav-link {
            background-color: #f39c12;
            color: black !important;
        }

        .container {
            margin-top: 80px;
            width: 320px;
            padding: 20px;
            border: 1px solid white;
            border-radius: 5px;
            background-color: #222;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.2);
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 5px;
            border: none;
            border-bottom: 2px solid white;
            background: transparent;
            color: white;
            font-size: 14px;
            box-sizing: border-box;
        }

        input:focus {
            outline: none;
            border-bottom: 2px solid gray;
        }

        button {
            background-color: white;
            color: black;
            border: none;
            padding: 10px;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }

        button:hover {
            background-color: gray;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">
        <img src="https://c8.alamy.com/comp/2GB2T17/initial-m-monogram-alphabet-with-a-barbell-lifting-vector-logo-design-modern-vector-logo-for-bodybuilding-gym-fitness-club-business-and-company-2GB2T17.jpg" alt="Megha Gym" height="50">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">  <!-- Moves buttons to the right -->
            <li class="nav-item">
                <a class="nav-link" href="UserLogin.jsp">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">Home</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <h2>Update Password</h2>
    <form action="updatePassword" method="post">
        <!-- Hidden field to pass email to backend -->
        <input type="hidden" name="email" value="${email}">

        <div class="form-group">
            <label for="oldPassword">Old Password:</label>
            <input type="password" id="oldPassword" name="oldPassword" required>
        </div>

        <div class="form-group">
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>
        </div>

        <div class="form-group">
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
        </div>

        <button type="submit">Update</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
