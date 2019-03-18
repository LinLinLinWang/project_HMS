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

<script><% 
		String uid = request.getParameter("uid");
		session.setAttribute("uid", uid);
	%>
	function dd(vv) {
	

		var answer = document.getElementById("answer").value;
       if(answer==""){
           alert("答案不能为空");return;}
			$.ajax({

				data : {
					"uid" : vv,
					"answer" : answer

				},

				type : "POST",
				async : false,

				dataType : 'json',

				url : "ajax/sumitanser.mvc",

				success : function(data) {
				  if(data.isok=="yes"){
					  setTimeout(function() {
						  	window.location.href="inputnewpassword.jsp";
					  }, 1000);
					  
					  }else{
						  alert("答案不正确");

						  }

				},

				error : function(data) {

					  alert("稍后再试");

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
				<input class="userid input" placeholder="${sessionScope.question.question}" id="uid"
					autocomplete="on" />
			</div>
			<div>
				<input class="password input" placeholder="输入答案" id="answer" />
			</div>





			<button class="login-tis" id="submit" onclick="dd('${sessionScope.uid}');">提交</button>

	
		

	</div>


</body>
</html>