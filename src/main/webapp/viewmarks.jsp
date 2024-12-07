<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Marks</title>
    <style>
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        h1 {
            text-align: center;
        }
        .no-data {
            text-align: center;
            font-size: 16px;
            margin-top: 20px;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            font-size: 16px;
            color: #007BFF;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Student Marks</h1>
    <c:choose>
        <!-- Check if marksList is not empty -->
        <c:when test="${not empty marksList}">
            <table>
                <thead>
                    <tr>
                        <th>Course</th>
                        <th>Marks Obtained</th>
                        <th>Total Marks</th>
                        <th>Remarks</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Iterate through marksList and display each mark -->
                    <c:forEach var="mark" items="${marksList}">
                        <tr>
                            <td>${mark.course.courseTitle}</td> <!-- Course title -->
                            <td>${mark.marksObtained}</td> <!-- Marks obtained -->
                            <td>${mark.totalMarks}</td> <!-- Total marks -->
                            <td>${mark.remarks}</td> <!-- Remarks -->
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <!-- If marksList is empty, show a no-data message -->
        <c:otherwise>
            <div class="no-data">No marks available for this student.</div>
        </c:otherwise>
    </c:choose>
    <!-- Back to Dashboard link -->
    <a href="studenthome" class="back-link">Back to Dashboard</a>
</body>
</html>
