<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

	<!-- 以下为操作页面 -->
	<div id=leftCon>

	    <!-- 确定本回合 -->	
		<c:if test="${cp3.getHealth()>0&&gm3.getHealth()>0}">
	    	<div id=sure class="btn" onclick="toUrl('game/tobalanceTwo')">
	    <p>攻击</p>
	    </div>    
	    
	    <!-- 返回菜单 -->
	    <div class="btn" onclick="returnMenu()">
	    <p>返回菜单</p>
	    </div>
	    </c:if>
	    
	    
	    <c:if test="${cp3.getHealth()<=0||gm3.getHealth()<=0}">
	    <!-- 结束游戏 -->
	    <div id=backMenu class="btn" onclick="toUrl('game/gameModeOver2/${flag}')">
	    <p>游戏结束</p>
	    </div>
	    </c:if>
	
    </div> 
  
	<!-- 以下为该页面主要板块 -->
	<div id=conn>
	    <!-- 死亡图 -->
	    <c:if test="${cp1.getHealth()==0&&cp2.getHealth()==0&&cp3.getHealth()==0 }">
	    <!-- 死亡图 -->
	    <img class="killed" src="${pageContext.request.contextPath }/image/game_mode1/killed.png">
	    </c:if>
	    
	    <!-- 玩家其他武将 -->
	    <div id=otherPlayer>
	    
	    <div id=ocbord1 class=ocbord>
	    <c:if test="${gm1.getHealth()>0 }">
	    <img id=op1 class="otherC" src="${pageContext.request.contextPath }/${gm2.getImage()}">
	    </c:if>
	    <c:if test="${gm1.getHealth()<=0&&gm2.getHealth()>0 }">
	    <img id=op1 class="otherC" src="${pageContext.request.contextPath }/${gm3.getImage()}">
	    </c:if>
	    <c:if test="${gm2.getHealth()<=0&&gm3.getHealth()>0 }">
	    <img id=op1 class="otherC" src="${pageContext.request.contextPath }/${gm1.getImage()}">
	    <p>已死亡</p>
	    </c:if>
	    </div>
	    
	    <div id=ocbord1 class=ocbord>
	    <c:if test="${gm1.getHealth()>0 }">
	    <img id=op2 class="otherC" src="${pageContext.request.contextPath }/${gm3.getImage()}">
	    </c:if>
	    <c:if test="${gm1.getHealth()<=0&&gm2.getHealth()>0 }">
	    <img id=op2 class="otherC" src="${pageContext.request.contextPath }/${gm1.getImage()}">
	    <p>已死亡</p>
	    </c:if>
	    <c:if test="${gm2.getHealth()<=0&&gm3.getHealth()>0 }">
	    <img id=op2 class="otherC" src="${pageContext.request.contextPath }/${gm2.getImage()}">
	    <p>已死亡</p>
	    </c:if>
	   
	    </div>
	    
	    </div>
	    <!-- 电脑其他武将 -->
	    <div id=otherComputer>
	    
	    <div id=ocbord2 class=ocbord>
	    <c:if test="${cp1.getHealth()>0}">
	    <img id=oc1 class="otherC" src="${pageContext.request.contextPath }/${cp2.getImage()}">
	    </c:if>
	    <c:if test="${cp1.getHealth()<=0&&cp2.getHealth()>0 }">
	    <img id=oc1 class="otherC" src="${pageContext.request.contextPath }/${cp3.getImage()}">
	    </c:if>
	    <c:if test="${cp2.getHealth()<=0&&cp3.getHealth()>0 }">
	    <img id=oc1 class="otherC" src="${pageContext.request.contextPath }/${cp1.getImage()}">
	    <p>已死亡</p>
	    </c:if>
	    
	    </div>
	    
	    <div id=ocbord2 class=ocbord>
	    <c:if test="${cp1.getHealth()>0}">  
	    <img id=oc2 class="otherC" src="${pageContext.request.contextPath }/${cp3.getImage()}">
	    </c:if>
	    <c:if test="${cp1.getHealth()<=0&&cp2.getHealth()>0 }">
	    <img id=oc2 class="otherC" src="${pageContext.request.contextPath }/${cp1.getImage()}">
	    <p>已死亡</p>
	    </c:if>	   
	    <c:if test="${cp2.getHealth()<=0&&cp3.getHealth()>0 }"> 
	    <img id=oc2 class="otherC" src="${pageContext.request.contextPath }/${cp2.getImage()}">
	    <p>已死亡</p>
	    </c:if>
	    
	    </div>
	    
	    </div>
	    	
	    <!-- 卡框图 -->	     
	    <img id=cb1 class=cardbord src="${pageContext.request.contextPath }/image/game_mode1/game_cardbord.png">
	    <img id=cb2 class=cardbord src="${pageContext.request.contextPath }/image/game_mode1/game_cardbord.png">     
	    <!-- 对战双方 -->
	    <c:if test="${cp1.getHealth()>0 }">
	        <div id=computer1 class="fighter">
	        <div id=bord1 class="bord">
	        <div id=show1 class="show">  
	        <img  src="${pageContext.request.contextPath }/${cp1.getImage()}">
	        </div>
	        </div>
	                <p>武将名：${cp1.getName() }</p>
	                <p>武将血量：${cp1.getHealth() }</p>
	                <p>武将伤害：${cp1.getHurt() }</p>
	                <p>武将防御：${cp1.getDefense() }</p>
	                <p>武将速度：${cp1.getSpeed() }</p>
	    </div>
	    </c:if>
	    
	    <c:if test="${cp1.getHealth()<=0&&cp2.getHealth()>0 }">
	    	<div id=computer2 class="fighter">
	    	<div id=bord2 class="bord">
	        <div id=show2 class="show">  
	        <img  src="${pageContext.request.contextPath }/${cp2.getImage()}">
	        </div>
	        </div>
	                <p>武将名：${cp2.getName() }</p>
	                <p>武将血量：${cp2.getHealth() }</p>
	                <p>武将伤害：${cp2.getHurt() }</p>
	                <p>武将防御：${cp2.getDefense() }</p>
	                <p>武将速度：${cp2.getSpeed() }</p>
	    </div>
	    </c:if>
	    
	    <c:if test="${cp2.getHealth()<=0&&cp3.getHealth()>0 }">
	    	<div id=computer3 class="fighter">
	    	<div id=bord3 class="bord">
	        <div id=show3 class="show">  
	        <img  src="${pageContext.request.contextPath }/${cp3.getImage()}">
	       </div>
	       </div>
	                <p>武将名：${cp3.getName() }</p>
	                <p>武将血量：${cp3.getHealth() }</p>
	                <p>武将伤害：${cp3.getHurt() }</p>
	                <p>武将防御：${cp3.getDefense() }</p>
	                <p>武将速度：${cp3.getSpeed() }</p>
	    </div>
	    </c:if>
		
		
		<c:if test="${gm1.getHealth()>0 }">
	        <div id=player1 class="fighter">
	        <div id=bord4 class="bord">
	        <div id=show4 class="show">  
            <img alt="" src="${pageContext.request.contextPath }/${gm1.getImage()}">
            </div>
            </div>
                    <p>武将名：${gm1.getName() }</p>
	                <p>武将血量：${gm1.getHealth() }</p>
	                <p>武将伤害： ${gm1.getHurt() }</p>
	                <p>武将防御：${gm1.getDefense() }</p>
	                <p>武将速度： ${gm1.getSpeed() }</p>           
        	</div>
	    </c:if>
        
        <c:if test="${gm1.getHealth()<=0&&gm2.getHealth()>0 }">
        	<div id=player2 class="fighter">
        	<div id=bord5 class="bord">
	        <div id=show5 class="show">  
            <img alt="" src="${pageContext.request.contextPath }/${gm2.getImage()}">
            </div>
            </div>
                    <p>武将名：${gm2.getName() }</p>
	                <p>武将血量：${gm2.getHealth() }</p>
	                <p>武将伤害： ${gm2.getHurt() }</p>
	                <p>武将防御：${gm2.getDefense() }</p>
	                <p>武将速度： ${gm2.getSpeed() }</p>           
        </div>
        </c:if>
        
       	<c:if test="${gm2.getHealth()<=0&&gm3.getHealth()>0 }">
       		 <div id=player3 class="fighter" >
       		 <div id=bord6 class="bord">
	        <div id=show6 class="show">  
            <img alt="" src="${pageContext.request.contextPath }/${gm3.getImage()}">
           </div>
           </div>
                    <p>武将名：${gm3.getName() }</p>
	                <p>武将血量：${gm3.getHealth() }</p>
	                <p>武将伤害： ${gm3.getHurt() }</p>
	                <p>武将防御：${gm3.getDefense() }</p>
	                <p>武将速度： ${gm3.getSpeed() }</p>           
        </div>
       	</c:if>
          
        <!-- 文本区域 -->  
        <div id=content>
            <c:forEach items="${msg }" var="msg">
                <p style="color: white">${msg }</p>
            </c:forEach>
        </div>
        
             
                     
    </div>