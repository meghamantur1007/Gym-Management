<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Success</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Helvetica Neue', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            background-image: url('https://img.freepik.com/premium-photo/modern-gym-interior-with-exercise-equipments_23-2147949737.jpg?w=740');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 15px 0;
            position: fixed;
            top: 0;
            width: 100%;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.7);
            z-index: 1000;
        }

        .navbar-brand img {
            height: 50px;
            width: auto;
        }

        .navbar-nav .nav-item {
            margin-left: 20px;
        }

        .navbar-nav .nav-link {
            font-size: 18px;
            font-weight: 500;
            color: #f8f9fa !important;
            padding: 10px 25px;
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

        /* Dashboard Section */
        .dashboard-section {
            padding: 30px;
            text-align: center;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
            width: 100%;
        }

        .dashboard-section h1 {
            font-size: 40px;
            font-weight: bold;
            color: #f39c12;
            margin-bottom: 20px;
        }

        .dashboard-section p {
            font-size: 22px;
            color: #333;
            line-height: 1.6;
            margin: 0 auto;
        }

        .dashboard-section ul {
            text-align: left;
            list-style-type: none;
            padding: 0;
            font-size: 18px;
            color: #333;
            margin-top: 20px;
        }

        .dashboard-section ul li {
            margin-bottom: 10px;
        }

        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 15px 0;
            text-align: center;
            color: #aaa;
            font-size: 16px;
        }
        .bold-link {
            font-weight: bold;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">
        <img src="https://c8.alamy.com/comp/2GB2T17/initial-m-monogram-alphabet-with-a-barbell-lifting-vector-logo-design-modern-vector-logo-for-bodybuilding-gym-fitness-club-business-and-company-2GB2T17.jpg" alt="Megha Gym">
    </a>
    <a class="nav-link font-weight-bold text-white ml-3" href="index.jsp">Home</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="Enquiry.jsp">Enquiry</a></li>
            <li class="nav-item"><a class="nav-link" href="http://localhost:8080/Megha_Gym/follow">Follow</a></li>
            <li class="nav-item"><a class="nav-link" href="http://localhost:8080/Megha_Gym/registration">Registration</a></li>
            <li class="nav-item"><a class="nav-link" href="http://localhost:8080/Megha_Gym/update">Update</a></li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">
                    More Options
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="http://localhost:8080/Megha_Gym/TimeSlot.jsp">Time Slot</a>
                    <a class="dropdown-item" href="http://localhost:8080/Megha_Gym/trainerDetails">Trainer Details</a>
                    <a class="dropdown-item" href="http://localhost:8080/Megha_Gym/assignSlot">Assign Slot</a>
                    <a class="dropdown-item" href="SlotAndTrainerName.jsp">Slot and Trainer Name</a>
                    <a class="dropdown-item" href="http://localhost:8080/Megha_Gym/removeTrainer">Remove Trainer</a>
                    <a class="dropdown-item" href="SetExerciseAndDietPlans.jsp">Set Exercise and Diet Plans</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

    <div class="dashboard-section">
        <h1>Welcome!!</h1>
        <p>Your fitness journey starts here. We provide a range of services to help you meet your goals:</p>
    </div>

    <div class="footer">
        &copy; 2025 Megha Gym | Your Fitness Journey Starts Here...
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
