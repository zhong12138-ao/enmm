<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<head>
	<meta charset="UTF-8">
	<title>ck-游戏菜单</title>
	<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/game_menu.css" type="text/css" />
</head>
<script src="${pageContext.request.contextPath }/js/scrollheng.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.insetborder.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('div.sample-border').borderEffect({borderColor : '#ffffff9a', speed : 100, borderWidth: 15});
    });
    /* 此script及以上两个,用于给元素添加边框时有沉浸效果 */
</script>

<script type="text/javascript">
//跳转
function toUrl(url){
	window.location.href = "${pageContext.request.contextPath }/"+url;
}
</script>

<body >

    <!-- 引用头部1 -->
	<%@ include file="user_head1.jsp" %>
    
    <!-- 头部文字 -->
	<div id=head>
		<p>ck-游戏菜单</p>
	</div>
	
	<!-- 消息 -->
	<p id=msg>
	<font color="red">${msg }</font>
	</p>
	
	<!-- 玩法菜单 -->
	<div id="conn">
	    <div id=dh1 class="sample-border" onclick="toUrl('card/userCardChoose/1&0')">
			<img class="dh" src="${pageContext.request.contextPath }/image/game_menu/game_mode_1.png" >
		</div>
	
	    <div id=dh2 class="sample-border" onclick="toUrl('jsp/game_mode_2a.jsp')">
			<img class="dh" src="${pageContext.request.contextPath }/image/game_menu/game_mode_2.png" >
		</div>
		
		<div id=dh3 class="sample-border" onclick="toUrl('jsp/game_mode_3.jsp')">
			<img class="dh" src="${pageContext.request.contextPath }/image/game_menu/game_mode_3.png" >
		</div>
		
		<div id=dh4 class="sample-border" onclick="">
			<img class="dh" src="${pageContext.request.contextPath }/image/game_menu/game_mode_x.png" >
		</div>
		
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/hengxiang.js"> </script>
		<!-- 此script用于鼠标拖拽div块使用 -->
	</div>


    <!-- 引用底部1 -->
	<%@ include file="user_footer3.jsp"%>
</body>
    <!-- 背景音频部分 -->
    <embed src="${pageContext.request.contextPath}/sound/qixiangchucheng.mp3" hidden="true" autostart="true" loop="true">


</html>