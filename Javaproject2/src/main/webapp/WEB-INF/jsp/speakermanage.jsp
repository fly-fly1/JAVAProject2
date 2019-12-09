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
<title>主讲人管理</title>
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
<div><h2>主讲人管理</h2></div>
<div style="float: left">
	<button type="button" onclick="add()">添加</button>
	<button type="button" onclick="deleteAll()">批量删除</button>
</div>

<table class="table table-bordered">
	<tr>
		<th><input type="checkbox" onchange="all()" id="all"></th>
		<th>序号</th>
		<th>名称</th>
		<th>职位</th>
		<th>简介</th>
		<th>编辑</th>
		<th>删除</th>
	</tr>
	
<c:if test="${list.size()>0}">
<c:forEach begin="0" end="${list.size()-1}" var="i">
	<tr>
		<td><input type="checkbox" name="checkbox" value="${list[i].id}"></td>
		<td>${i+1}</td>
		<td>${list[i].speaker_name}</td>
		<td>${list[i].speaker_job}</td>
		<td>${list[i].speaker_desc}</td>
		<td><a href="speaker_update?id=${list[i].id}">□</a></td>
		<td><a href="speaker_delete?id=${list[i].id}">X</a></td>
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
			<a href="speaker_manage?page=${i}"><i style="color: red">第${i}页</i></a>
		</c:if>
		<c:if test="${page!=i}">
			<a href="speaker_manage?page=${i}">第${i}页</a>
		</c:if>
	</c:forEach>
<script type="text/javascript">
	function add() {
		location.href="speaker_add";
	}
	function deleteAll() {
		var checkedNum=$("input[name='checkbox']:checked").length;
		var ids=new Array();
		$("input[name='checkbox']:checked").each(function(){
            ids.push($(this).val());
        });		
/* 		alert("ids:"+ids) */
		$.ajax({
			url:"speaker_deleteAll",//指定请求的url
//			contentType: "application/json; charset=utf-8",
			traditional:true,
			data:{			//请求附带的参数
				ids:ids
			},
			success: function(data){
				if(data=='success'){
					alert("温馨提示：删除成功");
					document.location.href="speaker_manage";
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