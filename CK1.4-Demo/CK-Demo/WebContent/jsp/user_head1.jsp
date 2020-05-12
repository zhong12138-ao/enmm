<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

</head>



<style>
#user_head{
    position:absolute;
    background-color:rgba(0,0,0,0.7);
    top:0;
    width:1920px;
    height: 80px;
    border-bottom: solid 3px #faeb61b4;
}
#user_head img{
    position:fixed;
    top:0;
    opacity:0.9;
    width:1920px;
    height: 80px;
}

#back{
    position:absolute;
    text-decoration:none;
    top:100px;
    right:20px;
    z-index:2;
}

#back img{ 
    width: 70px;
    height: 70px;
}
</style>

    <!-- 头部背景 -->
    <div id=user_head>
    <img  src="${pageContext.request.contextPath }/image/common/user_head1BG.png">
    </div>

    <!-- 返回 -->
    <div id=back_btn>
		<a href="#" onClick="javascript:history.back(-1);">
			<img alt="返回" title="返回" src="${pageContext.request.contextPath }/image/common/user_head2Back.png">
		</a>
    </div>