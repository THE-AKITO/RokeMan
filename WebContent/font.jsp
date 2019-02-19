<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>某某未来知名游戏网站</title>
</head>
<style>
#div1 {
	height: 60px;
	background: #1891ED;
	box-shadow: 1px 1px 10px rgba(0, 0, 0, .5);
}

#div2a {
	width: 100%;
	height: 620px;
}

#div2 {
	width: 50%;
	height: 660px;
	float: left;
}

#div2b2 {
	width: 25%;
	height: 660px;
	background: url('./pictures/roke.png') center center/cover;
	float: left;
}

#div2b {
	width: 25%;
	height: 660px;
	background: url('./pictures/roke2.png') center center/cover;
	float: left;
}

#div1_1 {
	height: 60px;
	width: 200px;
	float: left;
	background: #3448A1;
}

#div1_2 {
	height: 60px;
	width: 179px;
	float: left;
	background: url('./pictures/1.png');
}
a{
	text-decoration: none;
}
body {
	margin: 0;
	border: none;
}

.button {
	height: 60px;
	width: 150px;
	font-size: 18px;
	background: #1891ED;
	border: none;
	font-family: Lato, Helvetica Neue For Number, -apple-system,
		BlinkMacSystemFont, Segoe UI, Roboto, PingFang SC, Hiragino Sans GB,
		Microsoft YaHei, Helvetica Neue, Helvetica, Arial, sans-serif;
	color: white;
}

.stripe {
	height: 5px;
}

#frame {
	height: 100%;
	frameborder: "0";
	width: 100%;
	margin: 0;
	padding: 0;
}

.nav-btn {
	cursor: pointer;
	border: none;
	outline: none;
}

.nav-btn.active {
	background: url('./pictures/3.png') center top;
	opacity: 1;
}

.nav-btn:hover {
	background: linear-gradient(to right, #1891ED, #726DD1, #726DD1, #1891ED);
	opacity: 1;
}
</style>
<script language="javascript" type="text/javascript">
	function showpage(num) {
		var e = document.getElementById('frame');
		if (num === 1) {
			e.src = "homepage.jsp";
		} else if (num === 2) {
			e.src = "story.html";
		} else if (num === 3) {
			e.src = "guide.html";
		} else if (num === 4) {
<%if (session.getAttribute("username") == null) {%>
	alert("尚未登录帐号，请先登录账号！");
<%} else {%>
	e.src = "game.jsp";
<%}%>
	} else if (num === 5) {
<%if (session.getAttribute("username") == null) {%>
	alert("尚未登录帐号，请先登录账号！");
<%} else {%>
	e.src = "rank.jsp";
<%}%>
	}
	}
</script>
<body>
	<div id="div1">
		<div id="div1_1"></div>
		<div id="div1_2"></div>
		<input type="button" name="b1" class="button  nav-btn active"
			value="首   页" onclick="showpage(1);" /><input type="button" name="b2"
			class="button nav-btn" value="背景故事" onclick="showpage(2);" /> <input
			type="button" name="b3" class="button nav-btn" value="操作要领"
			onclick="showpage(3);" /><a href=<%if (session.getAttribute("username") != null) {%>"./sprite/game.html"<%}else{%>"javascript:alert('请先登录账号！')"<%} %>><input type="button" name="b4"
	class="button nav-btn" value="进入游戏"  /></a>	<input
			type="button" name="b5" class="button nav-btn" value="排行榜"
			onclick="showpage(5);" />
		<%
			if (session.getAttribute("username") != null) {
		%>
		<div style="height: 60px; width: 200px; float: right; color: #726DD1;">
			<br> <img src="./pictures/icon (1).png"> <span
				style="color: white;"><%=session.getAttribute("username")%></a>
				<a href="logout.jsp" style="text-decoration: none; color: white;"><span
					style="color: red;">退出</span></a>
		</div>
		<%
			} else {
		%>
		<div style="height: 60px; width: 200px; float: right;">
			<br> <a href="Login.jsp"><input type="button" name="b6"
				class="button"
				style="cursor:pointer;border-radius: 10px; font-size: 18px; width: 80px; height: 30px; background: #D0E9FF; color: #00343F;"
				value="登录" /></a> <a href="Sign.jsp"><input type="button" name="b7"
				class="button"
				style="cursor:pointer;border-radius: 10px; font-size: 18px; width: 80px; height: 30px; background: #57D2F7;"
				value="注册" "/></a>
		</div>
		<%
			}
		%>
	</div>
	<div class="stripe"></div>
	<div id="div2a">
		<div id="div2b"></div>
		<div id="div2">
			<iframe id="frame" src="homepage.jsp"
				style="text-align: center; border: none;"  scrolling="no"></iframe>
		</div>
		<div id="div2b2"></div>
	</div>
	<audio src="./music1.m4a"  loop="loop" autoplay="autoplay" style="display:none;"></audio>
	<script>
		(function() {
			var aLi = document.getElementById('div1').getElementsByClassName(
					'nav-btn');
			var reg = /\bactive\b/;
			for (var i = 0; i < aLi.length; i++) {
				aLi[i].addEventListener('click', function() {
					for (var i = 0; i < aLi.length; i++) {
						aLi[i].className = aLi[i].className.replace(reg, '');
					}
					this.className += ' active';
				})
			}

		}())
	</script>
</body>
</html>