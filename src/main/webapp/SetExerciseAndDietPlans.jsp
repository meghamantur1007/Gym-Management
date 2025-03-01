<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Exercise & Diet Plans</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        body {
            background: url('https://static.vecteezy.com/system/resources/thumbnails/035/987/056/small_2x/ai-generated-still-life-of-interior-modern-fitness-center-gym-with-a-workout-room-empty-space-for-text-ai-generated-photo.jpg')
                        no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            color: black;
            border-radius: 25px;
            padding: 30px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            width: 600px;
            max-height: 700px;
            overflow-y: auto;
        }

        label {
            font-size: 14px;
        }

        input.form-control, select.form-control {
            border-radius: 25px;
            height: 45px;
            font-size: 14px;
            border: 1px solid #ddd;
        }

        input.form-control:focus, select.form-control:focus {
            border-color: #1e3a8a;
            box-shadow: 0px 5px 10px #1e3a8a;
        }

        .btn {
            border-radius: 25px;
            height: 45px;
            font-size: 18px;
            background-color: black;
            color: white;
            border: none;
        }

        .btn:hover {
            background-color: #143362;
        }

        @media (max-width: 768px) {
            .form-container {
                width: 90%;
            }
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

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">
        <img src="https://c8.alamy.com/comp/2GB2T17/initial-m-monogram-alphabet-with-a-barbell-lifting-vector-logo-design-modern-vector-logo-for-bodybuilding-gym-fitness-club-business-and-company-2GB2T17.jpg"
             alt="Megha Gym">
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
                    <a class="dropdown-item" href="TimeSlot.jsp">Time Slot</a>
                    <a class="dropdown-item" href="trainerDetails">Trainer Details</a>
                    <a class="dropdown-item" href="assignSlot">Assign Slot</a>
                    <a class="dropdown-item" href="SlotAndTrainerName.jsp">Slot and Trainer Name</a>
                    <a class="dropdown-item" href="http://localhost:8080/Megha_Gym/removeTrainer">Remove Trainer</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

<div class="form-container">
    <h2 class="text-center">Exercise & Diet Plans</h2>

        <p style="color: green; font-size: 18px;">${success}</p>

    <!-- Search Form -->
    <form action="getNameAndPlanByEmail" method="get">
        <div class="form-group">
            <label for="email">Search Email:</label>
            <input type="text" name="email" class="form-control" id="email">
            <button type="submit" class="btn btn-primary mt-2">Search</button>
        </div>
    </form>

    <!-- Display Name & Plan -->
    <form action="assignDAW" method="post">
        <input type="hidden" name="email" value="${email}">

        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${name}" class="form-control" readonly>
        </div>

        <div class="form-group">
            <label for="planType">Plan Type:</label>
            <input type="text" id="planType" name="planType" value="${plan}" class="form-control" readonly>
        </div>

        <div class="form-group">
                        <label for="dietPlan" class="font-weight-bold">Select Diet Plan:</label>
                        <select name="dietPlan" id="dietPlan" class="form-control">
                            <option value="">--Select Diet Plan--</option>
                            <option value="VEG_WEIGHT_GAIN">Weight Gain for Vegetarian</option>
                            <option value="VEG_WEIGHT_LOSS">Weight Loss for Vegetarian</option>
                            <option value="NON_VEG_WEIGHT_GAIN">Weight Gain for Non-Vegetarian</option>
                            <option value="NON_VEG_WEIGHT_LOSS">Weight Loss for Non-Vegetarian</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="workoutPlan" class="font-weight-bold">Select Workout Plan:</label>
                        <select name="workoutPlan" id="workoutPlan" class="form-control">
                            <option value="">--Select Workout Plan--</option>
                            <option value="WEIGHT_GAIN">Bulking (Strength & Mass Gain)</option>
                            <option value="WEIGHT_LOSS">Fat Loss (Cardio & HIIT)</option>
                        </select>
                    </div>

        <button type="submit" class="btn btn-primary btn-block">Submit</button>
    </form>
</div>

<script>
    function searchEmail() {
        var email = document.getElementById('email').value;
        if (email !== "") {
            document.forms[0].submit();
        }
    }
</script>

</body>
</html>
