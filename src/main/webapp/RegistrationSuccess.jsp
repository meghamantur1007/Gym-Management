<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: url('https://snworksceo.imgix.net/cav/8d443aec-2090-4e9e-8793-6b95d830d89f.sized-1000x1000.JPG') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            margin: 0;
            padding-top: 80px; /* Adjusted for fixed navbar */
            color: #000;
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
        .container {
            text-align: center;
            margin-top: 20px;
        }
        .alert {
            display: inline-block;
            text-align: left;
            max-width: 500px;
            margin: 20px auto;
            opacity: 0.9;
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
              <li class="nav-item"><a class="nav-link" href="Enquiry.jsp">Enquiry</a></li>
               <li class="nav-item"><a class="nav-link" href="http://localhost:8080/Megha_Gym/follow">Follow</a></li>
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

    <!-- Main Content -->
    <div class="container">
        <div class="alert alert-success" role="alert">
            <h4 class="alert-heading">Registration Successful!</h4>
            <p>Your registration has been completed successfully.</p>
        </div>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
