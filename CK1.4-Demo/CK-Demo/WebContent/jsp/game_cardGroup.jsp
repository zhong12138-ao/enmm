<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>


<head>
	<meta charset="UTF-8">
	<title>ck-卡牌表</title>
	<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/game_cardGroup.css">
	<script src="${pageContext.request.contextPath }/js/jquery2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.roundabout2.js"></script>
</head>

<script>
/* 以下控制大圆周 */
    $(document).ready(function() {
            $('ul').roundabout({
                minZ: 100,
                maxZ: 300,
                minOpacity: 0.8,
                minScale: 0.5,
                childSelector: '.card',
                tilt: -4 
            });
        });
        
  //控制更换图片
    function overImage(imgId,imgSrc){
    	document.getElementById(imgId).src="${pageContext.request.contextPath }/"+imgSrc
    }
  
  function getText(name,star,att,def,str,sig,spe,ski){
	  document.getElementById('cardShowImg').style.display="block";
	  document.getElementById('cardShowText').innerHTML="<p><yellow>武将姓名-"+name+"</yellow></p>"+
	  "<p><yellow>武将星级：</yellow>"+star+"</p>"+
	  "<p><yellow>攻击：</yellow>"+att+"</p>"+
	  "<p><yellow>防御：</yellow>"+def+"</p>"+
	  "<p><yellow>谋略：</yellow>"+str+"</p>"+
	  "<p><yellow>攻城：</yellow>"+sig+"</p>"+
	  "<p><yellow>速度：</yellow>"+spe+"</p>"+
	  "<p><yellow>技能：</yellow>"+ski+"</p>"
  }
  
  
   $(document).ready(function () {
	  setTimeout(function(){
		  if(location.href.indexOf("#reloaded")==-1){
	        location.href=location.href+"#reloaded";
	        location.reload();
	    }},2000)

	     
	 })

</script>



<body>
	<div id=head>
		<p>ck-卡组详情</p>
	</div>

	<%@ include file="user_head1.jsp"%>
	<div id=back>
	<a href="${pageContext.request.contextPath }/href/to_recruit">
		<img alt="返回" title="返回" src="${pageContext.request.contextPath }/image/common/user_head2Back.png">
	</a>
	</div>
    <!-- 以下展示弹框，显示武将信息 -->
	<div id=conn>.
	
	<div id=card>
		<ul>	
			<c:if test="${!empty list}">
				<c:forEach items="${list }" var="l">	
					<li class="card">
						<img style="height: 400px;" class="cp" src="${pageContext.request.contextPath }/${l.generals_image }"
							onclick="overImage('cardShowImg','${l.generals_image }'),
							getText('${l.generals_name }','${l.generals_star }','${l.generals_attack }','${l.generals_defense }','${l.generals_strategy }','${l.generals_siege }','${l.generals_speed }','${l.generals_skill }')">
					</li>
					
				</c:forEach>
			</c:if>		
		</ul>
	</div>
	<!-- 展示区 -->
	<div id=cardShow>	
	 <img id=cardShowImg src="">
	 <div id=cardShowText></div>	 									
	</div>	
		
	</div>



	<%@ include file="user_footer1.jsp"%>
</body>
</html>