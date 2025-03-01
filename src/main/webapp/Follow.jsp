<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Follow-Up Records</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        let currentPage = 1;
        const rowsPerPage = 5;

        function paginateTable() {
            const tableRows = document.querySelectorAll("#tableBody tr");
            let totalRows = tableRows.length;
            let totalPages = Math.ceil(totalRows / rowsPerPage);

            tableRows.forEach((row, index) => {
                row.style.display = (index >= (currentPage - 1) * rowsPerPage && index < currentPage * rowsPerPage) ? "" : "none";
            });

            document.getElementById("pageNumber").innerText = currentPage;
            document.getElementById("prevPage").style.visibility = currentPage === 1 ? "hidden" : "visible";
            document.getElementById("nextPage").style.visibility = currentPage === totalPages ? "hidden" : "visible";
        }

        function changePage(direction) {
            currentPage += direction;
            paginateTable();
        }

        function searchName() {
            let input = document.getElementById("searchName").value.toUpperCase();
            let rows = document.querySelectorAll("#tableBody tr");
            rows.forEach(row => {
                let nameCell = row.cells[1];
                row.style.display = nameCell && nameCell.innerText.toUpperCase().includes(input) ? "" : "none";
            });
        }

        function validateTextField(field, errorId) {
            let value = field.innerText.trim();
            let isValid = /^[A-Za-z\s]+$/.test(value);
            document.getElementById(errorId).style.display = isValid ? "none" : "block";
            return isValid;
        }

        function updateHiddenFields(enquiryId) {
            let statusField = document.getElementById('status-' + enquiryId);
            let descriptionField = document.getElementById('description-' + enquiryId);

            if (!validateTextField(statusField, "status-error-" + enquiryId) || !validateTextField(descriptionField, "description-error-" + enquiryId)) {
                return false;
            }

            document.getElementById('hidden-status-' + enquiryId).value = statusField.innerText.trim();
            document.getElementById('hidden-description-' + enquiryId).value = descriptionField.innerText.trim();
            return true;
        }

        document.addEventListener("DOMContentLoaded", function () {
            document.querySelectorAll(".editable").forEach(field => {
                field.addEventListener("blur", function () {
                    validateTextField(field, field.dataset.errorId);
                });
            });
            paginateTable();
        });
    </script>
</head>
<body>
    <div class="container">
        <h1>Follow-Up Records</h1>
        <div class="search-container">
            <input type="text" id="searchName" placeholder="Search by Name" class="form-control" />
            <button type="button" class="btn btn-primary search-btn" onclick="searchName()">Search</button>
        </div>

        <table id="enquiryTable" class="table table-dark table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Area</th>
                    <th>Phone Number</th>
                    <th>Distance</th>
                    <th>Age</th>
                    <th>Status</th>
                    <th>Description</th>
                    <th>Action</th>
                    <th>View Details</th>
                </tr>
            </thead>
            <tbody id="tableBody">
                <c:forEach var="enquiry" items="${enquiries}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${enquiry.name}</td>
                        <td>${enquiry.area}</td>
                        <td>${enquiry.phoneNumber}</td>
                        <td>${enquiry.distance}</td>
                        <td>${enquiry.age}</td>
                        <td>
                            <div id="status-${enquiry.id}" class="editable" contenteditable="true" data-error-id="status-error-${enquiry.id}">
                                ${enquiry.status}
                            </div>
                            <div class="error-message" id="status-error-${enquiry.id}" style="display:none; color:red;">Only letters allowed!</div>
                        </td>
                        <td>
                            <div id="description-${enquiry.id}" class="editable" contenteditable="true" data-error-id="description-error-${enquiry.id}">
                                ${enquiry.description}
                            </div>
                            <div class="error-message" id="description-error-${enquiry.id}" style="display:none; color:red;">Only letters allowed!</div>
                        </td>
                        <td>
                            <form action="/Megha_Gym/updateEnquiry" method="POST" onsubmit="return updateHiddenFields(${enquiry.id})">
                                <input type="hidden" name="id" value="${enquiry.id}" />
                                <input type="hidden" name="name" value="${enquiry.name}" />
                                <input type="hidden" name="phoneNumber" value="${enquiry.phoneNumber}" />


                                <input type="hidden" name="status" id="hidden-status-${enquiry.id}" value="${enquiry.status}" />
                                <input type="hidden" name="description" id="hidden-description-${enquiry.id}" value="${enquiry.description}" />
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </td>
                        <td>
                            <form action="/Megha_Gym/viewDetails" method="GET">
                                <input type="hidden" name="id" value="${enquiry.id}" />
                                <button type="submit" class="btn btn-info">View</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="pagination">
            <span id="prevPage" class="page-link" onclick="changePage(-1)">Prev</span>
            <span id="pageNumber" class="page-link">1</span>
            <span id="nextPage" class="page-link" onclick="changePage(1)">Next</span>
        </div>
    </div>
</body>
</html>
