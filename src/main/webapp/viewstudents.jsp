<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>View Students</title>
</head>
<body>


<h3 align="center">View All Students<h3/>
	Total Students:<c:out value="${count}"></c:out><br/><br/>
<table align="center" border=2 class="table table-striped">
	<tr>
	   
		 <th>ID</th>
		 <th>NAME</th>
		 <th>GENDER</th>
		 <th>DATE OF BIRTH</th>
		 <th>EMAIL</th>
		 <th>CONTACT NO</th>
		 <th>STATUS</th>
		 <th>GRADELEVEL</th>
		 
		 

	<tr/>
	
	<c:if test="${empty studentlist}">
    No students found.
    </c:if>
	
	<c:forEach items="${studentlist}" var="student">
	    <tr>
	        <td><c:out value="${student.id}" /></td>
			<td><c:out value="${student.name}" /></td>
			<td><c:out value="${student.gender}" /></td>
			<td><c:out value="${student.dateOfBirth}" /></td>
			<td><c:out value="${student.email}" /></td>
			<td><c:out value="${student.contact}" /></td>
			<td><c:out value="${student.status}" /></td>
			<td><c:out value="${student.gradeLevel}" /></td>
	    </tr>
	</c:forEach>

</table>
</body>
</html>