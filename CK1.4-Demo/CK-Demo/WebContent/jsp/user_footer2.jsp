<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<style>
@font-face {
    font-family: lishu; 
    src: url(../font/lishu.TTF);
    }
#footer{
	position:fixed;
	bottom:0px;
    margin: 0;
    width: 100%;
    height: 60px;
    background-color: #0000007e;
    overflow: hidden;
    line-height: 55px;
    border-top:  #faeb61b4 3px solid;
    z-index: 10;
    font-family: lishu;
}
#footer1 img{
	position: absolute;
	bottom: 5px;
	left: 5px;
	width: 50px;
	height: 50px;
}

#footer2 p{
	position: absolute;
	bottom: -20px;
	left: 65px;
	width: 100px;
	height: 50px;
	color: #fff;
	font-size: 25px;
}

#footer3 img{
	position: absolute;
	bottom: 5px;
	left: 170px;
	width: 49px;
	height: 49px;
	
}

#footer4 p{
	position: fixed;
	bottom: -20px;
	left: 230px;
	width: 100px;
	height: 50px;
	color: #fff;
	font-size: 25px;
}

</style>


<div id=footer>


        <div id=footer1>
		    <a href="${pageContext.request.contextPath }/card/toShop">
		    <img src="${pageContext.request.contextPath }/image/common/user_hufu.png"></a>
		</div>
		
		<div id=footer2>
			<p>${user.getUser_money() }</p>
		</div>
		
		<div id=footer3>
		    <a id=f3 href="${pageContext.request.contextPath }/card/delCardToZhanLing">
			<img src="${pageContext.request.contextPath }/image/common/user_zhanling.png"></a>
		</div>
		
		<div id=footer4>
			<p>${user.getUser_points() }</p>
		</div>

</div>

