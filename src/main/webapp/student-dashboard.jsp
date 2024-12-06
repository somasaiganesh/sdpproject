<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard - EduAnalytics</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 250px;
            background-color: #343a40;
            padding-top: 20px;
            color: white;
        }
        .sidebar a {
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            display: block;
        }
        .sidebar a:hover {
            background-color: #4caf50;
        }
        /* Main content styling */
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }
        .hero {
            background: linear-gradient(135deg, #4caf50, #81c784);
            color: white;
            text-align: center;
            padding: 100px 20px;
        }
        .hero h1 {
            font-size: 3rem;
            font-weight: bold;
        }
        .hero p {
            font-size: 1.2rem;
            margin: 20px 0;
        }
        .footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 20px;
        }
        .card-title {
            font-size: 1.25rem;
        }
        .card-text {
            font-size: 1rem;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <a href="studenthome">Dashboard</a>
        <a href="viewstudentreports">View Reports</a>

        <a href="viewgrades">View Grades</a>
        <a href="viewrecommendations">View Recommendations</a>
        <a href="studentprofile">Student Profile</a>
        <a href="updateprofile">Update Profile</a>
        <a href="studentlogin">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="hero">
            <h1>Welcome, ${student.name}!</h1>
            <p>You're logged in to your EduAnalytics Dashboard. Use the navigation to track your performance, view reports, and receive recommendations to improve your learning.</p>
        </div>

        <!-- Dashboard Section -->
        <div class="container">
            <h2 class="mt-5">Dashboard Overview</h2>
            <p>Here you can monitor your academic progress, view detailed reports, and access personalized recommendations.</p>

            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card p-4">
                        <h5 class="card-title">Your Marks</h5>
                        <p class="card-text">View your grades for different courses and monitor your performance over time.</p>
                        <a href="viewgrades" class="btn btn-primary">View Grades</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-4">
                        <h5 class="card-title">Your Reports</h5>
                        <p class="card-text">Check out your academic reports and see your progress and areas for improvement.</p>
                        <a href="viewreports" class="btn btn-primary">View Reports</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-4">
                        <h5 class="card-title">Recommendations</h5>
                        <p class="card-text">Get recommendations on how to improve your performance and excel in your studies.</p>
                        <a href="viewrecommendations" class="btn btn-primary">View Recommendations</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2024 EduAnalytics. All Rights Reserved.</p>
        </footer>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
