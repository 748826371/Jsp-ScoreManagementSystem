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
<link rel="stylesheet" type="text/css" href="./css/table2.css">
	<style></style>
</head>
<body>
	<div id=container>
   <%@include file="./Tea_Top.jsp"%>
		<div id="med">
			<div id="med-left">
			    <% Course course = (Course)request.getAttribute("course");%>
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
    						</thead>
    						<tbody style="overflow:auto  height: 70px;">
  							  <%
  							  List scoreList = (List)request.getAttribute("scores");
  							   Iterator iter = scoreList.iterator();
  							  Score score;
		
  							  while(iter.hasNext()){ 
  							  			score = (Score)iter.next();%>
      						<tr>
									<td><%=score.getSid() %></td>
									<td><%=score.getSname() %></td>
									<td><%=score.getScore() %></td>
      						</tr>
      						<%} %>
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
