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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Include Chart.js -->
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
            position: relative;
        }
        .hero h1 {
            font-size: 3rem;
            font-weight: bold;
        }
        .hero p {
            font-size: 1.2rem;
            margin: 20px 0;
        }
        .hero img {
            position: absolute;
            top: 10px;
            right: 20px;
            width: 150px;
            border-radius: 50%;
            border: 3px solid white;
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
        .card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 5px;
        }
        /* Chart container styling */
        .chart-container {
            width: 100%;
            height: 400px;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <a href="studenthome">Dashboard</a>
        <a href="viewstudentreports">View Reports</a>
        <a href="/student/${student.id}/marks">View Marks</a>


        <a href="viewrecommendations">View Recommendations</a>
        <a href="studentProfile">Student Profile</a>
        <a href="updateprofile">Update Profile</a>
        <a href="studentlogin">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="hero">
            <h1>Welcome, ${student.name}!</h1>
            <p>You're logged in to your EduAnalytics Dashboard. Use the navigation to track your performance, view reports, and receive recommendations to improve your learning.</p>
            <!-- Profile Image -->
             <a href="studentProfile">
            <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAJQAtwMBIgACEQEDEQH/xAAcAAEAAgIDAQAAAAAAAAAAAAAABgcBBQIECAP/xABGEAABAwMCAwUDCQQGCwEAAAABAAIDBAUGBxESITETIkFRYXGBkQgUMkJSYqGxwSOCktEzU3J0osIVFzRDREVzlLLS8Bb/xAAUAQEAAAAAAAAAAAAAAAAAAAAA/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8AvFERAREQERYJ2IQZWN+uyjuXZnZsTpTLdKj9oR+zp4xxSSHyA8PaeSp24Z1m2f1bqHGKKSlpHHbaE89vN0h5D3ILnvmY2CwtJulygid9gO3d8AoBdtd7LTkttlvqas+DnkRtPx5/gtfj+hofI2pym6STSO7zoaXfmfIyO6+7ZWNZsAxaztb8ys1Nxgf0kre0d8XboKrdrbkdYN7bjsZb4HZ8v5ALh/rZzwczjjNv7lKr4jpYIhtFDGwfdaAvpwN+yPggohmuN8oyBdMdjA357OfH+YKkdn1zx+qIbcaWqonHlxbB7fwVnzUVLO0tmp4pAeocwFRi9abYldw41NohjkP+8p/2TvwQbezZLZ75GH2q4U9Rv9Vrxv8ABbbfmqLvmidwt8jq3Ebq8yM5shnPBJ7A8cj7wurZdUMoxGsFtzK3TVELTw8ThwytHoejkF/otPjeS2rJaJtXaKpk8ZHeHRzD5Ob1BW3B3QZREQEREBERAREQERYO+3JAcdlXOp2ptNi0Trfbyye7Pb9H6sAPi719F2dVc8jxO2dhRua66VAIhb/Vj7Z9ih+k+nklbIMoyprppZXdrBDNz4ifrv8APw2CDX4dptdcwqxkGZTziCQ8bYnnvyj/ACtV42u10NqpGUtupo6eBnRkY2C7bQNttuXkuSDHCFlEQEREBOqIgxwhau/4/a7/AELqS60jKiMg7Fw7zfUHwW1RB52yXEMg0xuH+nMcqZZrcHbucOfAPJ48R6q1dPM/ocxouEEQ3GIDt6cnmfvN8x+Sl88UcsTo5WNfG4EOa4bgj1CoTUbCqzCLrFlGKF0VIyTiexn/AA5/9Cgv9p3HPqsqK6f5hTZfZWVMe0dXH3aiHf6Dv5FSkdOaDKIiAiIgIiIC1uRXilsNmq7nWu2hp4y8jfm4+AHqTyWxd0VHa93+esrqDFaAl0j3NfKxp+k9x2Y1BqsAslbqRmNTkl+b2lFDIHFp6OP1WD0HivQkbWsaGtaGtAAAHgtLhWPQ4zjlHa4g0viZvM8D6ch+kfit6gIiIC61dW01BA+orJ2QQsG7pJHBrQPaVrMtyShxe0zXGvk7reTIx9J7vABUbBS5Vq/d3zzSuprRC7YEg9nH6AfWd6oLBvWtmL257oqMVdxkB24oGBsf8TtvwC0jdf6Ev71hqQ3zFQ3f8lK8f0oxezxt7SiFbOOstR3vgPBSR2LWF0fAbPRcPl2LUEVsOsOK3Z7Yp55rfK7oKpuzd/7Q3Cn1PNHPG2SGQSMcNw9p3BHtVe5Lo/jd2ie6hgNuqdiQ+H6JPq1V1b7pk+kd7bQ3TjqLTKdwOZY8ebCeh9EHoxFr7JdaS926C4W+YSU87OJpHh6FbBAXwrKaGrp5KepibLDK0tex3QhfdEHnGuirdI9QWVEAc60VR34R0kiJ5t/tDwXoejqYayliqaZ4kilYHscPEHoojq1jAybEqmOGPiraVpnptupcBuWj2jkozoFkrrjY5rJUP3noSDHv1MZ/kUFtog6IgIiICIiDhPI2GF8rzs1jS4n0C8/aZQOzHVSvyCp78NM907N/P6MfwHP3K29T7ibXgV6qWu4XmnMbCPtPIaP/ACUP+TtbRT4xV15HeqqggH7rRt+aC127jrsuSIgLB+ksroX2q+Y2avq99jDTvkB8iGkoKHzKqqdSdS47DRyOFvo5DHxDoAP6R/x5BXvZ7VSWa2wUFvibFTQs4Wtb+Z9Sqc+TpQCepvF2l78u7Yg53me8SrzHRAREQYPQrR5bjlHlFknt1cwODxvE/bnG/wAHBb1YPRBQ2jV5q8Zy6rw66uIZK9wiDvqyjny9HDmr5HUqgdXov9B6oWe7wfs3SmKUkeJa8A/gr9YQ4bt6FByREQcXA9eS89xsOCa3tYw9nRVkuw8uCXw9zl6GVGfKNoTBV2e7w7tf3oi4eY7w/JBeQ6LK6Fhrm3KyW+ub0qKaOX+JoK76AiIgIiFBW+vk/Y6fSR+EtXEwj3l3+VbHRqAQae2zYbdo1z/iVqPlCNLsDYQOQro9/g5b7SNwdp7Z9j0h2PxQTBERAWryindVY5dKdu/FJSStG3ieEraLi8cQII3BHMFBS3ybapvzK8UhI4hIyQDx222V1DovO1tkfplqzUU9SCy2VTy1rujeyed2n93ovQ8cjJI2vjcHNcNwR0IQc0REBYKyutcK2CgopquqkbHDCwve5x2AAQUXrvIK3OrHQR957WMbsOu7njZX3G3gY1v2RsvPmExz6g6sTX+aM/MKR/b7OHIcPKNvx2d7l6EG/igyiIgKrPlDQCTDoJiN+yqm/jyVpqsvlAuAwXhPU1Me3xQSDSqc1GnliefCm4P4SW/opaobpA0t04sgPjE8/wCNymSAiIgIiIIHrbSOqtObiWN3dA6Kb3B43/AldfQisFVgMEe/ep5XxkeXPkplkdubdrBcbc/pU074/iFT/wAne5Opay8WKoPDK09qGE+I7rv0QXkiwCsoCLG6w57WtLnEBo6knbZBCdUcHjzC1B0IYy40oJp3kfS82n0Vc4FqRWYlMcdzGKdkMDuBkzmkvgHTYj6zfVTbLdXrBZHyQULnXGqbyLYT3Gn1cqpyK75LqVNG6lxxpEZ7ssEJ4tvIyHYEIPSFru9uu1MyotlZDVQu6OifxfHyXd3XmO16YZ7Sv+cUUD6KQ+Largd+C3bsT1aczgdcqnh/vvP4oLsvuRWixUjqi7V8NKwDkHu7zvY3qVRmXZhd9S7pHYMappWUBdu7fkZB9p/k3x2Wluel2cukdU1NE+rk25u+ch7j7yV3cYzC/wCnDDR1+OMZG5273yQlkjv3/FBeOB4nTYhY2UFOGuleeOeUDm9/8lJVBMQ1Qx7I3Mg7Y0da4bCCo5cR9HdCpzxIOSLAWUBU/wDKOrRHYrbRg96WoL9vQBW+TsqA1fkOTam2vH4Dxti4InAHoXnd3+HmguDAaR1DhNjpnjheyiiLh5EtBP5qQLhDGIomRtGzWNDQPYuaAiIgIiIMHovPGVNdp7q7DeImkUFVIJnbdDG7lIP1Xoc8woBrJihyLFZJaaPjraHeaIAc3ADvNHuQTyneyWJskTmujeA5rm9CD0K+iqrQvMGXSxix1ko+e0I4Yw7q+Lw+HRWmXDbf3oOtdLhS2uimra+ZsNNCzike47ABUDkOXZHqXeDZcYhlhtu+2wPCXN+1I7wHovvqVf67Pstp8UsBc6kjl4SW9HvH0nO+639FcGF4lb8TtEdFQt3k6zTH6UjvE7+SCLYVo/Y7LHHU3ZrbnXdd5G/smH7rfH2lWPFDHCxscLWxsbyDWDYALmBsOu6ygwRumwWUQY2XxqqSCrhdDVxRzxu5OZI0EFfdEFSZvoxbq1jqzGXCgrAdxT8+yefTxafZyUdwrUS7YjdBjubMm+bsdwCaXm+Hy3P1m+vgr8I325kbKGaj4JSZdai1oEdyiBNPP6/Zd5goJfTzRzwtlheHxPaHMeDuHA+K+qo7RXLqm13CXDr9xxvjkc2m7U82PHWP2cuSu/i/+2QdO93GntFrqrjWENgpYnSvPoBvsPU8lR+jFBPkmcXHKrg0kROc5pP9Y88tvYOS2OvOVGqdBidqcZZpHtdUtj6k791nt35qxtPsZZi+L0tv2Hb7cdQ4eMh6/Dogkw6BZREBERAREQFh3RZWCNxzQef9R8brcDymLKsdaY6R8vE5rRyjeerT90qXZHqZR1Omk13tkobWz7UvZb96KQjn7ttyrIulBS3Ohloq6Fs1PM0tex3QgrzFqRgNbh9WXx9pNZ5X7xTD6p+y/wAneqCzNA8WbQ2aTIKpgNVXd2Iu6ti3/Uq229FENOMlst8x2lhtEnA6mibG+lfsHx7Dbp4+1S8IMoiICIiAiIgLi7wXJYd0QUbrxjz7dXUWW20COXja2ocz7Y+g78NvgpLd9U6OhwKhu0T2vuVdDtDBv0eOTi7yAO65a05JZaTGKqz1cnbVtUzaKCMglh6hx8gFXGlenFRkk0NzvDHss8Tt2NduDUHfoPJvmUEk0bw6ouNyfmF/a6SR7y+m7Qc3O/rP5K7h0Xzp4o4YGRQsDI2Dha1vIAL6jkEBERAREQEREBERAXVuFFS3CkkpK2Bk0ErS17HjcELtIgoPLtMrzitwN7wiSd8cZ4zDEd5Ix6D6w9Ft8Q1rp5CyiyyJ1LO08JqY2nh3+83qFchCieWafY/lHFJW0jYaoj/aYRwv9/n70Egt9yo7nAyot1XDUwu5h8Lw8fh0XcHTmqBrdJssxuqNXid1dJsdwIpDE/b18CuEWououNkRX21uqWNHN01OWn+JnJB6CRUjR6/R8O1dY5Gu8eymB/MBds6+2nblZq7+Jn80FxrB9FR9br653dt1iJceQ7Wb9ACtdJmmp2Uns7RQSUkTuXFBBw7fvP8A0QXfd77bLJTGou1fBSxt5/tHgE+wdSqgyzWaor5DbMMpZnySEsbUOjLnu/sMC69p0avl3qRWZbdi0uO728ZkkP7x6K2MXwyx4vHw2qiY2YjvVDxxSO96Cs8E0lqqyrF5zdz3zPPGKV7uIk/fP6K6oIo4omxxRtZGwbNa0bBoXMAeSygIiICIiAiIgIiICIiAiIgIiIC4PY142e0OHqN0RBr6uw2iqG9TbKOb/qQtK6f/AORxsf8AIbd/27f5IiDv0lmtdKB81t1LDt07OJoXeaA0bNAA9AiIOSIiAiIgIiICIiAiIg//2Q==" alt="Student Profile Picture" />
          </a>
        </div>

        <!-- Dashboard Section -->
        <div class="container">
            <h2 class="mt-5">Dashboard Overview</h2>
            <p>Here you can monitor your academic progress, view detailed reports, and access personalized recommendations.</p>

            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card p-4">
                        <img src="data:image/jpeg;base64,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" alt="Marks Image" />
                        <h5 class="card-title">Your Marks</h5>
                        <p class="card-text">View your grades for different courses and monitor your performance over time.</p>
                        <a href="viewmarks" class="btn btn-primary">View Grades</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-4">
                        <img src="data:image/jpeg;base64,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" alt="Reports Image" />
                        <h5 class="card-title">Your Reports</h5>
                        <p class="card-text">Check out your academic reports and see your progress and areas for improvement.</p>
                        <a href="viewreports" class="btn btn-primary">View Reports</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-4">
                        <img src="data:image/jpeg;base64,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" alt="Recommendations Image" />
                        <h5 class="card-title">Recommendations</h5>
                        <p class="card-text">Get recommendations on how to improve your performance and excel in your studies.</p>
                        <a href="viewrecommendations" class="btn btn-primary">View Recommendations</a>
                    </div>
                </div>
            </div>

            <!-- Pie Charts Section -->
            <div class="row mt-4">
                <!-- Marks Pie Chart -->
                <div class="col-md-6">
                    <div class="card p-4">
                        <h5 class="card-title">Your Marks</h5>
                        <div class="chart-container">
                            <canvas id="marksChart"></canvas> <!-- Canvas for Marks Pie Chart -->
                        </div>
                    </div>
                </div>

                <!-- Performance Pie Chart -->
                <div class="col-md-6">
                    <div class="card p-4">
                        <h5 class="card-title">Course Performance</h5>
                        <div class="chart-container">
                            <canvas id="performanceChart"></canvas> <!-- Canvas for Performance Pie Chart -->
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

    <!-- Chart.js Scripts -->
    <script>
        // Pie Chart for Marks
        const marksChart = document.getElementById('marksChart').getContext('2d');
        const marksPieChart = new Chart(marksChart, {
            type: 'pie',
            data: {
                labels: ['Maths', 'Science', 'English', 'History'], // Example subjects
                datasets: [{
                    data: [80, 90, 75, 88], // Example marks
                    backgroundColor: ['#FF5733', '#33FF57', '#3357FF', '#FF33A1'],
                    borderColor: '#ffffff',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function(tooltipItem) {
                                return tooltipItem.label + ': ' + tooltipItem.raw + '%';
                            }
                        }
                    }
                }
            }
        });

        // Pie Chart for Performance
        const performanceChart = document.getElementById('performanceChart').getContext('2d');
        const performancePieChart = new Chart(performanceChart, {
            type: 'pie',
            data: {
                labels: ['Excellent', 'Good', 'Average', 'Poor'], // Example performance levels
                datasets: [{
                    data: [50, 30, 15, 5], // Example performance distribution
                    backgroundColor: ['#FFB933', '#33D9FF', '#FF5733', '#7A33FF'],
                    borderColor: '#ffffff',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function(tooltipItem) {
                                return tooltipItem.label + ': ' + tooltipItem.raw + '%';
                            }
                        }
                    }
                }
            }
        });
    </script>
</body>
</html>
