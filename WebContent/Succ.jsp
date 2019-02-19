<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>跳转中</title>
</head>
<body>
	<p style="text-align: center;">
		成功！&nbsp;<span id="time">3</span>&nbsp;后将自动跳转到首页！若未能跳转,<a
			href="font.jsp">请点击</a>。
	</p>
	<script type="text/javascript">
		trans();
		function trans() {
			var time = document.getElementById("time").innerHTML;
			var t = setTimeout("trans()", 1000);
			if (time > 0) {
				time--;
				document.getElementById("time").innerHTML = time;
			} else {
				clearTimeout(t);
				window.location.href = "font.jsp";
			}
		}
	</script>
</body>
</html>