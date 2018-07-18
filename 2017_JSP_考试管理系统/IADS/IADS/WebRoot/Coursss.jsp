<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<%@ page import="cn.edu.ccnu.imd.test.entity.*"%>   
<%@ page import="cn.edu.ccnu.imd.test.dao.*"%>   
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
<link rel="stylesheet" type="text/css" href="./css/page1-top.css">
<link rel="stylesheet" type="text/css" href="./css/page1-med.css">
<link rel="stylesheet" type="text/css" href="./css/page1-foot.css">
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/bottsty.css">
<link rel="stylesheet" type="text/css" href="./css/table3.css">
<script type="text/javascript" src="./js/jquery-1.8.0.min.js"></script>
<style>
		#med-right
		#course-pic{float:right;margin-top:20px;margin-right:40px;width:200px;;height:240px;background-color:rgb(150,150,150);}
		#course-id{margin-top:40px;margin-left:40px;}
		#course-id li{margin-bottom:20px;}
		#course-content{margin-top:100px;margin-left:40px;padding:20px;background-color:rgb(230,2300,230);height:300px;width:80%;border:2px solid;border-radius:25px;}
</style>
</head>
<body>
	<div id=container>
	<%String role = (String)session.getAttribute("role");
	if(role.equals("teacher")){%>
				   <%@include file="./Tea_Top.jsp"%>
	<%}else if(role.equals("student")){%>
						<div id="top">
			<div id="top1">
				<img src="./images/logo2.png" alt="">
			</div>
			<div id="top2">
				<p style="margin-right:570px;">考试管理系统</p>
				<button  onclick="location='Stu_course.jsp'">课程表</button>
				<button  onclick="location='Stu_test.jsp'">考试表</button>
			</div>
			</div>	
		
	
			<%}else{%>
			<%@include file="./AdminTop.jsp"%>
			<%} %>
		<div id="med">
				<%
				if(role.equals("teacher")){%>
				<%@include file="./med-left-teacher.jsp"%>	
				<%}else if(role.equals("student")){ %>
				<%@include file="./med-left-student.jsp"%>	
				<%}else{ %>
				<%@include file="./med-left-admin.jsp"%>	
				<%} %>
				<div id="med-right">
				<%Course course = (Course)session.getAttribute("course");
					CourseDao coudao=new CourseDao();
					int cid=course.getCid();
   					String ktype = coudao.GetKtypebyCid(cid); %>
				<form method="post" action="service.do?service=SaveCourseChange&cid=<%=cid%>">
   						<div id="course-pic"></div>
   						<div id="course-id">
   								<% if(role.equals("manager")){%>
   								<li  style="font-size:30px;">课程名称:<input  name="Cname"  value="<%=course.getName() %>"></li>
   								<li>课程编号: <input  name="cid"  value="<%=course.getCid() %>" disabled="true"></li>
   								<li>课程专业:<input  name="major"  value="<%=course.getMajor() %>"></li>
   								<li>授课老师:编号<input  name="tid"  value="<%= course.getTid()%>">姓名<%= course.getTname()%></li>
   								<li>课程学分:<input  name="inputPointt"  value="<%= course.getPointt()%>"></li>
   							<% }else{%>
   								<li  style="font-size:30px;">课程名称:<%=course.getName() %></li>
   								<li>课程编号: <%=course.getCid() %></li>
   								<li>课程专业:<%=course.getMajor() %></li>
   								<li>授课老师:编号<%= course.getTid()%>姓名<%= course.getTname()%></li>
   								<li>课程学分:<%= course.getPointt()%></li>
   										<input  name="Cname"  value="<%=course.getName() %>" type="hidden">
   										<input  name="cid"  value="<%=course.getCid() %>" type="hidden">
   										<input  name="inputPointt"  value="<%= course.getPointt()%>" type="hidden">
   										<input  name="major"  value="<%=course.getMajor() %>" type="hidden">
   										<input  name="tid"  value="<%= course.getTid()%>" type="hidden">
   							<%} %>
   								<%if(role.equals("teacher")||role.equals("manager")){%>
   								考核方式：<select class="select" name="type">
           				   								<option value="1">考试(闭卷)</option>
             				 							<option value="2">考试(开卷)</option>
             				 							<option value="3">课题论文</option>
             				 							<option value="4">大作业</option>
          											</select> </br>
          						<%}else{%>
          						考核方式：<%=ktype%></br>
          						<%} %>
   						</div>
   						<div id="course-content">
   								<p>课程简介：
   								<div id="course-index"><span id="it5">内容</span> <a href="javascript:;" id="a5"  onclick="cg(this)">修改</a></div>
   						</div>
   						<button id="test123" type="submit" value="保存" style="width:80px;">保存</button>
   						
				</form></div>
				
		</div>
		</div>
	</div>
    <script>
			cg=function(obj){
			var o=document.getElementById("it"+obj.id.toString().substr(1));
			if(o.childNodes[0].value) {
			o.innerHTML =  o.childNodes[0].value;
			}else{
			o.innerHTML="<input type='text' value='"+document.getElementById("it"+obj.id.toString().substr(1)).innerHTML+"' />";
						}
			}
</script>

</body>
</html>
