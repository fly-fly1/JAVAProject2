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
<title>视频管理</title>
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
<div><h2>视频管理</h2></div>
<div style="float: left">
	<button type="button" onclick="add()">添加</button>
	<button type="button" onclick="deleteAll()">批量删除</button>
</div>
<div style="float: right">
<form action="video_manageLike">
	<input type="text" placeholder="请输入视频标题" name="title">
	老师：<select name="speaker_id">
	<c:if test="${speakerList.size()>0}">
		<c:forEach begin="0" end="${speakerList.size()-1}" var="i">
			<option value="${speakerList[i].id}">${speakerList[i].speaker_name}</option>
		</c:forEach>
	</c:if>
	</select>
	
	课程：<select name="course_id">
	<c:if test="${courseList.size()>0}">
		<c:forEach begin="0" end="${courseList.size()-1}" var="i">
			<option value="${courseList[i].id}">${courseList[i].course_title}</option>
		</c:forEach>
	</c:if>
	</select>
	<input type="submit" value="查询">
</form>	
</div>

<table class="table table-bordered">
	<tr>
		<th><input type="checkbox"  id="all"></th>
		<th>序号</th>
		<th>名称</th>
		<th>介绍</th>
		<th>讲师</th>
		<th>课程</th>
		<th>时长</th>
		<th>播放次数</th>
		<th>编辑</th>
		<th>删除</th>
	</tr>
	
<c:if test="${list.size()>0}">
<c:forEach begin="0" end="${list.size()-1}" var="i">
	<tr>
		<td><input type="checkbox" name="checkbox" value="${list[i].video_id}"></td>
		<td>${i+1}</td>
		<td>${list[i].title}</td>
		<td>${list[i].detail}</td>
		<td>${list[i].speaker.speaker_name}</td>
		<td>${list[i].course.course_title}</td>
		<td>${list[i].time}</td>
		<td>${list[i].play_num}</td>
		<td><a href="video_update?video_id=${list[i].video_id}">□</a></td>
		<td><a href="video_delete?video_id=${list[i].video_id}">X</a></td>
	</tr>
</c:forEach>
</c:if>
</table>

	<!-- pages:总页数；count:总记录数 -->
	<c:if test="${count % 5==0}">
		<c:set value="${count/5}" var="pages"></c:set>
	</c:if>
	<c:if test="${count % 5!=0}">
		<c:set value="${count/5+1}" var="pages"></c:set>
	</c:if>
	<!-- 限定pages只能是int类型,把pages的值赋给变量p -->
	<fmt:parseNumber var="p" value="${pages}" integerOnly="true"/>
	总共有${count}条记录，共${p}页
	<c:forEach var="i" begin="1" end="${p}">
		<c:if test="${page==i}">
			<a href="video_manage?page=${i}"><i style="color: red">第${i}页</i></a>
		</c:if>
		<c:if test="${page!=i}">
			<a href="video_manage?page=${i}">第${i}页</a>
		</c:if>
	</c:forEach>
<script type="text/javascript">
	function add() {
		location.href="video_add";
	}
	function deleteAll() {
/* 		var checkedNum=$("input[name='checkbox']:checked").length; */
		var ids=new Array();
		$("input[name='checkbox']:checked").each(function(){
            ids.push($(this).val());
        });		
/* 		alert("ids:"+ids) */
		$.ajax({
			url:"video_deleteAll",//指定请求的url
//			contentType: "application/json; charset=utf-8",
			traditional:true,
			data:{			//请求附带的参数
				video_ids:ids
			},
			success: function(data){
				if(data=='success'){
					alert("温馨提示：删除成功");
					document.location.href="video_manage";
				}else{
					alert("温馨提示：删除失败");
				}
         	 }
		})
			
	}
	/* 全选/全不选 */
	$("#all").on("click",function all() {
		var isCheck=document.getElementById("all"); 
		if(isCheck.checked==false){
			var group=document.getElementsByName("checkbox");
			for (var i = 0; i < group.length; i++) {
				group[i].checked=false;
			}
		}
		if(isCheck.checked==true){
			var group=document.getElementsByName("checkbox");
			for (var i = 0; i < group.length; i++) {
				group[i].checked=true;
			}
		}
	})


</script>
</div>
</body>
</html>