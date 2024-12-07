<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recommendations</title>
    <style>
        /* General styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
        }

        /* Header styles */
        header {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 20px;
        }

        header h1 {
            margin: 0;
            font-size: 2rem;
        }

        /* Section styles */
        section {
            max-width: 900px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        section h2 {
            color: #4CAF50;
            border-bottom: 3px solid #4CAF50;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        /* List styles */
        ul {
            list-style: none;
            padding: 0;
        }

        ul li {
            background: #f7f7f7;
            margin: 10px 0;
            padding: 15px;
            border-left: 5px solid #4CAF50;
            border-radius: 5px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        ul li:hover {
            transform: scale(1.02);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        ul li strong {
            font-weight: bold;
            color: #555;
        }

        ul li p {
            margin: 5px 0 0;
            color: #666;
        }

        p {
            text-align: center;
            color: #777;
            font-style: italic;
        }

        /* Footer styles */
        footer {
            text-align: center;
            margin-top: 20px;
            padding: 15px 0;
            background-color: #4CAF50;
            color: white;
            font-size: 0.9rem;
        }

        footer a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        footer a:hover {
            text-decoration: underline;
        }

        /* Responsive styles */
        @media (max-width: 600px) {
            section {
                padding: 15px;
                margin: 10px;
            }

            ul li {
                padding: 10px;
            }

            header h1 {
                font-size: 1.5rem;
            }

            section h2 {
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>Recommendations for ${student.name}</h1>
    </header>
    <section>
        <h2>Your Recommendations</h2>
        <c:if test="${not empty recommendationsList}">
            <ul>
                <c:forEach var="recommendation" items="${recommendationsList}">
                    <li>
                        <strong>Course Title:</strong> ${recommendation.courseTitle} <br>
                        <p><strong>Recommendation:</strong> ${recommendation.recommendationText}</p>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
        <c:if test="${empty recommendationsList}">
            <p>No recommendations available at the moment.</p>
        </c:if>
    </section>
    <footer>
        <a href="/studenthome">Back to Dashboard</a>
    </footer>
</body>
</html>
