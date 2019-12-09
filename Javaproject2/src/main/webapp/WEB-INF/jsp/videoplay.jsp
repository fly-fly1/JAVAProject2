<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--<base href="http://localhost:8080/Voids/">--><base href=".">
 

    <!-- base href="http://localhost:8080/video/" -->
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description" content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/zhiyou/base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/zhiyou/css.css">
<link rel="icon" href="#" type="image/png">
<title>视频播放</title>
</head>
<body class="w100" style="padding-top: 0px;">
<header>
	<div class="container">
		<span>欢迎来到IT培训的黄埔军校——智游教育！</span>


		
		
			
				
			
			<div id="userBlock" style="float:right">
				<a onclick="return user_exit()">退出</a>
				<c:if test="${empty user}">
					<a id="login_open">登录/注册</a>
				</c:if>
				<c:if test="${!empty user}">
					<a href="user_show">${user.accounts}</a>
				</c:if>
			</div>
	
			<script type="text/javascript">
				function user_exit() {
				       $.post("user_exit","",function(data){
				    	     if(data=='success'){
				    	     	document.location.reload();
				    	     }
				    	});
				}
			</script>
			
			
		

		<a onclick="JavaScript:addFavorite2()"><img src="${pageContext.request.contextPath}/zhiyou/sc.png" draggable="false">加入收藏</a>
		
		<a target="_blank" id="admin_open"><img src="${pageContext.request.contextPath}/zhiyou/we.png" draggable="false">后台管理</a>
		<a class="color_e4"><img src="${pageContext.request.contextPath}/zhiyou/phone.png" draggable="false"> 0371-88888598　4006-371-555</a>

	</div>
</header>

<div id="app">
        <!--banner图-->
        <div class="banner">
        	<img alt="" src="${pageContext.request.contextPath}/zhiyou/banner-1.jpg" width="100%" height="470px;">
        </div>
			
        <!--面包屑导航-->
        <div class="container mian-nav" id="navDiv">公开课 /${subject.subject_name}</div>
		<div id="content">
			
			<div class="intro">
				<div class="container">
					<div class="v-intro">
						<div class="left">
							<video id="videoplay" 
							class="video-js vjs-default-skin" controls="controls" autoplay="autoplay"
								poster="${pageContext.request.contextPath}/zhiyou/error.jpg" 
								data-setup="{}" height="280" width="627">
									<source src="${video.video_url}" type="video/mp4">								
								</video>	
						</div>
						
						<div class="right">
							<p class="right-title">${video.title }</p>
							<div class="avatar">
								<span
									style="background-image: url('${speaker.pic_url}')"></span>
								<p>
									<b>${speaker.speaker_job }：${speaker.speaker_name }</b><br>
									<i>${speaker.speaker_desc }</i>
								</p>
							</div>
							<p class="video-intro">
								<span>本节内容：</span>${video.detail }
							</p>
						</div>				
					</div>
					
					<div class="kcjs">
						<p class="title">课程介绍</p>
						<p class="content">${course.course_desc }</p>
					</div>
					<div class="kcjs">
						<a  id="lay_out" href="subject_show?subject_id=${subject.subject_id}">返回</a>
					</div>
					
					
				</div>
							
			</div>

			<!--目录-->
			<div class="catalog">
				<div class="container">
					<p class="title">目录</p>
					
					<c:forEach begin="0" end="${videos.size()-1 }" var="i">
						<div class="chapter">
							<p class="biaoti">
								<a href="subject_video_show?course_id=${videos[i].course_id }&video_id=${videos[i].video_id }
								&subject_id=${subject.subject_id }">${videos[i].title }</a>
							</p>
							
							<p class="lecturer">${videos[i].detail }</p>
							<p class="lecturer">讲师：${speaker.speaker_name }</p>
							<div class="v-info">
								<span class="count"><img src="z/count.png"
									alt="">${videos[i].play_num}</span> <span class="duration"><img
									src="z/player.png" alt="">${videos[i].time }</span>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		
			
		</div>


<!--页脚-->
<footer>
	<ul>
		<li>
			<img src="${pageContext.request.contextPath}/zhiyou/footer_logo.png" alt="" draggable="false">
		</li>
		<li class="mt25">
			<h3>各校区地址</h3>
			<ul>
				<li>总部地址<br>中国-郑州经济技术开发区河南省通信产业园六层</li>
				<li>郑州校区一<br>中国-郑州经济技术开发区第一大街与经北一路</li>
				<li>郑州校区二<br>中国-郑州经济技术开发区第四大街经开人才市场七楼</li>
				<li>郑州校区三<br>中国-郑州经济技术开发区第八大街河南省留学生创业园九层、十层</li>
				<li>西安分校<br>中国-西安莲湖区　联系人：梁老师 13201570801</li>
			</ul>
		</li>
		<li class="mt25">
			<h3>联系我们</h3>
			<ul id="foo_icon">
				<li>中国-郑州经济技术开发区经北三路河南通信产业园六层</li>
				<li>e-mail:zy@zhiyou100.com</li>
				<li>电话:4006-371-555 0371-88888598</li>
				<li class="erwei">
					<br>
					<div>
						<img class="weixin" src="${pageContext.request.contextPath}/zhiyou/a_002.png" alt="" draggable="false">
						<img class="weibo" src="${pageContext.request.contextPath}/zhiyou/a.png" alt="" draggable="false">
					</div>
				</li>
			</ul>
		</li>
	</ul>
	<div class="record">智游教育 © 豫ICP备17000832号-1 　河南智游臻龙教育科技有限公司</div>
</footer>


<!--登录注册弹出框-->
<div class="mask hidden" id="login">
	<div class="mask_content">
		<div class="mask_content_header">
			<img src="./zhiyou/logo.png" alt="" class="ma">
		</div>
		<div class="mask_content_body">
			<form id="loginForm" onsubmit="return commitLogin()">
				<h3>快速登录</h3>
				<input id="loginEmail" placeholder="请输入邮箱" name="email" type="email">
				<input id="loginPassword" placeholder="请输入密码" name="password" type="password">
				<div id="forget">
					<a href="zhiyou">忘记密码？</a>
				</div>
				<input  value="登　录" type="submit">
				<input  value="注    册" type="submit" id="reg_open">
			</form>
		</div>
		<div class="mask_content_footer">
			<span id="login_close">关　闭</span>
		</div>
	</div>
</div>
<div class="mask hidden" id="reg">
	<div class="mask_content">
		<div class="mask_content_header">
			<img src="./zhiyou/logo.png" alt="" class="ma">
		</div>
		<div class="mask_content_body">
			<form id="regForm" >
				<h3>新用户注册</h3>
				<input id="regEmail" placeholder="请输入邮箱" name="email" type="email"><span id="emailMsg"></span>
				<input id="regPsw" placeholder="请输入密码" name="password" type="password">
				<input id="regPswAgain" placeholder="请再次输入密码" name="psw_again" type="password"><span id="passMsg"></span>
				<div id="yzm" class="form-inline">
					<input name="yzm" style="width: 45%; display: inline-block;" type="text">
					<div id="v_container" style="width: 45%;height: 40px;float:right;"><canvas id="verifyCanvas" width="100" height="38" style="cursor: pointer;">您的浏览器版本不支持canvas</canvas><canvas id="verifyCanvas" width="100" height="38" style="cursor: pointer;">您的浏览器版本不支持canvas</canvas></div>
				</div>
				<input onclick="return commitRegForm();" value="注　册" type="submit">
			</form>
		</div>
		<div class="mask_content_footer">
			<span id="reg_close">关　闭</span>
		</div>
	</div>
</div>
<div class="mask hidden" id="admin">
	<div class="mask_content">
		<div class="mask_content_header">
			<img src="./zhiyou/logo.png" alt="" class="ma">
		</div>
		<div class="mask_content_body">
			<form id="adminForm" action="video_manage" onsubmit="return commitAdmin()">
				<h3>后台登录</h3>
				<input id="adminAccounts" placeholder="请输入账号" name="accounts" type="text">
				<input id="adminPassword" placeholder="请输入密码" name="password" type="password" onblur="blurAdmin()">
				<div id="forget">
					<a href="zhiyou">忘记密码？</a>
				</div>
				<input  value="登　录" type="submit">
			</form>
		</div>
		<div class="mask_content_footer">
			<span id="admin_close">关　闭</span>
		</div>
	</div>
</div>

<form action="http://localhost:8080/Voids/">
	<input type="text" value="1" id="isLogin">
</form>
    
<script src="${pageContext.request.contextPath}/zhiyou/jquery-1.js"></script>
<script src="${pageContext.request.contextPath}/zhiyou/gVerify.js"></script>
<script src="${pageContext.request.contextPath}/zhiyou/index.js"></script>

</div>
</body>
</html>