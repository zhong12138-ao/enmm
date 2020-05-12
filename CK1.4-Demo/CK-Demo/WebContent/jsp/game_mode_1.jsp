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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/game_mode_1.css" type="text/css" />
</head>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery1.min.js"></script>


<body>
	<div id=head>
		<p>ck-一骑当千挑战</p>
	</div>
	
	<!-- 以下为页眉 -->
	<%@ include file="user_head1.jsp"%>
	
	<!-- 技能展示动画 -->
	<div id=skillShow> 
	<div id=skillShowP></div>
    </div>  
	
    
    <!-- 战斗标题 -->
	<div id=title>
	    <font style="color:white;font-size:40px;">逐一击败对手，成为人中吕布吧！</font>
	</div>
	
	<!-- 变化页面 -->
	<div id=game_mode_1d>
	
    <%@ include file="game_mode_1d.jsp" %>
    </div>
    
   

	<%@ include file="user_footer2.jsp" %>
</body>

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

function sure(){
		var url = "${pageContext.request.contextPath }/game/tobalance";
		$.ajax({
			type : "post",
			url : url,
			dataType: "text",
			data : $('#form').serialize(),
			timeout:1000,
			success:function(dates){
				//alert(dates);
				$("#game_mode_1d").html(dates);//要刷新的div
			},
			error: function() {
               alert("失败，请稍后再试！");
            }
		});
}

function chooseSkill(num1,skillName) {
	var ss = document.getElementById('skillShow')
	var ssp = document.getElementById('skillShowP')
	var s1 = document.getElementById('skill1')
	var s2 = document.getElementById('skill2')
	var s3 = document.getElementById('skill3')
	ss.style.animation="none"
	ss.style.display="block"
	ss.style.animation="skillshow 0.5s ease-in 0s 1"
	if(num1==1){
		document.getElementById('sk1').value=1
		s1.style.display="none"	
		ssp.innerHTML=skillName
	}
    if(num1==2){
    	document.getElementById('sk2').value=1
    	s2.style.display="none"
    	ssp.innerHTML=skillName
	}
	if(num1==3){
		document.getElementById('sk3').value=1
		s3.style.display="none"
		ssp.innerHTML=skillName
	}
	setTimeout(function() {
		ss.style.display="none"
		ss.style.animation="none"
	}, 500);
}
</script>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
