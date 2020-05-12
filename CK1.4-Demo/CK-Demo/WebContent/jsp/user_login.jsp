<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>ck-登录</title>
	<!-- 导航栏图标 -->
	<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath}/image/game_ck2ICON.png" />
	<!-- end -->
	<script src="${pageContext.request.contextPath}/js/jquery1.min.js"></script>
	<!-- 链接样式表 -->	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/user_login.css">
	<!-- end -->
</head>

<!-- 效果函数 -->
<script type="text/javascript">
    //悬浮按键变化
    function init(){
        var log=document.getElementById("Login").getElementsByTagName("p");
        var len=log.length
        var flag=1
        for(var i=0;i<len;i++){
            log[i].value=i
            log[i].onmouseover=function(){
                log[flag].className="show0"
                flag=this.value
                log[flag].className="show1";
            }
            log[i].onmouseout=function(){
                log[flag].className="show0"
            }
        }
    }

    //图片悬浮
    function mouseoverImage(obj){
    	var img=document.getElementById("pic")
    	obj.style.border="solid 1px #ffffff"
    	obj.style.width="600px"
    	obj.style.height="165px"
    }
    function mouseoutImage(obj){
    	obj.style.border=0
    	obj.style.width="200px"
        obj.style.height="55px"
    }
    
    //注册点击及返回
    function onRegisterClick(n){
    	if(n==0){
    		document.getElementById("ck_register").style.display="block"
    	    document.getElementById("ck_login").style.display="none"
    	}
    	if(n==1){
    		document.getElementById("ck_register").style.display="none"
        	document.getElementById("ck_login").style.display="block"
    	}
    	
    }
    
    //注册图片点击
    function onRegImgClick(id,n){
    	document.getElementById(id).checked=true;
    	var img1 = document.getElementById("img1");
    	var img2 = document.getElementById("img2");
    	var img3 = document.getElementById("img3");
    	var img4 = document.getElementById("img4");    	
    	img1.style.border='solid 1px #00000000';
    	img2.style.border='solid 1px #00000000';
    	img3.style.border='solid 1px #00000000';
    	img4.style.border='solid 1px #00000000';
    	if(n==1){img1.style.border='solid 1px #fff';}
    	if(n==2){img2.style.border='solid 1px #fff';}
    	if(n==3){img3.style.border='solid 1px #fff';}
    	if(n==4){img4.style.border='solid 1px #fff';}	
    }
    
</script>

<body class="bg" onload="init();">

    <!-- 视频组件 -->
    <video autoplay="autoplay" preload="auto" loop="loop" style="z-index: -1;position: absolute;top:55px;width:1920px;">
    <source  src="${pageContext.request.contextPath}/video/user_login_bg.mp4" type="video/mp4" >
    </video>
    
    <!-- 头部标签 -->
    <div id=head>
    <img src="${pageContext.request.contextPath}/image/user_login/jianianhua.jpg" alt="" style="margin-left: 0;">
    <img src="${pageContext.request.contextPath}/image/user_login/wangyi.png" alt="" style="margin-left: 500px;">
    </div>
    
    <!-- 风云岛 -->
    <div id=pic>
    <a href="https://shark-tracer.netease.com/v1/log/default?project_id=101964018&sign=BuWjj4HhlBtokirqF59pSqtWRuvLjEgJ&log_type=mmad_click">
    <img src="${pageContext.request.contextPath}/image/user_login/fengyundao.png" 
    onmouseover="mouseoverImage(this)" onmouseout="mouseoutImage(this)"
    alt="" style="position:fixed;top:0px;left:420px;height: 55px;width: 200px;"></a>
    </div>      
    
    <div id=conn>
    <!-- 登录部分 -->
    <div id=ck_login>
            <form action="${pageContext.request.contextPath}/user/login" id="userForm" method="post">
            	<div id=Input>
                <h2 class="h2">CK-抽卡登录</h2>
                <p class="text">用户名</p>
                <p><input id="username1" name="username" onblur="checkUsername()" onfocus="clearUsername()"><br>
                <span class="msg" id="usernamemsg"></span></p>
                <p class="text">密码</p>                
                <p><input id="password1" name="password" onblur="checkPassword()" onfocus="clearPassword()" type="password"><br>
                <p><span class="msg" id="passwordmsg"></span></p>
            </div>
            <div id=Login>
                <p class="show0" ><input class="login-button" type="submit" value="登录" onclick="userLogin()"></p>
                <p class="show0" ><input class="regis-button" type="button" value="注册" onclick="onRegisterClick(0)"></p>
            </div>
            ${msg }
            <c:if test="${not empty msg}">
                <img class="msgimg" src="${pageContext.request.contextPath}/image/meme/cc(2).png">
            </c:if> 
            </form>                   
        </div>
        
    <!-- 注册部分 -->
    <div id=ck_register>
            <form action="${pageContext.request.contextPath }/user/regist" id="registForm" autocomplete="off"  method="post" >
            	<input type="hidden" name="method" value="regist">
            	<div id=Input>
                <h2 class="h2">CK-抽卡注册</h2>
                <p class="text">用户名</p>
                <p><input id="username2" name="user_name" onblur="checkUsername()" onfocus="clearUsername()"><br>
                <span class="msg" id="usernamemsg"></span></p>
                <p class="text">密码</p>
                <p><input id="password2" name="user_password" onblur="checkPassword()" onfocus="clearPassword()" type="password"><br>
                <span class="msg" id="passwordmsg"></span></p>
                <p class="text">邮箱</p>
                <p><input id="email" name="email" onblur="checkEmail()" onfocus="clearEmail()" type = "email"><br>
                <span class="msg" id="emailmsg"></span></p>
                
                
                <p style="width: 300px;height: 40px" >
                
                <label for="test1">
                <input name="user_image" id="test1" type="radio" checked="checked"  style="display: none;" value="image/touxiang/touxiang1.jpg"/>
                <img class="registImg" id="img1" src="${pageContext.request.contextPath }/image/touxiang/touxiang1.jpg"
                onclick= "onRegImgClick('test1',1)"/>          
                </label>
                <label for="test2">
                <input name="user_image" id="test2" type="radio" style="display: none;" value="image/touxiang/touxiang2.jpg"/>
                <img class="registImg" id="img2" src="${pageContext.request.contextPath }/image/touxiang/touxiang2.jpg"
                onclick= "onRegImgClick('test2',2)"/>
                </label>
                <label for="test3">
                <input name="user_image" id="test3" type="radio" style="display: none;" value="image/touxiang/touxiang3.jpg"/>
                <img class="registImg" id="img3" src="${pageContext.request.contextPath }/image/touxiang/touxiang3.jpg"
                onclick= "onRegImgClick('test3',3)"/>
                </label>
                <label for="test4">
                <input name="user_image" id="test4" type="radio" style="display: none;" value="image/touxiang/touxiang4.jpg"/>	
                <img class="registImg" id="img4" src="${pageContext.request.contextPath }/image/touxiang/touxiang4.jpg" 
                onclick= "onRegImgClick('test4',4)"/>
                </label>
                </p>
            </div>
            <div id=Regist>
                <p class="show0" ><input id="regis-button" class="login-button" type="submit" value="注册" onclick="check()"></p>
                <p class="show0" ><input id="back-button" class="regis-button" type="button" value="返回" onclick="onRegisterClick(1)"></p>
            	<p style="color: yellow;font-size: 15px;">新用户注册赠送50000虎符</p>
            </div>
            </form>
            ${msg }
            <c:if test="${not empty msg}">
                <img class="msgimg" src="${pageContext.request.contextPath }/image/meme/cc(2).png">
            </c:if> 
        </div>
        
    <div id=logo2><img src="${pageContext.request.contextPath}/image/user_login/rongyulogo.png" alt=""></div>
    </div>
    

    <!-- 底部 -->
    <div id=footer>
    <div style="float: left;margin-left: 20px;margin-top:60px;"><a href="https://adl.netease.com/d/g/stzb/c/gw"><img src="${pageContext.request.contextPath }/image/zhuomianban.png" alt="" style="margin-left: 40px;"></a></div>
    <div style="float: left;margin-left: 40px;margin-top:60px;"><img src="${pageContext.request.contextPath}/image/user_login/PRcod.png" alt=""></div>
    <div style="float: left;margin-left: 40px;margin-top:60px;"><img src="${pageContext.request.contextPath}/image/game_ck2ICON.png" width="108px" height="108px" alt=""></div>    
    <div style="float: right;margin-left: 40px;margin-top:0px;"><img src="${pageContext.request.contextPath}/image/meme/lb(1).png" width="200px" height="200px" alt=""></div>
    
    <!-- 开发者logo -->
    <div class="create_logo">
    <img alt="开发制作者" src="${pageContext.request.contextPath }/image/common/JA.png"
    style="width: 150px;height: 175px;">
    </div>
    <div style="float: left;margin-left: 40px;margin-top:0px;">
    <p>Create For Study And Happiness</p>
    <p>仅供交流学习使用</p>
    </div> 
    </div>

    <!-- 底部跳转下载桌面版 -->
    <div class="video-wrap">
    <a href="javascript:;" class="JvideoBtn" data-src="https://nie.v.netease.com/nie/2019/0725/661eaccac9c7c9b9822ae3152002cee4qt.mp4">
       <i></i>
    </a>
    </div>

    <!-- 判断用户输入 -->
    <script>
/* 判断用户方法 */
        function check(){
            var username=document.getElementById("username");
            /* 判断用户名是否为空 */
            if(username && username.value==""){
                alert("请输入用户名")
                username.focus()
                return;
            }
           
            var password=document.getElementById("password");
            /* 判断密码是否为空 */
            if(password && password.value==""){
                alert("请输入密码")
                password.focus()
                return;
            }

            document.frm.submit()
        }

        /* 当空户名未输入时提醒 */
        function checkUsername(){
            var username=document.getElementById("username");
            if(username && username.value==""){
                var msg=document.getElementById("usernamemsg")
                msg.innerHTML="用户名不能为空"
                return false
            }
            return true;
        }
        /* 当密码未输入时提醒 */
        function checkPassword(){
            var password=document.getElementById("password");
            if(password && password.value==""){
                var msg=document.getElementById("passwordmsg")
                msg.innerHTML="密码不能为空"
                return false
            }
            return true;

        }
        
        /* 光标点击输入框 消除提醒语句 */
        function clearUsername(){
            var msg=document.getElementById("usernamemsg")
            msg.innerHTML=""
        }
        
        /* 光标点击输入框 消除提醒语句 */   
        function clearPassword(){
            var msg=document.getElementById("passwordmsg")
            msg.innerHTML=""
        }

        function userLogin(){
        	var username = $("#username").val();
			var password = $("#password").val();
			var cpacha = $("#cpacha").val();
			if(username == '' || username == 'undefined'){
				alert("请填写用户名！");
				return;
			}
			if(password == '' || password == 'undefined'){
				alert("请填写密码！");
				return;
			}
			
			
			
    	}
    </script>
</body>

    <!-- 背景音频部分 -->
    <embed src="${pageContext.request.contextPath}/sound/daguojiangxing.mp3" hidden="true" autostart="true" loop="true">
</html>