<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css"
	href="css/patient_docotor_manager.css" /> 

<script src="js/jquery.js"></script>
<script src="js/patient_doctor_manager.js"></script>
<script src="js/patient.js"></script>
<script type="text/javascript" src="js/public.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
#footer{height:50px;line-height:50px;background:#5e5e5e;width:100%;position:absolute;z-index:200;bottom:0;text-align:center;}
#footer p{text-align:center;line-height:50px;color:#fbfbfb;}
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
</style>

<link rel="stylesheet" type="text/css" href="css/index.css" />

</head>

<body>

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
					<li class="cur"><a href="#"> <i
							class="img dh_02COMPASS"></i> <span>HMS概况</span>
					</a></li>
					<li><a href="#"> <i
							class="img dh_03TARGET"></i> <span>医疗器械</span>
					</a></li>
					<li><a href="#"> <i class="img dh_04GRID"></i>
							<span>案例展示</span>
					</a></li>
					<li><a href="#"> <i class="img dh_05NOTEPAD"></i>
							<span>资讯中心</span>
					</a></li>
					<c:if test="${!empty sessionScope.current_login_user}">
						<li><a href="tencent://message/?uin=1339567630&Site=http://vps.shuidazhe.com&Menu=yes"> <i class="img dh_06PEN"></i>
								<span>在线留言</span>
						</a></li>
					</c:if>
					<c:if test="${ empty sessionScope.current_login_user}">
						<li><a href="registe.html"> <i class="img dh_06PEN"></i>
								<span>注册</span>
						</a></li>
					</c:if>
					<c:if test="${!empty sessionScope.current_login_user}">
						<li><a href="sessioninvalidate.mvc"> <i class="img dh_07USER"></i>

								<span>退出</span>


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
									<a href="#">公司动态</a>
								</dt>
							</dl>
							<dl>
								<i></i>
								<dt>
									<a href="#">行业新闻</a>
								</dt>
							</dl>
							<dl>
								<i></i>
								<dt>
									<a href="#">员工活动</a>
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

	
	<div id="content">
	
		<div class="left_menu">
		<div id="ss" style="height:50px;width: 100%">
	
	</div>
			<ul id="nav_dot">
				<li>
					<h4 class="M2">
						<span></span>个人信息
					</h4>
					<div class="list-item none">

						<a  id="showinfoselef">修改个人信息</a> <a id="updatepassword">修改密码</a>
						
					</div>
				</li>



				<li> 
					<h4 class="M4" onclick="">
						<span></span>预约检查等功能
					</h4>
					<div class="list-item none">
						<a id="appoint_doctor">预约医生</a> <a id="paymoney">待缴费项目</a> <a
						id="print_chu">打印处方饮食建议等信息</a> <a id="moneylist">账单信息</a>

				
					</div>
				</li>


			</ul>
		</div>
			<div id="ss1" style="height:50px;width: 100%">
	
	</div>
		<div class="m-right">

			<div class="main">
				<iframe src="search.html" id="iframe_content"
					style="width: 100%; height: 100%"></iframe>
			</div>
		</div>
	</div>
	<div class="bottom"></div>
	<div id="footer">
	<p>JDK小组</p>
	</div>
	<script>
		navList();
	</script>
</body>
</html>