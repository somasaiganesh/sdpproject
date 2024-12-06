<%@ page import="com.klef.jfsd.springboot.model.Student" %>
<%
Student s=(Student)session.getAttribute("student");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Update Profile</title>
</head>
<body>
    <%@ include file="studentnavbar.jsp" %> <!-- Including the main navbar JSP file -->
    <h3 align="center">Student Update Profile Form</h3>
	<div class="container">
    <form method="post" action="update">	
        <label>ID</label>
        <input type="number" class="form-control" name="sid" value="<%=s.getId()%>" readonly  required />
        <br/>
		<label>Enter Name</label>
		<input type="text" class="form-control" name="sname" value="<%=s.getName()%>"  required />
		<br/>
        <label>Select Gender</label>
        <input type="radio" class="form-check-input" name="sgender" value="Male" required />Male
        <input type="radio" class="form-check-input" name="sgender" value="Female" required />Female
        <input type="radio" class="form-check-input" name="sgender" value="Others" required />Others
        <br/>
        <label>Select Date of Birth</label>
        <input type="date"  name="sdob" class="form-control" required />
        <br/>
        <label>Enter Email ID</label>
        <input type="email" class="form-control" name="semail" value="<%=s.getEmail()%>" readonly required />
        <br/>
        <label>Enter Password</label>
        <input type="password" class="form-control" name="spwd" value="<%=s.getPassword()%>" required />
        <br/>
        <label>Enter Contact</label>
        <input type="text" class="form-control" name="scontact" value="<%=s.getContact()%>" required />
        <br/>
		<br/>
		 <input type="submit" class="btn btn-success"  value="Update" />
		 <input type="reset" class="btn btn-success" value="Clear" />
    </form>
	<div/>
</body>
</html>