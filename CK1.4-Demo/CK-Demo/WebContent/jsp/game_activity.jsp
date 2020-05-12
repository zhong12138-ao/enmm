<!DOCTYPE html>
<%@page import="com.ck.pojo.User"%>
<% User user = (User) request.getSession().getAttribute("user"); %>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>ck-活动</title>
	<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/game_activity.css">
	<script src="${pageContext.request.contextPath }/js/jquery1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/confirm.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/sweetalert.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/sweetalert-dev.js"></script>
</head>


<body>
	<%@ include file="user_head1.jsp"%>
	
	<div id=head>
		<span>ck-骰子活动</span>
	</div>
	
	<!-- 用户头像 -->
	<div class="character">
		<img id="player2"
			src="${pageContext.request.contextPath }/${user.getUser_image()}">
	</div>

    <!-- 骰子地图 -->
	<div class="map">
		<div id="b1" class="box">
			<h1>1</h1>
		</div>
		<div id="b2" class="box">
			<h1>2</h1>
		</div>
		<div id="b3" class="box">
			<h1>3</h1>
		</div>
		<div id="b4" class="box">
			<h1 class="small">
				前进<br>4格
			</h1>
		</div>
		<div id="b5" class="box" style="background-image: url('${pageContext.request.contextPath }/image/game_activity/game_activityMapBG2.png');">
			<div class=fontbg>
				<font color="green" size="5.5px">500虎符</font>
			</div>
		</div>
		<div id="b6" class="box">
			<h1>6</h1>
		</div>
		<div id="b7" class="box" style="background-image: url('${pageContext.request.contextPath }/image/game_activity/game_activityMapBG2.png');">
			<div class=fontbg>
				<font color="green" size="5.5px">1000虎符</font>
			</div>
		</div>
		<div id="b8" class="box">
			<h1>8</h1>
		</div>
		<div id="b9" class="box">
			<h1>9</h1>
		</div>
		<div id="b10" class="box">
			<h1 class="small">
				前进<br>6格
			</h1>
		</div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div id="b11" class="box" style="background-image: url('${pageContext.request.contextPath }/image/game_activity/game_activityMapBG2.png');">
			<div class=fontbg>
				<font color="green" size="5.5px">300虎符</font>
			</div>
		</div>
		<div id="b25" class="box">
			<h1>25</h1>
		</div>
		<div id="b26" class="box">
			<h1 class="small">
				前进<br>1格
			</h1>
		</div>
		<div id="b27" class="box">
			<h1>27</h1>
		</div>
		<div id="b28" class="box">
			<h1 class="small">
				后退<br>10格
			</h1>
		</div>
		<div id="b29" class="box" style="background-image: url('${pageContext.request.contextPath }/image/game_activity/game_activityMapBG4.png');">
			<div class=fontbg>
				<font color="#C71585" size="4px">五星神将</font><font color="#800080"
					size="6px" style="font-family: fantasy;">吕布</font>
			</div>
		</div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div id="b12" class="box">
			<h1 class="small">
				后退<br>3格
			</h1>
		</div>
		<div id="b24" class="box" style="background-image: url('${pageContext.request.contextPath }/image/game_activity/game_activityMapBG3.png');">
			<div class=fontbg>
				<font color="#FAFAD2" size="4px">四星武将</font><font color="#00008B"
					size="6px">马超</font>
			</div>
		</div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div class="hi"></div>
		<div id="b13" class="box">
			<h1>13</h1>
		</div>
		<div id="b23" class="box">
			<h1>23</h1>
		</div>
		<div id="b22" class="box">
			<h1>22</h1>
		</div>
		<div id="b21" class="box">
			<h1 class="small">
				后退<br>5格
			</h1>
		</div>
		<div id="b20" class="box">
			<h1>20</h1>
		</div>
		<div id="b19" class="box" style="background-image: url('${pageContext.request.contextPath }/image/game_activity/game_activityMapBG2.png');">
			<div class=fontbg>
				<font color="green" size="5.5px">400虎符</font>
			</div>
		</div>
		<div id="b18" class="box">
			<h1>18</h1>
		</div>
		<div id="b17" class="box">
			<h1 class="small">
				回到<br>起点
			</h1>
		</div>
		<div id="b16" class="box">
			<h1>16</h1>
		</div>
		<div id="b15" class="box">
			<h1>15</h1>
		</div>
		<div id="b14" class="box" style="background-image: url('${pageContext.request.contextPath }/image/game_activity/game_activityMapBG3.png');">
			<div class=fontbg>
				<font color="#FAFAD2" size="4px">四星武将</font><font color="00008B"
					size="6px">刘备</font>
			</div>
		</div>
	</div>
	
	
	<div id="c2" class="control">
	    <div style="width:200px;text-align:center;font-size:30px;">
			<font id="dice2">${user.getDice_point() }</font>
        </div>
		<div class="dice2"></div>
	</div>
	
	<!-- 底部 -->
	<%@ include file="user_footer1.jsp"%>
	
	
	<script type="text/javascript">
		var refreshTime = "500";
		$(document).ready(function() {
			var i = 0;
			$(function() {
				setInterval(function() {
					$("#dice2").load(location.href + " #dice2");
				}, refreshTime);
			});
		});
	</script>


	<script>
		var i = 0;
		var j = 0;
		var dice2 = $(".dice2");
		var c2 = $("#c2");
		var p2 = document.querySelector("#player2");
		var end = document.querySelector("#b29");
		var b4 = $("#b4");
		var b10 = $("#b10");
		var b12 = $("#b12");
		var b17 = $("#b17");
		var b21 = $("#b21");
		var b26 = $("#b26");
		var b28 = $("#b28");
		var speed = 700;
		var dice_point = ${user.getDice_point()};
		
		//获得奖励弹窗及数据更新
		function trap() {
			if (j == 4) {
				p2.style.animation = "bigger .7s";
				var go = setInterval(function() {
					j++;
					$("#b" + j + "").append(p2);
				}, speed);
				swal("恭喜前进四格！")
				setTimeout(function() {
					clearInterval(go);
				}, speed * 4 + 100);
				setTimeout(function() {
					p2.style.animation = "none";
					dice1.css("pointer-events", "auto");
					clark();
				}, speed * 5);
			}
			if (j == 5) {
				swal("恭喜获得500虎符！")
				$.ajax({
					url : '../user/updatehufu?money=500',
					type : 'get',
					dataType : 'json',
				});
			}
			if (j == 11) {
				swal("恭喜获得300虎符！")
				$.ajax({
					url : '../user/updatehufu?money=300',
					type : 'get',
					dataType : 'json',
				});
			}

			if (j == 19) {
				swal("恭喜获得400虎符！")
				$.ajax({
					url : '../user/updatehufu?money=400',
					type : 'get',
					dataType : 'json',
				});
			}
			if (j == 7) {
				swal("恭喜获得1000虎符！")
				$.ajax({
					
					url : '../user/updatehufu?money=1000',
					type : 'get',
					dataType : 'json',
				});
			}
			if (j == 24) {
				swal("获得四星神将马超！")
				$.ajax({
					url : '../user/gethuodongcard?id=431',
					type : 'get',
					dataType : 'json',
				});
			}
			if (j == 14) {
				swal("获得四星神将刘备！")
				$.ajax({
					url : '../user/gethuodongcard?id=404',
					type : 'get',
					dataType : 'json',
				});
			}
			if (j == 10) {
				p2.style.animation = "bigger .7s";
				var go = setInterval(function() {
					j++;
					$("#b" + j + "").append(p2);
				}, speed);
				swal("恭喜前进六格！")
				setTimeout(function() {
					clearInterval(go);
				}, speed * 6 + 100);
				setTimeout(function() {
					p2.style.animation = "none";
					dice1.css("pointer-events", "auto");
					clark();
				}, speed * 7);
			}
			if (j == 12) {
				p2.style.animation = "smaller .7s";
				var go = setInterval(function() {
					j--;
					$("#b" + j + "").append(p2);
				}, speed);
				swal("可惜后退三格！")
				setTimeout(function() {
					clearInterval(go);
				}, speed * 3 + 100);
				setTimeout(function() {
					p2.style.animation = "none";
					dice1.css("pointer-events", "auto");
					clark();
				}, speed * 4);
			}
			if (j == 21) {
				p2.style.animation = "smaller .7s";
				var go = setInterval(function() {
					j--;
					$("#b" + j + "").append(p2);
				}, speed);
				swal("可惜后退五格！")
				setTimeout(function() {
					clearInterval(go);
				}, speed * 5 + 100);
				setTimeout(function() {
					p2.style.animation = "none";
					dice1.css("pointer-events", "auto");
					clark();
				}, speed * 6);
			}
			if (j == 26) {
				p2.style.animation = "bigger .7s";
				var go = setInterval(function() {
					j++;
					$("#b" + j + "").append(p2);
				}, speed);
				swal("恭喜前进一格！")
				setTimeout(function() {
					clearInterval(go);
				}, speed + 100);
				setTimeout(function() {
					p2.style.animation = "none";
					dice1.css("pointer-events", "auto");
					clark();
				}, speed * 2);
			}
			if (j == 28) {
				p2.style.animation = "bigger .7s";
				var go = setInterval(function() {
					j--;
					$("#b" + j + "").append(p2);
				}, speed);
				swal("可惜后退十格！")
				setTimeout(function() {
					clearInterval(go);
				}, speed * 10 + 100);
				setTimeout(function() {
					p2.style.animation = "none";
					dice1.css("pointer-events", "auto");
					clark();
				}, speed * 11);
			}
			
			if (j == 17) {
				j = 1;
				$("#b" + j + "").append(p2);
				Cswal("可惜，退回原点！")
			}
		}
		
		//骰子点击
		$(function() {
			dice2.on("click", function() {
				if(dice_point==0){
					swal("抱歉","您的点数不足，请前往购买","error")
				}else{
					$.ajax({
						url : '../user/rolldice',
						type : 'get',
						dataType : 'html',
					});
					let num = Math.ceil(Math.random() * 6);
					let bgi = Math.ceil(Math.random() * 2);
					dice2.css("background-image",
							"url(${pageContext.request.contextPath }/image/game_activity/huodong/s"
									+ bgi + ".jpg");
					setTimeout(function() {
						dice2.css("background-image",
								"url(${pageContext.request.contextPath }/image/game_activity/huodong/"
										+ num + ".jpg");
					}, 300);
					if (num == 1) {
						setTimeout(function() {
							j++;
							$("#b" + j + "").append(p2);
							trap();
							clark();
						}, speed);
						;
					}
					if (num == 2) {
						var move = setInterval(function() {
							j++;
							$("#b" + j + "").append(p2);
						}, speed);
						setTimeout(function() {
							clearInterval(move);
							trap();
							clark();
						}, speed * 2 + 100);
						;
					}
					if (num == 3) {
						var move = setInterval(function() {
							j++;
							$("#b" + j + "").append(p2);
						}, speed);
						setTimeout(function() {
							clearInterval(move);
							trap();
							clark();
						}, speed * 3 + 100);
						;
					}
					if (num == 4) {
						var move = setInterval(function() {
							j++;
							$("#b" + j + "").append(p2);
						}, speed);
						setTimeout(function() {
							clearInterval(move);
							trap();
							clark();
						}, speed * 4 + 100);
						;
					}
					if (num == 5) {
						var move = setInterval(function() {
							j++;
							$("#b" + j + "").append(p2);
						}, speed);
						setTimeout(function() {
							clearInterval(move);
							trap();
							clark();
						}, speed * 5 + 100);
						;
					}
					if (num == 6) {
						var move = setInterval(function() {
							j++;
							$("#b" + j + "").append(p2);
						}, speed);
						setTimeout(function() {
							clearInterval(move);
							trap();
							clark();
						}, speed * 6 + 100);
						;
					}
				}
			})
		})
		var check = setInterval(function() {
			if (end.lastElementChild.getAttribute("id") == "player2") {
				swal("获得五星神将吕布！")
				$.ajax({
					url : '../user/gethuodongcard?id=517',
					type : 'get',
					dataType : 'json',
				});
				clearInterval(check);
			}
		}, 1000);
	</script>

</body>
</html>