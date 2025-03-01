<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <title>Time Duration Calculator</title>
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
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(255, 255, 255, 0.2);
            text-align: center;
            height: 500px;
            width: 500px;
            border: 1px solid #fff;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        input {
            width: 90%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #fff;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
            background: #fff;
            color: #000;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        input[readonly] {
            background: #ddd;
            font-weight: bold;
        }
        button {
            width: 90%;
            padding: 12px;
            font-size: 18px;
            font-weight: bold;
            background-color: pink;
            color: black;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        button:hover {
            background-color:pink;
        }
        .error {
            color: red;
            font-size: 14px;
            display: none;
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

<<form action="http://localhost:8080/Megha_Gym/timeSlot" method="post">
     <span style="color:white; font-size: 24px; font-weight: bold;">${savedData}</span>

     <div class="container">
         <h2>Time Slot</h2>

         <label for="startTime">Start Time:</label>
         <input type="time" id="startTime" name="startTime" required>

         <label for="endTime">End Time:</label>
         <input type="time" id="endTime" name="endTime" required>

         <label for="duration">Duration (Minutes):</label>
         <input type="text" id="duration" name="duration" readonly>

         <button type="submit">Submit</button>
     </div>
 </form>

<script>
    document.getElementById("startTime").addEventListener("input", calculateDuration);
    document.getElementById("endTime").addEventListener("input", calculateDuration);

    function calculateDuration() {
        let start = document.getElementById("startTime").value;
        let end = document.getElementById("endTime").value;
        let durationField = document.getElementById("duration");

        if (start && end) {
            let [startHour, startMin] = start.split(":").map(Number);
            let [endHour, endMin] = end.split(":").map(Number);

            let startTotal = startHour * 60 + startMin;
            let endTotal = endHour * 60 + endMin;
            let diff = endTotal - startTotal;

            if (diff < 0) diff += 24 * 60; // Handle overnight cases

            durationField.value = diff + " min";
        } else {
            durationField.value = "";
        }
    }

</script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
