<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 已优化，已注释-JH -->
	<meta charset="UTF-8">
	<title>稀有武将</title>
	<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/game_recruitR.css" type="text/css" >
	<script src="${pageContext.request.contextPath }/js/jquery1.min.js"></script>	
</head>

<script type="text/javascript">
//跳转
function toUrl(url){
	window.location.href = "${pageContext.request.contextPath }/"+url;
}
</script>

<body>
	<c:if test="${cg == 4 }">
	<div class="text">
		<span>破</span>
		<span>敌</span>
		<span>千</span>
		<span>钧</span>
		<span>&nbsp;</span>
		<span>势</span>
		<span>卫</span>
		<span>吾</span>
		<span>城</span>
	</div>
	<!-- 以下为背景视频部分 -->
	    <video class="video" src="${pageContext.request.contextPath }/video/user_recruitRBG.mp4" autoplay=true loop=true preload="auto"></video>
	</c:if>
	
	<c:if test="${cg == 5 }">
	<div class="text">
		<span>神</span>
		<span>威</span>
		<span>天</span>
		<span>降</span>
		<span>&nbsp;</span>
		<span>定</span>
		<span>吾</span>
		<span>军</span>
		<span>山</span>
	</div>
	<!-- 以下为背景视频部分 -->
	    <video class="video" src="${pageContext.request.contextPath }/video/user_recruitRBG.mp4" autoplay=true loop=true preload="auto"></video>
	</c:if>

    <!-- 以下为页眉 -->
    <div id=head><p>ck-稀有武将</p></div>
    
    <%@ include file="user_head1.jsp" %>
    
    <div id=back>
	<a href="${pageContext.request.contextPath }/href/to_recruit">
		<img alt="返回" title="返回" src="${pageContext.request.contextPath }/image/common/user_head2Back.png">
	</a>
	</div>
	
	<!-- 以下为主要显示部分 -->
	<!-- 如果是数组，则显示多个 -->
	<c:if test="${not empty ct_list}">
		<c:forEach items="${ct_list }" var="c">
				<c:if test="${c.generals_star>4 }">
				<div class="spCard">
					<img class="fa2" src="${pageContext.request.contextPath}/${c.generals_image }" alt="">
					<img class="fa1" src="${pageContext.request.contextPath}/image/game_recruitR/back_5.gif" alt="">			
		        </div>				    
		  		</c:if>
		  		
		  		<c:if test="${c.generals_star==4 }">
				<div class="spCard">
					<img class="fa2" src="${pageContext.request.contextPath}/${c.generals_image }" alt="">
					<img class="fa1" src="${pageContext.request.contextPath}/image/game_recruitR/back_4.gif" alt="">			
		        </div>				    
		  		</c:if>
		  		
		  		<div id=for4>
				<c:if test="${c.generals_star<=3 }">
					<img src="${pageContext.request.contextPath}/${c.generals_image }"
					style="width: 200px; height: 280px; position: relative;float:left;top:300px;margin-left: 155px;">
				</c:if>
				</div>
		</c:forEach>	  		
	</c:if>
	
	<!-- 不是数组则显示单个 -->
	<c:if test="${empty ct_list}">	
	<!-- cg为1，是普通卡 -->
	<c:if test="${cg == 1 }">
	<div id=cg1>
	    <img src="${pageContext.request.contextPath}/${ct.getGenerals_image() }">
		<div id=h3>
		<h3 style="color: #ffffffb9;">
			再抽
			<p style="color: yellow; font-size: 25px;">${5-user.getC_times()%5}</p>
			次必定获赠4-5星武将
		</h3>
		</div>
	</div>
	</c:if>
	<!-- cg不为1，是特殊卡 -->
	<c:if test="${cg != 1 }">
		<div id=cgsp class="spCard">
		    <img class="fa2" src="${pageContext.request.contextPath}/${ct.getGenerals_image() }" alt="">   
            <c:if test="${cg == 4 }">
	        <img class="fa1" src="${pageContext.request.contextPath}/image/game_recruitR/back_4.gif" alt="">
	        </c:if>
	  		<c:if test="${cg == 5 }">
	        <img class="fa1" src="${pageContext.request.contextPath}/image/game_recruitR/back_5.gif" alt="">
	  		</c:if>                
        </div>
   </c:if>
   </c:if>
    
    <!-- 以下是招募一次，五次按钮及方法 -->
    <div id=conn_btn>
	    <img class="img" id=img1 src="${pageContext.request.contextPath}/image/user_recruit/zhaomu1.png"
	    onclick="toUrl('card/getOne/1&${type }')">
	    <img class="img" id=img2 src="${pageContext.request.contextPath}/image/user_recruit/zhaomu5.png"
	    onclick="toUrl('card/getFive/5&${type }')">
    </div>


    <!-- 以下为页脚部分 -->
    <%@ include file="user_footer3.jsp" %>
    
</body>

    <!-- 音效部分 -->
    <embed src="${pageContext.request.contextPath}/sound/get.wav" hidden="true" autostart="true" loop="false">

</html>