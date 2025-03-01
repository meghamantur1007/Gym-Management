<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gym Member Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        /* Global Styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: url('https://source.unsplash.com/1600x900/?gym,fitness') no-repeat center center fixed;
            background-size: cover;
            font-family: "Poppins", Arial, sans-serif;
            color: #333;
            text-align: center;
            padding-top: 80px; /* Prevents container from overlapping navbar */
        }

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

        .container {
            max-width: 700px;
            margin: 20px auto 0; /* Prevent navbar overlap */
            background: rgba(255, 255, 255, 0.85); /* Light color with slight transparency */
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 10px 40px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
        }

        h2 {
            font-size: 35px;
            margin-bottom: 20px;
            color: #2E8B57;
            font-weight: 700;
        }

        .profile-info {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 30px;
            background: rgba(255, 255, 255, 0.9);
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.1);
        }

        .profile-image img {
            border-radius: 50%;
            border: 4px solid #2E8B57;
            width: 160px;
            height: 160px;
            object-fit: cover;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        .profile-details {
            text-align: left;
            width: 100%;
            color: #333; /* Dark text for readability */
        }

        .profile-details p {
            font-size: 20px;
            margin: 12px 0;
            font-weight: 500;
            padding: 8px;
            background: rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            display: flex;
            justify-content: space-between;
        }

        .profile-details strong {
            color: #2E8B57;
            width: 40%;
        }

        .profile-details span {
            width: 60%;
            text-align: right;
            color: #333;
        }

        .btn {
            display: inline-block;
            width: 100%;
            background: linear-gradient(135deg, #2E8B57, #3CB371);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 20px;
            font-weight: bold;
            text-decoration: none;
            transition: all 0.3s ease-in-out;
            margin-top: 25px;
        }

        .btn:hover {
            background: linear-gradient(135deg, #3CB371, #2E8B57);
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 30px;
            }

            .profile-info {
                flex-direction: column;
                text-align: center;
            }

            .profile-image img {
                width: 130px;
                height: 130px;
            }

            h2 {
                font-size: 28px;
            }

            .profile-details p {
                font-size: 18px;
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
    <h2>Gym Member Profile</h2>

    <%-- Check if user data exists --%>
    <c:choose>
        <c:when test="${data != null}">
            <div class="profile-info">
                <div class="profile-image">
                    <img src="download?filePath=${data.filePath}" alt="Profile Picture">
                </div>
                <div class="profile-details">
                    <p><strong>Name:</strong> <span>${data.name}</span></p>
                    <p><strong>Email:</strong> <span>${data.email}</span></p>
                    <p><strong>Phone:</strong> <span>${data.phoneNumber}</span></p>
                    <p><strong>Age:</strong> <span>${data.age}</span></p>
                    <p><strong>Height:</strong> <span>${data.height} ft</span></p>
                    <p><strong>Weight:</strong> <span>${data.weight} kg</span></p>
                    <p><strong>Plan:</strong> <span>${data.plan}</span></p>
                    <p><strong>Trainer:</strong> <span>${data.trainerName}</span></p>
                    <p><strong>Slot:</strong> <span>${data.slot}</span></p>
                </div>
            </div>

            <a href="index.jsp" class="btn">Back to Dashboard</a>
        </c:when>
    </c:choose>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
