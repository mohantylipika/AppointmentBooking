<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patientappointment", "root", "admin");
		Statement stmt = con.createStatement();
		ResultSet result = null;
		PreparedStatement ps = null;
		String id = request.getParameter("e");
		int qid = Integer.parseInt(id);
		String qry = "select * from patient where Id='" + qid + "'";
		result = stmt.executeQuery(qry);
		while (result.next()) {
	%>
	<h1>Appointment Details</h1>
	<form action="" method="post">
		<input type="hidden" name="qid" value='<%=result.getString("Id")%>' />
		<label>Name :</label> <input type="text" name="pnam"
			value='<%=result.getString("pname")%>'><br> <br> <label>Mobile
			No :</label> <input type="text" name="pmob"
			value='<%=result.getString("pmob")%>'><br> <br> <label>Disease
			:</label> <input type="text" name="bim"
			value='<%=result.getString("bimar")%>'><br> <br> <label>Dr.
			Name :</label> <input type="text" name="dr"
			value='<%=result.getString("drname")%>'><br> <br>
		<button type="submit">Update Appointment</button>
	</form>
	<%
		}
		String a = request.getParameter("pnam");
		String b = request.getParameter("pmob");
		String c = request.getParameter("bim");
		String d = request.getParameter("dr");
		if (a != null) {
			String query = "update patient set pname=?,pmob=?,bimar=?,drname=? where Id='" + qid + "'";
			ps = con.prepareStatement(query);
			ps.setString(1, a);
			ps.setString(2, b);
			ps.setString(3, c);
			ps.setString(4, d);
			ps.executeUpdate();
			response.sendRedirect("appointmentdetails.jsp");
		}
	%>
</body>
</html>
