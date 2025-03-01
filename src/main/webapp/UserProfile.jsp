<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        /* Global Styles */
        body {
            background: url('https://www.hussle.com/blog/wp-content/uploads/2020/12/Gym-structure-1080x675.png') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            font-family: "Poppins", Arial, sans-serif;
            color: #333; /* Dark text for readability */
            text-align: center;
        }

        /* NAVBAR */
        .navbar {
            background-color: rgba(20, 20, 20, 0.9); /* Dark gray */
            padding: 10px 0;
            position: fixed;
            top: 0;
            width: 100%;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.7);
            z-index: 1000;
        }

        .navbar-brand img {
            height: 50px;
        }

        .navbar-nav {
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .navbar-nav .nav-item {
            margin: 0 15px;
        }

        .navbar-nav .nav-link {
            font-size: 18px;
            font-weight: bold;
            color: white !important;
            padding: 10px 20px;
            transition: all 0.3s ease-in-out;
            border-radius: 50px;
        }

        .navbar-nav .nav-link:hover {
            background-color: #007BFF; /* Blue hover */
            color: white !important;
        }

        .container {
            width: 90%;
            max-width: 700px; /* Increased from 500px */
            max-height: 600px; /* Increased from 500px */
            background: rgba(255, 255, 255, 0.8); /* Slightly more opacity for better contrast */
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            padding: 50px; /* Increased padding for better spacing */
            border-radius: 15px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3); /* Slightly deeper shadow for better pop */
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        h2 {
            font-size: 26px;
            margin-bottom: 25px;
            color: #222;
            font-weight: bold;
        }

        .profile-buttons {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-bottom: 30px;
        }

        .profile-buttons form {
            width: 100%;
        }

        .profile-buttons button {
            background: linear-gradient(135deg, #6ec6ff, #a3daff);
            color: #333;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s;
            font-weight: 500;
        }

        .profile-buttons button:hover {
            background: linear-gradient(135deg, #5eb4e7, #8ecbf5);
            transform: scale(1.05); /* Slight scale-up for better interaction */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 30px;
            }

            h2 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>

<!-- NAVIGATION BAR -->
<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">
        <img src="https://c8.alamy.com/comp/2GB2T17/initial-m-monogram-alphabet-with-a-barbell-lifting-vector-logo-design-modern-vector-logo-for-bodybuilding-gym-fitness-club-business-and-company-2GB2T17.jpg"
             alt="Megha Gym">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link font-weight-bold" href="UserLogin.jsp">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link font-weight-bold" href="index.jsp">Home</a>
            </li>
        </ul>
    </div>
</nav>

<!-- PROFILE CONTAINER -->
<div class="container">
    <h2>Welcome, ${email}</h2>

    <div class="profile-buttons">
        <form action="viewProfile" method="get">
            <input type="hidden" name="email" value="${email}">
            <button type="submit">View Profile</button>
        </form>

        <form action="updateProfile" method="get">
            <input type="hidden" name="email" value="${email}">
            <button type="submit">Update Profile</button>
        </form>

        <form action="viewDAW" method="get">
                    <input type="hidden" name="email" value="${email}">
                    <button type="submit">View Diet And Exercise</button>
                </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
