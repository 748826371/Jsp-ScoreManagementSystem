<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.edu.ccnu.imd.test.dao.*"%>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>考试管理系统</title>
<link rel="stylesheet" type="text/css" href="./css/mainpage.css">
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<script type="text/javascript" src="./js/jquery-1.8.0.min.js"></script>
<style>
	*{padding:0px;margin:0px;}
	.pop {  display: none;  width: 280px; min-height: 320px;  max-height: 750px;  height:320px;  position: absolute;  top: 0;  left: 0;  bottom: 0;  right: 0;  margin: auto;  padding: 25px;  z-index: 130;  border-radius: 8px;  background-color: #fff;  box-shadow: 0 3px 18px rgba(100, 0, 0, .5);  }
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
<body>
	<!-- zhushi-->
	<%--zhushi2 --%>
	
	<div id="container">
		<div id="top">
			<img id="logo" src="./images/logo.png">
		</div>
		<div id="med">
			<img id="mainpage-pic" src="./images/mainpage.jpg">
			<div id="videoplayer">
			</div>
			<div id="bot">
			</div>
			<div id="left">
			</div>
			<div id="right">	
				<form method="post" action="service.do?service=login">
				<div id="signin">
					<p>  用户名</p><br>
					<div class="inp"><input name="id" type="text" style="height:25px; font-size:22px;"></div><br>
					<p>  密码</p><br>
					
					<div class="inp"><input name="password" type="password" style="height:25px; font-size:22px;"></div><br>
				</div>
				登录角色：<select class="select" name="role">
              <option value="1">学生</option>
              <option value="2">老师</option>
              <option value="3">管理员</option>
          </select><br>
				<input id="butt" type="submit" value="登录" >
				</form>
			<a href="javascript:void(0)" class="click_pop" style="text-decoration:none;"><input id="butt" type="submit" value="注册" ></a>			
				 <%
           String message = (String)request.getAttribute("message");
           if(message!=null){
         %>
          <font color="red">
            错误信息：<br>
            <h2><%=message %><br>
            <%String userName = request.getParameter("id");
      /*      if(userName.equals("2008002"))
            		{out.println("")}*/
            out.println(userName);%><br>
             <%String password = request.getParameter("password");out.println(password);%>
           </font>
          <%} %>			
			</div>
		</div>
		<!--<div id="bottle"></div>-->
	</div>
				<center><br><br><br>
	<!--  点击显示弹出框</a>   -->
</center>

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
        		<% StudentDao studao=new StudentDao();
        			int newsid=studao.searchAvai();
        		%>
          		 学号：<input type="text" name="inputsid"   value="<%=newsid%>"></br>
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
			
			
</body>
</html>