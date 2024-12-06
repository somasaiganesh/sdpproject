<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Student</title>
</head>
<body>
<%@ include file="teacher-navbar.jsp" %><br/><br/>
<h3 align="center">Display Student</h3>
ID:<c:out value="${s.id}"></c:out><br/>
NAME:<c:out value="${s.name}"></c:out><br/>
GENDER:<c:out value="${s.gender}"></c:out><br/>
DOB:<c:out value="${s.dateOfBirth}"></c:out><br/>
EMAIL:<c:out value="${s.email}"></c:out><br/>
CONTACT:<c:out value="${s.contact}"></c:out><br/>
STATUS:<c:out value="${s.status}"></c:out><br/>
GRADE:<c:out value="${s.gradeLevel}"></c:out><br/>
</body>
</html>