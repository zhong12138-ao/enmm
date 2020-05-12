<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>ck-游戏界面</title>
<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/game_mode_2.css" type="text/css" />
</head>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
//点击跳转
function returnMenu() {
	var r = confirm("您将返回菜单，奖励取消，是否确定？")
	if (r == true) {
	    window.location.href='${pageContext.request.contextPath }/user/toGamemenu';
		}else{				
		}			
	}	
	

//跳转
function toUrl(url){
	window.location.href = "${pageContext.request.contextPath }/"+url;
}

</script>

<body>
	<div id=head>
		<p>ck-三英战吕布</p>
	</div>
	
	<!-- 以下为页眉 -->
	<%@ include file="user_head1.jsp"%>   
    
    <!-- 战斗标题 -->
	<div id=title>
	    <font style="color:white;font-size:40px;">击败所有对手，成为人中吕布吧！</font>
	</div>
	
	<!-- 变化界面 -->
	<div id=game_mode_2d>
	
    <%@ include file="game_mode_2d.jsp" %>
    </div>
	

	
	
	<%@ include file="user_footer2.jsp" %>
</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
