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
      						<thead>
        						<th>教工号</th>
        						<th>姓名</th>
       							<th>年龄</th>
       							<th>性别</th>
       							<th>学院</th>
       							<th>职称</th>	
       							<th>功能</th>	
    						</thead>
    						<tbody>
    							 <%int i=0;
									while(i<10){
    						%>
    				<tr>
    					<td	 style="text-align:left;padding-left:30px;">123</td>
    						<td>123</td>
    						<td>123</td>
    						<td>123</td>
    						<td>123</td>
    						<td>123</td>
    						<td><a href="location='service.do?service=&tid=<%//=student.getTid()%>'">修改</a>|<a href="location='service.do?service=&tid=<%//=student.getTid()%>'">删除</a></td>
    				</tr>
    						<%i++;}%>
    						</tbody>
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
			        <h2>教师信息</h2>
			        <span class="pop-close">Ｘ</span>
			    </div>
			    <div class="pop-content">
			    <form method="post" action="">
			        <div class="pop-content-left">
			            <img src="" alt="" class="teathumb">
			        </div>
			        	<div class="pop-content-right">
			        		教工号:<input type="text" name="inputSid"></br>
        					姓名:<input type="text" name="inputSname"></br>
       						年龄:<input type="text" name="inputAge"></br>>
       						性别:<input type="text" name="inputGender"></br> 	
       						学院:<input type="text" name="inputGender"></br> 	
       						职称:<input type="text" name="inputGender"></br> 	
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
