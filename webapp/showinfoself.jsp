<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style type="text/css">
form {
	position: relative;
	width: 305px;
	margin: 15px auto 0 auto;
	text-align: center
}

#cd {
margin:10% auto 0 auto;
	cursor: pointer;
	width: 300px;
	height: 44px;
	margin-top: 25px;
	padding: 0;

	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 0;
	-moz-box-shadow: 0 15px 30px 0 rgba(255, 255, 255, .25) inset, 0 2px 7px
		0 rgba(0, 0, 0, .2);
	font-family: "Microsoft YaHei", Helvetica, Arial, sans-serif;
	font-size: 14px;
	font-weight: 700;
	color: #fff;
	text-shadow: 0 1px 2px rgba(0, 0, 0, .1);
	-o-transition: all .2s;
	-moz-transition: all .2s;
	-webkit-transition: all .2s;
	-ms-transition: all .2s
}

input {
	width: 270px;
	height: 42px;
	line-height: 42px;
	margin-top: 25px;
	padding: 0 15px;
	background: #2d2d2d;
	background: rgba(45, 45, 45, .15);
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #3d3d3d;
	border: 1px solid rgba(255, 255, 255, .15);
	-moz-box-shadow: 0 2px 3px 0 rgba(0, 0, 0, .1) inset;
	-webkit-box-shadow: 0 2px 3px 0 rgba(0, 0, 0, .1) inset;
	box-shadow: 0 2px 3px 0 rgba(0, 0, 0, .1) inset;
	font-family: "Microsoft YaHei", Helvetica, Arial, sans-serif;
	font-size: 14px;
     color:blue;
	text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);

}
</style>
<body
	style="text-align:center;background-color: white;">
	<div id="cd">


		<script>
			function dd() {
				var email = document.getElementById("email").value;
				var name = document.getElementById("name").value;
				var address = document.getElementById("address").value;
				var reg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/; //验证规则
				if (reg.test(email) == false) {
					alert("邮箱格式不正确");
				
					return;
				}
				if (name == null || name == "") {
					alert("名字不能为空");
					return;
				}
				if (address == null || address == "") {
					alert("地址不能为空");
					return;
				}
			}
		</script>
		<form action="updateinfo.mvc">
			姓名：<input placeholder="${sessionScope.current_login_user.uname}"
				type="text" name="name" id="name" /></br> 邮箱： <input
				placeholder="${sessionScope.current_login_user.uemail}" type="text"
				name="email" id="email" /></br> 地址<input
				placeholder="${sessionScope.current_login_user.uaddress}"
				type="text" name="address" id="address" /></br>
			<button type="submit" onclick="dd();">修改</button>
		</form>
	</div>
</body>
</html>