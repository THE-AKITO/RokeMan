<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>排行榜</title>
</head>
<style>
*{
	margin: 0;
	padding: 0;
}
.strip {
	height: 80px;
	background: url('./pictures/line2.png') center center;
}

.line {
	height: 2px;
	background: #EC5549;
}

.wide {
	height: 400px;
	width: 400px;
	float: left;
	text-align: center;
}

.wider {
	height: 400px;
	width: 400px;
	float: left;
	text-align: center;
}

table {
	width: 380px;
	align: center;
	color: red;
}

td {
	cursor: pointer;
	width: 40px;
	height: 40px;
}

p {
	color: red;
	font-size: 20px;
}

#main {
	width: 100%;
	height: 520px;
	background: url('./pictures/rankb2.jpg') center center;
}

.top {
	text-align: center;
	font-family: 幼圆;
	color: gold;
	position: absolute;
	margin: 0 auto;
	left: 210px;
	top: 70px;
	font-size: 40px;
}
#container{
	position: relative;
	width: 800px;
	height: 660px;
	margin: 0 auto;
	background: white;
}
body{
	background: rgba(0,0,0,.5);
}
tr:hover {
	color: black;
	font-size: 35px;
}
</style>
<body>
	<div id="container">
		<div class="strip"></div>
	<div class="line"></div>
	<br>
	<h1 class="top">-----英雄榜-----</h1>
	<br>
	<div id="main">

		<div class="wide">
			<%
				String username = (String) session.getAttribute("username");
				String score33 = request.getParameter("score");
				Connection conn = null;
				Statement stmt = null;
				ResultSet rsa = null;
				int rsd;
				String sql2;
				int count = 1;
				try {
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rock", "root", "253612");
					stmt = conn.createStatement();
					String sql = "select * from score order by scores desc";
					if(score33 != null){
						sql2 = "insert into score(username,scores) values('" + username + "'," + score33 + ")";
						rsd = stmt.executeUpdate(sql2);
					}
					rsa = stmt.executeQuery(sql);
					
					
					
			%> 
			<br>
			<p>英雄总榜</p>
			<p>---------------------</p>
			<table>
				<%
					while (rsa.next() && count <= 10) {
							String name = rsa.getString(1);
							int score = rsa.getInt(2);
				%>
				<tr>
					<td>
						<%
							out.println(count);
						%>
					</td>
					<td>
						<%
							out.println(name);
						%>
					</td>
					<td>
						<%
							out.println(score);
						%>
					</td>
					<%
						count++;
					%>
				</tr>

				<%
					}

					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {

						stmt.close();
						conn.close();
					}
				%>
			</table>

		</div>

		<div class="wider">
			<%
				username = (String) session.getAttribute("username");
				conn = null;
				stmt = null;
				ResultSet rs = null;
				int coun = 1;
				try {
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rock", "root", "253612");
					stmt = conn.createStatement();
					String sql = "select * from score order by scores desc";
					rs = stmt.executeQuery(sql);
			%>
			<br>
			<p>个人总榜</p>
			<p>---------------------</p>
			<table>
				<%
					while (rs.next() && coun <= 5) {
							if (username.equals(rs.getString(1))) {
								int score = rs.getInt(2);
								String name = rs.getString(1);
				%>
				<tr>
					<td>
						<%
							out.println(coun);
						%>
					</td>
					<td>
						<%
							out.println(name);
						%>
					</td>
					<td>
						<%
							out.println(score);
						%>
					</td>
					<%
						coun++;
					%>
				</tr>
				<%
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
			</table>
		</div>
	</div>
	</div>	
</body>
</html>