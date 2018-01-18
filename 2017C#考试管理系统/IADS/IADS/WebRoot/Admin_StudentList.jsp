<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.ccnu.imd.test.entity.*"%>   
<%@ page import="cn.edu.ccnu.imd.test.dao.*"%>   
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
<link rel="stylesheet" type="text/css" href="./css/page1-top.css">
<link rel="stylesheet" type="text/css" href="./css/page1-med.css">
<link rel="stylesheet" type="text/css" href="./css/Tmain.css">
<link rel="stylesheet" type="text/css" href="./css/page1-foot.css">
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/bottsty.css">
<link rel="stylesheet" type="text/css" href="./css/addpost.css">
<script type="text/javascript" src="./js/jquery-1.8.0.min.js"></script>

<style>
*{padding:0px;margin:0px;}
	.pop {  display: none;  width: 280px; min-height: 320px;  max-height: 750px;  height:360px;  position: absolute;  top: 0;  left: 0;  bottom: 0;  right: 0;  margin: auto;  padding: 25px;  z-index: 130;  border-radius: 8px;  background-color: #fff;  box-shadow: 0 3px 18px rgba(100, 0, 0, .5);  }
	.pop-top{  height:40px;  width:100%;  border-bottom: 1px #E5E5E5 solid;  }
	.pop-top h2{  float: left;  display:black}
	.pop-top span{  float: right;  cursor: pointer;  font-weight: bold; display:black}
	.pop-foot{  height:50px;  line-height:50px;  width:100%;  border-top: 1px #E5E5E5 solid;  text-align: right;  }
	.pop-cancel, .pop-ok {  padding:8px 15px;  margin:15px 5px;  border: none;  border-radius: 5px;  background-color: #337AB7;  color: #fff;  cursor:pointer;  }
	.pop-cancel {  background-color: #FFF;  border:1px #CECECE solid;  color: #000;  }
	.pop-content{  height: 230px;  }
	.pop-content-left{  float: left;  }
	.pop-content-right{  width:310px;  float: left;  padding-top:20px;  padding-left:20px;  font-size: 16px;  line-height:35px;  }
	.bgPop{  display: none;  position: absolute;  z-index: 129;  left: 0;  top: 0;  width: 100%;  height: 99.5%;  background: rgba(0,0,0,.3);  }
	.butt{ display: block; float:left; width: 120px; height:38px; margin-top: 25px; margin-left: 11px; margin-right: auto; }
</style>
</head>

<body>
	<div id=container>
   <%@include file="./AdminTop.jsp"%>
 		<div id="med">
 	<%@include file="./med-left-admin.jsp"%> 	
			 <div id="med-right">
				<table class="table table-striped" >
				<%
  							List studentList = (List)session.getAttribute("StudentList");
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
								<td><a href="location='service.do?service=&sid=<%=student.getSid()%>'">修改</a>|<a href="service.do?service=DelStuFromSys&sid=<%=student.getSid()%>">删除</a></td>
							</tr>
							      <%}%>
				</table>
				<a href="javascript:void(0)" class="click_pop" style="text-decoration:none;"><input id="test123" type="button" value="添加" class="butt"></a>
			</div>
				
				
		<center><br><br><br>
	<!--  点击显示弹出框</a>   -->
</center>

<!--遮罩层-->
<div class="bgPop"></div>
<!--弹出框-->
<div class="pop">
    <div class="pop-top">
        <h2>添加学生</h2>
        <span class="pop-close">Ｘ</span>
    </div>
    <form method="post" action="service.do?service=signinbyAdmin">
    <div class="pop-content">
    	
        			<div class="pop-content-left">
          						  <img src="" alt="" class="teathumb">
        			</div>
        			<div class="pop-content-right">
        				<% StudentDao studao=new StudentDao();
        						int newsid=studao.searchAvai();
        				%>
          				学号：<input type="text" name="inputsid" ></br>
          					推荐可用学号：<%=newsid%></br>
          				姓名：<input type="text" name="inputname"></br>
           				性别：<select class="select" name="gender">
           				   				<option value="male">male</option>
             				 			<option value="female">female</option>
          							</select> </br>
           				专业：<input type="text" name="inputmajor" ></br>
	           		 	年级：<input type="text" name="inputgrade"></br>
	     		       	密码：<input type="text" name="inputpassword">
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
