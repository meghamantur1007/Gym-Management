<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        /* Smooth gradient background */
        body {
            background: linear-gradient(to right, #141e30, #243b55);
            font-family: "Poppins", sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        /* NAVBAR */
        .navbar {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 10px 0;
            position: fixed;
            top: 0;
            width: 100%;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.7);
            z-index: 1000;
        }

        .navbar-brand {
            font-size: 22px;
            font-weight: bold;
            color: white !important;
            text-transform: uppercase;
            margin-left: 10px;
        }

        .navbar-nav .nav-item {
            margin-right: 15px;
        }

        .navbar-nav .nav-link {
            font-size: 16px;
            font-weight: 500;
            color: white !important;
            padding: 8px 15px;
            transition: all 0.3s ease-in-out;
            border-radius: 50px;
        }

        .navbar-nav .nav-link:hover {
            background-color: white;
            color: black !important;
            font-weight: bold;
        }

        /* SUCCESS MESSAGE BOX */
        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.2);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
            max-width: 500px;
            backdrop-filter: blur(10px);
        }

        h1 {
            color: #28a745;
            font-size: 2rem;
            margin-bottom: 20px;
            font-weight: bold;
        }

        p {
            font-size: 1.2rem;
            color: white;
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

<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">
        <img src="https://c8.alamy.com/comp/2GB2T17/initial-m-monogram-alphabet-with-a-barbell-lifting-vector-logo-design-modern-vector-logo-for-bodybuilding-gym-fitness-club-business-and-company-2GB2T17.jpg" alt="Megha Gym" height="50">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
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
    <h1>Success!</h1>
    <p>Your password has been updated successfully.</p>
    <a href="UserLogin.jsp" class="btn-custom">Go to Login</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
