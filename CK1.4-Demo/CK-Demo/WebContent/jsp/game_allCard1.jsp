<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>ck-武将世界</title>
<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/game_allCard1.css" type="text/css" />
</head>
<script type="text/javascript">

function changeCardShow(name,url0,name,type,num) {
	document.getElementById("imgdet").src=url0;
	if(num==1){
		document.getElementById("isOwned").style.display="block";
		document.getElementById("isNotOwned").style.display="none";
	}
	if(num==0){
		document.getElementById("isNotOwned").style.display="block";
		document.getElementById("isOwned").style.display="none";
	}
	var text = document.getElementById("text");
	text.style.display="block";
	var msg=null;
	if(type!=null){
		if(type==1){
			msg="【名将】招募、活动获取"
		}
		if(type==2){
			msg="【江东霸业】招募、活动获取"
		}
		if(type==3){
			msg="【沉鱼落雁】招募、活动获取"
		}
		if(type==4){
			msg="【蜀汉英雄】招募、活动获取"
		}
		if(type==5){
			msg="【魏武之世】招募、活动获取"
		}
		if(type==6){
			msg="商城，碎片合成、活动获取"
		}			
	}else{
		msg="信息有误"
	}
	
	text.innerHTML="<p><yellow>"+name+"</yellow></p>"+"<p><white>获取途经</white></p>"+"<p><yellow>"+msg+"</yellow></p>"
}

</script>

<body>
    <!-- 以下为页眉 -->
    <%@ include file="user_head1.jsp"%>
    
    <!-- 头部文字 -->
	<div id=head>
		<p>ck-武将世界</p>
	</div>
	
	<!-- 详细展示区 -->
	<div id=imgDet>
	    <img id="imgdet" src="${pageContext.request.contextPath }/image/game_userChooseShow0.png">
	    <img id="isOwned" style="display: none" src="${pageContext.request.contextPath }/image/game_allCardImg1.png">
	    <img id="isNotOwned" style="display: none" src="${pageContext.request.contextPath }/image/game_allCardImg2.png">
	    <div id=text>
    </div>
    </div>
	
	<!-- 核心部分 -->
	<div id=conn>

    <div id=showImg > 
    <!-- 已拥有部分 -->
    <c:forEach items="${Owncard_list }" var="oc_l">
    	<div id=cardImg onclick="changeCardShow('${oc_l.generals_name}','${pageContext.request.contextPath }/${oc_l.generals_image}','${oc_l.generals_name}','${oc_l.type}',1)">
	    <img class="showImg" src="${pageContext.request.contextPath }/${oc_l.generals_image}">
	    <img class="isOwned" src="${pageContext.request.contextPath }/image/game_allCardImg1.png">
	    </div>
    </c:forEach>
    <!-- 未拥有部分 -->
    <c:forEach items="${NotOwncard_list }" var="noc_l">
    	<div id=cardImg onclick="changeCardShow('${noc_l.generals_name}','${pageContext.request.contextPath }/${noc_l.generals_image}','${noc_l.generals_name}','${noc_l.type}',0)">
	    <img class="showImg" src="${pageContext.request.contextPath }/${noc_l.generals_image}">
	    <img class="isOwned" src="${pageContext.request.contextPath }/image/game_allCardImg2.png">
	    </div>
    </c:forEach>
    </div>
    
	</div>
	
	<!-- 以下为页脚部分 -->
    <%@ include file="user_footer1.jsp"%>
</body>
</html>