<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

th {
	text-align: right;
}

span {
	align: center;
}

input {
	border-color: white;
	height: 30px;
	width: 200px;
}

#div1 {
	width: 100%;
	height: 100%;
	position: absolute;
}

#div2 {
	width: 37%;
	height: 75%;
	position: absolute;
	top: 30px;
	left: 650px;
}

#div3 {
	height: 30%;
	position: absolute;
	top: 160px;
	left: 70px;
}

#div4 {
	height: 50%;
	width: 400px;
	position: absolute;
	top: 250px;
	left: -10px;
	color: black;
	font-family: 华文细黑;
	filter: alpha(Opacity = 60);
	-moz-opacity: 1;
	opacity: 0.8;
	background: white;
}
</style>
<script type="text/javascript">
	function check() {
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		if (username == "") {
			alert("用户名不能为空！");
			return false;
		} else if (password == "") {
			alert("密码不能为空！");
			return false;
		} else {
			return checkYZM();
		}
	}
	function change() {
		var number = document.getElementById("yzm");
		var s = "";
		var i = 4;
		while (i--) {
			s += parseInt(Math.random() * 10);
		}
		number.innerHTML = s;
	}
	function checkYZM() {
		var number1 = parseInt(document.getElementById("yzm").innerHTML);
		var number2 = parseInt(document.getElementById("yz").value);
		if (number1 != number2) {
			alert("对不起，你输入的验证码有误！请重新输入！");
			return false;
		}
		return true;
	}
</script>
</head>
<body onload="change()"
	style="background: url('./pictures/person4.jpg');">
	<div id="div1">
		<div id="div2">
			<div id="div3">
				<h2 style="color: white; font-size: 40px">WELCOME!</h2>
				<br>
			</div>
			<div align="center" id="div4">
				<br>
				<form action="LoginError.jsp" name="loginForm" method="post"
					onsubmit="return check();">
					<table>
						<tr>
							<th></th>
							<td><input type="text" name="username" id="username"
								value="" placeholder="用户" /></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="password" name="password" id="password"
								value="" placeholder="密码" /></td>
						</tr>
						<tr>
							<th><label id="yzm"></label></th>
							<td><input type="text" id="yz" placeholder="验证码" /> <br>
								<input type="button" id="dj"
								style="color: red; background: pink;" value="换一换"
								onclick="change()" /></td>
						</tr>
					</table>
					<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="submit" style="color: red; background: pink" value="登录" /> <br>
					<br> <a href="font.jsp"
						style="text-decoration: none; color: red;">回到首页</a>
				</form>
			</div>

		</div>

	</div>
</body>
</html>