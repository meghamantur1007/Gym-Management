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
        /* General Page Styling */
        body {
         background: url('https://snworksceo.imgix.net/cav/8d443aec-2090-4e9e-8793-6b95d830d89f.sized-1000x1000.JPG') no-repeat center center fixed;
                     background-size: cover;
            font-family: Arial, sans-serif;
            background-color: #000; /* Black background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #fff; /* White text */
        }

        /* Form Container */
        .form-container {
            background: #111; /* Dark background for form */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(255, 255, 255, 0.2);
            height: 500px;
            width: 500px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        /* Centered Header */
        .header-container {
            text-align: center;
            margin-bottom: 20px;
        }

        h2 {
            color: #fff;
            margin: 0;
        }
        label {
           font-weight: bold;
           color: #ddd;
           display: block;
           margin-bottom: 8px; /* Space between label and input field */
       }

      input, select, button {
          width: 100%;  /* Make all fields equal width */
          height: 45px; /* Ensure consistent height */
          padding: 10px;
          border: 1px solid #444;
          border-radius: 5px;
          background: #222;
          color: #fff;
          font-size: 16px; /* Uniform font size */
          outline: none;
          margin-bottom: 20px;
          box-sizing: border-box;
      }



        select {
            cursor: pointer;
        }

       button {
           background-color: #fff;
           color: #000;
           font-weight: bold;
           cursor: pointer;
           border: none;
           transition: background 0.3s ease;
       }

        button:hover {
            background-color: #ddd;
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
                    <a class="dropdown-item" href="http://localhost:8080/Megha_Gym/assignSlot">Assign Slot</a>
                    <a class="dropdown-item" href="SlotAndTrainerName.jsp">Slot and Trainer Name</a>
                     <a class="dropdown-item" href="http://localhost:8080/Megha_Gym/removeTrainer">Remove Trainer</a>
                    <a class="dropdown-item" href="SetExerciseAndDietPlans.jsp">Set Exercise and Diet Plans</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

    <div class="form-container">
        <div class="header-container">
            <h2>Trainer Details</h2>
        </div>

        <span style="color:green; font-size: 24px; font-weight: bold;">${saved}</span>
        <form action="http://localhost:8080/Megha_Gym/trainerDetails" method="post">
            <label for="name">Name:</label>
            <span id="nameError" style="color:red;"></span>
            <input type="text" id="name" name="trainerName" onblur="validateName()" required>

            <label for="phoneNumber">Phone Number:</label>
            <span id="phoneError" style="color:red;"></span>
            <input type="text" id="phoneNumber" name="phoneNumber" onblur="validatePhone()" required>

            <label for="slot">Select Slot:</label>
            <select id="slot" name="slot" required>
                <option value="" disabled selected>Select Slot</option>
               <c:forEach var="slot" items="${timeslots}">
                   <option value="${slot.startTime}-${slot.endTime}">
                       ${slot.startTime} - ${slot.endTime}
                   </option>
               </c:forEach>
            </select>

            <button type="submit">Submit</button>
        </form>
    </div>
    <script>
     function validateName() {
               let name = document.getElementById("name").value.trim();
               let namePattern = /^[A-Za-z\s]{3,30}$/;
               document.getElementById("nameError").innerText = namePattern.test(name) ? "" : "Enter a valid name (3-30 alphabets).";
            }

      function validatePhone() {
                var phone = document.getElementById('phoneNumber').value.trim();
                var phonePattern = /^[6-9][0-9]{9}$/;
                if (!phonePattern.test(phone)) {
                    document.getElementById('phoneError').innerText = 'Please enter a valid 10-digit phone number.';
                    return false;
                }
                document.getElementById('phoneError').innerText = '';
                return true;
            }
     </script>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
