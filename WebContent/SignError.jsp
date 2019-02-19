<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册失败</title>
</head>
<body>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		boolean flag = false;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rock", "root", "253612");
			stmt = conn.createStatement();
			String sql = "select * from userInfo";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				if (username.equals(rs.getString(1))) {
					flag = true;
					break;
				}
			}
			if (!flag) {
				String sql1 = "insert into userInfo(username,password) values('" + username + "','" + password
						+ "')";
				int count = stmt.executeUpdate(sql1);
				if (count == 1) {
					response.sendRedirect("Succ.jsp");
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			rs.close();
			stmt.close();
			conn.close();
		}
	%>
	<div align="center">
		<span
			style="font-size: 3em; font-family: Verdana, Arial, Helvetica; color: #FF3300; font-weight: bold;">Error!!!</span>
		<br />
		<br />
		<br />
		<p>
			<img alt="" src="./pictures/0.gif"> <br> <br> <span
				style="font-family: Verdana, Arial, Helvetica;">注册失败！该用户名已注册！</span>
		</p>
		<br /> <a href="Sign.jsp" style="text-decoration: none;">重新注册</a>
	</div>
</body>
</html>