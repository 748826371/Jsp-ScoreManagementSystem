<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.ccnu.imd.test.entity.*"%>
<%@ page import="cn.edu.ccnu.imd.test.dao.ScoreDao"%>      
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
<link rel="stylesheet" type="text/css" href="./css/addpost.css">
<link rel="stylesheet" type="text/css" href="./css/page1-top.css">
<link rel="stylesheet" type="text/css" href="./css/page1-med.css">
<link rel="stylesheet" type="text/css" href="./css/page1-foot.css">
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/bottsty.css">
<link rel="stylesheet" type="text/css" href="./css/table2.css">
	<style></style>
</head>
<body>
	<div id=container>
   <%@include file="./top.jsp"%>
		<div id="med">
			<div id="med-left">
			    <% Course course = (Course)session.getAttribute("course");
			    /******此处永久定义了一个session.cid*******/
			    %>  
				<img src="./images/userpic1.png" alt="">
				<li><b>课程编号:<%=course.getCid() %></b></li>
				<li><b>课程名:<%=course.getName() %></b></li>
				<li><b>教师名:<%=course.getTname() %></b></li>
			</div>







			<div id="med-right">
				<div class="table-responsive" style="border:1px solid #ccc border-radius: 3%;">
     					<table class="table table-striped">
      						<thead>
        						<th>学号</th>
        						<th>姓名</th>
       							<th>成绩</th>
       							<th>功能</th>
    						</thead>
    						<tbody style="overflow:auto  height: 70px;">
  							  <%
  							  ScoreDao scoreDao = new ScoreDao();
  							  List scoreList = scoreDao.searchScoresByCid(course.getCid());
  							   Iterator iter = scoreList.iterator();
  							  Score score;
		
  							  while(iter.hasNext()){ 
  							  			score = (Score)iter.next();%>
      						<tr>
									<td><%=score.getSid() %></td>
									<td><%=score.getSname() %></td>
									<td><%=score.getScore() %></td>
									<td><button id="test123"onclick="location='service.do?service=DelStudent&sid=<%=score.getSid()%>'">删除学生</button></td>
      						</tr>
      						<%} %>
      						</tbody>
      					</table>
      					 <%String message = (String)session.getAttribute("message");%>
      					<form id="addpost"method="post" action="service.do?service=AddStudent&cid=<%=course.getCid()%> ">
      					     	<input  type="text" name="sid" value="<%=message %>"/>
      							<button  type="submit" >添加</button>
      					</form>
  				</div>		
			</div>
					<div id="foot">
					<div id="foot1">
				123
			</div>
			<div id="foot2">
				123
			</div>
		</div>
	</div>
</body>
</html>
