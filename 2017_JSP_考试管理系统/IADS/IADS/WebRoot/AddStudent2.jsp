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
				 Course course = (Course)request.getAttribute("course");
				 %>
<body>
	<div id=container>
		<div id="top">
			<div id="top1">
				<img src="./images/logo2.png" alt="">

			</div>
			<div id="top2">
				<p>考试管理系统</p>
				<button  onclick="location='Tmain.jsp'">主页</button>
				<button  onclick="location='InputScore1.jsp'">录入成绩</button>
				<button	 onclick="location='searchScorePage.jsp'">成绩查询</button>
				<button>功能4</button>
				<button onclick="location='localhost:8080/IADS/test2.page'">测试按钮</button>
			</div>
		</div>
		<div id="med">
			<div id="med-left">
				<img src="./images/userpic1.png" alt="">
				<li><b>学号:<%= teacher.getTid()%></b></li>
				<li><b>姓名:<%=  teacher.getName()%></b></li>
				<li><b>院系:<%=  teacher.getMajor()%></b></li>
			</div>
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
								<td><button id="test123"onclick="location='service.do?service=inputScore&cid=<%=course.getCid()%>'">录入成绩</button></td>
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
