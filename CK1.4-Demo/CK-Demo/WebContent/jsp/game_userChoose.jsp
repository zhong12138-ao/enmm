<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>


<head>
	<meta charset="UTF-8">
	<title>ck-选择出战武将</title>
	<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/game_userChoose.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/sweetalert.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/sweetalert-dev.js"></script>
</head>

<script>
    //js全局变量，游戏模式
    var mode =${mode }
    //开始游戏
	function start(num) {
    	if(mode==1){
    		var userc = document.getElementById('userChoose0')
    		if(userc.value==0){
    			swal("请选择出战武将！")
    		}else{
    			if(num==0){
    			changeDisplay('chooseSkills',1)
    			}
    			if(num==1){
    			document.getElementById('form').submit();	
    			}
    		}
    	}
    	
    	if(mode==2){
    		var userc1 = document.getElementById('userChoose1')
        	var userc2 = document.getElementById('userChoose2')
        	var userc3 = document.getElementById('userChoose3') 
        	if(userc1.value==0||userc2.value==0||userc3.value==0){
        		swal("错误，请选择三位武将")
        	}else{
        		document.getElementById('form').submit();
        	}
    	}		
	}
	
    
	//跳转
	function toUrl(url){
		window.location.href = "${pageContext.request.contextPath }/"+url;
	}
	
	//控制更换图片
	function overImage(imgId,imgSrc){
		document.getElementById(imgId).src="${pageContext.request.contextPath }/"+imgSrc
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
	//更改样式
	function changeClass(Id,className){
		var obj = document.getElementById(Id);
		obj.className = className; 
	}
	
       
    //游戏模式1点击选择
    function choose1(img1,value0,level) {
    	changeDisplay('showUC0',1);
    	overImage('showUC0',img1);
    	document.getElementById('userChoose0').value=value0
    	document.getElementById('showUC0P').innerHTML='lv.'+level
	}
    
    
    //选择技能
    function chooseSkill(obj,value2) {
        function _changeBI(obj,n){
        	if(n==1){
        	obj.setAttribute('class','skillBtn2'); 
        	}
        	if(n==0){
        	obj.setAttribute('class','skillBtn'); 
        	}
        }
        function _cleanSkill(gsk,skbtn){
        	gsk.value = 0;
			_changeBI(skbtn,0);
        }
        
    	//获取三个表单值
    	var g1sk1 = document.getElementById('g1sk1')
    	var g1sk2 = document.getElementById('g1sk2')
    	var g1sk3 = document.getElementById('g1sk3')   
    	
    	//如果点击相同的技能则代表取消技能
    	if(g1sk1.value == value2 || g1sk2.value == value2 || g1sk3.value == value2){
    		if(g1sk1.value == value2){_cleanSkill(g1sk1,obj)}
    		if(g1sk2.value == value2){_cleanSkill(g1sk2,obj)}
    		if(g1sk3.value == value2){_cleanSkill(g1sk3,obj)}
    	}else{
    		if (g1sk1.value == 0) {
    			g1sk1.value = value2;
    			_changeBI(obj,1);
    			}else{
    				if(g1sk2.value == 0){
    					g1sk2.value = value2
    					_changeBI(obj,1)
    					}else{
    						if(g1sk3.value==0){
    							g1sk3.value=value2
    							_changeBI(obj,1)
    							}else{
    								swal("您要携带的技能已经达到上限了！")
    							}
    						}
    			}
    	}
    	//end
    	
	}
    
    //一键清除所选技能
    function cleanSkill() {
    	document.getElementById('g1sk1').value = 0;
    	document.getElementById('g1sk2').value = 0;
    	document.getElementById('g1sk3').value = 0;
    	var i;
    	for(i=1;i<=10;i++){
    		changeClass('sk'+i,'skillBtn');
    	}
    	
    	swal("已清空！")
	} 
    
    //游戏模式2点击选择
    function choose2(img2,value2,level) {
    	var userc1 = document.getElementById('userChoose1')
    	var userc2 = document.getElementById('userChoose2')
    	var userc3 = document.getElementById('userChoose3') 
    	var uc2 = document.getElementById('uc2')
    	var uc3 = document.getElementById('uc3')

		if (userc1.value == 0) {
			userc1.value = value2
			uc2.style.display = "block"
			changeDisplay('showUC1',1)
	    	overImage('showUC1',img2);
			document.getElementById('showUC1P').innerHTML='lv.'+level
		} else {
			if(userc2.value == 0){
				userc2.value = value2
				changeDisplay('showUC2',1)
				document.getElementById('showUC2P').innerHTML='lv.'+level
				if(userc1.value==userc2.value){
					swal("亲不能选择一样的哦！")
					userc2.value=0
					document.getElementById('showUC2P').innerHTML=''
				}else{
					uc3.style.display = "block"
					overImage('showUC2',img2);
				}
			}else{
				if(userc3.value==0){
					userc3.value=value2
					changeDisplay('showUC3',1)
					document.getElementById('showUC3P').innerHTML='lv.'+level
					if(userc3.value==userc2.value||userc3.value==userc1.value){
						swal("亲不能选择一样的哦！")
						userc3.value=0
						document.getElementById('showUC3P').innerHTML=''
					}else{
						overImage('showUC3',img2);
					}
				}else{
					swal("您已选择满了！")
				}
			}
		}
    }

	//清空选择
	function clearChoose() {
		if (mode == 1 || mode == 3) {
			document.getElementById('userChoose0').value = "0";
			changeDisplay('showUC0',0);
			document.getElementById('showUC0P').innerHTML=''
		}

		if (mode == 2) {
			var userc1 = document.getElementById('userChoose1')
			var userc2 = document.getElementById('userChoose2')
			var userc3 = document.getElementById('userChoose3')
			var showuc1 = document.getElementById('showUC1')
			var showuc2 = document.getElementById('showUC2')
			var showuc3 = document.getElementById('showUC3')
			var uc2 = document.getElementById('uc2')
			var uc3 = document.getElementById('uc3')
			uc2.style.display = "none"
			uc3.style.display = "none"
			document.getElementById('showUC1P').innerHTML=''
			document.getElementById('showUC2P').innerHTML=''
			document.getElementById('showUC3P').innerHTML=''
			userc1.value = "0"
			userc2.value = "0"
			userc3.value = "0"
			showuc1.src = "${pageContext.request.contextPath }/image/game_userChooseShow0.png"
			showuc2.src = "${pageContext.request.contextPath }/image/game_userChooseShow0.png"
			showuc3.src = "${pageContext.request.contextPath }/image/game_userChooseShow0.png"
		}

	}

    function clearUC1(showUC) {
		document.getElementById('userChoose1').value=0
		document.getElementById('showUC1P').innerHTML=''
		showUC.src = "${pageContext.request.contextPath }/image/game_userChooseShow0.png"
		if(document.getElementById('userChoose2').value==0){
			uc2.style.display = "none"
		}
		if(document.getElementById('userChoose3').value==0){
			uc3.style.display = "none"
		}
		
	}
	function clearUC2(showUC) {
		document.getElementById('userChoose2').value=0
		document.getElementById('showUC2P').innerHTML=''
		showUC.src = "${pageContext.request.contextPath }/image/game_userChooseShow0.png"
			if(document.getElementById('userChoose1').value==0){
				uc2.style.display = "none"
			}
			if(document.getElementById('userChoose3').value==0){
				uc3.style.display = "none"
			}
	}
	function clearUC3(showUC) {
		document.getElementById('userChoose3').value=0
		document.getElementById('showUC3P').innerHTML=''
		showUC.src = "${pageContext.request.contextPath }/image/game_userChooseShow0.png"
		if(document.getElementById('userChoose1').value==0&&document.getElementById('userChoose2').value==0){
			uc2.style.display = "none"
			uc3.style.display = "none"
		}
		if(document.getElementById('userChoose2').value==0&&document.getElementById('userChoose1').value!=0){
			uc3.style.display = "none"
		}
		
	}
	
	//获取技能
	function getSkills() {	
		var skills = ${skill_id}
        for(var i=0;i<skills.length;i++){
        	var skillId = skills[i];
        	changeDisplay('sk'+skillId,1);
        }
	}
</script>

<body onload="getSkills()">
	<div id=head>
		<p>ck-选择出战武将</p>
	</div>

	<!-- 以下为页眉 -->
	<%@ include file="user_head1.jsp"%>

	<!-- 提示 -->
	<div id=msg>
	<p>${msg }</p>
	</div>
	
	<!-- 右侧控制区 -->
	<div id=rightCon>
		<!-- 按钮 -->
	    <div id=readyGame class="btn" onclick="start(0)">
	    <p>开始游戏</p>
	    </div>
	    
	    <!-- 按钮 -->
	    <div id=backMenu class="btn" onclick="toUrl('user/toGamemenu')">
	    <p>返回菜单</p>
	    </div>
	    
	    <!-- 按钮 -->
	    <div id=clearChoose class="btn" onclick="clearChoose()">
	    <p>清空选择</p>
	    </div>
	    
	    <!-- 选择展示区 -->
	    <div id=showUserChoose>	    
		    <c:if test="${mode == 1}">
		    <!-- 展示一个武将 -->
		    <div id=uc0 class="uc">
			    <img id=showUC0 class="showUC" src="">
			    <div id=showUC0P class="showucp"></div>
		    </div>
		    </c:if>
		    
		    <c:if test="${mode == 2}">
		    <!-- 展示三个武将 -->
		    <div id=uc1 class="uc" onclick="clearUC1(showUC1)">
			    <img id=showUC1 src="${pageContext.request.contextPath }/image/common/game_userChooseShow0.png">
			    <div id=showUC1P class="showucp"></div>
		    </div>
		    <div id=uc2 class="uc" onclick="clearUC2(showUC2)">
			    <img id=showUC2 src="${pageContext.request.contextPath }/image/common/game_userChooseShow0.png">
			    <div id=showUC2P class="showucp"></div>
		    </div>
		    <div id=uc3 class="uc" onclick="clearUC3(showUC3)">
			    <img id=showUC3 src="${pageContext.request.contextPath }/image/common/game_userChooseShow0.png"> 
			    <div id=showUC3P class="showucp"></div>
		    </div>
		    </c:if>
	    </div>
	    
    </div>
    
    		
    <!-- 游戏模式1 -->
	<c:if test="${mode == 1}">
	<!-- 表单传值 -->
	<form id=form action="${pageContext.request.contextPath }/game/toGameModeOne">
		<!--选择的 武将 -->
		<input id=userChoose0 type="radio"
		name="g1choose" hidden="true" value="0" checked="checked">
		<!--选择的 技能 -->
		<input id=g1sk1 type="checkbox" name="g1skills" value="0" hidden="true" checked="checked">
        <input id=g1sk2 type="checkbox" name="g1skills" value="0" hidden="true" checked="checked">
        <input id=g1sk3 type="checkbox" name="g1skills" value="0" hidden="true" checked="checked">
	
        <!-- 挑选技能 -->
        <div id=chooseSkills>
	        <img id=chooseSkillsBG src="${pageContext.request.contextPath }/image/game_activity/game_activityMsgBG.png">
	        <img id=chooseSkillsBack src="${pageContext.request.contextPath }/image/user_lobby/user_lobbySignBack.png"
	        onclick="changeDisplay('chooseSkills',0)">	 
      
            <div id=g1skSure class="btn" onclick="start(1)">
            <p>确定选择</p>
            </div>  
            <div id=g1skCancel class="btn" onclick="cleanSkill()">
            <p>清空选择</p>
            </div>
    
    
            <div id=g1sks>
                
            
	            <div id=sk1 class="skillBtn" onclick="chooseSkill(this,'1')">
	            <p>怒火</p>
	            </div>
	            
	            <div id=sk2 class="skillBtn" onclick="chooseSkill(this,'2')">
	            <p>看破</p>
	            </div>
	            
	            <div id=sk3 class="skillBtn" onclick="chooseSkill(this,'3')">
	            <p>疾行</p>
	            </div>
	            
	            <div id=sk4 class="skillBtn" onclick="chooseSkill(this,'4')">
	            <p>神医</p>
	            </div>
	            
	            <div id=sk5 class="skillBtn" onclick="chooseSkill(this,'5')">
	            <p>浴血</p>
	            </div>
	            
	            <div id=sk6 class="skillBtn" onclick="chooseSkill(this,'6')">
	            <p>影杀</p>
	            </div>
	            
	            <div id=sk7 class="skillBtn" onclick="chooseSkill(this,'7')">
	            <p>运气</p>
	            </div>
	            
	            <div id=sk8 class="skillBtn" onclick="chooseSkill(this,'8')">
	            <p>穿刺</p>
	            </div>
	            
	            <div id=sk9 class="skillBtn" onclick="chooseSkill(this,'9')">
	            <p>饮血</p>
	            </div>
	            
	            <div id=sk10 class="skillBtn" onclick="chooseSkill(this,'10')">
	            <p>格挡</p>
	            </div>           
           </div>        
    </div>
					
	<!-- 主要显示部分 -->
	<div id=conn>
		<div id=l1 class="cardList">
		
		<div class="tit">
		<p>级别★史诗</p>
		</div>
			<c:if test="${not empty five_list}">
				<c:forEach items="${five_list }" var="five">
				    <div class=card>
					<img src="${pageContext.request.contextPath }/${five.card_image }"
						 alt="${five.card_name }"
                         onclick="choose1('${five.card_image }','${five.id }','${five.card_level }')">
					<span>&nbsp;&nbsp;lv.${five.card_level }&nbsp;&nbsp;</span>
					</div>
				</c:forEach>
			</c:if>
		</div>
		
		<div id=l2 class="cardList">
		<div class="tit">
		<p>级别★稀有</p>
		</div>
			<c:if test="${not empty four_list}">
				<c:forEach items="${four_list }" var="four">
				    <div class=card>
					<img src="${pageContext.request.contextPath }/${four.card_image }"
						 alt="${four.card_name }"
					     onclick="choose1('${four.card_image }','${four.id }','${four.card_level }')">
					<span>&nbsp;&nbsp;lv.${four.card_level }&nbsp;&nbsp;</span>
					</div>
				</c:forEach>
			</c:if>
		</div>
		
		<div id=l3 class="cardList">
        <div class="tit">
		<p>级别★普通</p>
		</div>
			<c:if test="${not empty other_list}">
					<c:forEach items="${other_list }" var="o">
					<div class=card>
						<img src="${pageContext.request.contextPath }/${o.card_image }"
							 alt="${four.card_name }"
							 onclick="choose1('${o.card_image }','${o.id }','${o.card_level }')">
						<span>&nbsp;&nbsp;lv.${o.card_level }&nbsp;&nbsp;</span>
						</div>
					</c:forEach>
			</c:if>	
		</div>
	
	</div>
					
	</form>
	</c:if>
	
	
	

            
    <!-- 游戏模式2 -->
	<c:if test="${mode == 2}">
	<!-- 传值 -->
	<form id=form
		action="${pageContext.request.contextPath }/game/toGameMode2/${num}">
		<input id=userChoose1 type="checkbox"
		name="g2choose" hidden="true" value="0" checked="checked">
		<input id=userChoose2 type="checkbox"
		name="g2choose" hidden="true" value="0" checked="checked">
		<input id=userChoose3 type="checkbox"
		name="g2choose" hidden="true" value="0" checked="checked">
	
	          <!-- 主要显示部分 -->
     <div id=conn>
     <div id=l1 class="cardList">
		
		<div class="tit">
		<p>级别★史诗</p>
		</div>
			<c:if test="${not empty five_list}">
				<c:forEach items="${five_list }" var="five">
				    <div class=card>
					<img src="${pageContext.request.contextPath }/${five.card_image }"
						 alt="${five.card_name }"
                         onclick="choose2('${five.card_image }','${five.id }','${five.card_level }')">
					<span>&nbsp;&nbsp;lv.${five.card_level }&nbsp;&nbsp;</span>
					</div>
				</c:forEach>
			</c:if>
		</div>
		
		<div id=l2 class="cardList">
		<div class="tit">
		<p>级别★稀有</p>
		</div>
			<c:if test="${not empty four_list}">
				<c:forEach items="${four_list }" var="four">
				    <div class=card>
					<img src="${pageContext.request.contextPath }/${four.card_image }"
						 alt="${four.card_name }"
					     onclick="choose2('${four.card_image }','${four.id }','${four.card_level }')">
					<span>&nbsp;&nbsp;lv.${four.card_level }&nbsp;&nbsp;</span>
					</div>
				</c:forEach>
			</c:if>
		</div>
		
		<div id=l3 class="cardList">
        <div class="tit">
		<p>级别★普通</p>
		</div>
			<c:if test="${not empty other_list}">
					<c:forEach items="${other_list }" var="o">
					<div class=card>
						<img src="${pageContext.request.contextPath }/${o.card_image }"
							 alt="${four.card_name }"
							 onclick="choose2('${o.card_image }','${o.id }','${o.card_level }')">
						<span>&nbsp;&nbsp;lv.${o.card_level }&nbsp;&nbsp;</span>
						</div>
					</c:forEach>
			</c:if>	
		</div>
	
	</div>
	</form>
	</c:if>
	
	
	



	<!-- 以下为页脚部分 -->
	<%@ include file="user_footer1.jsp"%>

</body>
</html>