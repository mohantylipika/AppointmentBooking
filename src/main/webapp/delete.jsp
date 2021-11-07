<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("d");
		int qid = Integer.parseInt(id);
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patientappointment", "root", "admin");
		Statement stmt = con.createStatement();
		String qry = "delete from patient where id='" + qid + "'";
		stmt.executeUpdate(qry);
		response.sendRedirect("appointmentdetails.jsp");
	%>
</body>
</html>
