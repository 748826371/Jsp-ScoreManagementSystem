<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.ccnu.imd.test.entity.*"%>   
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
<link rel="stylesheet" type="text/css" href="./css/page1-top.css">
<link rel="stylesheet" type="text/css" href="./css/page1-med.css">
<link rel="stylesheet" type="text/css" href="./css/page1-foot.css">
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/bottsty.css">
  </head>
  <%Student student= (Student)session.getAttribute("stu"); %>
 	<body>
    <div id="med-left">
				<img src="./images/teacher/<%= student.getSid()%>.png" alt="">
				<li><b>学号:<%= student.getSid()%></b></li>
				<li><b>年级:<%=student.getGrade() %></b></li>
				<li><b>姓名:<%= student.getName()%></b></li>
				<li><b>院系:<%= student.getMajor()%></b></li>
			</div>
  </body>
</html>
