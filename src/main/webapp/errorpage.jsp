<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            text-align: center;
            padding: 50px;
        }
        .error-container {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
            padding: 20px;
            width: 60%;
            margin: 0 auto;
        }
        .error-container h1 {
            font-size: 36px;
        }
        .error-container p {
            font-size: 18px;
        }
        .back-button {
            background-color: #721c24;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .back-button:hover {
            background-color: #5a1c16;
        }
    </style>
</head>
<body>

    <div class="error-container">
        <h1>Error!</h1>
        <p>${error}</p>  <!-- Display the error message passed from the controller -->
        <a href="/studenthome" class="back-button">Go Back</a>  <!-- Link to go back to the form -->
    </div>

</body>
</html>
