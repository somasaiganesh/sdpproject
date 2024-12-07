<%@ page import="com.klef.jfsd.springboot.model.Recommendations" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Recommendations</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            margin: 2rem auto;
            padding: 1.5rem;
            max-width: 800px;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .recommendation {
            margin-bottom: 1.5rem;
            padding: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fefefe;
        }
        .recommendation h2 {
            margin: 0 0 0.5rem;
            color: #0073e6;
        }
        .recommendation p {
            margin: 0.2rem 0;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Recommendations</h1>

        <c:if test="${not empty recommendations}">
            <c:forEach var="rec" items="${recommendations}">
                <div class="recommendation">
                    <h2>${rec.course}</h2>
                    <p><strong>Recommendation ID:</strong> ${rec.recommendationId}</p>
                    <p><strong>Details:</strong> ${rec.recommendationText}</p>
                </div>
            </c:forEach>
        </c:if>

        <c:if test="${empty recommendations}">
            <p>No recommendations found for you.</p>
        </c:if>
    </div>
</body>
</html>
