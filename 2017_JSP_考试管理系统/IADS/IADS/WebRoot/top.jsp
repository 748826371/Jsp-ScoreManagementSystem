<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>
    <title>顶端</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<link rel="stylesheet" type="text/css" href="./css/bottsty.css">
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
				<button  onclick="location='Tmain.jsp'">主页</button>
				<button  onclick="location='MyCourses.jsp'">我的课程</button>
				<button	 onclick="location='MyTests.jsp'">考试安排</button>
				<button  onclick="location='ChangeStudent1.jsp'">学生管理</button>
				<button onclick="location='ChangeType1.jsp'">考试清单</button>
			</div>
		</div>
  </body>
</html>
