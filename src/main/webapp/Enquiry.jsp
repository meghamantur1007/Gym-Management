<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Enquiry - Megha Gym</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        body {
            background: url('https://snworksceo.imgix.net/cav/8d443aec-2090-4e9e-8793-6b95d830d89f.sized-1000x1000.JPG?w=1000')
                        no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            color: #333;
            padding-top: 80px;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 20px;
            width: 350px;
            box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.3);
            animation: fadeIn 0.8s ease-in-out;
            margin-top: 20px;
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
        .form-container h2 {
            font-size: 22px;
            font-weight: bold;
            color: #000;
            text-align: center;
            text-transform: uppercase;
            margin-bottom: 15px;
        }

        .form-group label {
            font-size: 14px;
            font-weight: bold;
            color: #555;
        }

        .form-control {
            border-radius: 30px;
            height: 40px;
            font-size: 14px;
            padding-left: 15px;
            border: 1px solid #ccc;
        }

        .form-control:focus {
            border-color: #f39c12;
            box-shadow: 0 0 10px rgba(243, 156, 18, 0.5);
        }

        .btn-submit {
            width: 100%;
            border-radius: 30px;
            font-size: 16px;
            font-weight: bold;
            padding: 12px;
            background: #f39c12;
            color: #000;
            border: none;
            transition: all 0.3s ease-in-out;
        }

        .btn-submit:hover {
            background: #e67e22;
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .form-container {
                width: 90%;
                padding: 20px;
            }

            .navbar {
                flex-direction: column;
                padding: 5px;
            }

            .navbar .nav-buttons {
                flex-direction: column;
                width: 100%;
                align-items: center;
            }

        }
    </style>

</head>
<body>
  <nav class="navbar navbar-expand-lg">
      <a class="navbar-brand" href="#">
          <img src="https://c8.alamy.com/comp/2GB2T17/initial-m-monogram-alphabet-with-a-barbell-lifting-vector-logo-design-modern-vector-logo-for-bodybuilding-gym-fitness-club-business-and-company-2GB2T17.jpg" alt="Megha Gym">
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
          <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
              <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
          </ul>
          <ul class="navbar-nav ml-auto">
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


    <!-- Enquiry Form -->
    <div class="form-container">
        <h2>Enquiry Form</h2>
        <span style="color:green">${success}</span>
        <form action="enquiry" method="post">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" name="name" class="form-control" id="name" value="${param.name}" onblur="validateName()" required>
                <span id="nameError" style="color:red"></span>
            </div>

            <div class="form-group">
                <label for="area">Area</label>
                <input type="text" name="area" class="form-control" id="area" value="${param.area}" onblur="validateArea()" required>
                <span id="areaError" style="color:red"></span>
            </div>

            <div class="form-group">
                <label for="ph">Phone</label>
                <input type="text" name="phoneNumber" class="form-control" id="ph" value="${param.phoneNumber}" onblur="validatePhone()" required>
                <span id="phoneError" style="color:red"></span>
            </div>

            <div class="form-group">
                <label for="distance">Distance</label>
                <input type="text" name="distance" class="form-control" id="distance" value="${param.distance}" onblur="validateDistance()" required>
                <span id="distanceError" style="color:red"></span>
            </div>

            <div class="form-group">
                <label for="age">Age</label>
                <input type="number" name="age" class="form-control" id="age" value="${param.age}" onblur="validateAge()" required>
                <span id="ageError" style="color:red"></span>
            </div>

            <button type="submit" class="btn-submit">Submit</button>
        </form>
    </div>

    <script>
        function validateName() {
            let name = document.getElementById("name").value.trim();
            let namePattern = /^[A-Za-z\s]{3,30}$/;
            document.getElementById("nameError").innerText = namePattern.test(name) ? "" : "Enter a valid name (3-30 alphabets).";
        }

        function validateArea() {
            let area = document.getElementById("area").value.trim();
            let areaPattern = /^[A-Za-z\s]{3,30}$/;
            document.getElementById("areaError").innerText = areaPattern.test(area) ? "" : "Enter a valid area (3-30 alphabets).";
        }

        function validatePhone() {
            let phone = document.getElementById("ph").value.trim();
            let phonePattern = /^[6-9]\d{9}$/;
            document.getElementById("phoneError").innerText = phonePattern.test(phone) ? "" : "Enter a valid 10-digit phone (starts with 6-9).";
        }

        function validateDistance() {
            let distance = parseFloat(document.getElementById("distance").value.trim());
            let isValid = distance >= 1 && distance <= 100;
            document.getElementById("distanceError").innerText = isValid ? "" : "Enter a valid distance between 1 and 100 km.";
        }

        function validateAge() {
            let age = document.getElementById("age").value.trim();
            document.getElementById("ageError").innerText = (age >= 10 && age <= 100) ? "" : "Age must be between 10 and 100.";
        }
    </script>

</body>
</html>
