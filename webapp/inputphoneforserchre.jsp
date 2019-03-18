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
<script src="js/verification.js"></script>

<script>
	function check_submit() {
		var uid = document.getElementById("UId").value;

		if (uid == "") {
			alert("账号为空，请重新填写");
			return;
		} else {
			var reg = /([0-9]{20})|(^1[3|4|5|7|8][0-9]{9}$)/;
			if (reg.test(uid) == false) {
				alert("账号不合法");
				return;
			}

		}

		$.ajax({

			data : {
				"uid" : uid,

			},

			type : "POST",
			async : false,

			dataType : 'json',

			url : "ajax/findpassword.mvc",

			success : function(data) {
				
				if (data.havathis == "no") {

					alert("没有该用户");
				} else {
					if (data.havequese == "yes") {
					
						setTimeout(function() {
							window.location.href = "showquestion.jsp?uid="
									+ uid;

						}, 2000)

					} else {

						alert("没有问题给您验证，请到医院自行办理");
					}

				}

			},

			error : function(data) {

				alert(data);

			}

		});

	}
</script>














</head>
<body>





	<div"login-container">
		<h1>找回密码界面</h1>

		<div"connect">
			<p>医院管理系统</p>
		</div>








			<div>
				<input class="userid input" placeholder="您的手机号或者注册号" id="UId"
					autocomplete="on" />
			</div>


			<button class="login-tis" id="submit" onclick="check_submit()">提交</button>

	


	</div>


</body>
</html>