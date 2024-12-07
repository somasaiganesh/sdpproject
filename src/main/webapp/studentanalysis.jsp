<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .section {
            margin-bottom: 30px;
        }
        .section h2 {
            color: #0073e6;
            margin-bottom: 10px;
        }
        .profile, .recommendations, .marks, .reports {
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        table th, table td {
            text-align: left;
            padding: 8px;
            border: 1px solid #ddd;
        }
        table th {
            background-color: #0073e6;
            color: white;
        }
        .profile img {
            display: block;
            max-width: 150px;
            height: auto;
            margin-bottom: 15px;
        }
        .no-data {
            color: #888;
            text-align: center;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Dashboard</h1>

        <!-- Student Profile Section -->
        <div class="section profile">
            <h2>My Profile</h2>
            <img src="data:image/png;base64,${profileImage}" alt="Profile Image">
            <p><strong>Name:</strong> ${student.name}</p>
            <p><strong>Gender:</strong> ${student.gender}</p>
            <p><strong>Date of Birth:</strong> ${student.dateOfBirth}</p>
            <p><strong>Email:</strong> ${student.email}</p>
            <p><strong>Contact:</strong> ${student.contact}</p>
            <p><strong>Status:</strong> ${student.status}</p>
            <p><strong>Grade Level:</strong> ${student.gradeLevel}</p>
        </div>

        <!-- Recommendations Section -->
        <div class="section recommendations">
            <h2>My Recommendations</h2>
            <c:if test="${not empty recommendations}">
                <table>
                    <thead>
                        <tr>
                            <th>Recommendation ID</th>
                            <th>Course Title</th>
                            <th>Recommendation Text</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="rec" items="${recommendations}">
                            <tr>
                                <td>${rec.recommendationId}</td>
                                <td>${rec.course}</td>
                                <td>${rec.recommendationText}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty recommendations}">
                <p class="no-data">No recommendations available.</p>
            </c:if>
        </div>

        <!-- Marks Section -->
        <div class="section marks">
            <h2>My Marks</h2>
            <c:if test="${not empty markslist}">
                <table>
                    <thead>
                        <tr>
                            <th>Subject</th>
                            <th>Marks</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="marks" items="${markslist}">
                            <tr>
                                <td>${marks.subject}</td>
                                <td>${marks.marks}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty markslist}">
                <p class="no-data">No marks available.</p>
            </c:if>
        </div>

        <!-- Reports Section -->
        <div class="section reports">
            <h2>My Reports</h2>
            <c:if test="${not empty percentage}">
                <table>
                    <thead>
                        <tr>
                            <th>Report ID</th>
                            <th>Percentage</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="report" items="${percentage}">
                            <tr>
                                <td>${report.reportId}</td>
                                <td>${report.percentage}%</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty percentage}">
                <p class="no-data">No reports available.</p>
            </c:if>
        </div>
    </div>
</body>
</html>
