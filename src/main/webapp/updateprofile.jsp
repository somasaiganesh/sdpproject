<%@ page import="com.klef.jfsd.springboot.model.Student" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 20px;
        }
        .update-container {
            width: 50%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .update-container h1 {
            text-align: center;
            color: #343a40;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }
        .btn-submit {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="update-container">
        <h1>Update Profile</h1>
        <c:if test="${not empty student}">
            <form action="update" method="post">
                <div class="form-group">
                    <label for="sname">Name</label>
                    <input type="text" id="sname" name="sname" value="${student.name}" required />
                </div>
                <div class="form-group">
                    <label for="sgender">Gender</label>
                    <select id="sgender" name="sgender">
                        <option value="Male" ${student.gender == 'Male' ? 'selected' : ''}>Male</option>
                        <option value="Female" ${student.gender == 'Female' ? 'selected' : ''}>Female</option>
                        <option value="Other" ${student.gender == 'Other' ? 'selected' : ''}>Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="sdob">Date of Birth</label>
                    <input type="date" id="sdob" name="sdob" value="${student.dateOfBirth}" required />
                </div>
                <div class="form-group">
                    <label for="semail">Email</label>
                    <input type="email" id="semail" name="semail" value="${student.email}" required />
                </div>
                <div class="form-group">
                    <label for="scontact">Contact</label>
                    <input type="text" id="scontact" name="scontact" value="${student.contact}" required />
                </div>
                <div class="form-group">
                    <label for="spwd">Password</label>
                    <input type="password" id="spwd" name="spwd" value="${student.password}" required />
                </div>
                <div class="form-group">
                    <label for="sgradelevel">Grade Level</label>
                    <input type="text" id="sgradelevel" name="sgradelevel" value="${student.gradeLevel}" required />
                </div>
                <button type="submit" class="btn-submit">Update Profile</button>
            </form>
        </c:if>
        <c:if test="${empty student}">
            <p>Student data not available. Please log in again.</p>
        </c:if>
    </div>
</body>
</html>