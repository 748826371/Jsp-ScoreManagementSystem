<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.ccnu.imd.test.entity.*"%>   
<%@ page import="cn.edu.ccnu.imd.test.dao.*"%>   
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width; initial-scale=1.0">
	<title>Document</title>
<link rel="stylesheet" type="text/css" href="./css/page1-top.css">
<link rel="stylesheet" type="text/css" href="./css/page1-med.css">
<link rel="stylesheet" type="text/css" href="./css/page1-foot.css">
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/bottsty.css">
<link rel="stylesheet" type="text/css" href="./css/table4.css">
<link rel="stylesheet" type="text/css" href="./css/SelectPlace.css">
<script type="text/javascript" src="./js/jquery-1.8.0.min.js"></script>
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
							Ktest ktest=(Ktest)session.getAttribute("Ktest");
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
							<tr>
								<td><%=ktest.getKid() %></td>
								<td><%=ktest.getCid()%></td>
								<td><input name="ktestType" type="text"  value="<%=ktest.getType() %>" style="width:135px;"></td>
								<td><%=ktest.getKtype() %></td>
								<td><%=ktest.getPlaceID() %></td>
								<td>day：<%=ktest.getDay() %> time：<%=ktest.getTime() %></td>
								<!--  <td><button id="test123"onclick="location='service.do?service=ChangeTest&kid=<%=ktest.getKid()%>'">提交</button></td>-->
							</tr>
							      </tbody>
   					</table>
				</div>
				
<div class="demo">
		<form method="post" action="service.do?service=SaveTest&kid=<%=ktest.getKid()%>">
   		<div id="seat-map">
			<div class="front">第一周&emsp;   &emsp;   &emsp;   &emsp;   &emsp;   &emsp;   第二周</div>					
		</div>
		<div class="booking-details">
			<p>课程名：<span>预设1</span></p>
			<p>地点：</p><div><select class="select" name="role">
              <option value="1">place1</option>
              <option value="2">place2</option>
               <option value="3">place3</option>
          		</select>
        		</div>
			<p>监考老师：<span>未实现</span></p>
			<p>时间：</p>
			<ul id="selected-seats">
				第<input id="zhou" name="zhou" type="text" value=""/>周
				周<input id="day" name="day" type="text" value=""/>
				第<input id="time" name="time" type="text" value=""/>时间段
			</ul>
			<li><%=session.getAttribute("message") %></li>
		<button class="checkout-button" type="submit">提交申请</button>
		<div style="clear:both"></div>
		   </div>
			
  		<br/>
  
</form>

  <script type="text/javascript" src="./js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="jquery.seat-charts.min.js"></script>
<script type="text/javascript">
var price = 80; //票价
$(document).ready(function() {
	var $cart = $('#selected-seats'), //座位区
	$counter = $('#counter'), //票数
	$total = $('#total'); //总计金额
	
	var sc = $('#seat-map').seatCharts({
		map: [  //座位图
			'aaaaa_aaaaa',
            'aaaaa_aaaaa',
            'aaaaa_aaaaa',
            'aaaaa_aaaaa',
			'aaaaa_aaaaa',
			'aaaaa_aaaaa',
			'aaaaa_aaaaa',
            'aaaaa_aaaaa'
		],
		naming : {
			top : false,
			getLabel : function (character, row, column) {
				return column;
			}
		},
		legend : { //定义图例
			node : $('#legend'),
			items : [
				[ 'a', 'available',   '可选座' ],
				[ 'a', 'unavailable', '已售出']
			]					
		},
		click: function () { //点击事件
			if (this.status() == 'available') { //可选座
				if (sc.find('selected').length) {
					alert("only one");
					sc.find('selected').remove();
				}
				if (this.settings.label>6) {
					$('<li>第2周 周'+(this.settings.label-6)+' 第'+(this.settings.row+1)+'时间段</li>')
						.attr('id', 'cart-item-'+this.settings.id)
						.data('seatId', this.settings.id)
						.appendTo($cart);
					$("#zhou").attr("value","2");
					$("#day").attr("value",(this.settings.label-6));
					$("#time").attr("value",(this.settings.row+1));
				}
				else{
					$('<li>第1周 周'+(this.settings.label)+' 第'+(this.settings.row+1)+'时间段</li>')
						.attr('id', 'cart-item-'+this.settings.id)
						.data('seatId', this.settings.id)
						.appendTo($cart);
					$("#zhou").attr("value","1");
					$("#day").attr("value",(this.settings.label));
					$("#time").attr("value",(this.settings.row+1));
						}
				
				$counter.text(sc.find('selected').length+1);
				$total.text(recalculateTotal(sc)+price);
							
				return 'selected';
			} else if (this.status() == 'selected') { //已选中
					//更新数量
					$counter.text(sc.find('selected').length-1);
					//更新总计
					$total.text(recalculateTotal(sc)-price);
						
					//删除已预订座位
					$('#cart-item-'+this.settings.id).remove();
					//可选座
					return 'available';
			} else if (this.status() == 'unavailable') { //已售出
				return 'unavailable';
			} else {
				return this.style();
			}
		}
	});
	//已售出的座位
	sc.get(['1_2', '4_4','4_5','6_6','6_7','8_5','8_6','8_7','8_8', '10_1', '10_2']).status('unavailable');
		
});
//计算总金额
function recalculateTotal(sc) {
	var total = 0;
	sc.find('selected').each(function () {
		total += price;
	});
			
	return total;
}
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
