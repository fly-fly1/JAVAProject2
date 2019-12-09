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
<title>添加视频信息</title>
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
<div><h2>视频信息操作</h2></div>
<form action="video_alter.do" method="post" enctype="multipart/form-data">
<table class="table1">
	<tr class="tr1">
		<td class="td1">视   频  标  题 </td>
		<td class="td2"><input class="input1" type="text" name="title" placeholder="请输入视频名称"></td>
	</tr>
	<tr class="tr1">
		<td class="td1">主     讲      人 </td>
		<td class="td2"><select name="speaker_id">
		<c:if test="${speakerList.size()>0}">
			<c:forEach begin="0" end="${speakerList.size()-1}" var="i">
				<option value="${speakerList[i].id}">${speakerList[i].speaker_name}</option>
			</c:forEach>
		</c:if>
		</select></td>
	</tr>
	<tr class="tr1">
		<td class="td1">所   属   课   程 </td>
		<td class="td2"><select name="course_id">
		<c:if test="${courseList.size()>0}">
			<c:forEach begin="0" end="${courseList.size()-1}" var="i">
				<option value="${courseList[i].id}">${courseList[i].course_title}</option>
			</c:forEach>
		</c:if>
		</select></td>
	</tr>
	<tr class="tr1">
		<td class="td1">视   频   时  长 </td>
		<td class="td2"><input class="input1" type="text" name="time" placeholder="精确到秒（正整数）"></td>
	</tr>
	<tr class="tr1">
		<td class="td1">封面图片地址 </td>
		<td class="td2"><input class="input1" type="file" name="image" placeholder="具体的url"></td>
	</tr>
	<tr class="tr1">
		<td class="td1">视频播放地址 </td>
		<td class="td2"><input class="input1" type="file" name="video" placeholder="具体的url"></td>
	</tr>
	<tr class="tr1">
		<td class="td1">视  频   介   绍 </td>
		<td class="td2"><input class="input1" type="text" name="detail"></td>
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