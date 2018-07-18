<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>
    <title>顶端</title>
	<link rel="stylesheet" type="text/css" href=" ./css/bottsty.css">
	<link rel="stylesheet" type="text/css" href="./css/reset.css">
	<link rel="stylesheet" type="text/css" href="./css/page1-top.css">
</head>
  
  <body>
		<div id="top">
			<div id="top1">
				<img src="./images/logo2.png" alt="">

			</div>
			<div id="top2">
				<p>考试管理系统</p>
				<button  onclick="location='Admin_Admin.jsp'">主页</button>
				<button  onclick="location='Admin_AssignTest.jsp'">考试管理</button>
				<button	 onclick="location='Admin_StudentList.jsp'">学生管理</button>
				<button  onclick="location='Admin_TeacherList.jsp'">教师管理</button>
				<button  onclick="location='Admin_CourseList.jsp'">课程管理</button>
			</div>
		</div>
  </body>
</html>
