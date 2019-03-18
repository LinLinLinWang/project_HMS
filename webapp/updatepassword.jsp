<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery.js"></script>
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
	style="text-align:center;background-color: gray">
	<div id="cd">
	<script>

 
		function dd() {
			var password1 = document.getElementById("password1").value;
			var password2 = document.getElementById("password2").value;
			var password3 = document.getElementById("password3").value;
			if (password1 == "") {
				alert("密码不能为空");
				return;
			}
			if (password2 == "") {
				alert("密码不能为空");
				return;
			}
			if (password3 == "") {
				alert("密码不能为空");
				return;
			}
			if (password3 != password2) {
				alert("两次密码不一致");
				return;
			}
			  $.ajax({ 
		
				    data:{"password1":password1,"password2":password2
				    
				    
				    },
				  

				    type:"POST", 
				    async: false,

				    dataType: 'json',

				    url:"ajax/updatepassword.mvc", 

				    success:function(data){ 
		                   if(data.istruepass=="no"){
			                   alert("原密码错误");}else{
			                	
                    window.parent.location.href="sessioninvalidate.mvc";

				                   }
				    },

				     error:function(data){ 

				        alert(data); 

				    }

				    }); 

			
		}
	</script>
	<form >
		原密码：<input placeholder="请输入原密码" type="password" name="password1"
			id="password1" /></br> 新密码： <input placeholder="请输入新密码" type="password"
			name="password2" id="password2" /></br> 再输入一次<input
			placeholder="请再次输入新密码" type="password" name="password3"
			id="password3" /></br>
		<button  onclick="dd();">修改</button>
	</form>
</div>
</body>
</html>