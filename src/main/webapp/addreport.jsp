<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }
        h2 {
            text-align: center;
            margin-top: 20px;
        }
        form {
            width: 60%;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        select, textarea, button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        textarea {
            resize: none;
            height: 80px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        p {
            text-align: center;
            color: #d9534f;
            font-weight: bold;
        }
    </style>
</head>
<body>
   <div class="form-container">
        <h2>ADD REPORTS</h2>
        <form action="insertreport" method="post">
            <div class="form-group">
                <label for="sname">Name</label>
                <input type="text" id="sname" name="sname" required>
            </div>
            <div class="form-group">
                <label for="sgender">Gender</label>
                <select id="sgender" name="sgender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="sdob">Date Of Birth</label>
                <input type="date" id="sdob" name="sdob" required>
            </div>
            <div class="form-group">
                <label for="semail">Email</label>
                <input type="email" id="semail" name="semail" required>
            </div>
            <div class="form-group">
                <label for="spwd">Password</label>
                <input type="password" id="spwd" name="spwd" required>
            </div>
            <div class="form-group">
                <label for="scontact">Contact</label>
                <input type="tel" id="scontact" name="scontact" pattern="[0-9]{10}" title="Enter a valid 10-digit contact number" required>
            </div>
            <div class="form-group">
                <label for="sgradelevel">Grade Level</label>
                <select id="sgradelevel" name="sgradelevel" required>
                    <option value="Grade 1">Grade 1</option>
                    <option value="Grade 2">Grade 2</option>
                    <option value="Grade 3">Grade 3</option>
                    <option value="Grade 4">Grade 4</option>
                    <option value="Grade 5">Grade 5</option>
                </select>
            </div>
            <div class="form-group">
                <button type="submit">Register</button>
            </div>
        </form>
    </div>
    <c:if test="${not empty message}">
        <p>${message}</p>
    </c:if>
</body>
</html>
