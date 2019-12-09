<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- base href="http://localhost:8080/video/" -->
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description" content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
    <meta name="author" content="尚忠祥">
    
<!--<base href="http://localhost:8080/Voids/">--><base href=".">
<!--     <link rel="stylesheet" href="./zhiyou/base.css">
    <link rel="stylesheet" href="./zhiyou/profile.css"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/zhiyou/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/zhiyou/profile.css">
    <link rel="icon" href="http://localhost:8080/Voids/static/z/favicon.png" type="image/png">
<title>个人中心</title>
</head>
<body>
<header>
	<div class="container top_bar clearfix">
		<img src="${pageContext.request.contextPath}/zhiyou/logo.png" alt="智游">
		<div id="tele">
			<span>4006-371-555</span>
			<span>0371-88888598</span>
		</div>
	</div>
	<menu>
		<div class="container clearfix">
			<ul class="clearfix f_left">
				<li><a href="admin.jsp">首页</a></li>
				
				<li class="menu_active"><a href="user_show">个人中心</a></li>
			</ul>
			
			<div id="user_bar">
				<a >
						
						<img id="avatar" src="${sessionScope.user.imgurl}" alt="" width="30px;">
						
						
					

				</a>
				<a  id="lay_out" href="admin.jsp">退出</a>
			</div>
		</div>
	</menu>
</header>

    <main>
        <div class="container">
            <h2>我的资料</h2>
            <div id="profile_tab">
                <ul class="profile_tab_header f_left clearfix">
                    <li><a href="user_update?service=data">更改资料</a></li>
                    <li class="profile_tab_line">|</li>
                    <li><a href="user_update?service=img">更改头像</a></li>
                    <li class="profile_tab_line">|</li>
                    <li><a href="user_update?service=password">密码安全</a></li>
                </ul>
                <div class="proflle_tab_body">
                    
                    <div class="proflle_tab_workplace clearfix">
                        <div class="profile_avatar_area">
                            
		                         <img id="avatar" width="200px;" src="${sessionScope.user.imgurl}" alt="">
		                      
                  
                            <p>
                            
						   
                                                                          欢迎回来！</p>
                        </div>
                        <ul class="profile_ifo_area">
                            <li><span class="dd">昵　称：${sessionScope.user.nickname}</span></li>
                            
                            
                            
                            
                            
                            <li><span class="dd">性　别：${sessionScope.user.sex}</span>
                                
                                 
                             </li>
                            <li><span class="dd">生　日：${sessionScope.user.birthday}</span></li>
                            <li><span class="dd">邮　箱：${sessionScope.user.accounts}</span></li>
                            <li><span class="dd">所在地：${sessionScope.user.address}</span> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <div class="container">
            <ul>
                <li><img src="${pageContext.request.contextPath}/zhiyou/footer_logo.png" alt="" id="foot_logo"></li>
                <li>版权所有：智游3G教育　　　©&nbsp;www.zhiyou100.com</li>
                <li><img src="${pageContext.request.contextPath}/zhiyou/a.png" alt="" id="wxgzh"></li>
            </ul>
        </div>
    </footer>

</body>
</html>