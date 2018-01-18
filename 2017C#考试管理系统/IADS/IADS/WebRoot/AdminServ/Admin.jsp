<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.ccnu.imd.test.entity.*"%>   
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
<link rel="stylesheet" type="text/css" href="../css/page1-top.css">
<link rel="stylesheet" type="text/css" href="../css/page1-med.css">
<link rel="stylesheet" type="text/css" href="../css/Tmain.css">
<link rel="stylesheet" type="text/css" href="../css/page1-foot.css">
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/bottsty.css">
	<style></style>
</head>

<body>
	<div id=container>
   <%@include file="./AdminTop.jsp"%>
 		<div id="med">
 	<%--<%@include file="./med-left-teacher.jsp"%> --%>
			 <div id="med-right"  style="margin-left:13% ;">
				<p style="font-size:60px;text-align:center;width:990px;">期末考试公告</p>
				<table class="table table-striped" >
      						<thead>
        						<th>课程名称</th>
        						<th>考核方式</th>
        						<th>考试时间</th>
        						<th>考场安排</th>
    						</thead>
    						<tbody>
    							 <%int i=0;
									while(i<10){
    						%>
    				<tr>
    					<td	 style="text-align:left;padding-left:30px;"><a href="#">优化模型与软件工具</a></td>
    						<td>闭卷考试</td>
    						<td>2018.1.9</td>
    						<td>9403</td>
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
