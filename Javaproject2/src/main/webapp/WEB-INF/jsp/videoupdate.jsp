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
<title>修改视频信息</title>
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
<div><h2>修改视频信息</h2></div>
<form action="video_alter.do" method="post" enctype="multipart/form-data">
<table class="table1">
		<input class="input1" type="hidden" name="video_id" value="${video.video_id}">
	<tr class="tr1">
		<td class="td1">视   频  标   题 </td>
		<td class="td2"><input class="input1" type="text" name="title" value="${video.title}"></td>
	</tr>
	<tr class="tr1">
		<td class="td1">主      讲     人 </td>
		<td class="td2"><select name="speaker_id">
		<c:if test="${speakerList.size()>0}">
			<c:forEach begin="0" end="${speakerList.size()-1}" var="i">
			<c:if test="${video.speaker_id == speakerList[i].id}">
				<option value="${speakerList[i].id}" selected="selected">${speakerList[i].speaker_name}</option>
			</c:if>
			<c:if test="${video.speaker_id != speakerList[i].id}">
				<option value="${speakerList[i].id}">${speakerList[i].speaker_name}</option>
			</c:if>
			</c:forEach>
		</c:if>
		</select></td>
	</tr>
	<tr class="tr1">
		<td class="td1">所  属  课   程 </td>
		<td class="td2"><select name="course_id">
		<c:if test="${courseList.size()>0}">
			<c:forEach begin="0" end="${courseList.size()-1}" var="i">
			<c:if test="${video.course_id == courseList[i].id}">
				<option value="${courseList[i].id}" selected="selected">${courseList[i].course_title}</option>
			</c:if>
			<c:if test="${video.course_id != courseList[i].id}">
				<option value="${courseList[i].id}">${courseList[i].course_title}</option>
			</c:if>
			</c:forEach>
		</c:if>
		</select></td>
	</tr>
	<tr class="tr1">
		<td class="td1">视   频   时  长 </td>
		<td class="td2"><input class="input1" type="text" name="time" value="${video.time}"></td>
	</tr>
	<tr class="tr1">
		<td class="td1">原封面图片地址 </td>
		<td class="td2"><input class="input1" type="text" name="image_url" value="${video.image_url}" readonly="readonly"></td>
	</tr>
	<tr class="tr1">
		<td class="td1">封面图片地址 </td>
		<td class="td2"><input class="input1" type="file" name="image" value=""></td>
	</tr>
	<tr class="tr1">
		<td class="td1">原视频播放地址 </td>
		<td class="td2"><input class="input1" type="text" name="video_url" value="${video.video_url}" readonly="readonly"></td>
	</tr>
	<tr class="tr1">
		<td class="td1">视频播放地址 </td>
		<td class="td2"><input class="input1" type="file" name="video"></td>
	</tr>
	<tr class="tr1">
		<td class="td1">视   频   介  绍 </td>
		<td class="td2"><input class="input1" type="text" name="detail" value="${video.detail}"></td>
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