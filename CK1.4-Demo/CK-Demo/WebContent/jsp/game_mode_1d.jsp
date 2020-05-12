<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

	<!-- 回合 -->
	<div id=rank>
	    <p>[第${gm1.getRound() }回合]</p>
	    <c:if test="${gm1.getRank()==2 }">
	    <img src="${pageContext.request.contextPath }/image/game_mode1/game_rank2.png">
	    </c:if>
	    <c:if test="${gm1.getRank()==3 }">
	    <img src="${pageContext.request.contextPath }/image/game_mode1/game_rank3.png">
	    </c:if>
	    <c:if test="${gm1.getRank()==4 }">
	    <img src="${pageContext.request.contextPath }/image/game_mode1/game_rank4.png">
	    </c:if>
	    <c:if test="${gm1.getRank()==5 }">
	    <img src="${pageContext.request.contextPath }/image/game_mode1/game_rank5.png">
	    </c:if>
	    <c:if test="${gm1.getRank()==6 }">
	    <img src="${pageContext.request.contextPath }/image/game_mode1/game_rank6.png">
	    </c:if>
	</div> 

	<!-- 以下为操作页面 -->
	<div id=leftCon>
	    <!-- 活着才可以释放技能 -->
	    <c:if test="${gm1.getHealth()>0 }">
	    <c:if test="${cp1.getHealth()>0 }">
	    <!-- 技能1 -->
	    <c:if test="${gm1.getSkill1State()==1 }">
	    <div id=skill1 class="skillsBTN" onclick="chooseSkill('1','${gm1.getSkill1Name() }')">
	    <span>${gm1.getSkill1Name() }</span>
	    </div>
	    </c:if>
	    
	    <!-- 技能2 -->
	    <c:if test="${gm1.getSkill2State()==1 }">
	    <div id=skill2 class="skillsBTN" onclick="chooseSkill('2','${gm1.getSkill2Name() }')">
	    <span>${gm1.getSkill2Name() }</span>
	    </div>
	    </c:if>
	    
	    <!-- 技能3 -->
	    <c:if test="${gm1.getSkill3State()==1 }">
	    <div id=skill3 class="skillsBTN" onclick="chooseSkill('3','${gm1.getSkill3Name() }')">
	    <span>${gm1.getSkill3Name() }</span>
	    </div> 
	    </c:if>
	    </c:if>
	    </c:if>
	
	      <!-- 技能选择 -->
		<form id="form" name="form" method="post">
	    <div>
		<input id=sk1 type="checkbox" name="g1UseSk" value="0" hidden="true" checked="checked">
	    <input id=sk2 type="checkbox" name="g1UseSk" value="0" hidden="true" checked="checked">
	    <input id=sk3 type="checkbox" name="g1UseSk" value="0" hidden="true" checked="checked">
		
		</div>
		</form>
	    <!-- 确定本回合 -->	
		<c:if test="${gm1.getHealth()>0 }">
	    	<div id=sure class="btn" onclick="sure()">
	    <p>攻击</p>
	    </div>
	    
	    
	    <!-- 返回菜单 -->
	    <div class="btn" onclick="returnMenu()">
	    <p>返回菜单</p>
	    </div>
	    </c:if>
	    
	    
	    <c:if test="${gm1.getHealth()<=0 }">
	    <!-- 结束游戏 -->
	    <div id=backMenu class="btn" onclick="toUrl('game/gameModeOver1')">
	    <p>游戏结束</p>
	    </div>
	    </c:if>
	
    </div>
    
    
	<!-- 以下为该页面主要板块 -->
	<div id=conn>
	    <c:if test="${gm1.getHealth()==0 }">
	    <!-- 死亡图 -->
	    <img class="killed" src="${pageContext.request.contextPath }/image/game_mode1/killed.png">
	    </c:if>
	    <!-- 卡框图 -->	     
	    <img id=cb1 class=cardbord src="${pageContext.request.contextPath }/image/game_mode1/game_cardbord.png">
	    <img id=cb2 class=cardbord src="${pageContext.request.contextPath }/image/game_mode1/game_cardbord.png">
	    
	    <!-- 对战双方 -->
	    <div id=computer class="fighter">
	        <div id=bord>
	        <div id=show>        
	        <img src="${pageContext.request.contextPath }/${cp1.getImage()}">      
	        </div>
	        </div>
	        
	        
	        <c:if test="${cp1.getHealth()<=0 }">
	        </c:if>
	        
	                <p>武将名：${cp1.getName() }<lv><font color="yellow">Lv.${cp1.getLevel() }</font></lv></p>
	                <p>武将血量：${cp1.getHealth() }</p>
	                <p>武将伤害：${cp1.getHurt() }</p>
	                <p>武将防御：${cp1.getDefense() }</p>
	                <p>武将速度：${cp1.getSpeed() }</p>
	    </div>
	
        <div id=player class="fighter">
            <div id=bord>
	        <div id=show>        
            <img alt="" src="${pageContext.request.contextPath }/${gm1.getImage()}">
            </div>
            </div>
            
            
            <c:if test="${gm1.getHealth()<=0 }">
	        </c:if>
                    <p>武将名：${gm1.getName() }<lv><font color="yellow">Lv.${gm1.getLevel() }</font></lv></p>
	                <p>武将血量：${gm1.getHealth() }</p>
	                <p>武将伤害： ${gm1.getHurt() }</p>
	                <p>武将防御：${gm1.getDefense() }</p>
	                <p>武将速度： ${gm1.getSpeed() }</p>
	                
                    <c:if test="${gm1.getSkill1State()==3 }">
	                <p><sk3>${gm1.getSkill1Name() }>>${gm1.getSkill1DTime() }回合</sk3></p>
	                </c:if>
	                <c:if test="${gm1.getSkill2State()==3 }">
	                <p><sk3>${gm1.getSkill2Name() }>>${gm1.getSkill2DTime() }回合</sk3></p>
	                </c:if>
	                <c:if test="${gm1.getSkill3State()==3 }">
	                <p><sk3>${gm1.getSkill3Name() }>>${gm1.getSkill3DTime() }回合</sk3></p>  
	                </c:if>            
        </div>
          
        <!-- 文本区域 -->  
        <div id=content>
            <c:forEach items="${msg }" var="msg">
                <p style="color: white">${msg }</p>
            </c:forEach>
        </div>
     </div>