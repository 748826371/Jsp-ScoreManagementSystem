<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	*{padding:0px;margin:0px;}
	.pop {  display: none;  width:760px; min-height: 320px;  max-height: 750px;  height:320px;  position: absolute;  top: 0;  left: 0;  bottom: 0;  right: 0;  margin: auto;  padding: 25px;  z-index: 130;  border-radius: 8px;  background-color: #fff;  box-shadow: 0 3px 18px rgba(100, 0, 0, .5);  }
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
	<div id=container>
   <%@include file="./top.jsp"%>
		<div id="med">
			<%@include file="./med-left-teacher.jsp"%>	
			<div id="med-right">
				<div class="table-responsive" style="border:1px solid #ccc border-radius: 3%;">
  					<table class="table table-striped">
  						<%
  							int tid = teacher.getTid();
  							KtestDao ktdao = new KtestDao();
  							List ktestList = ktdao.searchKtestByTid(tid);
							Iterator iter = ktestList.iterator();
							Ktest ktest;
								 %>
  						<thead>
  							<th>考试编号</th>
  							<th>课程编号</th>
  							<th>考核方式</th>
  							<th>考核类型</th>
  							<th>考试地点</th>
  							<th>考试/截止时间</th>
  							<th></th>
  						</thead>
						<tbody style="overflow:auto  height: 70px;">
  						<%	
						while(iter.hasNext()){
								int i=0;
								ktest = (Ktest)iter.next();%>
							<tr>
								<td name="<%=i%>"><%=ktest.getKid() %></td>
								<td><%=ktest.getCid()%></td>
								<td><%=ktest.getType() %></td>
								<td><%=ktest.getKtype() %></td>
								<td><%=ktest.getPlaceID() %></td>
								<td>day：<%=ktest.getDay() %> time：<%=ktest.getTime() %></td>
								<td><button id="test123"onclick="location='service.do?service=ChangeTest&kid=<%=ktest.getKid()%>'">编辑</button></td>
							</tr>
							        <%i++; }%>
							      </tbody>
   					</table>
   					<a  href="javascript:void(0);"  onclick="myfun1(this);" class="click_pop" style="text-decoration:none;" ><input id="test123" type="submit" value="编辑信息" style="width:300px;height:60px;margin-left:240px;text-align:center;"></a>
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
				<center><br><br><br>
	<!--  点击显示弹出框</a>   -->
</center>

<!--遮罩层-->
<div class="bgPop"></div>
<!--弹出框-->
<div class="pop">
    <div class="pop-top">
        <h2>考试信息</h2>
        <span class="pop-close">Ｘ</span>
    </div>
    <div class="pop-content">
    <form method="post" action="service.do?service=KtestChange">
        <div class="pop-content-left">
            <img src="" alt="" class="teathumb">
        </div>
        	<div class="pop-content-right">
        	<%/*String sskid=null; 
        			sskid = request.getParameter("testname");
        			        			*/%>
          		考试编号：<input name="Kid" type="text"></br>
           		考核方式：<select class="select" name="inputKtype">
           				   			<option value="open">开卷</option>
             				 		<option value="closed">闭卷</option>
          					</select> </br>
          		考试时间：<input type="text" name="inputTime" > </br>
           		考试地点：<select class="select" name="inputAddress">
           				   			<option value="place1">place1</option>
             				 		<option value="place2">place2</option>
             				 		<option value="place3">place3</option>
             				 		<option value="place4">place4</option>
             				 		<option value="place5">place5</option>
          					</select> </br>
        	<% %>
        	</div>
    	</div>
    	<div class="pop-foot">
        	<input type="button" value="关闭" class="pop-cancel pop-close">
        	<input type="submit" value="提交" class="pop-ok">
    	</div>
    </form>
	</div>
			<script>
			function myfun1(obj){
   			$(document).ready(function () {
					$('.pop-close').click(function () {
            		$('.bgPop,.pop').hide();
        			});
        			$('.click_pop').click(function () {
					//document.getElementById('testin').innerHTML=obj.id
					
            		$('.bgPop,.pop').show();
        			});
    		})
}
			</script>
			
			
</body>
</html>
