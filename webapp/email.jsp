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
	function dd(toemail) {

		var Message = document.getElementById("Message").value;
		var mailtitle = document.getElementById("mailtitle").value;
		alert(toemail);
		$.ajax({

			data : {
				"Message" : Message,
				"toemail" : toemail,
				"mailtitle":mailtitle

			},

			type : "POST",
			async : false,

			dataType : 'json',

			url : "ajax/sendEmail.mvc",

			success : function(data) {
				alert("发送消息成功");
				setTimeout(function() {
					window.location.href = "alluserlistandemail.jsp";
				}, 1000);
			},

			error : function(data) {
				setTimeout(function() {
					window.location.href = "alluserlistandemail.jsp";
				}, 1000);
				alert(data);

			}

		});

	}
</script>














</head>
<body>


	<%
		String toemail = request.getParameter("toemail");
		pageContext.setAttribute("toemail", toemail);
	%>


	<div"login-container">
		<h1>发送邮件界面</h1>

		<div"connect">
			<p>医院管理系统</p>
		</div>






			<div>


				<input rows="" cols="" class="userid input" type="text"
					placeholder="邮件主题" id="mailtitle"/>
			</div>

			<div>


				<textarea rows="" cols="" class="userid input" type=""
					placeholder="发送消息" id="Message"></textarea>
			</div>





			<button class="login-tis" id="submit" onclick="dd('${toemail}');">发送邮件</button>




	</div>


</body>
</html>