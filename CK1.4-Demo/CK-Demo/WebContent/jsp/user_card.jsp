<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>


<head>
	<meta charset="UTF-8">
	<title>ck-我的武将</title>
	<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/user_card.css" type="text/css" />
</head>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery1.min.js"></script>

<script type="text/javascript">
	//控制更换图片
	function overImage(imgId,imgSrc){
		document.getElementById(imgId).src="${pageContext.request.contextPath }/image/"+imgSrc
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
	
	//控制元素底色变化
	function changeBackColor(obj,color){
		obj.style.background=color
	}
	
	//跳转
	function toUrl(url){
		window.location.href = "${pageContext.request.contextPath }/"+url;
	}

</script>
    

<body>

    <!-- 以下为页眉 -->
    <%@ include file="user_head1.jsp"%>
    
    <!-- 头部文字 -->
	<div id=head>
		<p>ck-我的武将</p>
	</div>
    
    <!-- 以下为卡包满了的提示 -->
    <div>
      <p style="position:fixed; top:0px;left:0px;width:500px;text-align:left;color:white;font-size:30px;font-family:gupu">
      ${msg }</p>
    </div>

    <div id=conn>
		<section class="strips">
		<!-- 第一部分 -->
		  <article class="strips__strip">
			<div class="strip__content">
			  <h1 class="strip__title" data-name="Lorem">典<br><br>藏</h1>
			  <div class="strip__inner-text">
			  	<c:if test="${not empty Precious_card_list}">
			    <div id="diancang" class="showDiv">
					<p>珍稀度：★★★★★★</p>
					<c:forEach items="${Precious_card_list }" var="dc">
						<div class ="showCard">
						<img src="${pageContext.request.contextPath }/${dc.card_image }"></a>
						</div>
					</c:forEach>		
				</div>
				</c:if>
			  </div>
			</div>
		  </article>
		<!-- 第二部分 -->
		  <article class="strips__strip">
			<div class="strip__content">
			  <h1 class="strip__title" data-name="Ipsum">史<br><br>诗</h1>
			  <div class="strip__inner-text">
					<c:if test="${not empty five_list}">
				    <div id="wuxing" class="showDiv">
						<p>珍稀度：★★★★★</p>
						<c:forEach items="${five_list }" var="five">
						    <div class ="showCard">
							<a href="${pageContext.request.contextPath }/card/toGameCardInfo/${five.card_id }&${five.id }">
							<img src="${pageContext.request.contextPath }/${five.card_image }" alt=""></a>
							<span class="span1">&nbsp;&nbsp;lv.${five.card_level }&nbsp;&nbsp;</span>
							</div>
						</c:forEach>	
					</div>
					</c:if>
			  </div>
			</div>
		  </article>
		<!-- 第三部分 -->
		  <article class="strips__strip">
			<div class="strip__content">
			  <h1 class="strip__title" data-name="Dolor">稀<br><br>有</h1>
			  <div class="strip__inner-text">
				<c:if test="${not empty four_list}">
				<div id="sixing" class="showDiv">
					<p>珍稀度：★★★★</p>
					<c:forEach items="${four_list }" var="four">
					    <div class ="showCard">
						<a href="${pageContext.request.contextPath }/card/toGameCardInfo/${four.card_id }&${four.id }">
						<img src="${pageContext.request.contextPath }/${four.card_image }" alt=""></a>
						<span class="span1">&nbsp;&nbsp;lv.${four.card_level }&nbsp;&nbsp;</span>
						</div>
					</c:forEach>	
				</div>
				</c:if>
			  </div>
			</div>
		  </article>
		<!-- 第四部分 -->
		  <article class="strips__strip">
			<div class="strip__content">
			  <h1 class="strip__title" data-name="Sit">普<br><br>通</h1>
			  <div class="strip__inner-text">
				<c:if test="${not empty other_list}">
				<div id="sanxing" class="showDiv">
						<p>珍稀度：★★★及以下</p>
						<c:forEach items="${other_list }" var="o">
						<div class ="showCard">
						<a href="${pageContext.request.contextPath }/card/toGameCardInfo/${o.card_id }&${o.id }">
						<img src="${pageContext.request.contextPath }/${o.card_image }" alt=""></a>
						<span class="span1">&nbsp;&nbsp;lv.${o.card_level }&nbsp;&nbsp;</span>
						</div>
					</c:forEach>
				</div>
				</c:if>
			  </div>
			</div>
		  </article>
		
		  <i class="close fa-close strip__close">返回</i>
		</section>
		
		<script src="${pageContext.request.contextPath }/js/jquery1.min.js"></script>
		<script>
		var Expand = function () {
			var tile = $('.strips__strip');
			var tileLink = $('.strips__strip > .strip__content');
			var tileText = tileLink.find('.strip__inner-text');
			var stripClose = $('.strip__close');
			var expanded = false;
			var open = function () {
				var tile = $(this).parent();
				if (!expanded) {
					tile.addClass('strips__strip--expanded');
					tileText.css('transition', 'all .6s 1s cubic-bezier(0.23, 1, 0.32, 1)');
					stripClose.addClass('strip__close--show');
					stripClose.css('transition', 'all .6s 1s cubic-bezier(0.23, 1, 0.32, 1)');
					expanded = true;
				}
			};
			var close = function () {
				if (expanded) {
					tile.removeClass('strips__strip--expanded');
					tileText.css('transition', 'all 0.15s 0 cubic-bezier(0.23, 1, 0.32, 1)');
					stripClose.removeClass('strip__close--show');
					stripClose.css('transition', 'all 0.2s 0s cubic-bezier(0.23, 1, 0.32, 1)');
					expanded = false;
				}
			};
			var bindActions = function () {
				tileLink.on('click', open);
				stripClose.on('click', close);
			};
			var init = function () {
				bindActions();
			};
			return { init: init };
		}();
		Expand.init();
		</script>
    </div>
    
    <!-- 按钮 -->
    <div id=exchange class=btn onmouseover="overImage('btn1','common/game_btnBG2.png')" onmouseout="overImage('btn1','common/game_btnBG1.png')" 
    onclick="toUrl('jsp/game_exchange.jsp')">
    <img id=btn1 src="${pageContext.request.contextPath }/image/common/game_btnBG1.png">
    <p class="span2">兑&nbsp;&nbsp;换</p>
    </div>
    
    <div id=tozhanling class=btn onmouseover="overImage('btn2','common/game_btnBG2.png')" onmouseout="overImage('btn2','common/game_btnBG1.png')" 
    onclick="changeDisplay('Window',1)">
    <img id=btn2 src="${pageContext.request.contextPath }/image/common/game_btnBG1.png">
    <p class="span2">转换战法</p>
    </div>
    
    <div id=userPiece class=btn onmouseover="overImage('btn3','common/game_btnBG2.png')" onmouseout="overImage('btn3','common/game_btnBG1.png')"
    onclick="location='${pageContext.request.contextPath }/user/getUserPiece'">
    <img id=btn3 src="${pageContext.request.contextPath }/image/common/game_btnBG1.png">
    <p class="span2">碎片兑换</p>
    </div>
    
    <div id=userCardNum>
    <p>卡牌数量：${user.getUser_cardNum() }/<red>150</red></p>
    </div>

    <!-- 转换战法弹窗 -->
    <div id=Window>
	    <img id=WindowBG src="${pageContext.request.contextPath }/image/game_activity/game_activityMsgBG.png">
	    <form action="${pageContext.request.contextPath }/card/deleteCardToZhanLing">
		    <p>请选择要转化成战法的星级武将：</p>
		    <p><input type="radio" name="card_star" value="5">五星★★★★★</p>
		    <p><input type="radio" name="card_star" value="4">四星★★★★</p>
		    <p><input type="radio" name="card_star" value="3">三星★★★</p>
		    <p><input type="radio" name="card_star" value="2">二星★★</p>
		    <p><input type="submit" value="&nbsp;确认&nbsp;" onmouseover="changeBackColor(this,'#EE82EE')" onmouseout="changeBackColor(this,'#BA55D3')"
		    style="background-color: #BA55D3;border: none;font-family: gupu;font-size: 30px;color: white;"></p>
		    <p><input type="button" value="&nbsp;取消&nbsp;" onmouseover="changeBackColor(this,'#EE82EE')" onmouseout="changeBackColor(this,'#BA55D3')"
		    onclick="changeDisplay('Window',0)"
		    style="background-color: #BA55D3;border: none;font-family: gupu;font-size: 30px;color: white;"></p>
	    </form>  

    </div>

    <!-- 以下为页脚部分 -->
    <%@ include file="user_footer3.jsp"%>
</body>
</html>