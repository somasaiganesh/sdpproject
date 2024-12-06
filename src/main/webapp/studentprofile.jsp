<%@ page import="com.klef.jfsd.springboot.model.Student" %>
<%
Student s=(Student)session.getAttribute("student");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Activities</title>
</head>
<body>

<h3 align="center">My Profile</h3>
ID:<%=s.getId()%><br/>
NAME:<%=s.getName()%><br/>
GENDER:<%=s.getGender()%><br/>
DOB:<%=s.getDateOfBirth()%><br/>
EMAIL:<%=s.getEmail()%><br/>
CONTACT:<%=s.getContact()%><br/>
STATUS:<%=s.getStatus()%><br/>
GRADE:<%=s.getGradeLevel()%><br/>

</body>
</html>