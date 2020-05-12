<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" http-equiv="refresh" 
	content="4;URL='${pageContext.request.contextPath }/card/toGameAllCard1'">
	<title>ck-前往武将世界</title>
	<link rel="prefetch" href="${pageContext.request.contextPath }/card/toGameAllCard1">
	<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
</head>

<style>
	@font-face {
	    font-family: lishu; 
	    src: url(../font/lishu.TTF);
	    }
	#head{
	    position: absolute;
	    margin:0;
	    top:0px;
	    width: 1920px;
	    height: 80px;
	    text-align: center;
	    line-height: 55px;
	    background-image:url("../image/common/user_head1BG.png");
	    background-size:100% 100%; 
	    z-index: 4;
	}
	
	#head p{
	    margin-top: 10px;
	    font-size: 70px;
	    text-shadow:0 4px 2px #fafa32ca;
	    color: #fff;
	    font-family: lishu;
	}
	    
	html, body {
	  background: black;
	  overflow: hidden;
	  margin: 0;
	}
	
	#codepen-link {
	  position: absolute;
	  bottom: 20px;
	  right: 30px;
	  height: 40px;
	  width: 40px;
	  z-index: 10;
	  border-radius: 50%;
	  box-sizing: border-box;
	  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/544318/logo.jpg");
	  background-position: center center;
	  background-size: cover;
	  opacity: 0.4;
	  transition: all 0.25s;
	}
	#codepen-link:hover {
	  opacity: 0.8;
	  box-shadow: 0 0 6px #efefef;
	}
	
	#img{
	  position: absolute;
	  width: 100%;
	  height: 100%;
	  overflow: hidden;
	}
	
	.img{
	  position: absolute;
	  width:0px;
	  height:0px;
	  top:48%;
	  left:50%;
	}
	
	#img1{
	  animation: img1 0.8s linear 1s infinite;
	}
	#img2{
	  animation: img2 1s linear 2s infinite;
	}
	#img3{
	  animation: img3 0.5s linear 3s infinite;
	}
	#img4{
	  animation: img4 0.7s linear 4s infinite;
	}
	#img5{
	  animation: img5 0.4s linear 1.5s infinite;
	}
	#img6{
	  animation: img6 0.6s linear 1.7s infinite;
	}
	
	@keyframes img1 {
	    from {left:50%;top:48%;width:0px;height:0px;}
	    to {left:-2%;top:-2%;width:200px;height:300px;}
	}
	@keyframes img2 {
	    from {left:50%;top:48%;width:0px;height:0px;}
	    to {left:100%;top:-2%;width:200px;height:300px;}
	}
	@keyframes img3 {
	    from {left:50%;top:48%;width:0px;height:0px;}
	    to {left:100%;top:102%;width:200px;height:300px;}
	}
	@keyframes img4 {
	    from {left:50%;top:48%;width:0px;height:0px;}
	    to {left:-2%;top:102%;width:200px;height:300px;}
	}
	@keyframes img5 {
	    from {left:50%;top:48%;width:0px;height:0px;}
	    to {left:-2%;top:48%;width:200px;height:300px;}
	}
	@keyframes img6 {
	    from {left:50%;top:48%;width:0px;height:0px;}
	    to {left:102%;top:48%;width:200px;height:300px;}
	}


    
</style>

    <script type="text/javascript">
    "use strict";
    var PI = Math.PI,cos = Math.cos,sin = Math.sin,abs = Math.abs,sqrt = Math.sqrt,pow = Math.pow,random = Math.random,atan2 = Math.atan2;
    var HALF_PI = 0.5 * PI;
    var TAU = 2 * PI;
    var rand = function rand(n) {return n * random();};
    var randIn = function randIn(min, max) {return rand(max - min) + min;};
    var fadeIn = function fadeIn(t, m) {return t / m;};
    var angle = function angle(x1, y1, x2, y2) {return atan2(y2 - y1, x2 - x1);};

    var starCount = 1000;

    var canvas = void 0;
    var ctx = void 0;
    var center = void 0;
    var positions = void 0;
    var velocities = void 0;
    var lifeSpans = void 0;
    var hues = void 0;

    function setup() {
    	createCanvas();
    	createStars();
    	draw();
    }

    function createCanvas() {
    	canvas = {
    		a: document.createElement("canvas"),
    		b: document.createElement("canvas") };

    	canvas.b.style = "\n\t\tposition: absolute;\n\t\ttop: 0;\n\t\tleft: 0;\n\t\twidth: 100%;\n\t\theight: 100%;\n\t";


    	document.body.appendChild(canvas.b);
    	ctx = {
    		a: canvas.a.getContext("2d"),
    		b: canvas.b.getContext("2d") };

    	center = [];
    	resize();
    }

    function resize() {var _window =
    	window,innerWidth = _window.innerWidth,innerHeight = _window.innerHeight;

    	canvas.a.width = canvas.b.width = innerWidth;
    	canvas.a.height = canvas.b.height = innerHeight;

    	center[0] = 0.5 * innerWidth;
    	center[1] = 0.5 * innerHeight;
    }

    function checkBounds(x, y) {
    	return (
    		x > canvas.a.width ||
    		x < 0 ||
    		y > canvas.a.height ||
    		y < 0);

    }

    function createStars() {
    	positions = new Float32Array(starCount * 2);
    	velocities = new Float32Array(starCount * 2);
    	hues = new Float32Array(starCount);
    	lifeSpans = new Float32Array(starCount * 2);

    	var i = void 0,x = void 0,y = void 0,t = void 0,s = void 0,vx = void 0,vy = void 0;

    	for (i = 0; i < starCount * 2; i += 2) {
    		resetStar(i);
    	}
    }

    function resetStar(i) {
    	var iy = void 0,rd = void 0,rt = void 0,cx = void 0,sy = void 0,x = void 0,y = void 0,rv = void 0,vx = void 0,vy = void 0,t = void 0,h = void 0,l = void 0,ttl = void 0;

    	iy = i + 1;
    	rd = rand(100);
    	rt = rand(TAU);
    	cx = cos(rt);
    	sy = sin(rt);
    	x = center[0] + cx * rd;
    	y = center[1] + sy * rd;
    	rv = randIn(0.1, 1);
    	vx = rv * cx;
    	vy = rv * sy;
    	h = rand(360);
    	l = 0;
    	ttl = randIn(20, 100);

    	positions[i] = x;
    	positions[iy] = y;
    	velocities[i] = vx;
    	velocities[iy] = vy;
    	hues[0.5 * i | 0] = h;
    	lifeSpans[i] = l;
    	lifeSpans[iy] = ttl;
    }

    function drawStar(i) {
    	var iy = void 0,x = void 0,y = void 0,tx = void 0,ty = void 0,vx = void 0,vy = void 0,h = void 0,l = void 0,dl = void 0,ttl = void 0,c = void 0;

    	iy = i + 1;
    	x = positions[i];
    	y = positions[iy];
    	vx = velocities[i];
    	vy = velocities[iy];
    	tx = x + vx;
    	ty = y + vy;
    	vx *= 1.15;
    	vy *= 1.15;
    	h = hues[0.5 * i | 0];
    	l = lifeSpans[i];
    	ttl = lifeSpans[iy];
    	dl = fadeIn(l, ttl);
    	c = "hsla(" + h + ",50%,80%," + dl + ")";

    	l++;

    	ctx.a.save();
    	ctx.a.lineWidth = dl;
    	ctx.a.lineCap = 'round';
    	ctx.a.strokeStyle = c;
    	ctx.a.beginPath();
    	ctx.a.moveTo(x, y);
    	ctx.a.lineTo(tx, ty);
    	ctx.a.stroke();
    	ctx.a.closePath();
    	ctx.a.restore();

    	positions[i] = tx;
    	positions[iy] = ty;
    	velocities[i] = vx;
    	velocities[iy] = vy;
    	lifeSpans[i] = l;

    	checkBounds(x, y) && resetStar(i);
    }

    function draw() {
    	ctx.a.clearRect(0, 0, canvas.a.width, canvas.a.height);
    	ctx.b.clearRect(0, 0, canvas.b.width, canvas.b.height);

    	ctx.b.fillStyle = 'rgba(0,0,0,0.5)';
    	ctx.b.fillRect(0, 0, canvas.b.width, canvas.b.height);

    	var i = void 0;

    	for (i = 0; i < starCount * 2; i += 2) {
    		drawStar(i);
    	}

    	ctx.b.save();
    	ctx.b.filter = 'blur(10px)';
    	ctx.b.drawImage(canvas.a, 0, 0);
    	ctx.b.restore();

    	ctx.b.save();
    	ctx.b.globalCompositeOperation = 'lighter';
    	ctx.b.drawImage(canvas.a, 0, 0);
    	ctx.b.restore();

    	window.requestAnimationFrame(draw);
    }

    window.addEventListener("load", setup);
    window.addEventListener("resize", resize);    
    </script>

<body>
    <!-- 以下为页眉 -->
    <%@ include file="user_head1.jsp"%>
    
    <c:if test="${not empty img}">
    <div id=img>
    <img id=img1 class="img" src="${pageContext.request.contextPath }/${img[0]}">
    <img id=img2 class="img" src="${pageContext.request.contextPath }/${img[1]}">
    <img id=img3 class="img" src="${pageContext.request.contextPath }/${img[2]}">
    <img id=img4 class="img" src="${pageContext.request.contextPath }/${img[3]}">
    <img id=img5 class="img" src="${pageContext.request.contextPath }/${img[4]}">
    <img id=img6 class="img" src="${pageContext.request.contextPath }/${img[5]}">
    </div>
    </c:if>
    
    <!-- 头部文字 -->
	<div id=head>
		<p>ck-正在前往武将世界</p>
	</div>
	
    <!-- 以下为页脚部分 -->
    <%@ include file="user_footer1.jsp"%>
</body>
</html>