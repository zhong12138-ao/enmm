<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>ck-用户大厅</title>
	<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/user_lobby.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/cichang.css">
</head>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery1.min.js"></script>

<script type="text/javascript">
//控制更换图片
function overImage(imgId,imgSrc){
	document.getElementById(imgId).src="${pageContext.request.contextPath }/image/"+imgSrc
}

//控制添加边框，ID为元素id，n控制是添加还是取消边框，width和color控制边框效果。
function addBorder(Id,n,width,color){
	var obj = document.getElementById(Id);
	if(n == 1){
		obj.style.border="solid"+" "+width+"px "+color
	}
	if(n == 0){
		obj.style.border="solid"+" "+width+"px "+color
	}
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

//更改元素大小
function changeWH(Id,width,height){
	var obj = document.getElementById(Id);
	obj.style.width=width;
	obj.style.height=height;
}

//更改元素class
function changeClass(Id,className){
	document.getElementById(Id).setAttribute('class',className);
}

//写死的关闭窗口，不建议
function closeDiv(){
	document.getElementById('gtext').setAttribute('class','gtext2');
	setTimeout(function(){
		document.getElementById('gameDetial').style.display="none";
	},750)	
}

//控制签到获取物品
function showSignGet(obj,x){
	var signget = document.getElementById("SignGet")
	var x2 = document.getElementById("x2")
	if(x==1){
		x2.value="恭喜您获得了200虎符！"
			$.ajax({
				url : '../user/getSignHufu?money=200',
				type : 'get',
				dataType : 'json',
			});
	}
	if(x==2){
		x2.value="恭喜您获得了600虎符！"
			$.ajax({
				url : '../user/getSignHufu?money=600',
				type : 'get',
				dataType : 'json',
			});	
	}
	if(x==3){
		x2.value="恭喜您获得了小乔（四星）！"
			$.ajax({
				url : '../user/getSignCard?id=446',
				type : 'get',
				dataType : 'json',
			});
	}
	if(x==4){
		x2.value="恭喜您获得了王美人（四星）！"
			$.ajax({
				url : '../user/getSignCard?id=442',
				type : 'get',
				dataType : 'json',
			});
	}
	if(x==5){
		x2.value="恭喜您获得了200虎符！"
			$.ajax({
				url : '../user/getSignHufu?money=200',
				type : 'get',
				dataType : 'json',
			});
	}
	if(x==6){
		x2.value="恭喜您获得了600虎符！"
			$.ajax({
				url : '../user/getSignHufu?money=200',
				type : 'get',
				dataType : 'json',
			});
	}
	if(x==7){
		x2.value="恭喜您获得了许褚（五星）！"
			$.ajax({
				url : '../user/getSignCard?id=525',
				type : 'get',
				dataType : 'json',
			});
	}
    
	//刷新
	
	
	signget.style.display = "block"
	obj.src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet.png"
}



function initAbout(){
	changeDisplay('about',1);
	//判断有无about的session
	if(sessionStorage.getItem('about')==1){
		changeDisplay('about',0);
	}else{
		//如果无session说明重登录的，显示，并存入数据		
		changeDisplay('about',1);
	}
	sessionStorage.setItem('about', 1);

}

function cleanAbout(){
	sessionStorage.clear();
}
/*
 * $(document)意思是说，获取整个网页文档对象
 * $(document).ready意思就是说，获取文档对象就绪的时候。
 * $(function(){})也就是$(document).ready(function(){})的简写
 */
var refreshTime = "1000";// 页面数据刷新定时单位为ms
$(document).ready(function() {
	var i = 0;
	$(function() {
		setInterval(function() {
			$("#footer2").load(location.href + " #footer2");
		}, refreshTime);
		setInterval(function() {
			$("#footer4").load(location.href + " #footer4");
		}, refreshTime);
	});
}); 

</script>

<body onload="initAbout()">

    <!-- 背景 -->
    <img id=bg src="${pageContext.request.contextPath }/image/user_lobby/user_lobbyBG.png"></img>
    
    <!-- 头部 -->
    <div id=head>
	    <!-- 头像 -->
	    <div id=headImg onmouseover="addBorder(this.id,1,5,'#fff')" onmouseout="addBorder(this.id,0,5,'#00000000')">
		    <a href="${pageContext.request.contextPath }/user/to_UserInformation">
		    <img src="${pageContext.request.contextPath }/${user.getUser_image() }"></a>
	    </div>
	    
	    <!-- 用户信息 -->
	    <div id=userInfo >
		    <p><yellow>昵称：</yellow>${user.getUser_name() }</p>
		    <c:if test="${user.getUser_level()>=0 && user.getUser_level()<=5}">
		    <p><yellow>称号：</yellow>初入江湖</p>
		    </c:if>
		    <c:if test="${user.getUser_level()>5 && user.getUser_level()<=10}">
		    <p><yellow>称号：</yellow>小有成就</p>
		    </c:if>
		    <c:if test="${user.getUser_level()>10 && user.getUser_level()<=15}">
		    <p><yellow>称号：</yellow>纵横捭阖</p>
		    </c:if>
		    <c:if test="${user.getUser_level()>15}">
		    <p><yellow>称号：</yellow>运筹帷幄</p>
		    </c:if>
		    <p><yellow>邮箱：</yellow>${user.getEmail() }</p>
		    <p><yellow>Lv.</yellow>${user.getUser_level() }</p>
	    </div>    
	    
	    <!-- 用户可操作活动 -->
	    <div id=userActivity>
		    <!-- 签到 -->
		    <div onmouseover="overImage('userActivity1','user_lobby/user_lobbyImgQiandao2.jpeg')" onmouseout="overImage('userActivity1','user_lobby/user_lobbyImgQiandao1.jpeg')"
		    onclick="changeDisplay('userSign',1)">
		    <img id=userActivity1 src="${pageContext.request.contextPath }/image/user_lobby/user_lobbyImgQiandao1.jpeg">
		    <span>签到</span>
		    </div>
		    <!-- 活动 -->
		    <div onmouseover="overImage('userActivity2','user_lobby/user_lobbyImgHuodong2.jpeg')" onmouseout="overImage('userActivity2','user_lobby/user_lobbyImgHuodong1.jpeg')">
		    <a href="${pageContext.request.contextPath }/jsp/game_activity.jsp">
		    <img id=userActivity2 src="${pageContext.request.contextPath }/image/user_lobby/user_lobbyImgHuodong1.jpeg"></a>
		    <span>活动</span>
		    </div>
		    <!-- 武将 -->
		    <div onmouseover="overImage('userActivity3','user_lobby/user_lobbyImgWujiang2.jpeg')" onmouseout="overImage('userActivity3','user_lobby/user_lobbyImgWujiang1.jpeg')">
		    <a href="${pageContext.request.contextPath }/card/getUser_card">
		    <img id=userActivity3 src="${pageContext.request.contextPath }/image/user_lobby/user_lobbyImgWujiang1.jpeg"></a>
		    <span>武将</span>
		    </div>
		    <!-- 退出 -->
		    <div onmouseover="overImage('userActivity4','user_lobby/user_lobbyImgTuichu2.jpeg')" onmouseout="overImage('userActivity4','user_lobby/user_lobbyImgTuichu1.jpeg')"
		    onclick="cleanAbout()">
		    <a href="${pageContext.request.contextPath }/user/logout">
		    <img id=userActivity4 src="${pageContext.request.contextPath }/image/user_lobby/user_lobbyImgTuichu1.jpeg"></a>
		    <span>退出</span>
		    </div>
	    </div>
	    
	    <!-- 设置 -->
	    <div id=userSet onmouseover="overImage('userSet2','user_lobby/user_lobbyImgShezhi2.png')" onmouseout="overImage('userSet2','user_lobby/user_lobbyImgShezhi1.png')">
		    <img id=userSet2 alt="" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbyImgShezhi1.png">
	    </div>
	    
    </div>

    <!-- 主要显示区 -->
    <div id=conn>
    
	    <!-- 活动缩略图 -->
	    <div id=activity_small>
		    <img id=ac1 src="${pageContext.request.contextPath }/image/user_lobby/game_activityImg1.png"
		    onmouseover="overImage('activityDetail','user_lobby/game_activityImgDetail.png'),changeDisplay('activityDetail',1),changeWH(this.id,'300px','150px')" 
		    onmouseout="overImage('activityDetail',''),changeDisplay('activityDetail',0),changeWH(this.id,'230px','110px')" >
		    <img id=ac2 src="${pageContext.request.contextPath }/image/user_lobby/game_activityImg2.png"
		    onmouseover="overImage('activityDetail','user_lobby/game_activityImgDetail.png'),changeDisplay('activityDetail',1),changeWH(this.id,'300px','150px')" 
		    onmouseout="overImage('activityDetail',''),changeDisplay('activityDetail',0),changeWH(this.id,'230px','110px')" >
		    <img id=ac3 src="${pageContext.request.contextPath }/image/user_lobby/game_activityImg3.png"
		    onmouseover="overImage('activityDetail','user_lobby/game_activityImgDetail.png'),changeDisplay('activityDetail',1),changeWH(this.id,'300px','150px')" 
		    onmouseout="overImage('activityDetail',''),changeDisplay('activityDetail',0),changeWH(this.id,'230px','110px')" >
		    <img id=ac4 src="${pageContext.request.contextPath }/image/user_lobby/game_activityImg4.png"
		    onmouseover="overImage('activityDetail','user_lobby/game_activityImgDetail.png'),changeDisplay('activityDetail',1),changeWH(this.id,'300px','150px')" 
		    onmouseout="overImage('activityDetail',''),changeDisplay('activityDetail',0),changeWH(this.id,'230px','110px')" >
		    <img id=ac5 src="${pageContext.request.contextPath }/image/user_lobby/game_activityImg5.png"
		    onmouseover="overImage('activityDetail','user_lobby/game_activityImgDetail.png'),changeDisplay('activityDetail',1),changeWH(this.id,'300px','150px')" 
		    onmouseout="overImage('activityDetail',''),changeDisplay('activityDetail',0),changeWH(this.id,'230px','110px')" >
	    </div>
    
	    <!-- 活动详细概览 -->
	    <div>
	        <img src="" id=activityDetail>
	    </div>
    
	    <!-- 签到概览 -->
	    <div id=userSign>
	        <!-- 背景 -->
		    <img id=userSignBG src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignBG.png">
		    <!-- 返回按键 -->
		    <img id=userSignBack src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignBack.png"
		    onclick="changeDisplay('userSign',0)">
		    
		    	<img id=g1 class=userSignGoods1 src="${pageContext.request.contextPath }/image/user_shopHufu1.png">
			    <c:if test="${not empty user.getLogin_day()}">
			    	<c:if test="${user.getLogin_day()==1 }">
		    		<div id=p1>
					    <c:if test="${user.getSign_state()==0 }">
					    	<img id=s1 class=userSignGet title="点击获取奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet0.png"
					    	onclick="showSignGet(this,1)">
					    </c:if>
					    <c:if test="${user.getSign_state()==1 }">
					    	<img id=s1 class=userSignGet title="已经获得奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet.png">
					    </c:if>
		    		</div>
					</c:if>
				    <c:if test="${user.getLogin_day()>1 }">
				    	<img id=s1 class=userSignGet title="已经获得奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet.png">
			    	</c:if>
			    </c:if>
		    
		    	<img id=g2 class=userSignGoods1 src="${pageContext.request.contextPath }/image/user_shopHufu2.png">
			    <c:if test="${not empty user.getLogin_day()}">
			    <c:if test="${user.getLogin_day()==2 }">
		    		<div id=p2>
				    	<c:if test="${user.getSign_state()==0 }">
				    		<img id=s2 class=userSignGet title="点击获取奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet0.png"
				    		onclick="showSignGet(this,2)">
				    	</c:if>
				    	<c:if test="${user.getSign_state()==1 }">
				    		<img id=s2 class=userSignGet title="已经获得奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet.png">
				    	</c:if>
		    		</div> 
			    </c:if>
			    <c:if test="${user.getLogin_day()>2 }">
			    	<img id=s2 class=userSignGet title="已经获得奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet.png">
			    </c:if>
			    </c:if> 
		      
		    	<img id=g3 class=userSignGoods2 src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignCard1.png">
			    <c:if test="${not empty user.getLogin_day()}">
			    <c:if test="${user.getLogin_day()==3}">
		    		<div id=p3>
				    	<c:if test="${user.getSign_state()==0 }">
				    		<img id=s3 class=userSignGet title="点击获取奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet0.png"
				    		onclick="showSignGet(this,3)">
				    	</c:if>
				    	<c:if test="${user.getSign_state()==1 }">
				    		<img id=s3 class=userSignGet title="已经获得奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet.png">
				    	</c:if>
		    		</div>
			    </c:if> 
			    <c:if test="${user.getLogin_day()>3 }">
			    	<img id=s3 class=userSignGet title="已经获得奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet.png">
			    </c:if>
			    </c:if>
		    
		    	<img id=g4 class=userSignGoods2 src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignCard2.png">
			    <c:if test="${not empty user.getLogin_day()}">
			    <c:if test="${user.getLogin_day()==4}">
		    		<div id=p4>
				    	<c:if test="${user.getSign_state()==0 }">
				    		<img id=s4 class=userSignGet title="点击获取奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet0.png"
				    		onclick="showSignGet(this,4)">
				    	</c:if>		    		
				    	<c:if test="${user.getSign_state()==1 }">
				    		<img id=s4 class=userSignGet title="已经获得奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet.png">
				    	</c:if>
				   </div>
			    </c:if>
			    <c:if test="${user.getLogin_day()>4 }">
			    	<img id=s4 class=userSignGet title="已经获得奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet.png">
			    </c:if>
			    </c:if>
		    
		    	<img id=g5 class=userSignGoods1 src="${pageContext.request.contextPath }/image/user_shopHufu1.png">
			    <c:if test="${not empty user.getLogin_day()}">
			    <c:if test="${user.getLogin_day()==5}">
		   		 	<div id=p5>
				    	<c:if test="${user.getSign_state()==0 }">
				    		<img id=s5 class=userSignGet title="点击获取奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet0.png"
				    		onclick="showSignGet(this,5)">
				    	</c:if>
				    	<c:if test="${user.getSign_state()==1 }">
				    		<img id=s5 class=userSignGet title="已经获得奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet.png">
				    	</c:if>
		    		</div>
			    </c:if>
			    <c:if test="${user.getLogin_day()>5 }">
			    	<img id=s5 class=userSignGet title="已经获得奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet.png">
			    </c:if>
			    </c:if>
		    
			   	<img id=g6 class=userSignGoods1 src="${pageContext.request.contextPath }/image/user_shopHufu2.png">
			    <c:if test="${not empty user.getLogin_day()}">
			    <c:if test="${user.getLogin_day()==6}">
		   			<div id=p6>
				    	<c:if test="${user.getSign_state()==0 }">
				    		<img id=s6 class=userSignGet title="点击获取奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet0.png"
				    		onclick="showSignGet(this,6)">
				    	</c:if>
				    	<c:if test="${user.getSign_state()==1 }">
				    		<img id=s6 class=userSignGet title="已经获得奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet.png">
				    	</c:if>
		   			</div>
			    </c:if>
			    <c:if test="${user.getLogin_day()>6 }">
			    	<img id=s6 class=userSignGet title="已经获得奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet.png">
			    </c:if>
			    </c:if>
		    
		    	<img id=g7 class=userSignGoods2 src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignCard3.png">
			    <c:if test="${not empty user.getLogin_day()}">
			    <c:if test="${user.getLogin_day()==7}">
		   			<div id=p7>
				    	<c:if test="${user.getSign_state()==0 }">
				    		<img id=s7 class=userSignGet title="点击获取奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet0.png"
				    		onclick="showSignGet(this,7)">
				    	</c:if>
				    	<c:if test="${user.getSign_state()==1 }">
				    		<img id=s7 class=userSignGet title="已经获得奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet.png">
				    	</c:if>
		    		</div>
			    </c:if>
			    <c:if test="${user.getLogin_day()>7 }">
			    	<img id=s7 class=userSignGet title="已经获得奖励" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGet.png">
			    </c:if>
			    </c:if>
		    
		    <span id=x1>您已经登录了${user.getLogin_day() }天</span>
		    <div id=SignGet>
		    <img  src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignGetBG.png">
		    <input id=x2 type="text" value=""></input>
		    </div>
	    </div>
    
    <!-- 招募 -->
    <div id=recruit>
	    <a href="${pageContext.request.contextPath }/href/to_recruit">
	    <img id=zhaomuceng1 class="zhaomuceng1" src="${pageContext.request.contextPath }/image/user_lobby/user_zhaomu1.png"
	    onmouseover="overImage('zhaomuceng1','user_lobby/user_zhaomu2.png'),overImage('zhaomuceng2','user_lobby/user_zhaomuB1.png')" 
	    onmouseout="overImage('zhaomuceng1','user_lobby/user_zhaomu1.png'),overImage('zhaomuceng2','user_lobby/user_zhaomuB5.png')"></a>
	    <img id=zhaomuceng2 class="zhaomuceng2" src="${pageContext.request.contextPath }/image/user_lobby/user_zhaomuB5.png">
	    <img class="zhaomuceng3" src="${pageContext.request.contextPath }/image/user_lobby/user_zhaomuB4.png">
	    <img class="zhaomuceng4" src="${pageContext.request.contextPath }/image/user_lobby/user_zhaomuB3.png">
	    <img class="zhaomuceng5" src="${pageContext.request.contextPath }/image/user_lobby/user_zhaomuB2.png">
    </div>

    <!-- 菜单 -->
    <div id=menu>
      
      <!-- 游戏大厅 -->
      <div id=gameMenu onmouseover="changeDisplay('u1',1)" onmouseout="changeDisplay('u1',0)">
      <a href="${pageContext.request.contextPath }/href/toGamemenu">
      <img src="${pageContext.request.contextPath }/image/user_lobby/user_lobbyImgYouxidating.png"></img></a>
      </div>
      
      <!-- 武将资料 -->
      <div id=generalInfo onmouseover="changeDisplay('u2',1)" onmouseout="changeDisplay('u2',0)">
      <a href="${pageContext.request.contextPath }/game/toGameAllCard0">
      <img src="${pageContext.request.contextPath }/image/user_lobby/user_lobbyImgWujiangziliao.png"></img></a>
      </div>
      
      <!-- 虎符商城 -->
      <div id=gameShop onmouseover="changeDisplay('u3',1)" onmouseout="changeDisplay('u3',0)">
      <a href="${pageContext.request.contextPath }/card/toShop">
      <img src="${pageContext.request.contextPath }/image/user_lobby/user_lobbyImgHufushangcheng.png"></img></a>
      </div>
      
      <!-- 更多精彩 -->
      <div id=other onmouseover="changeDisplay('u4',1)" onmouseout="changeDisplay('u4',0)" 
      onclick="changeDisplay('gameDetial',1),changeDisplay('gback',1),changeClass('gtext','gtext1')">
      <img src="${pageContext.request.contextPath }/image/user_lobby/user_lobbyImgGengduojingcai.png"></img>
      </div>
      
    </div>
    
    <!-- 用户选择 -->
    <div>
        <img id=u1 class="userChoose" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbyChoose.png">
        <img id=u2 class="userChoose" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbyChoose.png">
        <img id=u3 class="userChoose" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbyChoose.png">
        <img id=u4 class="userChoose" src="${pageContext.request.contextPath }/image/user_lobby/user_lobbyChoose.png">
    </div>
    
    </div>      
    
    <!-- 底部 -->
    <div id=footer>
        <!-- 虎符图案 -->
        <div id=footer1>
		    <img src="${pageContext.request.contextPath }/image/common/user_hufu.png">
		</div>
		<!-- 虎符数量 -->
		<div id=footer2>
			<p>${user.getUser_money() }</p>
		</div>
		<!-- 战令图案 -->
		<div id=footer3>
			<img src="${pageContext.request.contextPath }/image/common/user_zhanling.png">
		</div>
		<!-- 战令数量 -->
		<div id=footer4>
			<p>${user.getUser_points() }</p>
		</div>
		
		<!-- 经验条 -->
		<div id=footer6>	
			<c:if test="${user.getUser_level()>=0&&user.getUser_level()<=5 }">
			    <span>经验${user.getUser_exp() }/500</span>
				<progress  class="progress" value="${user.getUser_exp() }" max="500" ></progress>
			</c:if>
			<c:if test="${user.getUser_level()>=6&&user.getUser_level()<=10 }">
			    <span>经验${user.getUser_exp() }/900</span>
				<progress  class="progress" value="${user.getUser_exp() }" max="900" ></progress>
			</c:if>
			<c:if test="${user.getUser_level()>=11&&user.getUser_level()<=15 }">
			    <span>经验${user.getUser_exp() }/1500</span>
				<progress  class="progress" value="${user.getUser_exp() }" max="1500"></progress>
			</c:if>
			<c:if test="${user.getUser_level()>=16&&user.getUser_level()<=20 }">
			    <span>经验${user.getUser_exp() }/3000</span>
				<progress  class="progress" value="${user.getUser_exp() }" max="3000"></progress>
			</c:if>
		</div>
    </div>

    <!--磁引特效-->   
    <div class="ui">
    <p class="zoom"><span class="zoom zoomin">+</span><span class="zoom zoomout">-</span></p>
    <p class="zoomlevel"><span class="percent">100</span> % - (<span class="width"></span>px)(<span class="height"></span>px)</p>
    <p>Dead: <span class="dead">0</span></p>
    <p>Alive: <span class="alive">0</span></p>
    <p>Drawn: <span class="drawn">0</span></p>
    <p><span class="fps">0</span> FPS</p>
    </div>
    <script src='${pageContext.request.contextPath }/js/cichang2.js'></script>
    <script  src="${pageContext.request.contextPath }/js/cichang1.js"></script>
    
    <!-- 更多精彩——版本 -->
    <div id=gameDetial>
    <div id=gback onclick="closeDiv(),changeDisplay('gback',0)"><p>返回</p></div>
    <div id=gtext class="gtext1">
	    <p>游戏版本号：<yellow>CK1.4</yellow></p>
	    <p>开发者：J&A</p>
    </div>
    
    </div>
     <!-- 游戏引导 -->
    <div id=about>
    <div id=aboutBack onclick="changeDisplay('about',0)"><p>返回</p></div>
        <img src="${pageContext.request.contextPath }/image/user_lobby/about.png">
    </div>


</body>
    <!-- 背景音频部分 -->
    <embed src="${pageContext.request.contextPath}/sound/qixiangchucheng.mp3" hidden="true" autostart="true" loop="loop">
</html>