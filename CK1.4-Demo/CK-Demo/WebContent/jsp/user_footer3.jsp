<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

#footer5 img{
	position: fixed;
	bottom: 0px;
	left: 1750px;
	width: 200px;
	height: 120px;
	
	
}


    
#user_choose {
    position: absolute;
}


</style>

<script type="text/javascript">
function mouseoverImage(b,l,w){
	var choose = document.getElementById("user_choose")
	choose.style.left=l
	choose.style.bottom=b
	choose.style.width=w
	choose.style.height=w
}
function mouseoutImage(){
	var choose = document.getElementById("user_choose")
	choose.style.left="-5000px"
}


</script>


<div id=footer onmouseout="mouseoutImage()">
        <div>
        <img id=user_choose src="${pageContext.request.contextPath }/image/common/user_mouseOver.png"
        style="	bottom: 50px;left: -5000px;width: 100px;height: 100px;">
        </div>

        <div id=footer1>
		    <a href="${pageContext.request.contextPath }/card/toShop">
		    <img src="${pageContext.request.contextPath }/image/common/user_hufu.png"
		    onmouseover="mouseoverImage('-19px','-20px','100px')" ></a>
		</div>
		
		<div id=footer2>
			<p>${user.getUser_money() }</p>
		</div>
		
		<div id=footer3>
		    <a id=f3 href="${pageContext.request.contextPath }/card/delCardToZhanLing">
			<img src="${pageContext.request.contextPath }/image/common/user_zhanling.png"
			onmouseover="mouseoverImage('-19px','144px','100px')"></a>
		</div>
		
		<div id=footer4>
			<p>${user.getUser_points() }</p>
		</div>
		
		<div id=footer5>
		    <a href="${pageContext.request.contextPath }/href/toUserlobby">
			<img src="${pageContext.request.contextPath }/image/common/user_lobbyImgZhuye.png"
			onmouseover="mouseoverImage('-185px','1600px','500px')"></a>
		</div>

		
</div>

