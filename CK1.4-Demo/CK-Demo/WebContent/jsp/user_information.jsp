<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>ck-个人信息</title>
	<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/user_information.css" type="text/css" />
</head>

<script type="text/javascript">
	//控制更换图片
	function overImage(imgId,imgSrc){
		document.getElementById(imgId).src="${pageContext.request.contextPath }/image/"+imgSrc
	}
	
	//控制元素块的显示与否
	function changeDisplay(Id,choose){
		var obj = document.getElementById(Id);
		if(choose == 1){
			obj.style.display="block";
		}
		if(choose == 0){
			obj.style.display="none";
		}
	}
</script>

<body >

    <!-- 引用头部1 -->
	<%@ include file="user_head1.jsp" %>
    
    <!-- 头部文字 -->
	<div id=head>
		<p>ck-个人信息</p>
	</div>

	<!-- 消息 -->
	<p id=msg>
		<font color="red">${msg }</font>
	</p>
	
	<!-- 主要显示区 -->
	<div id=conn>
	<form id=form action="${pageContext.request.contextPath }/user/updateUserInfo" method="post">
		<!-- 头像显示区 -->
		<div id=headImg>
			<img src="${pageContext.request.contextPath }/${user.getUser_image()}">	
			<!-- 称号显示 -->
			<c:if test="${user.getUser_level()>=0 && user.getUser_level()<=5}">
		    <p style="color:#228B22">初入江湖</p>
		    </c:if>
		    <c:if test="${user.getUser_level()>5 && user.getUser_level()<=10}">
		    <p style="color:#0000CD">小有成就</p>
		    </c:if>
		    <c:if test="${user.getUser_level()>10 && user.getUser_level()<=15}">
		    <p style="color:#8B008B">纵横捭阖</p>
		    </c:if>
		    <c:if test="${user.getUser_level()>15}">
		    <p style="color:#DC143C">运筹帷幄</p>
		    </c:if>
			<font size="5px;" color="yellow">拥有技能:</font>
			<c:forEach items="${user_skill }" var="skill">
			<font size="5px;" color="white">${skill.getSkill_name()}</font>
				
			</c:forEach>
		</div>
		<!-- 玩家其他信息 -->
		<div id=information>
			<div id = name onclick="changeDisplay('name',0),changeDisplay('ename',1),changeDisplay('btn',1),changeDisplay('cancel',1)">
				<p><yellow>[昵&nbsp;&nbsp;&nbsp;称]</yellow>&nbsp;${user.getUser_name() }<font style="font-size: 25px;color: green;">（点击更改）</font>
			</div>
			<div id = ename>
				<p><yellow>[昵&nbsp;&nbsp;&nbsp;称]</yellow>&nbsp;
				<input type="text" name="user_name" placeholder="${user.getUser_name() }" autocomplete="off">
				<font style="font-size: 25px;color: green;">（请修改）</font></p>
			</div>
			
			<div id = password onclick="changeDisplay('password',0),changeDisplay('epassword',1),changeDisplay('btn',1),changeDisplay('cancel',1)">
				<p><yellow>[密&nbsp;&nbsp;&nbsp;码]</yellow>&nbsp;${user.getUser_password() }<font style="font-size: 25px;color: green;">（点击更改）</font>
			</div>
			<div id = epassword>
				<p><yellow>[密&nbsp;&nbsp;&nbsp;码]</yellow>&nbsp;
				<input type="text" name="user_password" placeholder="${user.getUser_password() }" autocomplete="off">
				<font style="font-size: 25px;color: green;">（请修改）</font></p>
			</div>
		
			<p><yellow>[邮&nbsp;&nbsp;&nbsp;箱]</yellow>&nbsp;${user.getEmail() }<font style="font-size: 25px;color: red;">（已绑定，无法更改）</font></p>
			<p><yellow>[等&nbsp;&nbsp;&nbsp;级]</yellow>&nbsp;Lv.${user.getUser_level() }</p>
			<p><yellow>[虎&nbsp;&nbsp;&nbsp;符]</yellow>&nbsp;${user.getUser_money() }</p>
			<p><yellow>[战&nbsp;令&nbsp;点]</yellow>&nbsp;${user.getUser_points() }点</p>
			<p><yellow>[卡&nbsp;牌&nbsp;数]</yellow>&nbsp;${user.getUser_cardNum() }张</p>
			<p><yellow>[活&nbsp;动&nbsp;点]</yellow>&nbsp;${user.getDice_point() }点</p>
			<p><yellow>[已&nbsp;登&nbsp;录]</yellow>&nbsp;${user.getLogin_day() }天</p>
		</div>
		  
	    <div id=btn class="btn" onmouseover="overImage('btn1','common/game_btnBG2.png')" onmouseout="overImage('btn1','common/game_btnBG1.png')" 
	    onclick="document.getElementById('form').submit()">
		    <img id=btn1 src="${pageContext.request.contextPath }/image/common/game_btnBG1.png">
		    <p>修改信息</p>
	    </div>
	    
	    <div id=cancel class="btn" onmouseover="overImage('btn2','common/game_btnBG2.png')" onmouseout="overImage('btn2','common/game_btnBG1.png')" 
	    onclick="changeDisplay('password',1),changeDisplay('name',1),changeDisplay('epassword',0),changeDisplay('ename',0),changeDisplay('btn',0),changeDisplay('cancel',0)">
		    <img id=btn2 src="${pageContext.request.contextPath }/image/common/game_btnBG1.png">
		    <p>取消修改</p>
	    </div>


	</form>
	</div>


    <!-- 引用底部1 -->
	<%@ include file="user_footer3.jsp"%>
</body>
</html>