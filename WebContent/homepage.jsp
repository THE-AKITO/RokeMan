<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>焦点轮播图</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

body {
	padding: 20px;
}

#container {
	width: 720px;
	height: 600px;
	border: 3px solid #333;
	overflow: hidden;
	position: relative;
	align: center;
	top: 0px;
}

#list {
	width: 5040px;
	height: 600px;
	position: absolute;
	z-index: 1;
}

#list img {
	width: 720px;
	height: 600px;
	float: left;
}

#buttons {
	position: absolute;
	height: 10px;
	width: 100px;
	z-index: 2;
	bottom: 20px;
	left: 50%;
	transform: translateX(-50%)
}

#buttons span {
	cursor: pointer;
	float: left;
	border: 1px solid #fff;
	width: 10px;
	height: 10px;
	border-radius: 50%;
	background: #333;
	margin-right: 5px;
}

#buttons .on {
	background: orangered;
}

.arrow {
	cursor: pointer;
	display: none;
	line-height: 39px;
	text-align: center;
	font-size: 36px;
	font-weight: bold;
	width: 40px;
	height: 40px;
	position: absolute;
	z-index: 2;
	top: 300px;
	background-color: RGBA(0, 0, 0, .3);
	color: #fff;
}

.arrow:hover {
	background-color: RGBA(0, 0, 0, .7);
}

#container:hover .arrow {
	display: block;
}

#prev {
	left: 20px;
}

#next {
	right: 20px;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		var container = document.getElementById('container');
		var list = document.getElementById('list');
		var buttons = document.getElementById('buttons').getElementsByTagName(
				'span');
		var prev = document.getElementById('prev');
		var next = document.getElementById('next');
		var index = 1;
		var len = 5;
		var animated = false;
		var interval = 3000;
		var timer;

		function animate(offset) {
			if (offset == 0) {
				return;
			}
			animated = true;
			var time = 300;
			var inteval = 10;
			var speed = offset / (time / inteval);
			var left = parseInt(list.style.left) + offset;

			var go = function() {
				if ((speed > 0 && parseInt(list.style.left) < left)
						|| (speed < 0 && parseInt(list.style.left) > left)) {
					list.style.left = parseInt(list.style.left) + speed + 'px';
					setTimeout(go, inteval);
				} else {
					list.style.left = left + 'px';
					if (left > -200) {
						list.style.left = -720 * len + 'px';
					}
					if (left < (-720 * len)) {
						list.style.left = '-720px';
					}
					animated = false;
				}
			}
			go();
		}

		function showButton() {
			for (var i = 0; i < buttons.length; i++) {
				if (buttons[i].className == 'on') {
					buttons[i].className = '';
					break;
				}
			}
			buttons[index - 1].className = 'on';
		}

		function play() {
			timer = setTimeout(function() {
				next.onclick();
				play();
			}, interval);
		}
		function stop() {
			clearTimeout(timer);
		}

		next.onclick = function() {
			if (animated) {
				return;
			}
			if (index == 5) {
				index = 1;
			} else {
				index += 1;
			}
			animate(-720);
			showButton();
		}
		prev.onclick = function() {
			if (animated) {
				return;
			}
			if (index == 1) {
				index = 5;
			} else {
				index -= 1;
			}
			animate(720);
			showButton();
		}

		for (var i = 0; i < buttons.length; i++) {
			buttons[i].onclick = function() {
				if (animated) {
					return;
				}
				if (this.className == 'on') {
					return;
				}
				var myIndex = parseInt(this.getAttribute('index'));
				var offset = -720 * (myIndex - index);

				animate(offset);
				index = myIndex;
				showButton();
			}
		}

		container.onmouseover = stop;
		container.onmouseout = play;

		play();

	}
</script>
</head>
<body>

	<div id="container">
		<div id="list" style="left: -720px;">
			<img src="./pictures/battle.jpg" alt="1" /> <img
				src="./pictures/l1.jpg" alt="1" /> <img src="./pictures/l3.jpg"
				alt="2" /> <img src="./pictures/l2.jpg" alt="3" /> <img
				src="./pictures/person2.jpg" alt="4" /> <img
				src="./pictures/battle.jpg" alt="5" /> <img src="./pictures/l1.jpg"
				alt="5" />
		</div>
		<div id="buttons">
			<span index="1" class="on"></span> <span index="2"></span> <span
				index="3"></span> <span index="4"></span> <span index="5"></span>
		</div>
		<a href="javascript:;" id="prev" class="arrow">&lt;</a> <a
			href="javascript:;" id="next" class="arrow">&gt;</a>
	</div>

</body>
</html>