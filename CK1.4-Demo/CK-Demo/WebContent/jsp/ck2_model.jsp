<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>ck2-开发模板</title>
<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/ck2_model.css" type="text/css" />
</head>


<style>
@font-face {
    font-family: lishu; 
    src: url(../font/lishu.TTF);
    }

body{
    margin: 0;
    ondragstart:false;
    background-image: url("../image/user_cardBG.png");
    background-repeat: no-repeat;
}
    
#head{
    position: absolute;
    top:10px;
    width: 100%;
    height: 55px;
    text-align: center;
    line-height: 55px;
    background-color: #000000 0;  
    z-index: 4;
}

#head p{
    margin: 0;
    font-size: 70px;
    text-shadow:0 4px 2px #fafa32ca;
    color: #fff;
    font-family: lishu;
}

#conn{
    position: absolute;
    top:0;
    left: 0;
    right: 0;
    bottom: 0;
}

#conn p{
    position:absolute;
    text-align:center;
    width:100%;
    top:48%;
    margin:0;
    color:white;
    font-size:65px;
    font-family:lishu; 
    line-height: 100%;  
}
</style>


<body>
    <!-- 以下为页眉 -->
    <%@ include file="user_head1.jsp"%>
    
    <!-- 头部文字 -->
	<div id=head>
		<p>ck2-开发模板</p>
	</div>
	
	<!-- 核心部分 -->
	<div id=conn>
	<p>页面正在施工中！</p>
	</div>
	
	<!-- 以下为页脚部分 -->
    <%@ include file="user_footer1.jsp"%>
</body>
</html>