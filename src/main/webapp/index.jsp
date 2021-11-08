<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<title>MAX Appoint Booking</title>
</head>
<body>
	<h1 align="center">
		<span style="color: blue">MAX MULTISPECIALITY HOSPITAL</span>
	</h1>
	<h2>
		<span style="color: blue">Doctor's Appointment Booking</span>
	</h2>
	<h3>
		<span>Enter the following deatils in order to book an appoint
			with the available doctors</span>
	</h3>
	<div class="login-form">
		<br />
		<form>
			<table>
				<tr>
					<td>Patient Name<span style=color:red>*</span></td>
					<td><input type="text" name="name" value=""
						placeholder="Enter Patient's name" required></td>
				</tr>
				<tr>
					<td>Mobile No<span style=color:red>*</span></td>
					<td><input type="text" name="no" value=""
						placeholder="Enter mobile number" required></td>
				</tr>
				<tr>
					<td>Disease<span style=color:red>*</span></td>
					<td><input type="text" name="dukh" value=""
						placeholder="Enter the Disease" required></td>
				</tr>
				<tr>
					<td>Dr. Name</td>
					<td><select name="doctorkanam">
							<option value="none" selected disabled hidden>Select
								Doctor's Name</option>
							<option>John Singh</option>
							<option>Sivraj G</option>
							<option>Viswa Vardhan Mehta</option>
							<option>Krishna Reddy</option>
							<option>Suvam Swain (Medicine)</option>
							<option>S N Rao</option>
					</select></td>
				</tr>
			</table>
			<br />
			<div class="sub">
				<input class="sub-btn" type="submit" name="submit"
					value="Book Appointment">
			</div>
		</form>
		<br />
		<div class="sub">
			<a href="appointmentdetails.jsp" class="ebtn">Edit/Delete
				Patient's information</a>
		</div>
	</div>
	<%
		String name = request.getParameter("name");
		String mobile = request.getParameter("no");
		String bimari = request.getParameter("dukh");
		String drname = request.getParameter("doctorkanam");
		// Now we will set a condition so that user does not leave a particular field empty 
		if (name != null && drname != null) {
			// Now we will declare driver and connection and statemnt variable that will be fixed in every page rat le bhalai
			Class.forName("com.mysql.jdbc.Driver"); // used to connect driver of mysql
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patientappointment", "root", "admin"); // used to create connection and storing value in con variable
			Statement stmt = con.createStatement();
			// used to create a variable name stmt that will hold mysql query later
			// Now make a sample database to how the demo watch carefully
			String query = "insert into patient(pname,pmob,bimar,drname) values('" + name + "','" + mobile + "','"
					+ bimari + "','" + drname + "')";
			// Now we will execute the query using stmt variable 
			int check = stmt.executeUpdate(query);
			if (check > 0) {
				out.print("inserted");
				response.sendRedirect("appointmentdetails.jsp");
			} else
				out.print("failed");
		}
	%>
</body>
</html>