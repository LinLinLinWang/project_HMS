<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/jquery.js"></script>
<title>Insert title here</title>

<script type="text/javascript" src="js/public.js"></script>
<script src="js/jquery.js"></script>
    <script>
  
    var time;
        window.onload = function() {
            var i = 10;
            var j = 0;
            var e = target;
            var win = document.documentElement || document.body;
          
         function intern() {
            	
                var width = e.clientWidth;
                var height = e.clientHeight;
                var left = parseFloat(e.style.left);
                var top = parseFloat(e.style.top);
                var windowWidth = win.clientWidth;
                var windowHeight = win.clientHeight;
                if (windowWidth - width < (left + i)) {
                    i = -i;
                } else if ((left + i) < 0) {
                    i = -i;
                }
                if (windowHeight - height < (top + j)) {
                    j = -j;
                } else if ((top + j) < 0) {
                    j = -j;
                }
                e.style.left = left + i + "px";
                e.style.top = top + j + "px";
            }
         time= setInterval(intern, 100);
         $("#target").on("click",function(){
            
             
             clearInterval(time);
             document.getElementById("target").style.display='none';
         });
        };
      
    </script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

#footer {
	height: 50px;
	line-height: 50px;
	background: #5e5e5e;
	width: 100%;
	position: absolute;
	z-index: 0;
	margin-top: 2900px;
	text-align: center;
}

#footer p {
	text-align: center;
	line-height: 50px;
	color: #fbfbfb;
}

.bn-alp {
	width: 100%;
	height: 50%;
	position: relative;
}

.bn-alp ul, .bn-alp li {
	margin: 0;
	padding: 0;
	list-style: none;
}

.bn-alp .box {
	height: 100%;
	position: relative;
}

.bn-alp .box li {
	width: 100%;
	height: 600px;
	background-position: 50% 50%;
	background-size: cover;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 10;
}

.bn-alp .box li.on {
	z-index: 99;
}

.bn-alp .box li img.bg {
	display: none;
}

.bn-alp .i {
	top: 560px;
	bottom: 5px;
	left: 50%;
	margin-left: -50px;
	text-align: center;
	position: absolute;
	z-index: 100;
}

.bn-alp .i i {
	display: inline-block;
	margin-right: 10px;
	width: 16px;
	height: 16px;
	background: #000;
	cursor: pointer;
}

.bn-alp .i i.on {
	background: red;
}

.doctor {
	margin: 0 auto;
	align-items: center;
	width: 100%;
	position: absolute;
	margin-top: 580px;
	position: absolute;
}

.doctor .doctorul {
	background-color: rgba(0, 0, 0, 0.6);
	margin: 0 auto;
	width: 100%;
	height: 330px;
	text-align: center;
	align-items: center;
}

.doctor .doctorul li {
	width: 20%;
	align-items: center;
	list-style: none; /* 将默认的列表符号去掉 */
	padding: 0; /* 将默认的内边距去掉 */
	margin-left: 3%;
	float: left
}

.doctor .doctorul li eachdoctor {
	align-items: center;
}

.bordered {
	margin-top: 1200px;
	position: absolute;
	*border-collapse: collapse; /* IE7 and lower */
	border-spacing: 0;
	width: 100%;
	height: 500px;
}

.bordered {
	border: solid #ccc 1px;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: 0 1px 1px #ccc;
	-moz-box-shadow: 0 1px 1px #ccc;
	box-shadow: 0 1px 1px #ccc;
}

.bordered tr:hover {
	background: #fbf8e9;
	-o-transition: all 0.1s ease-in-out;
	-webkit-transition: all 0.1s ease-in-out;
	-moz-transition: all 0.1s ease-in-out;
	-ms-transition: all 0.1s ease-in-out;
	transition: all 0.1s ease-in-out;
}

.bordered td, .bordered th {
	border-left: 1px solid #ccc;
	border-top: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

.bordered th {
	background-color: #dce9f9;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc),
		to(#dce9f9));
	background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -moz-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -ms-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -o-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: linear-gradient(top, #ebf3fc, #dce9f9);
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	border-top: none;
	text-shadow: 0 1px 0 rgba(255, 255, 255, .5);
}

.bordered td:first-child, .bordered th:first-child {
	border-left: none;
}

.bordered th:first-child {
	-moz-border-radius: 6px 0 0 0;
	-webkit-border-radius: 6px 0 0 0;
	border-radius: 6px 0 0 0;
}

.bordered th:last-child {
	-moz-border-radius: 0 6px 0 0;
	-webkit-border-radius: 0 6px 0 0;
	border-radius: 0 6px 0 0;
}

.bordered th:only-child {
	-moz-border-radius: 6px 6px 0 0;
	-webkit-border-radius: 6px 6px 0 0;
	border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
	-moz-border-radius: 0 0 0 6px;
	-webkit-border-radius: 0 0 0 6px;
	border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
	-moz-border-radius: 0 0 6px 0;
	-webkit-border-radius: 0 0 6px 0;
	border-radius: 0 0 6px 0;
}

/*----------------------*/
.zebra {
	margin-top: 1840px;
	position: absolute;
	*border-collapse: collapse; /* IE7 and lower */
	border-spacing: 0;
	width: 100%;
	height: 500px;
}

.zebra td, .zebra th {
	padding: 10px;
	border-bottom: 1px solid #f2f2f2;
}

.zebra tbody tr:nth-child(even) {
	background: #f5f5f5;
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
}

.zebra th {
	text-align: left;
	text-shadow: 0 1px 0 rgba(255, 255, 255, .5);
	border-bottom: 1px solid #ccc;
	background-color: #eee;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5),
		to(#eee));
	background-image: -webkit-linear-gradient(top, #f5f5f5, #eee);
	background-image: -moz-linear-gradient(top, #f5f5f5, #eee);
	background-image: -ms-linear-gradient(top, #f5f5f5, #eee);
	background-image: -o-linear-gradient(top, #f5f5f5, #eee);
	background-image: linear-gradient(top, #f5f5f5, #eee);
}

.zebra th:first-child {
	-moz-border-radius: 6px 0 0 0;
	-webkit-border-radius: 6px 0 0 0;
	border-radius: 6px 0 0 0;
}

.zebra th:last-child {
	-moz-border-radius: 0 6px 0 0;
	-webkit-border-radius: 0 6px 0 0;
	border-radius: 0 6px 0 0;
}

.zebra th:only-child {
	-moz-border-radius: 6px 6px 0 0;
	-webkit-border-radius: 6px 6px 0 0;
	border-radius: 6px 6px 0 0;
}

.zebra tfoot td {
	border-bottom: 0;
	border-top: 1px solid #fff;
	background-color: #f1f1f1;
}

.zebra tfoot td:first-child {
	-moz-border-radius: 0 0 0 6px;
	-webkit-border-radius: 0 0 0 6px;
	border-radius: 0 0 0 6px;
}

.zebra tfoot td:last-child {
	-moz-border-radius: 0 0 6px 0;
	-webkit-border-radius: 0 0 6px 0;
	border-radius: 0 0 6px 0;
}

.zebra tfoot td:only-child {
	-moz-border-radius: 0 0 6px 6px;
	-webkit-border-radius: 0 0 6px 6px border-radius: 0 0 6px 6px
}

#tab {
	margin: 20px;
	position: absolute;
	margin-top: 2400px;
	width: 100%;
	height: 500px
}

#tab ul {
	list-style: none;
	width: 100%;
	height: 400px
}

#tab ul li {
	float: left;
}

#tab ul li a {
	background: #f90;
	color: #fff;
	font-weight: 500;
	height: 30px;
	line-height: 30px;
	border-bottom: 0px;
	display: block;
	text-decoration: none;
	padding: 0px 10px;
	margin-right: 1px;
}

#tab ul li a:hover {
	background: blue;
}

#tab ul {
	text-align: center;
}

#tab ul li {
	margin: 0 auto;
	width: 100px;
	height: 60px;
	margin-left: 10%
}

#p1 {
	clear: left;
}

#tab>p {
	border: 1px solid blue;
	width: 100%;
	height: 100px;
	text-indent: 2em;
	padding: 5px 5px;
	position: absolute;
	top: 31px;
	background: #fff;
}

#p1:target, #p2:target, #p3:target {
	z-index: 2;
}

#checkimg {
	
}
</style>
<link rel="stylesheet" type="text/css" href="css/index.css" />

<script type="text/javascript">
	$(function() {
		var bn_alp;// 定义动画变量  
		var Time = 2000;// 自动播放间隔时间 毫秒  
		var num = 1000;// 切换图片间隔的时间 毫秒  
		var page = 0;// 定义变量  
		var len = $(".bn-alp .box li").length;// 获取图片的数量  
		$(".bn-alp .box li").each(
				function() {
					$(this).css("opacity", 0);
					$(this).css("background-image",
							"url(" + $(this).find('img.bg').attr('src') + ")");
					$(".bn-alp .i").append('<i></i>');
				}); // 设置全部的图片透明度为0  
		$(".bn-alp .box li:first").css("opacity", 1); // 设置默认第一张图片的透明度为1  
		$(".bn-alp .i i").eq(0).addClass("on");
		function fun()// 封装  
		{
			$(".bn-alp .i i").eq(page).addClass("on").siblings('i')
					.removeClass("on"); // 切换小点  
			$(".bn-alp .box li").eq(page).addClass("on").animate({
				"opacity" : 1
			}, num).siblings('li').removeClass("on").animate({
				"opacity" : 0
			}, num);// 切换图片  
		}
		function run()// 封装  
		{
			if (!$(".bn-alp .box li").is(":animated"))// 判断li是否在动画  
			{
				if (page == len - 1)// 当图片切换到了最后一张的时候  
				{
					page = 0; // 把page设置成0 又重新开始播放动画  
					fun();
				} else {// 继续执行下一张  
					page++;
					fun();
				}
			}
		}
		$(".bn-alp .i i").click(function()// 点击小点  
		{
			clearInterval(bn_alp);//鼠标点击下面的点就清除动画开始新的动画。  
			//if( !$( ".bn-alp .box li" ).is( ":animated" ) )// 判断li是否在动画  
			//{  
			var index = $(".bn-alp .i i").index(this);// 获取点击小点的位置  
			page = index;// 同步于page  
			fun();
			//}  
		});
		$(".bn-alp").hover(function()// 鼠标放上去图片的时候清除动画  
		{
			clearInterval(bn_alp);
		}, function()// 鼠标移开图片的时候又开始执行动画  
		{
			bn_alp = setInterval(run, Time);
		}).trigger("mouseleave");
	});
</script>
</head>
<body>
	<!-- 导航菜单 -->
	<!--头部-->
	<div class="top_bg" id="top_bg">
		<div class="top_line">
			<p></p>
		</div>
		<div class="top_main">
			<div class="top_logo">
				<a href='./'><img src="images/logo.png"></a>
			</div>
			<!-- 导航 -->
			<div class="dh_bg">
				<ul>
					<li><a href="index.mvc"> <i class="img dh_01HOME"></i> <span>网站首页</span>
					</a></li>
					
						<c:if test="${empty sessionScope.current_login_user}">
							
							<li class="cur"><a href="tencent://message/?uin=1339567630&Site=http://vps.shuidazhe.com&Menu=yes"> <i class="img dh_02COMPASS"></i>
							<span>在线留言</span>
					</a></li>
						
						</c:if>
					<c:if test="${!empty sessionScope.current_login_user}">
					
					<li class="cur"><a href="#"> <i class="img dh_02COMPASS"></i>
							<span>HMS概况</span>
					</a></li>
					
					</c:if>
					<li><a href="#"> <i class="img dh_03TARGET"></i> <span>医疗器械</span>
					</a></li>



					<c:if test="${empty sessionScope.current_login_user}">

						<li><a href="#"> <i class="img dh_04GRID"></i> <span>案例展示</span>
						</a></li>
					</c:if>
					<c:if test="${! empty sessionScope.current_login_user}">
						<c:if test="${sessionScope.current_login_user.utype==0}">
							<li><a href="patient_face.jsp"> <i class="img dh_04GRID"></i>
									<span>个人中心</span>
							</a></li>
						</c:if>
						<c:if test="${sessionScope.current_login_user.utype!=0}">
							
								<li><a href="doctor_face.jsp"> <i class="img dh_04GRID"></i>
										<span>个人中心</span>
								</a></li>
							
						</c:if>
					</c:if>










						<li><a href="#"> <i class="img dh_05NOTEPAD"></i> <span>热点信息</span>
						</a></li>
						<c:if test="${!empty sessionScope.current_login_user}">
							<li><a
								href="tencent://message/?uin=1339567630&Site=http://vps.shuidazhe.com&Menu=yes">
									<i class="img dh_06PEN"></i> <span>在线留言</span>
							</a></li>
						</c:if>
						<c:if test="${ empty sessionScope.current_login_user}">
							<li><a href="registe.html"> <i class="img dh_06PEN"></i>
									<span>注册</span>
							</a></li>
						</c:if>
						<c:if test="${!empty sessionScope.current_login_user}">
							<li><a href="sessioninvalidate.mvc"> <i
									class="img dh_07USER"></i> <span>退出</span>


							</a></li>

						</c:if>
						<c:if test="${ empty sessionScope.current_login_user}">
							<li><a href="login.jsp"> <i class="img dh_07USER"></i> <span>登陆</span>


							</a></li>

						</c:if>
				</ul>
				<!-- 背景块 -->
				<div class="dh_bg_cur">
					<img src="images/nav_cur.png">
				</div>

				<!-- 二级菜单 -->
				<div class="two_nav_box">
					<div class="two_nav">
						<span></span>
						<div style="color: blue">由青大JDK小组开发，服务于医疗行业</div>
					</div>
					<div class="two_nav">
						<span></span>
						<div>
							<dl>
								<i></i>
								<dt>
									<a href="#">微型医疗器械</a>
								</dt>
								<dd>
									<a href="#">空心纤维透析器</a>
								</dd>
								<dd>
									<a href="#">脉搏波血压计</a>
								</dd>
								<dd>
									<a href="#">三高测量仪</a>
								</dd>
							</dl>
							<dl>
								<i></i>
								<dt>
									<a href="#">家用医疗器械</a>
								</dt>
								<dd>
									<a href="#">家用制氧机</a>
								</dd>
								<dd>
									<a href="#">脉搏波血压计</a>
								</dd>
							</dl>
							<dl>
								<i></i>
								<dt>
									<a href="#">大型医疗器械</a>
								</dt>
								<dd>
									<a href="#">磁共振成像</a>
								</dd>
								<dd>
									<a href="#">高频电刀</a>
								</dd>
								<dd>
									<a href="#">脉搏波血压计</a>
								</dd>
								<dd>
									<a href="#">X射线机</a>
								</dd>
							</dl>
							<dl>
								<i></i>
								<dt>
									<a href="#">新型医疗器械</a>
								</dt>
								<dd>
									<a href="#">大脑探测仪</a>
								</dd>
								<dd>
									<a href="#">AI治疗仪</a>
								</dd>
							</dl>
						</div>
					</div>
					<div class="two_nav">
						<span></span>
						<div>
							<dl>
								<i></i>
								<dt>
									<a href="#">医疗机构案例</a>
								</dt>
							</dl>
							<dl>
								<i></i>
								<dt>
									<a href="#">家用器械案例</a>
								</dt>
							</dl>
						</div>
					</div>
					<div class="two_nav">
						<span></span>
						<div>
							<dl>
								<i></i>
								<dt>
									<a href="#docol">资深医生</a>
								</dt>
							</dl>
							<dl>
								<i></i>
								<dt>
									<a href="#checkimg">检查栏目</a>
								</dt>
							</dl>
							<dl>
								<i></i>
								<dt>
									<a href="#officeimg">科室栏目</a>
								</dt>
							</dl>
						</div>
					</div>
				</div>
				<!-- 二级菜单end -->
			</div>
			<!-- 导航菜单 end -->
		</div>
	</div>

	<div class="bn-alp">
		<ul class="box" style="height: 100%; weight: 100%">
			<li class="on"><img src="images/li1.jpg" class="bg" /></li>
			<li><img src="images/li2.jpg" class="bg" /></li>
			<li><img src="images/li3.jpg" class="bg" /></li>
			<li><img src="images/li4.jpg" class="bg" /></li>
		</ul>
		<div class="i"></div>
	</div>

	<div class="doctor" id="docol">
		<div>
			<table>
				<tr>
					<td><img src="images/hospi1.png" /></td>
					<td style="text-align: center;"><span
						style="font-size: 40px; color: #006699">医生代表</span></td>
				</tr>
			</table>

		</div>

		<ul class="doctorul">
			<c:forEach items="${doctor}" var="eachdoctor" begin="0" end="3">
				<li><div class="eachdoctor">

						<img style="width: 300px; height: 280px;"
							src="../dede/images/doctorimg/${eachdoctor[0]}.png"
							onerror="this.src='./images/doctorimg/nothing.gif'" />
						<div>
							<label>医生姓名：${eachdoctor[1]}</label><label>医生性别：${eachdoctor[5]}</label>
						</div>
						<div>
							<label>医生职称：${eachdoctor[3]}</label><label>医生科室：${eachdoctor[2]}</label>
						</div>
					</div></li>
			</c:forEach>

		</ul>




	</div>








	<div style="padding: 0; position: absolute; margin-top: 1060px"
		id="checkimg">
		<table>
			<tr>
				<td><img src="images/check.png" /></td>
				<td style="text-align: center;"><span
					style="font-size: 40px; color: #006699">已开通检查</span></td>
			</tr>
		</table>

	</div>
	<table class="bordered">


		<thead>



			<tr>
				<th>可供检查编号</th>
				<th>可供检查名称</th>
				<th>费用</th>
			</tr>
		</thead>
		<c:forEach items="${pchecklist}" var="check" begin="0" end="3">
			<tr>
				<td>${check[0]}</td>
				<td>${check[1]}</td>
				<td>${check[2]}</td>
			</tr>
		</c:forEach>
	</table>

	</br>



	<div style="padding: 0; position: absolute; margin-top: 1680px"
		id="officeimg">
		<table>
			<tr>
				<td><img src="images/office1.png" /></td>
				<td style="text-align: center;"><span
					style="font-size: 40px; color: #006699">已有科室</span></td>
			</tr>
		</table>

	</div>
	<table class="zebra" id="officie3">

		<thead>
			<tr>
				<th>科室号</th>
				<th>科室名称</th>
				<th>现有医生人数</th>

			</tr>
		</thead>

		<c:forEach items="${officelist}" var="office" begin="0" end="3">
			<tr>
				<td>${office[0]}</td>
				<td>${office[1]}</td>
				<td>${office[2]}</td>
			</tr>
		</c:forEach>

	</table>

	<div id="tab">
		<ul>
			<li><a href="#p1">医院简介</a></li>
			<li><a href="#p2">医院地理位置</a></li>
			<li><a href="#p3">联系电话</a></li>
		</ul>
		<p id="p1">该医院其实不存在！</p>
		<p id="p2">位置也是我们乱写的</p>
		<p id="p3">电话号码：XXX-XXX--XX</p>
	</div>

 <div id="target"  style="width: 30px; height: 30px; position: absolute; top:100px; left: 0px;z-index: 20000"><p style="ont-family: Georgia, serif;font-size: 24px ;color: red ;border: 2px;">门诊时间上午十点到下午五点</p></div>

	<div id="footer" style="margin-bottom: 0; color: gray">
		<p>JDK小组</p>
	</div>
</body>
</html>