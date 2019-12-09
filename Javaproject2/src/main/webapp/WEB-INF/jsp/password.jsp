<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- base href="http://localhost:8080/video/" -->
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    
        
<!--<base href="http://localhost:8080/Voids/">--><base href=".">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description" content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/zhiyou/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/zhiyou/profile.css">
    <link rel="icon" href="http://localhost:8080/Voids/static/z/favicon.png" type="image/png">
<title>修改密碼</title>
<!-- 引入jauery -->
<script src="${pageContext.request.contextPath}/jquery/jquery.js"/></script>
<script src="${pageContext.request.contextPath}/jquery/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/messages_zh.js"></script>

<script type="text/javascript">
	$().ready(function() {
		$("#form").validate({
				rules:{
					password1:{
						required:true,
						//minlength:8
					},
					password:{
						required:true,
						equalTo:"#password1"
					}
				},
				messages:{
					password1:{
						required:"请输入密码",
						//minlength:"密码长度最小为8位"
					},
					password:{
						required:"请输入确认密码",
						equalTo:"确认密码需要与密码保持一致"
					}	
				}
		});
	})	
							
</script>
                            
<style type="text/css">
.error{
	color:red;
}
</style>
</head>
<body class="w100">
   



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
				<a>
						
						<img id="avatar" src="${sessionScope.user.imgurl}" alt="" "="">
						
						
					

				</a>
				<a href="admin.jsp">退出</a>
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
                        <div class="profile_ifo_area">
                            <form action="user_alter" method="post" onsubmit="return i" id="form">
                                <div class="form_group">
                                    <span class="dd">旧　密　码：</span>
                                    <input  type="password" id="oldMsg" onblur="on()"><i style="color: red"></i>
                                </div>
                                <div class="form_group">
                                    <span class="dd">新　密　码：</span>
                                    <input type="password" name="password1" id="password1">
                                </div>
                                <div class="form_group">
                                    <span class="dd">确认新密码：</span>
                                    <input  type="password" name="password">
                                </div>
                                	<input type="hidden" name="id" value="${user.id}">
                                <div class="form_submit dd">
                                    <input value="保　存" type="submit">
                                    <a >取消</a>
                                </div>
                                	<input id="pass" value="${sessionScope.user.password}" type="hidden">
                            </form>
                            <script type="text/javascript">
                            	var i=false;
                            	
								function on() {
									if($("#pass").val()==$("#oldMsg").val()){
										i=true;
										$("i").text("");
									}else {
										i=false;
										$("i").text("原密碼錯誤");
									}
								}
							</script>
							
                        </div>
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