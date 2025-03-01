<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gym Dashboard</title>
   <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
      }

      body {
        display: flex;
        height: 100vh;
        width: 100vw;
        background-color: grey;
        justify-content: center;
        align-items: center;
      }


      .container {
        display: flex;
        width: 100%;
        height: 90vh;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
        overflow: hidden;
      }

      /* Left Section */
      .left-container {
        width: 45%;
        height: 100%;
        background: #ffffff;
        padding: 60px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-start;
        position: relative;
      }

      /* Gym Logo */
      .logo {
        position: absolute;
        top: 20px;
        left: 20px;
        width: 100px;
      }

      .content {
        text-align: left;
        max-width: 400px;
      }

      .content h1 {
        font-size: 28px;
        color: #333;
        margin-bottom: 15px;
      }

      .content p {
        font-size: 16px;
        color: #555;
        margin: 10px 0;
      }

      /* Login Button */
      .login-btn {
        margin-top: 20px;
        padding: 12px 24px;
        background-color: #ff4b2b;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
        text-align: center;
        width: 180px;
        text-transform: uppercase;
        font-weight: bold;
        transition: 0.3s;
      }

      .login-btn:hover {
        background-color: #ff416c;
      }

      .right-container {
        width: 65%;
        height: 100%;
        background: url('https://thumbs.dreamstime.com/z/woman-gym-running-treadmill-woman-gym-running-treadmill-fitness-women-gym-portrait-fit-workout-girl-110609553.jpg') no-repeat center center;
        background-size: cover;
      }


      /* Responsive Design */
      @media screen and (max-width: 900px) {
        .container {
          flex-direction: column;
          width: 100%;
          height: auto;
        }

        .left-container, .right-container {
          width: 100%;
          height: 50vh;
          text-align: center;
          padding: 40px;
          align-items: center;
        }

        .logo {
          position: static;
          margin-bottom: 15px;
        }

        .login-btn {
          width: 80%;
          max-width: 250px;
        }
      }
    </style>
</head>
<body>

  <div class="container">
    <!-- Left Section -->
    <div class="left-container">
      <img src="https://c8.alamy.com/comp/2GB2T17/initial-m-monogram-alphabet-with-a-barbell-lifting-vector-logo-design-modern-vector-logo-for-bodybuilding-gym-fitness-club-business-and-company-2GB2T17.jpg" alt="Gym Logo" class="logo">

      <div class="content">
        <h1>Welcome to Your Gym!</h1>
        <p>"Train like a beast, look like a beauty."</p>
        <p>"Your body achieves what your mind believes."</p>
        <p>"Every rep counts, every day matters."</p>
        <p>"Stay strong, stay focused, stay consistent."</p>
      </div>

      <a href="UserLogin.jsp" class="login-btn">Login</a>
    </div>

    <!-- Right Image Section -->
    <div class="right-container"></div>
  </div>

</body>
</html>
