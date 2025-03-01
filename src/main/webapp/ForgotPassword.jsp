<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<style>
    body {
    background: url('https://www.hussle.com/blog/wp-content/uploads/2020/12/Gym-structure-1080x675.png') no-repeat center center fixed;
                background-size: cover;
        background-color: #000000;  /* Black background */
        color: #ffffff;  /* White text */
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 500px;
        background-color: #ffffff;  /* White background for the form */
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        margin-top: 100px;
    }

    h2 {
        color: #000000;  /* Black color for the heading */
        font-weight: bold;
        text-align: center;
        margin-bottom: 30px;
    }

    .btn-primary {
        background-color: #000000;  /* Black background for the button */
        border-radius: 25px;
        font-size: 1.2em;
        transition: all 0.3s ease;
    }

    .btn-primary:hover {
        background-color: #333333;  /* Dark gray on hover */
        transform: scale(1.05);
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
</style>
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
    <h2>Forgot Password</h2>
    <form action="resetPassword" method="post">

        <div class="form-group">
            <label for="email">Email address</label>
            <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
        </div>

        <div class="form-group">
            <label for="newPassword">New Password</label>
            <input type="password" class="form-control" name="newPassword" placeholder="Enter new password" required>
        </div>

        <div class="form-group">
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm new password" required>
        </div>

        <button type="submit" class="btn btn-primary btn-block">Reset Password</button>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
