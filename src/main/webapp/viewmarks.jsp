<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marks</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
        }

        section {
            padding: 20px;
            max-width: 900px;
            margin: 20px auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #4CAF50;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            padding: 15px;
            margin: 10px 0;
            background-color: #f7f7f7;
            border-left: 5px solid #4CAF50;
            border-radius: 5px;
        }

        footer {
            text-align: center;
            background-color: #4CAF50;
            color: white;
            padding: 15px 0;
        }

        footer a {
            color: white;
            text-decoration: none;
        }

    </style>
</head>
<body>
    <header>
        <h1>Marks for Student</h1>
    </header>
     
    <section>
        <h2>Your Marks</h2>

        <c:if test="${not empty marksList}">
            <ul>
                <c:forEach var="mark" items="${marksList}">
                    <li>
                        <strong>Course:</strong> ${mark.course.coursetitle} <br>
                        <strong>Marks Obtained:</strong> ${mark.marksObtained} <br>
                        <strong>Total Marks:</strong> ${mark.totalMarks} <br>
                        <strong>Remarks:</strong> ${mark.remarks} <br>
                    </li>
                </c:forEach>
            </ul>
        </c:if>

        <c:if test="${empty marksList}">
            <p>No marks available at the moment.</p>
        </c:if>
    </section>

    <footer>
        <a href="/studenthome">Back to Dashboard</a>
    </footer>

</body>
</html>
