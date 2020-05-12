<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>ck-招募</title>
	<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/user_recruit.css" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery1.min.js"></script>
</head>

<script type="text/javascript">
//控制更换图片
function overImage(imgId,imgSrc){
	document.getElementById(imgId).src="${pageContext.request.contextPath }/image/"+imgSrc
}
//控制元素块的显示与否
function changeDisplay(Id,choose,time){
	var obj = document.getElementById(Id);
	if(time){
		setTimeout(function(){
			if(choose == 1){
				obj.style.display="block";
			}
			if(choose == 0){
				obj.style.display="none";
			}
		}, time);
	}else{
		if(choose == 1){
			obj.style.display="block";
		}
		if(choose == 0){
			obj.style.display="none";
		}	
	}

}
//更换元素样式表
function changeClass(Id,uclass){
	var obj = document.getElementById(Id);
	obj.setAttribute("class", uclass); 
}

//跳转
function toUrl(url){
	window.location.href = "${pageContext.request.contextPath }/"+url;
}
</script>


<body>
	<div id=head>
		<p>ck-招募</p>
	</div>
	
	<!-- 以下为引用头部 -->
	<%@ include file="user_head1.jsp" %>
	
	<!-- 以下为提示信息 -->
	<p id=tip>再招募${5-user.getC_times()%5}次必定获赠4-5星武将</p>
	<p id=msg>${msg }</p>
	<!-- 以下为该页面主要板块 -->
	<div id=conn>
	    <!-- 第一个卡包 -->
		<div id=cb1 class="cb">
		    <!-- 以下为卡包封面及点击事件 --> 
			<img class="cbImg" src="${pageContext.request.contextPath }/image/user_recruit/mingjiang.png">
			<img class="mark" onclick="changeClass('cb1','cbex'),changeDisplay('hidDiv1',1,750)"
			 src="${pageContext.request.contextPath }/image/user_recruit/cb_bg.png">
			<div class="cbImgText">
				<p style="font-size:60px;color:	#800080">名将</p>
				<p style="font-size:30px;color:	#FF4500">2-5星</p>
			</div>
			
			<div id=hidDiv1  class="hidDiv">
			    <div class="close" onclick="changeClass('cb1','cb'),changeDisplay('hidDiv1',0)"><span style="color:white;">关闭</span></div>
				<!-- 以下为卡牌表的跳转事件及图标 -->		
				<div class="cpb">
				    <p style="color:white">点击查看卡包内详细卡牌</p>
					<img src="${pageContext.request.contextPath }/image/user_recruit/cpb.png"alt="" 
					onclick="toUrl('card/getCardGroup/1')">
				</div>
				<!-- 以下为招募一次，五次按钮的事件及图标 -->
				<div class="zhaomu">
					<img class="zi1" src="${pageContext.request.contextPath }/image/user_recruit/zhaomu1.png" 
					onclick="toUrl('card/getOne/1&1')">
					<img class="zi2" src="${pageContext.request.contextPath }/image/user_recruit/zhaomu5.png" 
					onclick="toUrl('card/getFive/5&1')">
				</div>
			</div>
			
		</div>
		<!-- 用于空隔 -->
		<div class="kong"></div>
		
		<div id=cb2 class="cb">
		    <!-- 以下为卡包封面及点击事件 --> 
			<img class="cbImg" src="${pageContext.request.contextPath }/image/user_recruit/jiangdong.png">
			<img class="mark" onclick="changeClass('cb2','cbex'),changeDisplay('hidDiv2',1,750)"
			 src="${pageContext.request.contextPath }/image/user_recruit/cb_bg.png">
			<div class="cbImgText">
				<p style="font-size:60px;color:	#A52A2A">江东霸业</p>
				<p style="font-size:30px;color:	#FF4500">2-5星</p>
			</div>
			
			<div id=hidDiv2  class="hidDiv">
			    <div class="close" onclick="changeClass('cb2','cb'),changeDisplay('hidDiv2',0)"><span style="color:white;">关闭</span></div>
				<!-- 以下为卡牌表的跳转事件及图标 -->		
				<div class="cpb">
				    <p style="color:white">点击查看卡包内详细卡牌</p>
					<img src="${pageContext.request.contextPath }/image/user_recruit/cpb.png"alt="" 
					onclick="toUrl('card/getCardGroup/2')">
				</div>
				<!-- 以下为招募一次，五次按钮的事件及图标 -->
				<div class="zhaomu">
					<img class="zi1" src="${pageContext.request.contextPath }/image/user_recruit/zhaomu1.png" 
					onclick="toUrl('card/getOne/1&2')">
					<img class="zi2" src="${pageContext.request.contextPath }/image/user_recruit/zhaomu5.png" 
					onclick="toUrl('card/getFive/5&2')">
				</div>
			</div>
			
		</div>
		<!-- 用于空隔 -->
		<div class="kong"></div>
		
		<div id=cb3 class="cb">
		    <!-- 以下为卡包封面及点击事件 --> 
			<img class="cbImg" src="${pageContext.request.contextPath }/image/user_recruit/jinguo.png">
			<img class="mark" onclick="changeClass('cb3','cbex'),changeDisplay('hidDiv3',1,750)"
			 src="${pageContext.request.contextPath }/image/user_recruit/cb_bg.png">
			<div class="cbImgText">
				<p style="font-size:60px;color:	#FF8C00">沉鱼落雁</p>
				<p style="font-size:30px;color:	#FF4500">4-5星</p>
			</div>
			
			<div id=hidDiv3  class="hidDiv">
			    <div class="close" onclick="changeClass('cb3','cb'),changeDisplay('hidDiv3',0)"><span style="color:white;">关闭</span></div>
				<!-- 以下为卡牌表的跳转事件及图标 -->		
				<div class="cpb">
				    <p style="color:white">点击查看卡包内详细卡牌</p>
					<img src="${pageContext.request.contextPath }/image/user_recruit/cpb.png"alt="" 
					onclick="toUrl('card/getCardGroup/3')">
				</div>
				<!-- 以下为招募一次，五次按钮的事件及图标 -->
				<div class="zhaomu">
					<img class="zi1" src="${pageContext.request.contextPath }/image/user_recruit/zhaomu1.png" 
					onclick="toUrl('card/getOne/1&3')">
					<img class="zi2" src="${pageContext.request.contextPath }/image/user_recruit/zhaomu5.png" 
					onclick="toUrl('card/getFive/5&3')">
				</div>
			</div>
			
		</div>
		<!-- 用于空隔 -->
		<div class="kong"></div>
		
		<div id=cb4 class="cb">
		    <!-- 以下为卡包封面及点击事件 --> 
			<img class="cbImg" src="${pageContext.request.contextPath }/image/user_recruit/suhan.png">
			<img class="mark" onclick="changeClass('cb4','cbex'),changeDisplay('hidDiv4',1,750)"
			 src="${pageContext.request.contextPath }/image/user_recruit/cb_bg.png">
			<div class="cbImgText">
				<p style="font-size:60px;color:	#228B22">蜀汉英雄</p>
				<p style="font-size:30px;color:	#FF4500">4-5星</p>
			</div>
			
			<div id=hidDiv4  class="hidDiv">
			    <div class="close" onclick="changeClass('cb4','cb'),changeDisplay('hidDiv4',0)"><span style="color:white;">关闭</span></div>
				<!-- 以下为卡牌表的跳转事件及图标 -->		
				<div class="cpb">
				    <p style="color:white">点击查看卡包内详细卡牌</p>
					<img src="${pageContext.request.contextPath }/image/user_recruit/cpb.png"alt="" 
					onclick="toUrl('card/getCardGroup/4')">
				</div>
				<!-- 以下为招募一次，五次按钮的事件及图标 -->
				<div class="zhaomu">
					<img class="zi1" src="${pageContext.request.contextPath }/image/user_recruit/zhaomu1.png" 
					onclick="toUrl('card/getOne/1&4')">
					<img class="zi2" src="${pageContext.request.contextPath }/image/user_recruit/zhaomu5.png" 
					onclick="toUrl('card/getFive/5&4')">
				</div>
			</div>
			
		</div>
		<!-- 用于空隔 -->
		<div class="kong"></div>
		
		<div id=cb5 class="cb">
		    <!-- 以下为卡包封面及点击事件 --> 
			<img class="cbImg" src="${pageContext.request.contextPath }/image/user_recruit/weiwu.png">
			<img class="mark" onclick="changeClass('cb5','cbex'),changeDisplay('hidDiv5',1,750)"
			 src="${pageContext.request.contextPath }/image/user_recruit/cb_bg.png">
			<div class="cbImgText">
				<p style="font-size:60px;color:	#0000CD">魏武之世</p>
				<p style="font-size:30px;color:	#FF4500">2-5星</p>
			</div>
			
			<div id=hidDiv5  class="hidDiv">
			    <div class="close" onclick="changeClass('cb5','cb'),changeDisplay('hidDiv5',0)"><span style="color:white;">关闭</span></div>
				<!-- 以下为卡牌表的跳转事件及图标 -->		
				<div class="cpb">
				    <p style="color:white">点击查看卡包内详细卡牌</p>
					<img src="${pageContext.request.contextPath }/image/user_recruit/cpb.png"alt="" 
					onclick="toUrl('card/getCardGroup/5')">
				</div>
				<!-- 以下为招募一次，五次按钮的事件及图标 -->
				<div class="zhaomu">
					<img class="zi1" src="${pageContext.request.contextPath }/image/user_recruit/zhaomu1.png" 
					onclick="toUrl('card/getOne/1&5')">
					<img class="zi2" src="${pageContext.request.contextPath }/image/user_recruit/zhaomu5.png" 
					onclick="toUrl('card/getFive/5&5')">
				</div>
			</div>
			
		</div>

     <!-- 该js用于鼠标水平拖拽卡包。 -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/hengxiang.js" ></script> 
    </div>
	<%@ include file="user_footer1.jsp" %>
</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
