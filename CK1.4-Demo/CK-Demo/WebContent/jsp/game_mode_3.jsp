<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.ck.pojo.User"%>
<%
	User user = (User) request.getSession().getAttribute("user");
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>策略决战</title>
<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />

<script src="../js/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/game_mode_3.css">
<!-- Jquery -->
<script src="../js/jquery-1.11.3.min.js"></script>
<!-- Confirm Modal -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/confirm.js"></script>
</head>


<body>
	<%@ include file="user_head1.jsp"%>
	
	<div id=head>
	<span>策略决战</span>
	</div>
	
	

    <!-- 骰子地图 -->
	<div class="map">
		<div id="1_1" class="box" style="background-color: green">
			<h1 class="small">粮草</h1>
		</div>
		<div id="1_2" class="box">
		</div>
		<div id="1_3" class="box">
		</div>
		<div id="1_4" class="box">
		</div>
		<div id="1_5" class="box">
		</div>
		<div id="1_6" class="box">
		</div>
		<div id="1_7" class="box">
		</div>
		<div id="1_8" class="box" style="background-color: green">
			<h1 class="small">大营</h1>
		</div>
		<div id="2_1" class="box">
		</div>
		<div id="2_2" class="box">
		</div>
		<div id="2_3" class="box">
		</div>
		<div id="2_4" class="box">
		</div>
		<div id="2_5" class="box">
		</div>
		<div id="2_6" class="box">
		</div>
		<div id="2_7" class="box"  style="background-color: white">
			<h1 class="small"><font color="black">出生点</font></h1>
		</div>
		<div id="2_8" class="box">
		</div>
		<div id="3_1" class="box">
		</div>
		<div id="3_2" class="box">
		</div>
		<div id="3_3" class="box">
		</div>
		<div id="3_4" class="box">
		</div>
		<div id="3_5" class="box">
		</div>
		<div id="3_6" class="box">
		</div>
		<div id="3_7" class="box">
		</div>
		<div id="3_8" class="box">
		</div>
		<div id="4_1" class="box" style="background-color: brown">
			<h1 class="small">山</h1>
		</div>
		<div id="4_2" class="box" style="background-color: brown">
			<h1 class="small">山</h1>
		</div>
		<div id="4_3" class="box">
		</div>
		<div id="4_4" class="box">
		</div>
		<div id="4_5" class="box">
		</div>
		<div id="4_6" class="box">
		</div>
		<div id="4_7" class="box" style="background-color: brown">
			<h1 class="small">山</h1>
		</div>
		<div id="4_8" class="box" style="background-color: brown">
			<h1 class="small">山</h1>
		</div>
		<div id="5_1" class="box">
		</div>
		<div id="5_2" class="box">
		</div>
		<div id="5_3" class="box">
		</div>
		<div id="5_4" class="box">
		</div>
		<div id="5_5" class="box">
		</div>
		<div id="5_6" class="box">
		</div>
		<div id="5_7" class="box">
		</div>
		<div id="5_8" class="box">
		</div>
		<div id="6_1" class="box">
		</div>
		<div id="6_2" class="box"  style="background-color: white">
			<h1 class="small"><font color="black">出生点</font></h1>
		</div>
		<div id="6_3" class="box">
		</div>
		<div id="6_4" class="box">
		</div>
		<div id="6_5" class="box">
		</div>
		<div id="6_6" class="box">
		</div>
		<div id="6_7" class="box">
		</div>
		<div id="6_8" class="box">
		</div>
		<div id="7_1" class="box" style="background-color: green">
			<h1 class="small">大营</h1>
		</div>
		<div id="7_2" class="box">
		</div>
		<div id="7_3" class="box">
		</div>
		<div id="7_4" class="box">
		</div>
		<div id="7_5" class="box">
		</div>
		<div id="7_6" class="box">
		</div>
		<div id="7_7" class="box">
		</div>
		<div id="7_8" class="box" style="background-color: green">
			<h1 class="small">粮草</h1>
		</div>
	</div>
	<div class="map1">
		<div id="1" class="box" style="background-color: purple">
			<h1 class="small"></h1>
		</div>
		<div id="2" class="box" style="background-color: purple">
			<h1 class="small">上</h1>
		</div>
		<div id="3" class="box" style="background-color: purple">
			<h1 class="small"></h1>
		</div>
		<div id="4" class="box" style="background-color: purple">
			<h1 class="small">左</h1>
		</div>
		<div id="5" class="box" style="background-color: purple">
			<h1 class="small">攻击</h1>
		</div>
		<div id="6" class="box" style="background-color: purple">
			<h1 class="small">右</h1>
		</div>
		<div id="7" class="box" style="background-color: purple">
			<h1 class="small"></h1>
		</div>
		<div id="8" class="box" style="background-color: purple">
			<h1 class="small">下</h1>
		</div>
		<div id="9" class="box" style="background-color: purple">
			<h1 class="small"></h1>
		</div>
	</div>
	<!-- 底部 -->
	<%@ include file="user_footer1.jsp"%>
	
	
	

</body>
</html>