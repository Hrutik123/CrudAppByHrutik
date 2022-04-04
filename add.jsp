<%@   page import = "java.sql.*"  %>
<html>
<head>
	<title> Student CRUD by KS</title>
	<style> * {font-size:40px} </style>

</head>
<body>
<center>
	<h1> Add Page </h1>
	<a href="index.jsp"> Home Page </a>
	<br><br>
	<form>
		<input type="number" name="rno" placeholder="Enter Roll No. " required >
		<br><br>
		<input type="text" name="name" placeholder="Enter Name " required >
		<br><br>
		<input type = "Submit" name="b1">
	</form>

	<%
		if(request.getParameter("b1") != null){
			int rno = Integer.parseInt(request.getParameter("rno"));
			String name = request.getParameter("name");

			try{
				DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:ORCL", "system", "abc123");
				
				String sql ="insert into student_4jan2021 values(?,?)";
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setInt(1, rno);
				pst.setString(2, name);
				pst.executeUpdate();
				out.println("Record Added");
				con.close();
	
			
				}catch(SQLException e){
					out.println("issue" + e);
				}
		}
	
	%>

</center>
</body>
</html>