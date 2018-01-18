<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.ccnu.imd.test.entity.*"%>
<%@ page import="cn.edu.ccnu.imd.test.dao.StudentDao"%>  
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
 	<%@include file="../med-left-teacher.jsp"%>
			 <div id="med-right">
				<p style="font-size:60px;text-align:center;width:990px;">学生信息管理</p>
				<table class="table table-striped" >
				<%
  							List studentList = (List)session.getAttribute("students");
  							if(studentList==null){
  										System.out.println("缺数据");
  							}
							Iterator iter = studentList.iterator();
							Student student; %>
      						<thead>
        						<th>学号</th>
        						<th>姓名</th>
       							<th>年龄</th>
       							<th>专业</th>
       							<th>年级</th>
       							<th>性别</th>
       							<th>功能</th>
    						</thead>
    						<tbody style="overflow:auto  height: 70px;">
  					 <%
					while(iter.hasNext()){
								student = (Student)iter.next();
								 %>
							<tr>
								<td><%=student.getSid() %></td>
								<td><%=student.getName() %></td>
								<td><%=student.getAge() %></td>
								<td><%=student.getMajor() %></td>
								<td><%=student.getGrade() %></td>
								<td><%=student.getGender() %></td>
								<td><a href="location='service.do?service=&sid=<%=student.getSid()%>'">修改</a>|<a href="location='service.do?service=&sid=<%=student.getSid()%>'">删除</a></td>
							</tr>
							      <%}%>
				</table>
				<form id="addpost" method="post" action="">
				<a href="javascript:void(0)" class="click_pop" style="text-decoration:none;"><input type="button" value="添加" class="butt"></a>
				</form>
			</div>
			
			<center><br><br><br>
				<!--  点击显示弹出框</a>   -->
			</center>
			
			<!--遮罩层-->
			<div class="bgPop"></div>
			<!--弹出框-->
			<div class="pop">
			    <div class="pop-top">
			        <h2>学生信息</h2>
			        <span class="pop-close">Ｘ</span>
			    </div>
			    <div class="pop-content">
			    <form method="post" action="">
			        <div class="pop-content-left">
			            <img src="" alt="" class="teathumb">
			        </div>
			        	<div class="pop-content-right">
			        	           学号:<input type="text" name="inputSid"></br>
        				           姓名:<input type="text" name="inputSname"></br>
       						年龄:<input type="text" name="inputAge"></br>
       						性别:<input type="text" name="inputGender"></br> 	
       						专业:<input type="text" name="inputMajor"></br>
       						年级:<input type="text" name="inputGrade"></br>				
			        	</div>
			    	</div>
				     <div class="pop-foot">
			        	<input type="button" value="关闭" class="pop-cancel pop-close">
			        	<input type="submit" value="注册" class="pop-ok">
			    	</div>
			    </form>
				</div>
						<script>
			   			$(document).ready(function () {
								$('.pop-close').click(function () {
			            		$('.bgPop,.pop').hide();
			        			});
			        			$('.click_pop').click(function () {
			            		$('.bgPop,.pop').show();
			        			});
			    		})
			
						</script>
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
