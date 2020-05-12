<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>ck-我的碎片</title>
	<link rel="icon" type="image/x-icon2" href="${pageContext.request.contextPath }/image/game_ck2ICON.png" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/user_piece.css" type="text/css" />
</head>
    
<body>

    <!-- 以下为页眉 -->
    <%@ include file="user_head1.jsp"%>
    
    <!-- 头部文字 -->
	<div id=head>
		<p>ck-我的碎片</p>
	</div>
    
    <!-- 以下为卡包满了的提示 -->
    <div id=msg>
      <p>${msg }</p>
    </div>
    
    <!-- 返回 -->
	<div id=back>
	<a href="${pageContext.request.contextPath }/card/getUser_card">
		<img alt="返回" title="返回" src="${pageContext.request.contextPath }/image/common/user_head2Back.png">
	</a>
	</div>	

    <div id=conn>
    <!-- 背景板 -->
	<div id=bord>
	
	<c:forEach items="${user_picelist }" var="u_pl">
		<div id="box">
		    <div class="imgLQ" href="javascript:;">
				<img alt="" src="${pageContext.request.contextPath }/${u_pl.fragment_image }"><br>
			</div>
				<p><yellow>${u_pl.fragment_name }</yellow>×${u_pl.fragment_num }</p>
				<p><c:if test="${u_pl.fragment_num>=80 }">
					<a href="${pageContext.request.contextPath }/user/pieceToCard?fragment_id=${u_pl.fragment_id}" style="text-decoration: none;">
					<span style="background:rgba(34,139,34,0.5)">&nbsp;&nbsp;兑换&nbsp;&nbsp;</span></a>
				</c:if>
				</p>
				<p>
			<c:if test="${u_pl.fragment_num<80 }">
				<span>碎片不足</span>
			</c:if>
			</p>
		</div>
	</c:forEach>	
		
	</div>	
    </div>
     

    <!-- 以下为页脚部分 -->
    <%@ include file="user_footer1.jsp"%>
</body>
</html>