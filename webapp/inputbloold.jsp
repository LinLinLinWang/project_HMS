<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
input{margin-top: 40px;}
</style>
<body style="color:gray;text-align: center">
	志愿者献血登记
	<script>
		function dd() {
			var name = document.getElementById("name").value;
			var number = document.getElementById("number").value;

			var type = $('input[name="type"]:checked').val();
			
			var bllod = $('input[name="bloodcount"]:checked').val();
		
			if (name == "") {
				alert("名字为空");
				return;
			}
			if (number == "") {
				alert("手机号为空");
				return;

			}
			var reg = /^1[3|4|5|7|8][0-9]{9}$/; //验证规则
			if (reg.test(number) == false) {
				alert("手机号格式不正确");
				return;
			}

			 $.ajax({

					data : {
				          "number":number,
				          "type":type,
				           "blood":bllod
						
						

					},

					type : "POST",
					async : false,

					dataType : 'json',

					url : "ajax/inputBlood.mvc",

					success : function(data) {
					  
					if(data.isP=="yes"){}else{
						alert("该志愿者尚未出现在我医院血库");}
					
					},

					error : function(data) {
					
						
						

					}});

					
			

		}
	</script>
	<form>
		姓名：<input type="text" name="name" id="name" /> </br>手机号<input type="text"
			name="idcard" id="number" /></br> 血型：A<input type="radio" value="A"
			name="type" checked /> B<input type="radio" value="B" name="type" />
		AB<input type="radio" value="AB" name="type" /> O<input type="radio"
			value=" O" name="type" /></br> 献血量:<input type="radio" value="200"
			name="bloodcount" checked />200 <input type="radio" value="300"
			name="bloodcount" />300 <input type="radio" value="400"
			name="bloodcount" />400
		<button type="submit" onclick="dd();">提交</button>
	</form>

</body>
</html>