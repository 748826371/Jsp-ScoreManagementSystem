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
<script type="text/javascript" src="./js/jquery-1.8.0.min.js"></script>
	<style>
			*{padding:0px;margin:0px;}
	.pop {  display: none;  width: 340px; min-height: 320px;  max-height: 750px;  height:400px;  position: absolute;  top: 0;  left: 0;  bottom: 0;  right: 0;  margin: auto;  padding: 25px;  z-index: 130;  border-radius: 8px;  background-color: #fff;  box-shadow: 0 3px 18px rgba(100, 0, 0, .5);  }
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
	
	</style>
</head>
				<%
				//Teacher teacher= (Teacher)session.getAttribute("ter");
				 %>
<body>
	<div id=container>
   <%@include file="./Tea_Top.jsp"%>
		<div id="med">
		 <%@include file="./med-left-teacher.jsp"%>	
		<!--  	
			<div id="med-left">
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
  							<th>考核类型</th>
  							<th>学分</th>
  							<th>功能</th>
  						</thead>
						<tbody style="overflow:auto  height: 70px;">
  					 <%
					while(iter.hasNext()){
								course = (Course)iter.next();
								 %>
							<tr>
								<td  ><%=course.getCid() %></td>
								<!--  <td><a id="<%=course.getCid()%>"  href="javascript:void(0)" class="click_pop" style="text-decoration:none;"><%=course.getName() %></a></td>
								-->
								<td><a href="service.do?service=Coursss&cid=<%=course.getCid()%>"><%=course.getName() %></a></td>
								<td id="<%=course.getMajor() %>"><%=course.getMajor() %></td>
								<td><%=course.getType() %></td>
								<td><%=course.getPointt() %></td>
								<td>
											<button id="test123"onclick="location='service.do?service=inputScore&cid=<%=course.getCid()%>'">录入成绩</button>
											<button id="test123"onclick="location='service.do?service=searchScore&cid=<%=course.getCid()%>'">成绩查询</button>
								</td>
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
		
<!--遮罩层-->
<div class="bgPop"></div>
<!--弹出框-->
<div class="pop">
    <div class="pop-top">
        <h2>注册</h2>
        <span class="pop-close">Ｘ</span>
    </div>
    <div class="pop-content">
    <form method="post" action="service.do?service=signin">
        <div class="pop-content-left">
            <img src="" alt="" class="teathumb">
        </div>
        	<div class="pop-content-right">
          		 <li type="text" name="cid" id="cid"></li></br>
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
            		$("#cid").text("课程号："+this.id);
        			});
    		})

			</script>
		
	</div>
</body>
</html>
