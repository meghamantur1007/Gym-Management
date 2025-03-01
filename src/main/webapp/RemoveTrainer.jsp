<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trainer Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body {
            background: url('https://snworksceo.imgix.net/cav/8d443aec-2090-4e9e-8793-6b95d830d89f.sized-1000x1000.JPG') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            background-color: #000;
            color: #fff;
            padding-top: 80px; /* To prevent navbar overlap */
        }

        .container {
            background: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            color: #000;
            border-radius: 5px;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f39c12;
            color: white;
        }

        .btn-remove {
            background-color: red;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn-remove:hover {
            background-color: darkred;
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


        .alert {
            margin: 20px 0;
            padding: 15px;
            border-radius: 5px;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert ul {
            margin: 10px 0 0;
            padding-left: 20px;
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
                    <a class="dropdown-item" href="TimeSlot.jsp">Time Slot</a>
                    <a class="dropdown-item" href="trainerDetails">Trainer Details</a>
                    <a class="dropdown-item" href="assignSlot">Assign Slot</a>
                    <a class="dropdown-item" href="SlotAndTrainerName.jsp">Slot and Trainer Name</a>
                    <a class="dropdown-item" href="SetExerciseAndDietPlans.jsp">Set Exercise and Diet Plans</a>
                </div>
            </li>

        </ul>
    </div>
</nav>

<div class="container mt-5">
    <c:if test="${not empty error}">
        <div class="alert alert-danger text-center">
            ${error}
            <ul>
                <c:forEach var="trainee" items="${trainees}">
                    <li>${trainee[0]} - ${trainee[1]}</li>
                </c:forEach>
            </ul>
        </div>

    </c:if>

    <c:if test="${not empty success}">
        <div class="alert alert-success text-center">
            ${success}
        </div>
    </c:if>

    <h2 class="text-center text-warning">Trainer Details</h2>
    <table class="table table-bordered mt-3">
        <thead>
            <tr>
                <th>Trainer Name</th>
                <th>Phone Number</th>
                <th>Slot</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="trainer" items="${trainerDetails}">
                <tr>
                    <td>${trainer.trainerName}</td>
                    <td>${trainer.phoneNumber}</td>
                    <td>${trainer.slot}</td>
                    <td>
                        <form action="removeTrainer" method="post">
                            <input type="hidden" name="trainerName" value="${trainer.trainerName}">
                            <button type="submit" class="btn-remove">Remove</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
