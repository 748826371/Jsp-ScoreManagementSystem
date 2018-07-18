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
<link rel="stylesheet" type="text/css" href="./css/table.css">
	<style></style>
</head>
				<%
				//Teacher teacher= (Teacher)session.getAttribute("ter");
				 %>
<body>
	<div id=container>
    <%@include file="./top.jsp"%>
		<div id="med">
		 	 <%@include file="./med-left-teacher.jsp"%>	
		<!--  	<div id="med-left">
				<img src="./images/userpic1.png" alt="">
				<li><b>学号:<%= teacher.getTid()%></b></li>
				<li><b>姓名:<%=  teacher.getName()%></b></li>
				<li><b>院系:<%=  teacher.getMajor()%></b></li>
			</div>-->
			<div id="med-right">
				<div class="table-responsive" style="border:1px solid #ccc border-radius: 3%;">
  					<table class="table table-striped">
  						<%
  							List courseList = (List)session.getAttribute("courses");
  							if(courseList==null){
  										System.out.println("缺数据");
  							}
							Iterator iter = courseList.iterator();
							Course course; %>
  						<thead>
  							<th>课程编号</th>
  							<th>课程名称</th>
  							<th>课程学科</th>
  							<th>课程类型</th>
  							<th>??</th>
  						</thead>
						<tbody style="overflow:auto  height: 70px;">
  					 <%
					while(iter.hasNext()){
								course = (Course)iter.next();
								 %>
							<tr>
								<td><%=course.getCid() %></td>
								<td><%=course.getName() %></td>
								<td><%=course.getMajor() %></td>
								<td><%=course.getType() %></td>
								<td><button id="test123"onclick="location='service.do?service=ChangeStudent&cid=<%=course.getCid()%>'">添加/删除学生</button></td>
							</tr>
							      <%}%>
							      </tbody>
   					</table>
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
