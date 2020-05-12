<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- 已优化，已注释-JH -->
<head>
<meta charset="UTF-8">
<title>ck2-选择关卡</title>
<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/game_exchange.css" type="text/css" />
</head>
<script src="${pageContext.request.contextPath }/js/scrollheng.js" type="text/javascript" charset="utf-8"></script>


<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.insetborder.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('div.sample-border').borderEffect({borderColor : '#ffffff9a', speed : 100, borderWidth: 15});
    });
    /* 此script及以上两个,用于给元素添加边框时有沉浸效果 */
</script>

<body>
    <!-- 文字头 -->
	<div id=head>
		<p>ck2-选择关卡</p>
	</div>

    <!-- 引用头部 -->
	<%@ include file="user_head1.jsp"%>
	
	<!-- 返回信息 -->
	<p id=c1 style="color: yellow; font-size: 25px; position: absolute;top:70px;width:1920px;text-align: center;">
	${msg }</p>
	
	<!-- 核心部分 -->
	<div id=conn>
		<a
			href="${pageContext.request.contextPath }/card/userCardChoose/2&1">
			<div id=dh1 class="sample-border">
				<img class="dh" src="${pageContext.request.contextPath }/image/game_2taoyuanjieyi.png" alt="刘关张--桃园结义">
			</div>
		</a>
		 <a
			href="${pageContext.request.contextPath }/card/userCardChoose/2&2">
			<div id=dh2 class="sample-border">
				<img class="dh" src="${pageContext.request.contextPath }/image/game_2hanmosanjiang.png" alt="汉末三将">
			</div>
		</a> <a
			href="${pageContext.request.contextPath }/card/userCardChoose/2&3">
			<div id=dh3 class="sample-border">
				<img class="dh" src="${pageContext.request.contextPath }/image/game_2muyifumeng.png" alt="母仪浮梦">
			</div>
		</a> <a
			href="${pageContext.request.contextPath }/card/userCardChoose/2&4">
			<div id=dh4 class="sample-border">
				<img class="dh" src="${pageContext.request.contextPath }/image/game_2caoweimingjiang.png" alt="曹魏名将">
			</div>
		</a> <a
			href="${pageContext.request.contextPath }/card/userCardChoose/2&5">
			<div id=dh5 class="sample-border">
				<img class="dh" src="${pageContext.request.contextPath }/image/game_2fenghuajuedai.png" alt="风华绝代">
			</div>
		</a> <a
			href="${pageContext.request.contextPath }/card/userCardChoose/2&6">
			<div id=dh6 class="sample-border">
				<img class="dh" src="${pageContext.request.contextPath }/image/game_2jinguozhizi.png" alt="巾帼之姿">
			</div>
		</a> <a
			href="${pageContext.request.contextPath }/card/userCardChoose/2&7">
			<div id=dh7 class="sample-border">
				<img class="dh" src="${pageContext.request.contextPath }/image/game_2juedaizhimou.png" alt="绝代智谋">
			</div>
		</a> <a
			href="${pageContext.request.contextPath }/card/userCardChoose/2&8">
			<div id=dh8 class="sample-border">
				<img class="dh" src="${pageContext.request.contextPath }/image/game_2jiangmenhunv.png" alt="将门虎女">
			</div>
		</a> <a
			href="${pageContext.request.contextPath }/card/userCardChoose/2&9">
			<div id=dh9 class="sample-border">
				<img class="dh" src="${pageContext.request.contextPath }/image/game_2sanguodingli.png" alt="三国鼎立">
			</div>
		</a>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/hengxiang.js"> </script>
		<!-- 此script用于鼠标拖拽div块使用 -->
	</div>


    <!-- 尾部 -->
	<%@ include file="user_footer1.jsp"%>
</body>
</html>