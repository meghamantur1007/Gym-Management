<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        /* Global Styles */
        body {
           background: url('https://www.hussle.com/blog/wp-content/uploads/2020/12/Gym-structure-1080x675.png') no-repeat center center fixed;
           background-size: cover;
            font-family: "Poppins", Arial, sans-serif;
            color: #333;
            text-align: center;
            padding-top: 80px; /* Avoids navbar overlap */
            position: relative;
        }

        /* Dark Overlay for readability */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Slightly dark overlay */
            z-index: -1;
        }

        /* Navbar */
        .navbar {
            background-color: rgba(20, 20, 20, 0.9); /* Dark gray */
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
        }

        .navbar-nav {
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .navbar-nav .nav-item {
            margin: 0 15px;
        }

        .navbar-nav .nav-link {
            font-size: 18px;
            font-weight: bold;
            color: white !important;
            padding: 10px 20px;
            transition: all 0.3s ease-in-out;
            border-radius: 50px;
        }

        .navbar-nav .nav-link:hover {
            background-color: #007BFF; /* Blue hover */
            color: white !important;
        }

        /* Profile Container */
        .container {
            max-width: 500px;
            margin: 20px auto 0;
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease-in-out;
        }

        h2, h3 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #007BFF; /* Cool Blue */
            font-weight: 700;
        }

        .form-group {
            text-align: left;
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #aaa;
            border-radius: 8px;
            background: #fff;
            color: #333;
            box-sizing: border-box;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input:focus {
            outline: none;
            border-color: #007BFF; /* Blue highlight */
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.4);
        }

        input[type="file"] {
            background: #f5f5f5;
            color: #333;
            border: 1px solid #bbb;
        }

        /* Buttons */
        button {
            display: inline-block;
            width: 100%;
            background: linear-gradient(135deg, #007BFF, #00C8FF);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            transition: all 0.3s ease-in-out;
            margin-top: 20px;
        }

        button:hover {
            background: linear-gradient(135deg, #00C8FF, #007BFF);
            transform: scale(1.05);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 30px;
            }

            h2, h3 {
                font-size: 22px;
            }

            .form-group label {
                font-size: 14px;
            }

            input {
                font-size: 14px;
                padding: 10px;
            }

            button {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">
        <img src="https://c8.alamy.com/comp/2GB2T17/initial-m-monogram-alphabet-with-a-barbell-lifting-vector-logo-design-modern-vector-logo-for-bodybuilding-gym-fitness-club-business-and-company-2GB2T17.jpg"
             alt="Megha Gym" height="50">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link font-weight-bold" href="UserLogin.jsp">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link font-weight-bold" href="index.jsp">Home</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <h2>Welcome, ${email}</h2>

    <!-- Form for updating profile -->
    <h3>Update Your Profile</h3>
    <form action="updateUserProfile" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
        <input type="hidden" name="email" value="${email}">

        <div class="form-group">
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" value="${data.age}" required onblur="validateAge()">
            <small id="ageError" class="text-danger"></small>
        </div>

        <div class="form-group">
            <label for="height">Height (ft):</label>
            <input type="number" step="0.1" id="height" name="height" value="${data.height}" required onblur="validateHeight()">
            <small id="heightError" class="text-danger"></small>
        </div>

        <div class="form-group">
            <label for="weight">Weight (kg):</label>
            <input type="number" step="0.1" id="weight" name="weight" value="${data.weight}" required onblur="validateWeight()">
            <small id="weightError" class="text-danger"></small>
        </div>

        <div class="form-group">
            <label for="plan">Plan:</label>
            <select id="plan" name="plan" class="form-control" value="${data.plan}" required onblur="validatePlan()">
                <option value="">-- Select Plan --</option>
                <option value="Weight Loss" ${data.plan == 'Weight Loss' ? 'selected' : ''}>Weight Loss</option>
                <option value="Weight Gain" ${data.plan == 'Weight Gain' ? 'selected' : ''}>Weight Gain</option>
            </select>

        </div>

        <div class="form-group">
            <label for="picture">Profile Picture:</label>
            <input type="file" id="picture" name="picture" accept="image/*" onblur="validatePicture()">
            <small id="pictureError" class="text-danger"></small>
        </div>

        <button type="submit">Save Changes</button>
    </form>
</div>

<script>
    function validateAge() {
        let age = document.getElementById("age").value;
        if (age < 10 || age > 100) {
            document.getElementById("ageError").innerText = "Age must be between 10 and 100.";
            return false;
        }
        document.getElementById("ageError").innerText = "";
        return true;
    }

    function validateHeight() {
        let height = document.getElementById("height").value;
        if (height < 3 || height > 8) {
            document.getElementById("heightError").innerText = "Height must be between 3ft and 8ft.";
            return false;
        }
        document.getElementById("heightError").innerText = "";
        return true;
    }

    function validateWeight() {
        let weight = document.getElementById("weight").value;
        if (weight < 30 || weight > 300) {
            document.getElementById("weightError").innerText = "Weight must be between 30kg and 300kg.";
            return false;
        }
        document.getElementById("weightError").innerText = "";
        return true;
    }



    function validatePicture() {
        let picture = document.getElementById("picture").files[0];
        if (picture) {
            let allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
            if (!allowedExtensions.test(picture.name)) {
                document.getElementById("pictureError").innerText = "Only JPG, JPEG, PNG, and GIF files are allowed.";
                return false;
            } else if (picture.size > 2 * 1024 * 1024) { // 2MB limit
                document.getElementById("pictureError").innerText = "File size must be less than 2MB.";
                return false;
            }
        }
        document.getElementById("pictureError").innerText = "";
        return true;
    }

    function validateForm() {
        let valid = true;
        if (!validateAge()) valid = false;
        if (!validateHeight()) valid = false;
        if (!validateWeight()) valid = false;
        if (!validatePlan()) valid = false;
        if (!validatePicture()) valid = false;
        return valid;
    }
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
