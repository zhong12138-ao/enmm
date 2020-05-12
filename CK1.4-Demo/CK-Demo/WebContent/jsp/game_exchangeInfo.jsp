<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ck-兑换</title>
	<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/game_exchangeInfo.css" type="text/css" />
	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/sweetalert.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/sweetalert-dev.js"></script>
</head>

<script src="${pageContext.request.contextPath }/js/scrollheng.js" type="text/javascript" charset="utf-8"></script> 

<script type="text/javascript">
    /* 提示信息 */
	function tixing() {
		swal("抱歉","您已经兑换过了","error")
	}
    function worn(){
    	swal("抱歉","您的卡不足","error")
    }
    
	//跳转
	function toUrl(url){
		window.location.href = "${pageContext.request.contextPath }/"+url;
	}
</script>

<body>
	
    <div id=head>
		<p>ck-典藏详情</p>
	</div>
	
	<div id=back>
		<img alt="返回" title="返回" src="${pageContext.request.contextPath }/image/common/user_head2Back.png"
		onclick="toUrl('href/toGameExchange')">
	</div>	
	
	<!-- 以下为页眉 -->
    <%@ include file="user_head1.jsp" %>

	<div id=msg>
		<p>${msg }</p>
	</div>

    <div id=conn>
	     <img id = "i1" alt="" src="${pageContext.request.contextPath }/${dc.getCard_image() }"><br>
	     <div id = "i2">
				<img class="simg"  alt="" src="${pageContext.request.contextPath }/${dc.getCard1_image() }"> 
				 <c:if test="${list_num.get(0)>=1 }">
					<font color="yellow" size="25px">${list_num.get(0) }/1</font>
				</c:if> 
				<c:if test="${list_num.get(0)==0 }">
					<font color="red" size="25px">0/1</font>
				</c:if>
		 </div>

		 <div id = "i3">
				<img class="simg"  alt="" src="${pageContext.request.contextPath }/${dc.getCard2_image() }">  
				<c:if test="${list_num.get(1)>=1 }">
					 <font color="yellow" size="25px">${list_num.get(1) }/1</font>
				 </c:if>
				 <c:if test="${list_num.get(1)==0 }">
					 <font color="red" size="25px">0/1</font>
				 </c:if> 

		 </div>

		 <div id = "i4">
				<img class="simg"  alt="" src="${pageContext.request.contextPath }/${dc.getCard3_image() } ">  
				<c:if test="${list_num.get(2)>=1 }">
					 <font color="yellow" size="25px">${list_num.get(2) }/1</font>
				 </c:if>
				<c:if test="${list_num.get(2)==0 }">
					 <font color="red" size="25px">0/1</font>
				 </c:if><br>
		 </div>
	     
		<div id = tip>
               <c:if test="${empty user_card }">
			     	<c:if test="${list_num.get(0)==1&&list_num.get(1)==1&&list_num.get(2)==1 }">
			     	<a id="button" href="${pageContext.request.contextPath }/card/postDuiHuan/${dc.getCard1_id() }&${dc.getCard2_id() }&${dc.getCard3_id()}&${dc.getCard_id() }&${dc.getId() }">
			     	<font style="color: white;font-size: 40px;">兑换</font></a></c:if>
			     <c:if test="${list_num.get(0)!=1||list_num.get(1)!=1||list_num.get(2)!=1 }" >
			     	<a onclick="worn()" id="button" >
			     	<font style="color: gray;font-size: 40px;">兑换</font></a>
			     </c:if>
			     </c:if> 	
			     <c:if test="${not empty user_card }">
			     	<a id="button" onclick="tixing()">
			     	<font style="color: gray;font-size: 40px;">已兑换</font></a>
			     </c:if>
		</div>
        
        <!-- 显示典藏卡信息文本 -->
		<div id=content>
			<p>${dc.getText() }</p>
		</div>
				     	
	</div> 
    
	<!-- 以下为页脚部分 -->
    <%@ include file="user_footer1.jsp" %>
</body>
</html>
	