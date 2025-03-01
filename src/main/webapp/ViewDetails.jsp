<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Enquiry Details</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: url('https://snworksceo.imgix.net/cav/8d443aec-2090-4e9e-8793-6b95d830d89f.sized-1000x1000.JPG') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            color: #fff;
            padding-top: 70px; /* Adjusted for fixed navbar */
        }
        h2 {
            text-align: center;
            color: black;
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #fff;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #333;
            color: #fff;
            font-weight: bold;
        }
        td {
            background-color: #000;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #222;
        }
        .navbar {
            background-color: rgba(0, 0, 0, 0.95);
            padding: 2px 0;
            position: fixed;
            top: 0;
            width: 100%;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.7);
            z-index: 1000;
        }
        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            color: #f8f9fa !important;
            text-transform: uppercase;
        }
        .navbar-nav .nav-item {
            margin-left: 15px;
        }
        .navbar-nav .nav-link {
            font-size: 16px;
            font-weight: 500;
            color: #f8f9fa !important;
            padding: 8px 20px;
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
            <img src="https://c8.alamy.com/comp/2GB2T17/initial-m-monogram-alphabet-with-a-barbell-lifting-vector-logo-design-modern-vector-logo-for-bodybuilding-gym-fitness-club-business-and-company-2GB2T17.jpg" alt="Megha Gym" height="60">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Enquiry.jsp">Enquiry</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/Megha_Gym/follow">Follow</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/Megha_Gym/registration">Registration</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/Megha_Gym/update">Update</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/Megha_Gym/TimeSlot.jsp">Time Slot</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/Megha_Gym/trainerDetails">Trainer Details</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/Megha_Gym/assignSlot">Assign Slot</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="SlotAndTrainerName.jsp">Slot and TrainerName</a>
                </li>
            </ul>
        </div>
    </nav>

    <h2>View Details</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Phone Number</th>
                <th>Remarks</th>
                <th>Updated On</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${data}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${item.name}</td>
                    <td>${item.phoneNumber}</td>
                    <td>${item.remarks}</td>
                    <td>
                    <c:set var="formattedDate" value="${item.updatedOn.format(DateTimeFormatter.ofPattern('yyyy-MM-dd HH:mm:ss'))}" />
                        ${formattedDate}
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
