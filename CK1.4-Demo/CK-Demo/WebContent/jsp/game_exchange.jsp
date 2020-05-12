<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- 已优化，已注释-JH -->
<head>
<meta charset="UTF-8">
<title>ck-兑换</title>
<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/game_exchange.css" type="text/css" />
</head>
<script src="${pageContext.request.contextPath }/js/scrollheng.js" type="text/javascript" charset="utf-8"></script>


<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.insetborder.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('div.sample-border').borderEffect({borderColor : '#ffffff9a', speed : 100, borderWidth: 15});
    });
    /* 此script及以上两个,用于给元素添加边框时有沉浸效果 */
</script>

<script type="text/javascript">
//跳转
function toUrl(url){
	window.location.href = "${pageContext.request.contextPath }/"+url;
}
</script>

<body>
    <!-- 文字头 -->
	<div id=head>
		<p>ck-典藏兑换</p>
	</div>

    <!-- 引用头部 -->
	<%@ include file="user_head1.jsp"%>
	
	<!-- 返回信息 -->
	<div id=msg><p>${msg }</p></div>
	
	<!-- 核心部分 -->
	<div id=conn>
		<div id=dh1 class="sample-border" onclick="toUrl('card/toExchangeInfo/1')">
			<img class="dh" src="${pageContext.request.contextPath }/image/dh/1/weizhenxiaoyao.png" >
		</div>
		
		<div id=dh2 class="sample-border" onclick="toUrl('card/toExchangeInfo/2')">
			<img class="dh" src="${pageContext.request.contextPath }/image/dh/1/dangyangqiao.png" >
		</div>
		
		<div id=dh3 class="sample-border" onclick="toUrl('card/toExchangeInfo/3')">
			<img class="dh" src="${pageContext.request.contextPath }/image/dh/1/danqijiuzhu.png" >
		</div>
		
		<div id=dh4 class="sample-border" onclick="toUrl('card/toExchangeInfo/4')">
			<img class="dh" src="${pageContext.request.contextPath }/image/dh/1/dingzujiangdong.png" >
		</div>
		
		<div id=dh5 class="sample-border" onclick="toUrl('card/toExchangeInfo/5')">
			<img class="dh" src="${pageContext.request.contextPath }/image/dh/1/fengyiting.png" >
		</div>
		
		<div id=dh6 class="sample-border" onclick="toUrl('card/toExchangeInfo/6')">
			<img class="dh" src="${pageContext.request.contextPath }/image/dh/1/renzhonglvbu.png" >
		</div>
		
		<div id=dh7 class="sample-border" onclick="toUrl('card/toExchangeInfo/7')">
			<img class="dh" src="${pageContext.request.contextPath }/image/dh/1/sishuiguan.png" >
		</div>
		
		<div id=dh8 class="sample-border" onclick="toUrl('card/toExchangeInfo/8')">
			<img class="dh" src="${pageContext.request.contextPath }/image/dh/1/taoyuanjieyi.png" >
		</div>
		
		<div id=dh9 class="sample-border" onclick="toUrl('card/toExchangeInfo/9')">
			<img class="dh" src="${pageContext.request.contextPath }/image/dh/1/xiaoxiong.png" >
		</div>

		<script type="text/javascript" src="${pageContext.request.contextPath }/js/hengxiang.js"> </script>
		<!-- 此script用于鼠标拖拽div块使用 -->
	</div>


    <!-- 尾部 -->
	<%@ include file="user_footer1.jsp"%>
</body>
</html>