<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>虎符商城</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/image/game_ck2ICON.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/game_shop.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/js/jquery1.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/confirm.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/sweetalert.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/sweetalert-dev.js"></script>
</head>

<script>
    //购买商品
	var user_money = ${user.getUser_money() };
	function shop(num) {
		if (num == 1 || num == 2) {
			if (user_money < 5000) {
				swal("抱歉","虎符不足","error")
			} else {
				$.ajax({
					url : '../card/buy_ShopOther?num=' + num,
					type : 'get',
					dataType : 'json',
				});
				swal("恭喜","购买成功","success")
			}
		}
		if (num == 3) {
			if (user_money < 8000) {
				swal("抱歉","虎符不足","error")
			} else {
				$.ajax({
					url : '../card/buy_ShopOther?num=' + num,
					type : 'get',
					dataType : 'json',
				});
				swal("恭喜","购买成功","success")
			}
		}
		$("#footer").load(location.href + " #footer");
	}
    function shop_skill(num) {
    	var gedang_buy = ${gedang_buy};
    	var yinxue_buy = ${yinxue_buy};
    	if (num == 4) {
			if (yinxue_buy == 1) {
				swal("抱歉","您已经拥有此技能了","error")
			} else {
				if (user_money < 2000) {
					swal("抱歉","虎符不足","error")
				} else {
					$.ajax({
						url : '../card/buy_ShopOther?num=' + num,
						type : 'get',
						dataType : 'json',
					});
					swal({ 
						title: "恭喜", 
						text: "购买成功", 
						type: "warning",
						showCancelButton: true, 
						confirmButtonColor: "#DD6B55",
						confirmButtonText: "确定！", 
						closeOnConfirm: false, 
						closeOnCancel: true	
						},
						function(isConfirm){ 
						if (isConfirm) { 
							history.go(0);
						}
				    });
				}
			}
		}
		if (num == 5) {
			if (gedang_buy == 1) {
				swal("抱歉","您已经拥有此技能了","error")
			} else {
				if (user_money < 2000) {
					swal("抱歉","虎符不足","error")
				} else {
					$.ajax({
						url : '../card/buy_ShopOther?num=' + num,
						type : 'get',
						dataType : 'json',
					});
					swal({ 
						title: "恭喜", 
						text: "购买成功", 
						type: "warning",
						showCancelButton: true, 
						confirmButtonColor: "#DD6B55",
						confirmButtonText: "确定！", 
						closeOnConfirm: false, 
						closeOnCancel: true	
						},
						function(isConfirm){ 
						if (isConfirm) { 
							history.go(0);
						}
				    });
				}
			}
		}
	}
	function shop_card(state,id) {
		if (state==0) {
			if (user_money < 1000) {
				swal("抱歉","虎符不足","error")
			} else {
				$.ajax({
					url : '../card/buy_ShopCard?id=' + id,
					type : 'get',
					dataType : 'json',
				});
				 swal({ 
						title: "恭喜", 
						text: "购买成功", 
						type: "warning",
						showCancelButton: true, 
						confirmButtonColor: "#DD6B55",
						confirmButtonText: "确定！", 
						closeOnConfirm: false, 
						closeOnCancel: true	
						},
						function(isConfirm){ 
						if (isConfirm) { 
							history.go(0);
						}
				    });
			}
		}else{
			swal("抱歉","您已经购买","error")
		}
	}

	//跳转
	function toUrl(){
		$.ajax({
			url : '../card/getOnePiece',
			type : 'get',
			dataType : 'json',
		});
		window.location.href='${pageContext.request.contextPath }/card/toShop';
	} 

	//控制更换图片
	function overImage(imgId, imgSrc) {
		document.getElementById(imgId).src = "${pageContext.request.contextPath }/image/"
				+ imgSrc
	}
	//控制元素块的显示与否
	function changeDisplay(Id, choose) {
		var obj = document.getElementById(Id);
		if (choose == 1) {
			obj.style.display = "block";
		}
		if (choose == 0) {
			obj.style.display = "none";
		}
	}
</script>	
			
<body>
    <%@ include file="user_head1.jsp"%>
    
    <div id=head>
        <p>ck-虎符商城</p>		
    </div>
    
    <div id=msg>
        <p style="color:green;font-size:40px">${msg }</p>
    </div>
    
    
    
    <!-- 布景 -->
    <div id=BG> 
    <img class=shopimg1 src="${pageContext.request.contextPath }/image/game_shopImg1.png">
    <img class=shopimg3 src="${pageContext.request.contextPath }/image/game_shopImg3.png">
    </div>
     
    <!-- 商品 -->
    <div id=g1 class=goods >
	    <div id =g style=" width: 250px;height: 250px;position:absolute; z-index: 6">
	    	<c:if test="${empty buy }">
	    	<p style=" width: 250px;height: 250px;position:absolute; z-index: 5" onclick="shop_card(0,'${card_piece.getId() }')">
	    	</p>
	    </c:if>
	    <c:if test="${not empty buy }">
	    	<p style=" width: 250px;height: 250px;position:absolute; z-index: 5" onclick="shop_card(1,'${card_piece.getId() }')">	
	    </p>
	    </c:if>
	    </div>
	    <img class=g1 src="${pageContext.request.contextPath }/${card_piece.getFragment_image()}">
	    <p><yellow>五星武将${card_piece.getFragment_name() }碎片×5</yellow></p>
	    <div id=g_1>
	    	<c:if test="${empty buy }">
	    	<p id = "h1"><price>1000虎符</price></p>
	    </c:if>
	    <c:if test="${not empty buy }">
	    	<p id = "h_1"><price>已购买</price></p>
	    </c:if>
	    </div>
    </div>
    
    
    <div id=g2 class=goods onclick="shop(1)">
	    <img class=g2 src="${pageContext.request.contextPath }/image/user_shopHuoDongDian.png">
	    <p><purple>活动骰子次数10次</purple></p>
	    <p><price>5000虎符</p>
    </div>
    
    
    <div id=g3 class=goods onclick="shop(2)">
	    <img class=g2 src="${pageContext.request.contextPath }/image/user_shopHuoDongLing.png">
	    <p><blue>500战令点</blue></p>
	    <p><price>5000虎符</p>
    </div>
    
    <div id=g4 class=goods onclick="shop(3)">
	    <img class=g2 src="${pageContext.request.contextPath }/image/user_shopHuoDongLing.png">
	    <p><blue>1000战令点</blue></p>
	    <p><price>8000虎符</p>
    </div>
    
    <div id=g5 class=goods onclick="shop_skill(4)">
	    <img class=g2 src="${pageContext.request.contextPath }/image/skills/skill_yinxue.png">
	    <p><yellow>技能饮血</yellow></p>
	    <div id=g_2>
	    	<c:if test="${empty yinxue}">
	    	<p id = "h3"><price>2000虎符</price></p>
	    </c:if>
	    <c:if test="${not empty yinxue}">
	    	<p id = "h_3"><price>已购买</price></p>
	    </c:if>
	    </div>
    </div>
    
    <div id=g6 class=goods onclick="shop_skill(5)">
	    <img class=g2 src="${pageContext.request.contextPath }/image/skills/skill_gedang.png">
	    <p><yellow>技能格挡</yellow></p>
	    <div id=g_3>
	    	<c:if test="${empty gedang}">
	    	<p id = "h4"><price>2000虎符</price></p>
	    </c:if>
	    <c:if test="${not empty gedang}">
	    	<p id = "h_4"><price>已购买</price></p>
	    </c:if>
	    </div>
    </div>
    
    <div id=g7 class=goods onclick="document.getElementById('pay_form').submit()">
	    <img class=g2 src="${pageContext.request.contextPath }/image/zhifu.jpg">
	    <p><purple>50000虎符</purple></p>
	    <p><price>0.01￥</p>
    	<form id="pay_form" action="${pageContext.request.contextPath }/card/forAli" method="post" target="_blank">
	    	<input type="hidden" id="WIDout_trade_no" name="WIDout_trade_no" />
	    	<input type="hidden" id="WIDsubject" name="WIDsubject" />
	    	<input type="hidden" id="WIDtotal_amount" name="WIDtotal_amount" value="0.01"/>
	    	<input type="hidden" id="WIDbody" name="WIDbody"/>
    	</form>
    </div>
    
   
    <div id=B1 class="btn1" onmouseover="overImage('btn1','common/btn_bg2.png')" onmouseout="overImage('btn1','common/btn_bg1.png')" 
	onclick="toUrl()">
		<img id=btn1 src="${pageContext.request.contextPath }/image/common/btn_bg1.png">
		<p>刷&nbsp;&nbsp;新</p>
		<p><price>消耗50虎符</price></p>
	</div> 
    

    

   <%@ include file="user_footer3.jsp"%>

</body>
</html>