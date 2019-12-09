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
<title>课程信息操作</title>
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
<div><h2>课程信息操作</h2></div>
<form action="course_alter">
<table class="table1">
	<c:if test="${!empty course}">
		<input class="input1" type="hidden" name="id" value="${course.id}">
	</c:if>

	<tr class="tr1">
		<td class="td1">所属学科</td>
		<td class="td2"><select name="subject_id">
		<c:if test="${subjectList.size()>0}">
			<c:forEach begin="0" end="${subjectList.size()-1}" var="i">
			<c:if test="${course.subject_id == subjectList[i].subject_id}">
				<option value="${subjectList[i].subject_id}" selected="selected">${subjectList[i].subject_name}</option>
			</c:if>
			<c:if test="${course.subject_id != subjectList[i].subject_id}">
				<option value="${subjectList[i].subject_id}">${subjectList[i].subject_name}</option>
			</c:if>
			</c:forEach>
		</c:if>
		</select>
			
		</td>
	</tr>
	<tr class="tr1">
		<td class="td1">标        题</td>
		<td class="td2"><input class="input1" type="text" name="course_title" value="${course.course_title}"></td>
	</tr>
	<tr class="tr1">
		<td class="td1">简        介</td>
		<td class="td2"><input class="input1" type="text" name="course_desc" value="${course.course_desc}"></td>
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