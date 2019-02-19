<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎注册</title>
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
	border-color: none;
}

#div1 {
	width: 100%;
	height: 100%;
	position: absolute;
}

#div2 {
	width: 50%;
	height: 85%;
	position: absolute;
	top: 30px;
	left: 650px;
}

#div3 {
	height: 30%;
	position: absolute;
	top: 110px;
	left: 50px;
}

#div4 {
	height: 70%;
	position: absolute;
	top: 200px;
	left: -50px;
	background: blue;
	filter: alpha(Opacity = 60);
	-moz-opacity: 0.6;
	opacity: 0.7;
	width: 400px;
	color: white;
}

#div5 {
	position: absolute;
	bottom: -50px;
	left: 300px;
}
</style>
<script>
	function checkUsername() {
		var username = document.getElementById("username").value;
		var sp = document.getElementById("sp1");
		var wb = document.getElementById("username");
		var reg = /^[A-Za-z]+$/;
		if (username != "") {
			if (!reg.test(username)) {
				wb.style.borderColor = "red";
				sp.innerHTML = "用户名只能为字母！";
			} else {
				wb.style.borderColor = "black";
				sp.innerHTML = "";
			}
		}
	}
	function checkPassword() {
		var password = document.getElementById("password").value;
		var sp = document.getElementById("sp2");
		var wb = document.getElementById("password");
		var reg = /^[A-Za-z0-9]+$/;
		var len = password.length;
		if (password != "") {
			if (len < 6) {
				wb.style.borderColor = "red";
				sp.innerHTML = "密码不能低于6位！";
			} else if (len > 20) {
				wb.style.borderColor = "red";
				sp.innerHTML = "密码不能超过20位！";
			} else if (!reg.test(password)) {
				wb.style.borderColor = "red";
				sp.innerHTML = "密码只能为字母和数字！";
			} else {
				wb.style.borderColor = "black";
				sp.innerHTML = "";
			}
		}
	}
	function checkCFPassword() {
		var password1 = document.getElementById("cfpassword").value;
		var password2 = document.getElementById("password").value;
		var sp = document.getElementById("sp3");
		var wb = document.getElementById("cfpassword");
		var reg = /^[A-Za-z0-9]+$/;
		var len = password.length;
		if (password != "") {
			if (password1 != password2) {
				wb.style.borderColor = "red";
				sp.innerHTML = "两次密码不正确！";
			} else {
				wb.style.borderColor = "black";
				sp.innerHTML = "";
			}
		}
	}
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
<body onload="change()" style="background: url('./pictures/fight.jpg');">
	<div id="div1">
		<div id="div2">
			<div id="div3">
				<h2 style="color: white; font-family: 华文细黑; font-size: 40px;">WELCOME</h2>
			</div>
			<div align="center" id="div4">
				<form action="SignError.jsp" name="signForm" method="post"
					onsubmit="return check();">
					<hr>
					<span>必填信息</span>
					<hr>
					<table>
						<tr>
							<th>用户名：</th>
							<td><input type="text" name="username" id="username"
								value="" onblur="checkUsername()" /><span id="sp1"></span></td>
						</tr>
						<tr>
							<th>登录密码：</th>
							<td><input type="password" name="password" id="password"
								value="" onblur="checkPassword()" /><span id="sp2"></span></td>
						</tr>
						<tr>
							<th>重复登录密码：</th>
							<td><input type="password" name="cfpassword" id="cfpassword"
								value="" onblur="checkCFPassword()" /><span id="sp3"></span></td>
						</tr>
					</table>
					<br>

					<hr>
					<span>选填信息（请尽量完善下列信息）</span>
					<hr>
					<table>
						<tr>
							<th>性别：</th>
							<td><input type="radio" name="sex" id="male" value="0" />男 <input
								type="radio" name="sex" id="female" value="1" />女</td>
						</tr>
						<tr>
							<th>年龄：</th>
							<td><input type="text" name="age" id="age" value="" /></td>
						</tr>
						<tr>
							<th>验证码：<label id="yzm"></label></th>
							<td><input type="text" id="yz" /></td>
						</tr>
						<tr>
							<td><input type="button" id="dj" style="color: red;"
								value="换一换" onclick="change()" /></td>
						</tr>
					</table>
					<br /> <input type="submit" style="color: red;" value="注册" /> <br>
					<a href="font.jsp" style="text-decoration: none; color: white;">回到首页</a>
				</form>
			</div>

		</div>
		<div
			style="width: 300px; height: 50px; position: absolute; bottom: 20px; left: 48%">
		</div>
	</div>
</body>
</html>