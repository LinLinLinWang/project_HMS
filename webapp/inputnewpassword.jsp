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
	function dd() {
		var password = document.getElementById("password").value;

		if (password == "") {
			alert("密码为空，请重新填写");
			return;
		} 

		

		
			$.ajax({

				data : {
					"password" : password
					

				},

				type : "POST",
				async : false,

				dataType : 'json',

				url : "ajax/restpassword.mvc",

				success : function(data) {
		               setTimeout(function() {
		               	window.location.href="login.jsp";
		               }, 1000);
				},

				error : function(data) {

					alert("修改失败 稍后重试 ");

				}

			});

		}

</script>














</head>
<body>





	<div"login-container">
		<h1>重置密码界面</h1>

		<div"connect">
			<p>医院管理系统</p>
		</div>








			<div>
				<input class="userid input" placeholder="您的新密码" id="password"
					autocomplete="on" />
			</div>


			<button class="login-tis" id="submit" onclick="dd()">提交</button>

	

	</div>


</body>
</html>