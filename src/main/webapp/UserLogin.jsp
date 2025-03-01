<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gym Login</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <style>
    /* Fullscreen Gym Background */
    body {
      background: url('https://www.hussle.com/blog/wp-content/uploads/2020/12/Gym-structure-1080x675.png')
                  no-repeat center center fixed;
      background-size: cover;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      font-family: "Poppins", Arial, sans-serif;
      position: relative;
    }

    /* Dark Overlay for Readability */
    body::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.6); /* Dark overlay */
      z-index: 0;
    }

    /* NAVIGATION BAR */
    .navbar {
      background-color: rgba(20, 20, 20, 0.95);
      padding: 15px 0;
      position: fixed;
      top: 0;
      width: 100%;
      box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.7);
      z-index: 1000;
    }

    .navbar-brand {
      font-size: 24px;
      font-weight: bold;
      color: white !important;
      text-transform: uppercase;
    }

    .navbar-nav {
      margin: auto;
    }

    .navbar-nav .nav-item {
      margin: 0 25px;
    }

    .navbar-nav .nav-link {
      font-size: 18px;
      font-weight: bold;
      color: white !important;
      padding: 12px 30px;
      transition: all 0.3s ease-in-out;
      border-radius: 50px;
    }

    .navbar-nav .nav-link:hover {
      background-color: rgba(255, 255, 255, 0.2);
      color: white !important;
    }

    /* Glassmorphism Login Box */
    .login-container {
      position: relative;
      z-index: 1;
      background: rgba(255, 255, 255, 0.15);
      backdrop-filter: blur(12px);
      padding: 50px;
      border-radius: 15px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
      width: 80%;  /* Set width to 80% of the screen */
      max-width: 800px;  /* Limit max width to 800px */
      height: 500px;  /* Keep height fixed */
      text-align: center;
      color: white;
    }

    .form-group {
      margin-bottom: 20px;
      text-align: left;
    }

    .form-group label {
      display: block;
      font-weight: bold;
      color: white;
    }

    .form-group input,
    .login-btn {
      width: 100%;
      padding: 14px;
      border: none;
      border-radius: 8px;
      font-size: 18px;
      box-sizing: border-box;
      display: block;
    }

    .login-btn {
      background: linear-gradient(45deg, #ff416c, #ff4b2b);
      color: white;
      cursor: pointer;
      transition: 0.3s;
      font-weight: bold;
      text-align: center;
      font-size: 18px;
    }

    .login-btn:hover {
      opacity: 0.8;
    }

    .forgot-password {
      display: block;
      margin-top: 10px;
      color: white;
      text-decoration: none;
    }

    .forgot-password:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<!-- NAVIGATION BAR -->
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

<!-- LOGIN FORM -->
<div class="login-container">
  <h2>Login</h2>
  <form action="userLogin" method="post">
    <div class="form-group">
      <label for="email">Email Address</label>
      <input type="text" name="email" placeholder="Enter your login ID" required>
    </div>
    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" name="password" placeholder="Enter your password" required>
    </div>
    <button type="submit" class="login-btn">Login</button>
    <a href="ForgotPassword.jsp" class="forgot-password">Forgot Password?</a>
  </form>
</div>

<!-- BOOTSTRAP SCRIPTS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
