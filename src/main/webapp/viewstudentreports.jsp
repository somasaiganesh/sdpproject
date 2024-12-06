<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Student Reports</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1, h2 {
            color: #2c3e50;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .error-message {
            color: red;
            font-weight: bold;
            margin-top: 20px;
        }

        .info-message {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Student Report</h1>

        <c:if test="${not empty student}">
            <h2>Student Details</h2>
            <table>
                <tr>
                    <th>Student Name</th>
                    <td>${student.name}</td> <!-- Display student name -->
                </tr>
                <tr>
                    <th>Student ID</th>
                    <td>${student.id}</td> <!-- Display student ID -->
                </tr>
                <tr>
                    <th>Grade Level</th>
                    <td>${student.gradeLevel}</td> <!-- Display student's grade level -->
                </tr>
                <tr>
                    <th>Status</th>
                    <td>${student.status}</td> <!-- Display student's status -->
                </tr>
            </table>

            <c:if test="${not empty student.reports}">
                <h2>Report Details</h2>
                <table>
                    <c:forEach var="report" items="${student.reports}">
                        <tr>
                            <th>Report ID</th>
                            <td>${report.reportId}</td> <!-- Display report ID -->
                        </tr>
                        <tr>
                            <th>Marks Obtained</th>
                            <td>${report.marks.marksObtained}</td> <!-- Display marks obtained -->
                        </tr>
                        <tr>
                            <th>Total Marks</th>
                            <td>${report.marks.totalMarks}</td> <!-- Display total marks -->
                        </tr>
                        <tr>
                            <th>Percentage</th>
                            <td>${report.percentage}%</td> <!-- Display percentage -->
                        </tr>
                        <tr>
                            <th>Remarks</th>
                            <td>${report.remarks}</td> <!-- Display general remarks -->
                        </tr>
                        <tr>
                            <th>Teacher Remarks</th>
                            <td>${report.teacherRemarks}</td> <!-- Display teacher remarks -->
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </c:if>

        <c:if test="${empty student}">
            <p class="error-message">No report found for this student.</p>
        </c:if>
    </div>

</body>
</html>
