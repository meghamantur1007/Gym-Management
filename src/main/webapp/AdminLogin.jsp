<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gym Login</title>
  <style>
    body {
      background: url('https://thumbs.dreamstime.com/z/woman-gym-running-treadmill-woman-gym-running-treadmill-fitness-women-gym-portrait-fit-workout-girl-110609553.jpg?ct=jpeg') no-repeat center fixed;
      background-size: cover;
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      background-color: #000;
      color: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      overflow: hidden;
    }

    .background-img {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: -1;
      object-fit: cover;
      opacity: 0.2;
    }

    form {
      background: rgba(0, 0, 0, 0.9);
      padding: 20px;
      border-radius: 10px;
      max-width: 400px;
      width: 100%;
      box-shadow: 0 4px 8px rgba(255, 255, 255, 0.2);
    }

    form label {
      display: block;
      margin-bottom: 8px;
      color: #fff;
    }

    form input {
      width: 100%;
      padding: 10px;
      margin-bottom: 5px;
      border: 1px solid #444;
      border-radius: 5px;
      background: #222;
      color: #fff;
      box-sizing: border-box;
    }

    form input::placeholder {
      color: #aaa;
    }

    .error {
      color: red;
      font-size: 14px;
      margin-bottom: 10px;
      display: block;
    }

    /* Updated Button Styling */
    form button {
      width: 100%;
      padding: 10px;
      border: none;
      border-radius: 5px;
      background-color: #d32f2f; /* Dark Red */
      color: white;
      font-size: 16px;
      cursor: pointer;
      font-weight: bold;
      text-transform: uppercase;
      transition: all 0.3s ease;
    }

    form button:hover {
      background-color: #b71c1c; /* Slightly darker red */
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #fff;
    }

    @media screen and (max-width: 500px) {
      form {
        padding: 15px;
      }
      form input {
        padding: 8px;
        font-size: 14px;
      }
      form button {
        padding: 8px;
        font-size: 14px;
      }
    }
  </style>
</head>
<body>
  <img src="https://img.freepik.com/premium-photo/fit-people-working-out-fitness-class_13339-173762.jpg?w=740" alt="Background" class="background-img">

  <form action="logIn" method="post">
    <h2>Login</h2>
    <span style="color:red">${error}</span>
    <div class="form-group">
      <label for="logInId">Email address</label>
      <input type="text" id="logInId" name="logInId" placeholder="Enter your email" onblur="validateEmail()" required>
      <span id="emailError" class="error"></span>
    </div>

    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" id="password" name="password" placeholder="Enter your password" required>
    </div>

    <button type="submit">Submit</button>
  </form>

  <script>
   function validateEmail() {
     var email = document.getElementById('logInId').value.trim();
     var emailError = document.getElementById('emailError');
     var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

     if (!regex.test(email)) {
       emailError.innerText = 'Please enter a valid email.';
       return false;
     }

     if (email.includes("GMAIL.COM")) {
       emailError.innerText = 'Enter Valid Email.';
       return false;
     }

     emailError.innerText = '';
     return true;
   }

  </script>

</body>
</html>
