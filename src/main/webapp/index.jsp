<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gym Management Login</title>
    <style>
        /* Background Styling */
        body {
            background: url('https://img.freepik.com/premium-photo/motivation-fitness-athlete-with-words-exercise-workout-cardio-training-sports-health-motivational-quote-strong-muscles-body-arms-with-ropes-gym-sport-studio_590464-154108.jpg') no-repeat center fixed;
            background-size: cover;
            font-family: 'Poppins', sans-serif;
            color: #fff;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        /* Container for Login */
        .container {
            background: rgba(0, 0, 0, 0.8);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(255, 0, 0, 0.3);
            max-width: 400px;
            width: 100%;
            text-align: center;
            border: 2px solid rgba(255, 0, 0, 0.5);
            margin-bottom: 30px;
        }

        h1 {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 25px;
            color: #ff0000;
            text-transform: uppercase;
        }

        /* Button Styling */
        button {
            background: white;
            color: black;
            border: none;
            padding: 12px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            width: 100%;
            font-weight: bold;
            text-transform: uppercase;
            margin-top: 10px;
        }

        button:hover {
            background: #ff0000;
            color: #fff;
        }

        /* Dashboard Section */
        .dashboard {
            display: flex;
            gap: 140px;
            justify-content: center;
            width: 80%;
            margin-top: 20px;
        }

        .box {
            background: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(255, 0, 0, 0.3);
            width: 250px;
            text-align: center;
            border: 1px solid rgba(255, 0, 0, 0.5);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .dashboard {
                flex-direction: column;
                align-items: center;
            }

            .box {
                width: 80%;
            }
        }
    </style>
</head>
<body>

    <!-- Login Section -->
    <div class="container">
        <h1>Login to Your Account</h1>

        <!-- Admin Login Button -->
        <button onclick="window.location.href='AdminLogin.jsp'">Admin Login</button>

        <!-- User Login Button -->
        <button onclick="window.location.href='UserFirstLogin.jsp'">User Login</button>
    </div>

    <!-- Dashboard Section -->
    <div class="dashboard">
        <div class="box">
            <h2>State-of-the-art Equipment</h2>
            <p>We provide the latest machines and tools for a complete workout.</p>
        </div>
        <div class="box">
            <h2>Expert Trainers</h2>
            <p>Get guidance from certified trainers to achieve your fitness goals.</p>
        </div>
        <div class="box">
            <h2>Flexible Membership</h2>
            <p>Choose a membership plan that suits your schedule and budget.</p>
        </div>
    </div>

</body>
</html>
