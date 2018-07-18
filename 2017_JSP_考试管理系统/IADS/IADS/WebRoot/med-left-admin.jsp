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
  <%Manager manager= (Manager)session.getAttribute("mana"); %>
 	<body>
    <div id="med-left">
				<img src="../images/teacher/<%= manager.getMid()%>.png" alt="">
				<li><b>账号:<%= manager.getMid()%></b></li>
				<li><b>权限:<%=  manager.getRank()%></b></li>
			</div>
  </body>
</html>
