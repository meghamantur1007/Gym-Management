<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Form</title>
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
            height: 550px;
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
        input, select, button {
            width: 100%;
            height: 40px;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #fff;
            border-radius: 5px;
            font-size: 16px;
            background: #222;
            color: #fff;
            box-sizing: border-box;
        }
        input::placeholder {
            color: #aaa;
        }
        button {
            background: #fff;
            color: #000;
            font-weight: bold;
            cursor: pointer;
            border: none;
            margin-top: 10px;
        }
        button:hover {
            background: #ddd;
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
                    <a class="dropdown-item" href="SlotAndTrainerName.jsp">Slot and Trainer Name</a>
                     <a class="dropdown-item" href="http://localhost:8080/Megha_Gym/removeTrainer">Remove Trainer</a>
                    <a class="dropdown-item" href="SetExerciseAndDietPlans.jsp">Set Exercise and Diet Plans</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

    <div class="container">
        <h2>Assign Slot</h2>
        <span style="color:green; font-size: 24px; font-weight: bold;">${updated}</span>
        <form action="http://localhost:8080/Megha_Gym/assignSlot" method="post">
            <label for="name">Name:</label>
            <span id="nameError" style="color: red;"></span>
            <input type="text" id="name" name="name" onblur="validateName()"placeholder="Enter your name" required>

            <label for="email">Email:</label>
            <span id="emailError" style="color: red;"></span>
           <input type="text" id="email" name="email" onblur="validateEmail()"placeholder="Enter your email" required>

            <label for="slot">Slot:</label>
            <select id="slot" name="slot" required>
                <option value="" disabled selected>Select Slot</option>
                <c:forEach var="timeSlot" items="${timeslots}">
                    <option value="${timeSlot.slot}">${timeSlot.slot}</option>
                </c:forEach>
            </select>

            <label for="trainer">Trainer Name:</label>
            <select id="trainer" name="trainerName" required>
                <option value="" disabled selected>Select Trainer Name</option>
                <c:forEach var="trainer" items="${trainerNames}">
                    <option value="${trainer.trainerName}">${trainer.trainerName}</option>
                </c:forEach>
            </select>


            <button type="submit">Submit</button>
        </form>
    </div>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
    function validateName() {
               let name = document.getElementById("name").value.trim();
               let namePattern = /^[A-Za-z\s]{3,30}$/;
               document.getElementById("nameError").innerText = namePattern.test(name) ? "" : "Enter a valid name ";
            }

          function validateEmail() {
              var email = document.getElementById('email').value.trim();
              var emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
              if (!emailPattern.test(email)) {
                  document.getElementById('emailError').innerText = 'Please enter a valid Gmail address';
                  return false;
              }
              document.getElementById('emailError').innerText = '';
              return true;
          }
    </script>
</body>
</html>
