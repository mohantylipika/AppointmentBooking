<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Appointment Details</title>
</head>
<body>
	<h3>Appointment Details</h3>
	<table border="1">
		<tr>
			<th>Appointment Id</th>
			<th>Patient Name</th>
			<th>Disease</th>
			<th>Doctor Name</th>
			<th>Patient No</th>
		</tr>
		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patientappointment", "root", "admin");
			Statement stmt = con.createStatement();
			ResultSet result = null;
			String qry = "select * from patient";
			result = stmt.executeQuery(qry);
			while (result.next()) {
		%>
		<tr>
			<td><%=result.getInt("id")%></td>
			<td><%=result.getString("pname")%></td>
			<td><%=result.getString("bimar")%></td>
			<td><%=result.getString("drname")%></td>
			<td><%=result.getString("pmob")%></td>
			<td><a href='edit.jsp?e=<%=result.getInt("id")%>'>Edit</a></td>
			<td><a href='delete.jsp?d=<%=result.getInt("id")%>'>Delete</a></td>
		</tr>
		<%
			}
			con.close();
		%>
	</table>
</body>
</html>