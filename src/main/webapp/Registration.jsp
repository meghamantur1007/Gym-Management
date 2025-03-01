<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
      <style>
            body {
                background: url('https://snworksceo.imgix.net/cav/8d443aec-2090-4e9e-8793-6b95d830d89f.sized-1000x1000.JPG?w=1000') no-repeat center center fixed;
                background-size: cover;
                background-attachment: fixed;
                background-color: #000;
                color: #fff;
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
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


            .form-container {
                background-color: #fff;
                border-radius: 25px;
                padding: 20px;
                box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.5);
                width: 700px;
                box-sizing: border-box;
                margin-top: 20px; /* Space between navbar and form */
                flex: 1;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            label {
                color: black;
                font-size: 14px;
            }

            input.form-control:focus,
            select.form-control:focus {
                border-color: #000;
                box-shadow: 0px 5px 10px black;
            }

            .form-group input,
            .form-group select {
                border-radius: 25px;
                height: 40px;
                font-size: 14px;
                border: 1px solid #ddd;
                width: 100%;
                padding: 8px;
                background-color: #f9f9f9;
                color: black;
            }

            .btn {
                font-size: 16px;
                height: 45px;
                border-radius: 20px;
                width: 100%;
                background-color: #000;
                color: #fff;
                border: none;
            }

            .form-group {
                margin-bottom: 1rem;
            }

            .form-check-label {
                font-size: 14px;
            }

            .row {
                margin-bottom: 1rem;
            }

            @media (max-width: 767px) {
                .form-container {
                    width: 90%;
                    padding: 15px;
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


        <c:forEach items="${error}" var="i">
            <span style="color:red">${i.message}</span>
        </c:forEach>
    <div class="form-container">
        <h2 class="text-center" style="color:black; margin-bottom: 1.5rem;">Registration Form</h2>
        <form action="registration" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="name">Name:</label>
                    <input type="text" name="name" class="form-control" id="name" onblur="validateName()" required>
                    <span id="nameError" style="color: red;"></span>
                </div>
                <div class="form-group col-md-6">
                    <label for="email">Email:</label>
                    <input type="text" name="email" class="form-control" id="email" onblur="validateEmail()" required>
                    <span id="emailError" style="color: red;"></span>
                </div>
            </div>

            <!-- Phone -->
            <div class="form-group">
                <label for="ph">Phone:</label>
                <input type="text" name="phoneNumber" class="form-control" id="ph" onblur="validatePhone()" required>
                <span id="phoneError" style="color: red;"></span>
            </div>

            <!-- Packages -->
            <div class="form-group">
                <label for="packages">Package:</label>
                <select name="packages" class="form-control" id="packages" required>
                    <option value="" disabled selected>-Select a package-</option>
                    <c:forEach items="${packages}" var="pkg">
                        <option value="${pkg}">${pkg}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Trainer -->
            <div class="form-group">
                <label for="trainer">Trainer:</label>
                <div class="form-check form-check-inline">
                    <input type="radio" name="trainer" value="yes" class="form-check-input" id="trainerYes" required>
                    <label class="form-check-label" for="trainerYes">Yes</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="radio" name="trainer" value="no" class="form-check-input" id="trainerNo" required>
                    <label class="form-check-label" for="trainerNo">No</label>
                </div>
            </div>

            <!-- Gym Name -->
            <div class="form-group">
                <label for="gymName">Gym Name:</label>
                <select name="gymName" class="form-control" id="gymName" required>
                    <option value="" disabled selected>-Select branch-</option>
                    <c:forEach items="${gymNames}" var="gym">
                        <option value="${gym}">${gym}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="row">
                <div class="form-group col-md-6">
                    <label for="amount">Amount:</label>
                    <input type="number" name="amount" class="form-control" id="amount" required readonly>
                </div>
                <div class="form-group col-md-6">
                    <label for="discount">Discount (%):</label>
                    <input type="number" name="discount" class="form-control" id="discount" onblur="validateDiscount()" required>
                    <span id="discountError" style="color: red;"></span>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-6">
                    <label for="paidAmount">Paid Amount:</label>
                    <input type="number" name="paidAmount" class="form-control" id="paidAmount" onblur="validatePaidAmount()" required>
                    <span id="paidAmountError" style="color: red;"></span>
                </div>
                <div class="form-group col-md-6">
                    <label for="balance">Balance:</label>
                    <input type="number" name="balance" class="form-control" id="balance" required readonly>
                </div>
            </div>

            <div class="form-group col-md-6">
                <label for="installment">Installment:</label>
                <select name="installment" class="form-control" id="installment" required>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                </select>
            </div>


            <button type="submit" class="btn btn-primary btn-block">Submit</button>
        </form>
    </div>

    <script>
       $(document).ready(function () {
           var packageDetails = {
               'BRONZE': 1000,
               'SILVER': 1500,
               'GOLD': 2000,
               'PLATINUM': 3000
           };

           function updateAmounts() {
               var selectedPackage = $('#packages').val();
               var trainerRequired = $('#trainerYes').is(':checked');
               var baseAmount = packageDetails[selectedPackage] || 0;

               var finalAmount = trainerRequired ? baseAmount + 1000 : baseAmount;

               var discount = parseFloat($('#discount').val()) || 0;
               var discountedAmount = finalAmount - (finalAmount * discount / 100);
               $('#amount').val(discountedAmount * 12);

               var paidAmount = parseFloat($('#paidAmount').val()) || 0;
               $('#balance').val((discountedAmount * 12 - paidAmount).toFixed(2));
           }

           $('#packages').change(function () {
               updateAmounts();
           });

           $('input[name="trainer"]').change(function () {
               updateAmounts();
           });

           $('#paidAmount').on('input change', function () {
               updateAmounts();
           });

           $('#discount').on('input change', function () {
               updateAmounts();
           });

           updateAmounts();
       });

       function validateForm() {
           return validateName() && validateEmail() && validatePhone() && validateDiscount() && validatePaidAmount();
       }


        function validateName() {
           let name = document.getElementById("name").value.trim();
           let namePattern = /^[A-Za-z\s]{3,30}$/;
           document.getElementById("nameError").innerText = namePattern.test(name) ? "" : "Enter a valid name (3-30 alphabets).";
        }

      function validateEmail() {
          var email = document.getElementById('email').value.trim();
          // Regular expression to match a valid email ending with @gmail.com
          var emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
          if (!emailPattern.test(email)) {
              document.getElementById('emailError').innerText = 'Please enter a valid Gmail address ending with @gmail.com';
              return false;
          }
          document.getElementById('emailError').innerText = '';
          return true;
      }


       function validatePhone() {
           var phone = document.getElementById('ph').value.trim();
           var phonePattern = /^[6-9][0-9]{9}$/;
           if (!phonePattern.test(phone)) {
               document.getElementById('phoneError').innerText = 'Please enter a valid 10-digit phone number.';
               return false;
           }
           document.getElementById('phoneError').innerText = '';
           return true;
       }


      function validateDiscount() {
          var discount = document.getElementById('discount').value.trim();
          if (discount === "" || isNaN(discount) || discount < 0 || discount > 100) {
              document.getElementById('discountError').innerText = 'Discount should be between 0 and 100.';
              return false;
          }
          document.getElementById('discountError').innerText = '';
          return true;
      }

      function validatePaidAmount() {
          var paidAmount = document.getElementById('paidAmount').value.trim();
          if (paidAmount === "" || isNaN(paidAmount) ||  paidAmount <= 0 || paidAmount > 60000) {
              document.getElementById('paidAmountError').innerText = 'Enter a valid amount (greater than 0 and up to 60000).';
              return false;
          }
          document.getElementById('paidAmountError').innerText = '';
          return true;
      }

      function validateForm() {
         return validateName() && validateEmail() && validatePhone() && validateDiscount() && validatePaidAmount();
        }

   </script>
</body>
</html>
