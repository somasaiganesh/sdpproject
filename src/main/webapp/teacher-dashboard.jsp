<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Dashboard - EduAnalytics</title>
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
        .sidebar a img {
            width: 20px;
            height: 20px;
            margin-right: 10px;
            vertical-align: middle;
        }
        .sidebar a:hover {
            background-color: #4caf50;
        }
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
        .hero img {
            max-width: 150px;
            margin-bottom: 20px;
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
        .card img {
            width: 100%;
            height: auto;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <a href="teacherhome"><img src="icons/dashboard.png" alt="Dashboard">Dashboard</a>
        <a href="viewstudentreports"><img src="icons/reports.png" alt="Reports">Student Reports</a>
        <a href="addreport"><img src="icons/reports.png" alt="Add Report">Add Student Reports</a>
        <a href="addrecommendation"><img src="icons/recommendations.png" alt="Recommendations">Add Student Recommendations</a>
        <a href="addstudent"><img src="icons/add students.png" alt="Add Student">Add Students</a>
        <a href="viewstudents"><img src="icons/view students.png" alt="View Students">View Students</a>
        <a href="deletestudent"><img src="icons/delete students.png" alt="Delete Student">Delete Students</a>
        <a href="viewstudentbyid"><img src="icons/search.png" alt="Search">View Students By ID</a>
        <a href="addmarks"><img src="icons/search.png" alt="add marks">Add Marks</a>
        <a href="/logout"><img src="icons/logout.png" alt="Logout">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="hero">
            <img src="data:image/jpeg;base64,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" alt="Welcome Image">
            <h1>Welcome, Teacher!</h1>
            <p>You're logged in to the EduAnalytics Dashboard. Use the navigation to manage student performance and generate reports.</p>
            <a href="/viewstudentreports" class="btn btn-light btn-lg">View Student Reports</a>
        </div>

        <!-- Dashboard Section -->
        <div class="container">
            <h2 class="mt-5">Dashboard Overview</h2>
            <p>Here you can track student progress, generate detailed reports, and get insights to improve learning outcomes.</p>

            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card p-4">
                        <img src="data:image/jpeg;base64,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" alt="Performance">
                        <h5 class="card-title">Student Performance</h5>
                        <p class="card-text">Monitor student grades, attendance, and overall progress.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-4">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuUkCKNwXYC2Us600xwLjE2LMFXlbiF-Wg4A&s" alt="Reports">
                        <h5 class="card-title">Generate Reports</h5>
                        <p class="card-text">Create custom reports based on student performance data.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-4">
                        <img src="https://www.teachermagazine.com/assets/images/teacher/_1200x630_crop_center-center_82_none/Using_rubrics_to_enhance_student_achievement_2020-11-11-213506.jpg?mtime=1605130506" alt="Improvement">
                        <h5 class="card-title">Improvement Tracker</h5>
                        <p class="card-text">Identify students who need extra support and track improvements.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
          <div class="row">
            <div class="col-xl-3 col-xxl-3 col-sm-6">
              <div class="widget-stat card bg-primary">
                <div class="card-body">
                  <div class="media">
                    <span class="me-3">
                      <i class="la la-users"></i>
                    </span>
                    <div class="media-body text-white">
                      <p class="mb-1">Total Students</p>
                      <h3 class="text-white">80</h3>
                      <div class="progress mb-2 bg-white">
                        <div
                          class="progress-bar progress-animated bg-white"
                          style="width: 80%"
                        ></div>
                      </div>
                      <small>80% Increase in 20 Days</small>
                    </div>
                  </div>
                </div>
              </div>
            </div>
             <div class="col-xl-3 col-xxl-3 col-sm-6">
                    <div class="widget-stat card bg-secondary">
                      <div class="card-body">
                        <div class="media">
                          <span class="me-3">
                            <i class="la la-graduation-cap"></i>
                          </span>
                          <div class="media-body text-white">
                            <p class="mb-1">Total Performance</p>
                            <h3 class="text-white">85%</h3>
                            <div class="progress mb-2 bg-white">
                              <div
                                class="progress-bar progress-animated bg-white"
                                style="width: 76%"
                              ></div>
                            </div>
                            <small>5% Increase in 2 months</small>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
               <div class="col-xl-3 col-xxl-3 col-sm-6">
                    <div class="widget-stat card bg-warning">
                      <div class="card-body">
                        <div class="media">
                          <span class="me-3">
                            <i class="la la-user"></i>
                          </span>
                          <div class="media-body text-white">
                            <p class="mb-1">students passed</p>
                            <h3 class="text-white">45</h3>
                            <div class="progress mb-2 bg-white">
                              <div
                                class="progress-bar progress-animated bg-white"
                                style="width: 50%"
                              ></div>
                            </div>
                            <small>50% Increase in 25 Days</small>
                          </div>
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
