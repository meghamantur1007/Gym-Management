<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search User</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body {
        background: url('https://snworksceo.imgix.net/cav/8d443aec-2090-4e9e-8793-6b95d830d89f.sized-1000x1000.JPG') no-repeat center center fixed;
                    background-size: cover;
            font-family: Arial, sans-serif;
            background-color: #000;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #111;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.2);
            height: 400px;
            width: 500px;
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
        }
        label {
            display: block;
            text-align: left;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        input, button {
            width: 100%;
            height: 40px;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #fff;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            background: #222;
            color: #fff;
            box-sizing: border-box;
        }
        input::placeholder {
            color: #aaa;
        }
        button {
            background: pink;
            color: pink;
            font-weight: bold;
            cursor: pointer;
            border: none;
            font-size: 18px;
            height: 50px;
        }

        button:hover {
            background: pink;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 15px; /* Adjust spacing between fields */
            text-align: left;
        }

        .result {
            font-size: 18px;
            padding: 25px;
        }
        .errorResult{
        font-size: 18px;
        padding: 25px;
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
                    <a class="dropdown-item" href="http://localhost:8080/Megha_Gym/removeTrainer">Remove Trainer</a>
                    <a class="dropdown-item" href="SetExerciseAndDietPlans.jsp">Set Exercise and Diet Plans</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

    <div class="container">
        <h2>Slot And Trainer </h2>

        <!-- Ensure error message displays correctly -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                <strong>${errorMessage}</strong>
            </div>
        </c:if>

        <form action="slotAndTrainerName" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Enter Email:</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required value="${email}">
            </div>
            <button type="submit" class="btn btn-light w-100">Search</button>
        </form>

        <c:if test="${not empty slot}">
            <div class="result">
                <p><strong>Slot:</strong> ${slot}</p>
                <p><strong>Trainer Name:</strong> ${trainerName}</p>
            </div>
        </c:if>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
