<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        /* Global Styles */
        body {
            background: url('https://www.hussle.com/blog/wp-content/uploads/2020/12/Gym-structure-1080x675.png')
                        no-repeat center center fixed;
            background-size: cover;
            font-family: "Poppins", Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        /* Navbar */
        .navbar {
            background-color: rgba(20, 20, 20, 0.95); /* Professional dark */
            padding: 12px 0;
            position: fixed;
            top: 0;
            width: 100%;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.7);
            z-index: 1000;
        }

        .navbar-brand {
            font-size: 22px;
            font-weight: bold;
            color: white !important;
            text-transform: uppercase;
        }

        .navbar-nav {
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .navbar-nav .nav-item {
            margin: 0 20px;
        }

        .navbar-nav .nav-link {
            font-size: 18px;
            font-weight: bold;
            color: white !important;
            padding: 12px 25px;
            transition: all 0.3s ease-in-out;
            border-radius: 50px;
        }

        .navbar-nav .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2);
            color: white !important;
        }

        /* Success Message Box */
        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            max-width: 500px;
        }

        h1 {
            color: #28a745; /* Professional green */
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 15px;
        }

        p {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 20px;
        }

        .btn-custom {
            text-decoration: none;
            color: white;
            background-color: #28a745;
            padding: 12px 25px;
            border-radius: 5px;
            font-size: 1rem;
            transition: background-color 0.3s ease;
            display: inline-block;
        }

        .btn-custom:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<!-- NAVIGATION BAR -->
<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">
        <img src="https://c8.alamy.com/comp/2GB2T17/initial-m-monogram-alphabet-with-a-barbell-lifting-vector-logo-design-modern-vector-logo-for-bodybuilding-gym-fitness-club-business-and-company-2GB2T17.jpg"
             alt="Megha Gym" height="50">
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

<div class="container">
    <h1>Profile Updated Successfully</h1>
    <p>Your profile changes have been saved.</p>
    <a href="UserLogin.jsp" class="btn-custom">Go to Login</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
