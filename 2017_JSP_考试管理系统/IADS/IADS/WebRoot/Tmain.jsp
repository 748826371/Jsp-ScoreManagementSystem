<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.ccnu.imd.test.entity.*"%>   
<html>
<head>


	<meta charset="UTF-8">
	 <meta http-equiv="Page-Enter" content="revealTrans(Duration=2.0,Transition=12)" /> 
	<title>Document</title>

<link rel="stylesheet" type="text/css" href="./css/page1-top.css">
<link rel="stylesheet" type="text/css" href="./css/page1-med.css">
<link rel="stylesheet" type="text/css" href="./css/Tmain.css">
<link rel="stylesheet" type="text/css" href="./css/page1-foot.css">
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/bottsty.css">
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
<!--			<div id="med-left">
				<img src="./images/userpic1.png" alt="">
				<li><b>学号:<%= teacher.getTid()%></b></li>
				<li><b>姓名:<%=  teacher.getName()%></b></li>
				<li><b>院系:<%=  teacher.getMajor()%></b></li>
			</div> -->
			<div id="med-right">
				<p style="font-size:60px;text-align:center;width:990px;">公告</p>
				<table class="table table-striped" >
      						<thead>
        						<th>标题</th>
        						<th>分类</th>
        						<th>日期</th>
    						</thead>
    						<tbody>
    							 <%int i=0;
									while(i<10){
    						%>
    				<tr>
    						<td	 style="text-align:left;padding-left:30px;"><a  href="#">试验公告</a></td>
    						<td>test</td>
    						<td>2012.2.31</td>
    				</tr>
    						<%i++;}%>
    						</tbody>
				</table>
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
