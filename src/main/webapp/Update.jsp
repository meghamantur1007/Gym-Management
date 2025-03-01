<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background: url('https://static.vecteezy.com/system/resources/thumbnails/035/987/056/small_2x/ai-generated-still-life-of-interior-modern-fitness-center-gym-with-a-workout-room-empty-space-for-text-ai-generated-photo.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            color: black;
            border-radius: 25px;
            padding: 30px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            width: 600px;
            max-height: 700px;
            overflow-y: auto;
        }

        .fitness-image {
            width: 6cm;
            height: 6cm;
            position: relative;
            top: -13cm;
            right: -30cm;
            animation: fadeIn 5s ease-in-out infinite;
            opacity: 0;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }

        label {
            font-size: 14px;
        }

        input.form-control, select.form-control {
            border-radius: 25px;
            height: 45px;
            font-size: 14px;
            border: 1px solid #ddd;
        }

        input.form-control:focus, select.form-control:focus {
            border-color: #1e3a8a;
            box-shadow: 0px 5px 10px #1e3a8a;
        }

        .btn {
            border-radius: 25px;
            height: 45px;
            font-size: 18px;
            background-color: black;
            color: white;
            border: none;
        }

        .btn:hover {
            background-color: #143362;
        }

        .form-check-inline {
            margin-right: 15px;
        }

        @media (max-width: 768px) {
            .form-container {
                width: 90%;
            }
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
             <li class="nav-item"><a class="nav-link" href="http://localhost:8080/Megha_Gym/registration">Registration</a></li>


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


    <div class="form-container">
        <!-- Search Form -->
        <h2 class="text-center"> Update Form</h2>


        <form action="http://localhost:8080/Megha_Gym/update" method="post">

        <div class="form-group d-flex align-items-center">
            <label for="email" class="mr-2">Search Email:</label>
            <input type="text" name="email" class="form-control mr-2" id="email" style="width: 60%;">
            <button type="button" class="btn btn-primary" onclick="searchEmail()">Search</button>
        </div>


            <div class="form-group">
                <label for="packages">Package:</label>
                <select name="packages" class="form-control" id="packages" value="${details.packages}">
                    <option value="" disabled selected>-Select a package-</option>
                    <option value="BRONZE" ${details.packages == 'BRONZE' ? 'selected' : ''}>BRONZE</option>
                    <option value="SILVER" ${details.packages == 'SILVER' ? 'selected' : ''}>SILVER</option>
                    <option value="GOLD" ${details.packages == 'GOLD' ? 'selected' : ''}>GOLD</option>
                    <option value="PLATINUM" ${details.packages == 'PLATINUM' ? 'selected' : ''}>PLATINUM</option>
                </select>
            </div>

            <div class="form-group">
                <label for="trainer">Trainer:</label>
                <div class="form-check form-check-inline">
                    <input type="radio" name="trainer" value="yes" class="form-check-input" id="trainerYes"
                        ${details.trainer == 'yes' ? 'checked' : ''}>
                    <label class="form-check-label" for="trainerYes">Yes</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="radio" name="trainer" value="no" class="form-check-input" id="trainerNo"
                        ${details.trainer == 'no' ? 'checked' : ''}>
                    <label class="form-check-label" for="trainerNo">No</label>
                </div>
            </div>

            <div class="form-group">
                <label for="id">Id:</label>
                <input type="number" name="id" class="form-control" id="id" value="${details.id}" readonly>
            </div>

            <div class="form-group">
                <label for="amount">Amount:</label>
                <input type="number" name="amount" class="form-control" id="amount" value="${details.amount}" readonly>
            </div>

           <div class="form-group">
               <label for="paidAmount">Paid Amount:</label>
               <input type="number" name="paidAmount" class="form-control" id="paidAmount" value="${details.paidAmount}">
               <small id="paidAmountError" class="text-danger"></small> <!-- Error message placeholder -->
           </div>


            <div class="form-group">
                <label for="balance">Balance:</label>
                <input type="number" name="balance" class="form-control" id="balance" value="${details.balance}" readonly>
            </div>

            <div class="form-group">
                <label for="installment">Installment:</label>
                <select name="installment" class="form-control" id="installment" value="${details.installment}">
                    <option value="1" ${details.installment == 1 ? 'selected' : ''}>1</option>
                    <option value="2" ${details.installment == 2 ? 'selected' : ''}>2</option>
                    <option value="4" ${details.installment == 3 ? 'selected' : ''}>3</option>
                    <option value="4" ${details.installment == 4 ? 'selected' : ''}>4</option>
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

          var finalAmount = 0; // Store the calculated final amount

          function updateAmounts(updateAmountField = true) {
              var selectedPackage = $('#packages').val();
              var trainerRequired = $('#trainerYes').is(':checked');
              var baseAmount = packageDetails[selectedPackage] || 0;

              if (updateAmountField) {
                  finalAmount = trainerRequired ? baseAmount + 1000 : baseAmount;
                  var discount = parseFloat($('#discount').val()) || 0;
                  var discountedAmount = finalAmount - (finalAmount * discount / 100);
                  finalAmount = discountedAmount * 12;
                  $('#amount').val(finalAmount.toFixed(2));
              }

              var paidAmount = parseFloat($('#paidAmount').val()) || 0;
              $('#balance').val((finalAmount - paidAmount).toFixed(2));
          }

          $('#packages, input[name="trainer"]').change(function () {
              updateAmounts(true); // Allow updating amount field
          });

          $('#paidAmount').on('input change', function () {
              updateAmounts(false); // Prevent updating amount field
          });

          $('#discount').on('input change', function () {
              updateAmounts(true); // Allow updating amount field
          });

          updateAmounts(true);

      });

       $('#paidAmount').on('input change', function () {
           var paidAmount = parseFloat($(this).val());
           var errorMessage = $('#paidAmountError');

           if (isNaN(paidAmount) || paidAmount < 1 || paidAmount > 50000) {
               errorMessage.text('Enter a valid amount');
               $(this).addClass('is-invalid'); // Bootstrap invalid class for styling
           } else {
               errorMessage.text('');
               $(this).removeClass('is-invalid'); // Remove the error styling
           }
       });


    </script>

     <script>
            function searchEmail() {
                var email = document.getElementById('email').value;
                if (email !== "") {
                    var form = document.createElement('form');
                    form.method = 'POST';
                    form.action = 'searchEmail'; // Adjust the URL for your search action

                    var emailInput = document.createElement('input');
                    emailInput.type = 'hidden';
                    emailInput.name = 'email';
                    emailInput.value = email;

                    form.appendChild(emailInput);
                    document.body.appendChild(form);
                    form.submit();
                }
            }
     </script>
</body>
</html>
