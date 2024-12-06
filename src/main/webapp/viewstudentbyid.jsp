<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>EduAnalytics</title>
	<style>
		.container{
			text-align:center
		}
	</style>
</head>
<body>
    <%@ include file="teacher-navbar.jsp" %> <!-- Including the main navbar JSP file -->
    <h3 align="center"><u>View Student By ID<u></h3><br/>
	<div class="container">
    <form method="post" action="displaystudent">	
        <label>Select Student ID</label>
        <select name='id' class="form-select" required><br/>
			<option value="">----select----</option>
			<c:forEach items="${studentlist}" var="student">
				<option value="${student.id}">${student.id}-${student.name}</option>
			</c:forEach>
		</select>
		<br/><br/>
		 <input type="submit" class="btn btn-success"  value="View" />
	
    </form>
	</div>
</body>
</html>