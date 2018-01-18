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
  							List TeacherList = (List)session.getAttribute("TeacherList");
  							if(TeacherList==null){
  										System.out.println("缺数据");
  							}
							Iterator iter = TeacherList.iterator();
							Teacher teacher; %>
				
				
      						<thead>
        						<th>教工号</th>
        						<th>姓名</th>
       							<th>性别</th>
       							<th>学院</th>
       							<th>职称</th>	
       							<th>功能</th>	
    						</thead>
    						<tbody>
  					 <%
					while(iter.hasNext()){
								teacher = (Teacher)iter.next();
								 %>
    				<tr>
    						<td><%=teacher.getTid() %></td>
    						<td><%=teacher.getName() %></td>
    						<td><%=teacher.getGender() %></td>
    						<td><%=teacher.getMajor() %></td>
    						<td><%=teacher.getTitle() %></td>
    						<td><a href="location='service.do?service=&tid=<%//=student.getTid()%>'">修改</a>|<a href="service.do?service=DelTeacher&tid=<%=teacher.getTid()%>">删除</a></td>
    				</tr>
    						<%}%>
    						</tbody>
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
			<form method="post" action="service.do?service=AddTeacher">
			    <div class="pop-top">
			        <h2>教师信息</h2>
			        <span class="pop-close">Ｘ</span>
			    </div>
			    <div class="pop-content">
			    
			        <div class="pop-content-left">
			            <img src="" alt="" class="teathumb">
			        </div>
			        	<div class="pop-content-right">
			        		<%TeacherDao teadao= new TeacherDao();
			        		int newtid= teadao.searchAvai();%>
			        		教工号:<input type="text" name="inputTid"></br>
			        				推荐可用教工号<%= newtid %></br>
        					姓名:<input type="text" name="inputTname"></br>
       						年龄:<input type="text" name="inputAge"></br>
       						性别:<input type="text" name="inputGender"></br> 	
       						学院:<input type="text" name="inputMajor"></br> 	
       						职称:<input type="text" name="inputTitle"></br> 	
       						密码:<input type="text" name="inputPassword"></br>
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
