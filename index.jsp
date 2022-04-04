<%@   page import = "java.sql.*"  %>

<%
	if(request.getParameter("drno") != null){
			
			try{
				DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:ORCL", "system", "abc123");
				
				String sql ="delete from student_4jan2021 where rno = ?";
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setInt(1, Integer.parseInt(request.getParameter("drno")));
				pst.executeUpdate();
				con.close();
	
			
				}catch(SQLException e){
					out.println("issue" + e);
				}
		}
%>
<html>
<head>
	<title> Student CRUD by KS</title>
	<style> * {font-size:40px} </style>

</head>
<body>
<center>
	<h1> Home Page </h1>
	<a href="add.jsp"> Add Student </a>
	<br><br>
	
	<table border = "2">
		<tr>
			<th> Rno </th>
			<th> Name </th>
			<th> Delete </th>
		</tr>
	<%
		try{
				DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:ORCL", "system", "abc123");
				
				String sql = "select  * from student_4jan2021";
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while (rs.next()){
					int rno  = rs.getInt(1);
					String name = rs.getString(2);

	%>

			<tr align = "center">
				<td>		<%= rno %>      </td>
				<td>		<%= name %>     </td>
				<td>		<a href="?drno=<%= rno %>" onclick="return confirm('r u sure  ??? ')"    > Delete </a>  </td>
			</tr>

	<%
			}
				con.close();
				}catch(SQLException e){
					out.println("issue" + e);
				}
	%>
		
	</table>

	
</center>
</body>
</html>