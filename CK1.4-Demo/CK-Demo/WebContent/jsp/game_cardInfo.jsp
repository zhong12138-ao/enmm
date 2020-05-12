<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>ck-武将详情</title>
	<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/game_cardInfo.css" type="text/css" />
</head>

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery1.min.js"></script>

<script type="text/javascript">
	//控制更换图片
	function overImage(imgId,imgSrc){
		document.getElementById(imgId).src="${pageContext.request.contextPath }/image/"+imgSrc
	}
	//跳转
	function toUrl(url){
		window.location.href = "${pageContext.request.contextPath }/"+url;
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
	
	//升级
	function uplevel() {
		var id = ${uc.getId()}
		var user_points = ${user.getUser_points()}
		var level = ${uc.getCard_level()}
		if(level<30){
			if(user_points<160){
				alert("您的战令不足")
			}else{
				$.ajax({
					url :"${pageContext.request.contextPath }/card/uplevel?id="+id,
					type : 'get',
					dataType : 'json',
				});
			}
		}else{
			alert("武将升级已达上限")
		};
		//刷新
		setInterval(function() {$("#msg").load(location.href + " #msg");}, '10');
		setInterval(function() {$("#lv1").load(location.href + " #lv1");}, '10');
		setInterval(function() {$("#lv2").load(location.href + " #lv2");}, '10');

	    }
	
	//分解
	function breakCard(star,id,level){
		//获取稀有度并强转为int类型
		var starInt = parseInt(star);	
		if(sessionStorage.getItem('noText')){
			var noText = sessionStorage.getItem('noText');
			if(noText == 0){
				//表示不再提醒,直接分解
				window.location.href = "${pageContext.request.contextPath }/card/resolveOne/"+id;
				console.log("不再提醒,直接分解");
			}
			if(noText == 1){
				//session中没有数据，需要提醒
				//判断是否为五星武将或等级大于1
				if(starInt == 5 || level > 1){
					changeDisplay('Window',1)
				}else{
					window.location.href = "${pageContext.request.contextPath }/card/resolveOne/"+id;
					console.log("不是五星等级为1,直接分解");
				}	
			}
		}else{
			//初始化，设定为提示
			sessionStorage.setItem('noText',1);
			//判断是否为五星武将或等级大于1
			if(starInt == 5 || level > 1){
				changeDisplay('Window',1)
			}else{
				window.location.href = "${pageContext.request.contextPath }/card/resolveOne/"+id;
				console.log("不是五星等级为1,直接分解");
			}
		}		
									
	}
	
	//不再提醒
	function noText(obj){
		if(sessionStorage.getItem('noText')==0){
			alert("已开启提醒！");
			obj.style.background="#228B22";
			sessionStorage.setItem('noText',1);
			refuse;	
		}
		if(sessionStorage.getItem('noText')==1){
			alert("已关闭提醒！");
			obj.style.background="#DC143C";
			sessionStorage.setItem('noText',0);
			refuse;	
		}
		obj.style.background="#DC143C";
		sessionStorage.setItem('noText', 0);
	}
	//进入页面加载用户设定noText
	function loadNoText(){
		if(sessionStorage.getItem('noText')){
			if(sessionStorage.getItem('noText')==0){
				document.getElementById('B3').style.background="#DC143C";
			}
			if(sessionStorage.getItem('noText')==1){
				document.getElementById('B3').style.background="#228B22";
			}
		}
	}

</script>


<body onload="loadNoText()">
	<!-- 以下为页眉 -->
	<%@ include file="user_head1.jsp" %>
	
	<div id=head>
	<p>ck-武将详情</p>
	</div>

    <div id=back>
	    <a href="${pageContext.request.contextPath }/card/getUser_card">
		<img src="${pageContext.request.contextPath }/image/common/user_head2Back.png"></a>
	</div>

   <!--  武将信息显示区 -->
    <div id=conn>

       <div id=text>
           <h1 style="color:#f1ee48c2;font-size:70px;font-family:gupu;">${ct.getGenerals_name() }</h1>                          
           <div id="msg">
           	<c:if test="${ct.getGenerals_star()==5 }">
	           <p>谋略：${ct.getGenerals_strategy()}<font style="color: green">+${uc.getCard_level()*2.5}</font></p>
	           <p>攻击：${ct.getGenerals_attack() }<font style="color: green">+${uc.getCard_level()*2.5}</font></p> 
	           <p>攻城：${ct.getGenerals_siege() }<font style="color: green">+${uc.getCard_level()*1.0}</font></p>
	           <p>防御：${ct.getGenerals_defense() }<font style="color: green">+${uc.getCard_level()*3.0}</font></p>
	           <p>速度：${ct.getGenerals_speed() }<font style="color: green">+${uc.getCard_level()*3.0}</font></p>
	           <c:if test="${uc.getCard_level()<30 }">
	           <p>等级：${uc.getCard_level() }</p>
	           </c:if>
	           <c:if test="${uc.getCard_level()>=30 }">
	           <p>等级：已满级（30）</p>
	           </c:if>
           </c:if>
           
           <c:if test="${ct.getGenerals_star()==4 }">
	           <p>谋略：${ct.getGenerals_strategy()}<font style="color: green">+${uc.getCard_level()*2.0}</font></p>
	           <p>攻击：${ct.getGenerals_attack() }<font style="color: green">+${uc.getCard_level()*2.0}</font></p> 
	           <p>攻城：${ct.getGenerals_siege() }<font style="color: green">+${uc.getCard_level()*1.0}</font></p>
	           <p>防御：${ct.getGenerals_defense() }<font style="color: green">+${uc.getCard_level()*2.5}</font></p>
	           <p>速度：${ct.getGenerals_speed() }<font style="color: green">+${uc.getCard_level()*2.5}</font></p>
	           <p>等级：${uc.getCard_level() }</p>
           </c:if>
           
           <c:if test="${ct.getGenerals_star()==3 }">
	           <p>谋略：${ct.getGenerals_strategy()}<font style="color: green">+${uc.getCard_level()*1.5}</font></p>
	           <p>攻击：${ct.getGenerals_attack() }<font style="color: green">+${uc.getCard_level()*1.5}</font></p> 
	           <p>攻城：${ct.getGenerals_siege() }<font style="color: green">+${uc.getCard_level()*0.5}</font></p>
	           <p>防御：${ct.getGenerals_defense() }<font style="color: green">+${uc.getCard_level()*2.0}</font></p>
	           <p>速度：${ct.getGenerals_speed() }<font style="color: green">+${uc.getCard_level()*2.0}</font></p>
	           <c:if test="${uc.getCard_level()<30 }">
	           <p>等级：${uc.getCard_level() }</p>
	           </c:if>
	           <c:if test="${uc.getCard_level()>=30 }">
	           <p>等级：已满级（30）</p>
	           </c:if>
           </c:if>
           
           <c:if test="${ct.getGenerals_star()==2 }">
	           <p>谋略：${ct.getGenerals_strategy()}<font style="color: green">+${uc.getCard_level()*1.0}</font></p>
	           <p>攻击：${ct.getGenerals_attack() }<font style="color: green">+${uc.getCard_level()*1.0}</font></p> 
	           <p>攻城：${ct.getGenerals_siege() }<font style="color: green">+${uc.getCard_level()*0.5}</font></p>
	           <p>防御：${ct.getGenerals_defense() }<font style="color: green">+${uc.getCard_level()*1.5}</font></p>
	           <p>速度：${ct.getGenerals_speed() }<font style="color: green">+${uc.getCard_level()*1.0}</font></p>
	           <c:if test="${uc.getCard_level()<30 }">
	           <p>等级：${uc.getCard_level() }</p>
	           </c:if>
	           <c:if test="${uc.getCard_level()>=30 }">
	           <p>等级：已满级（30）</p>
	           </c:if>
           </c:if>
           </div>
           
           <p>战法技能：<font color="yellow"  style="font-family: gupu;">${ct.getGenerals_skill() }</font></p>
           <p>兵种：敬请期待</p>         	
       </div> 
       
       
           <p id=tip>注：数据和技能以最终游戏内设定为准，数据仅供参考</p>    
                   
           <!-- 右边显示部分 --> 
           <div id=img>
               <!-- 头像 -->
	           <img src="${pageContext.request.contextPath }/${ct.getGenerals_image() }" alt="${ct.getGenerals_name() }" width="400px" height="570px"> 
	           <!-- 因为图片原因，兑换武将卡框略有偏移，做这个调整，让等级遮挡显示正常 -->
	           <!-- card_id大于550即是兑换卡 -->
	           <c:if test="${uc.getCard_id()<=550 }">
	           <div id=lv1 align="center">
	                <font color="white" size="5.5px">Lv.${uc.getCard_level()}</font>
	            </div>
	           </c:if>
	           <c:if test="${uc.getCard_id()>550 }">
	           <div id=lv2 align="center">
	                <font color="white" size="5.5px">Lv.${uc.getCard_level()}</font>
	            </div>
	           </c:if>
            
           </div> 
 		
	</div>

    <!-- 升级和分解按键 -->
    <div>
	    <c:if test="${uc.getCard_level()<30 }">
		    <div id=B1 class="btn" onmouseover="overImage('btn1','common/btn_bg2.png')" onmouseout="overImage('btn1','common/btn_bg1.png')" 
		    onclick="uplevel()">
		    <img id=btn1 src="${pageContext.request.contextPath }/image/common/btn_bg1.png">
		    <p>升&nbsp;&nbsp;级</p>
		    </div>
	    </c:if>
	   
	    <div id=B2 class="btn" onmouseover="overImage('btn2','common/btn_bg2.png')" onmouseout="overImage('btn2','common/btn_bg1.png')" 
	    onclick="breakCard('${uc.getCard_star()}','${uc.getId() }','${uc.getCard_level() }')">
		    <img id=btn2 src="${pageContext.request.contextPath }/image/common/btn_bg1.png">
		    <p>分&nbsp;&nbsp;解</p>
	    </div>
	    
	    <div id=B3t class="btn"><span>分解史诗级卡牌及高等级卡牌时进行提醒</span></div>
	    <div id=B3 class="btn" onmouseover="overImage('btn3','common/btn_bg2.png')" onmouseout="overImage('btn3','common/btn_bg1.png')" 
	    onclick="noText(this)">
		    <img id=btn3 src="${pageContext.request.contextPath }/image/common/btn_bg1.png">
		    <p>分解提醒</p>
	    </div>
    </div>
    
    <!-- 确定分解弹窗 -->
    <div id=Window>
	    <img id=WindowBG src="${pageContext.request.contextPath }/image/game_activity/game_activityMsgBG.png">

		    <!-- 遮挡框 -->
		    <div id=mark>
		    	<img src="${pageContext.request.contextPath }/${ct.getGenerals_image() }" alt="${ct.getGenerals_name() }" >
		    </div> 
		    <!-- 文字 -->
		    <div id=Wtext>
		        <p><yellow>${ct.getGenerals_name() }</yellow>是</p>
		        <c:if test="${uc.getCard_level()>1 }">
			    <p>等级大于1级</p>
			    </c:if>
			    <c:if test="${uc.getCard_StarInt() == 5 }">
			    <p>史诗级别</p>
			    </c:if>
			    <p>的武将，您确定要分解吗？</p>
			    <span onmouseover="changeBackColor(this,'#EE82EE')" onmouseout="changeBackColor(this,'#BA55D3')"
			    onclick="toUrl('card/resolveOne/${uc.getId() }')">&nbsp;&nbsp;确认&nbsp;&nbsp;</span><br><br>
			    <span onmouseover="changeBackColor(this,'#EE82EE')" onmouseout="changeBackColor(this,'#BA55D3')"
			    onclick="changeDisplay('Window',0)">&nbsp;&nbsp;取消&nbsp;&nbsp;</span><br><br>
		    </div>
		    		    
    </div>

	<!-- 以下为页脚部分 -->
    <%@ include file="user_footer1.jsp" %>
</body>
</html>