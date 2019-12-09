<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/zhiyou/base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/zhiyou/profile.css">
<link href="zhiyou/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- 引入jauery -->
<script src="jquery/jquery.js"></script>
<meta charset="UTF-8">
<title>主讲人信息操作</title>
   <style type="text/css">
        .table1{
	          border: 1px gray solid;
            border-collapse: collapse;
        }
        .tr1{
            width: 810px;
            height: 40px;
        }
        .td1{
            border: 1px gray solid;
             width: 200px;
             height: 60px;
            text-align: center;
         }
        .td2{
            border: 1px gray solid;
            width: 900px;
            height: 60px;
        }
        .input1{
            width: 700px;
            height: 50px;
        }
   </style> 
</head>
<body>

<header>
	<menu>
		<div class="container clearfix">
			<ul class="clearfix f_left">
				<li class="menu_active"><i style="color:white"><h4>视频管理系统</h4></i></li>
				
				<li class="menu_active"><a href="video_manage">视频管理</a></li>
				<li class="menu_active"><a href="speaker_manage">主讲人管理</a></li>
				<li class="menu_active"><a href="course_manage">课程管理</a></li>
			</ul>
			
			<div id="user_bar">
				<i style="color:white">${admin.accounts}</i>
				<a  id="lay_out" href="admin.jsp">退出</a>
			</div>
		</div>
	</menu>
</header>

<div class="container2">
<div><h2>主讲人信息操作</h2></div>
<form action="speaker_alter.do" method="post" enctype="multipart/form-data">
<table class="table1">
	<c:if test="${!empty speaker}">
		<input class="input1" type="hidden" name="id" value="${speaker.id}">
	</c:if>

	<tr class="tr1">
		<td class="td1">姓           名</td>
		<td class="td2"><input class="input1" type="text" name="speaker_name" value="${speaker.speaker_name}"></td>
	</tr>
	<tr class="tr1">
		<td class="td1">职           位 </td>
		<td class="td2"><input class="input1" type="text" name="speaker_job" value="${speaker.speaker_job}"></td>
	</tr>
	<c:if test="${!empty speaker}">
	<tr class="tr1">
		<td class="td1">原头像地址 </td>
		<td class="td2"><input class="input1" type="text" name="pic_url" value="${speaker.pic_url}" readonly="readonly"></td>
	</tr>
	</c:if>
	<tr class="tr1">
		<td class="td1">头像地址    </td>
		<td class="td2"><input class="input1" type="file" name="image"></td>
	</tr>
	<tr class="tr1">
		<td class="td1">简             介</td>
		<td class="td2"><input class="input1" type="text" name="speaker_desc" value="${speaker.speaker_desc}"></td>
	</tr>
	<tr>
		<td class="td1"  colspan="2">
			<input type="submit" value="保存">
		</td>
	</tr>
</table>
</form>	
</div>
</body>
</html>