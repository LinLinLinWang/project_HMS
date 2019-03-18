
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/registe_login.css" />


<script src="js/jquery.js"></script>

<script type="text/javascript" src="js/public.js"></script>
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
	z-index: 200;
	bottom: 0;
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
</style>
<link rel="stylesheet" type="text/css" href="css/index.css" />






















<script src="js/jquery.js"></script>
<script src="js/verification.js"></script>

<script>
	function check_submit() {
		var uid = document.getElementById("UId").value;
		var isSave = $("input[type='checkbox']").is(':checked');

		if (isSave == true) {
			var savestate = "true";
		} else {
			var savestate = "false";
		}
		var password = document.getElementById("password").value;

		if (uid == "") {
			alert("账号为空，请重新填写");
			return;
		} else {
			var reg = /([0-9]{20})|(^1[3|4|5|7|8][0-9]{9}$)/;
			if (reg.test(uid) === false) {
				alert("账号不合法");
				return;
			}

		}

		if (password == "") {
			alert("密码不能为空");
			return;
		} else {
			$.ajax({

				data : {
					"uid" : uid,
					"password" : password,
					"savestate":savestate

				},

				type : "POST",
				async : false,

				dataType : 'json',

				url : "ajax/login.mvc",

				success : function(data) {
					if (data.IsRegisted == "true") {

						if (data.IsTruePassword == "true") {
							if (data.IsDoctor == "true") {
								alert("将跳转医生界面");
								setTimeout(function() {
									window.location.href = "doctor_face.jsp";
								}, 1);
							} else {
								alert("将跳转您（非医院员工）所在界面");
								setTimeout(function() {
									window.location.href = "patient_face.jsp";
								}, 1);
							}

						} else {
							alert("密码错误");
							setTimeout(function() {
								window.location.href = "login.jsp?msg="
										+ "密码错误";
							}, 1);

						}

					} else {
						alert("没有注册过");
						setTimeout(function() {
							window.location.href = "login.jsp?msg=" + "该账号不存在";
						}, 1);

					}

				},

				error : function(data) {
 
					alert(data);

				}

			});

		}

	}
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
					<li class="cur"><a href="#"> <i class="img dh_02COMPASS"></i>
							<span>HMS概况</span>
					</a></li>
					<li><a href="#"> <i class="img dh_03TARGET"></i> <span>医疗器械</span>
					</a></li>
					<li><a href="#"> <i class="img dh_04GRID"></i> <span>案例展示</span>
					</a></li>
					<li><a href="#"> <i class="img dh_05NOTEPAD"></i> <span>资讯中心</span>
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
	<div id="ss" style="height: 150px; width: 100%"></div>



	<div id="login-container">


		<%
			String msg = request.getParameter("msg");//用request得到
			if (msg != null) {
				out.print("<div style=\"color:red\">" + msg + "</div>");
			} else {
			}
		%>


		<form id="loginForm" action="#">

			欢迎登陆JDK医院管理系统

			<div>
				<input class="userid input" placeholder="您的手机号或者注册号" id="UId"
					autocomplete="on" />
			</div>
			<div>
				<input class="password input" placeholder="输入密码" id="password" />
			</div>

			<label style="margin-left: 0; width: 40px;"><input
				type="checkbox" />自动登陆</label></br>



			<button class="login-tis" id="submit" onclick="check_submit()">登陆</button>

		</form>

		<a href="registe.html">
			<button type="button" class="register-tis">还没有有账号？</button>
		</a></br> <a href=inputphoneforserchre.jsp>
			<button type="button" class="register-tis">忘记密码？</button>
		</a>

	</div>
	<div id="footer" style="margin-bottom: 0; color: gray">
		<p>JDK小组</p>
	</div>



</body>
</html>