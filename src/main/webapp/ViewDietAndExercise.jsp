<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Diet & Workout Plan</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
           background: url('https://www.hussle.com/blog/wp-content/uploads/2020/12/Gym-structure-1080x675.png') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 25px;
            padding: 30px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
            width: 80%;
            max-width: 900px;
        }

        label {
            font-weight: bold;
            color: black;
        }

        pre {
            background: white;
            padding: 10px;
            border-radius: 10px;
            font-size: 16px;
            min-height: 300px;
            white-space: pre-line;
            border: 1px solid #ddd;
            overflow-x: auto;
        }

        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background: transparent;
            padding: 15px 0;
            z-index: 10;
        }

        .navbar .logo img {
            height: 60px;
            animation: bounce 5s ease-out infinite;
            filter: hue-rotate(180deg);
        }

        .navbar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: flex-end;
        }

        .navbar ul li {
            margin-right: 40px;
        }

        .navbar ul a {
            color: white;
            font-size: 21px;
            font-weight: 600;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .navbar ul li a:hover {
            background-color: black;
            color: white;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <a href="#" class="logo">
        <img src="https://c8.alamy.com/comp/2GB2T17/initial-m-monogram-alphabet-with-a-barbell-lifting-vector-logo-design-modern-vector-logo-for-bodybuilding-gym-fitness-club-business-and-company-2GB2T17.jpg" alt="Gym Logo"></a>
        <ul>
                <a class="nav-link font-weight-bold" href="index.jsp">Home</a>
        </ul>
    </nav>

    <div class="form-container">
            <div class="container">
                <div class="row">
                    <!-- Diet Plan Section -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="dietPlan">Diet Plan</label>
                            <pre id="dietPlan">${registrationEntity.dietPlan}</pre>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="workoutPlan">Workout Plan</label>
                            <pre id="workoutPlan">
                                <c:out value="${registrationEntity.exercise}" escapeXml="true"/>
                            </pre>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            function formatText(elementId) {
                let element = document.getElementById(elementId);
                if (element) {
                    let text = element.innerHTML;

                    text = text.replace(/\\n/g, "<br>").replace(/\+/g, "");

                    element.innerHTML = text;
                }
            }

            formatText("dietPlan");
            formatText("workoutPlan");
        });
    </script>
</body>
</html>
