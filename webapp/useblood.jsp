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
form {
	position: relative;
	width: 305px;
	margin: 15px auto 0 auto;
	text-align: center
}

#cd {
margin:10% auto 0 auto;
	cursor: pointer;
	width: 400px;
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

	line-height: 42px;
	margin-top:45px;
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
	var a=0;
	function compare(){
		
		
		var type = $('input[name="type"]:checked').val();
		var tolblood = document.getElementById(type).innerText;
	
		var inttolblood=parseInt(tolblood);
		var bllodcount = document.getElementById("count").value;
		if(inttolblood<-bllodcount||bllodcount>=0){
			 a=1;
			alert("麻烦工作严谨点,储备不够或者输入有误");
			return;
		}else{}
		
		
		
		
		
	}
		function dd() {
			compare();
		if(a==1){
			alert("数目输入有误");
			return ;
		}else{var registe = document.getElementById("name").value;
		
		var type = $('input[name="type"]:checked').val();
		
		var bllodcount = document.getElementById("count").value;
		
		if (registe == "") {
			alert("手机号或者注册号为空");
			return;
		}
		/* 
		var reg = /^1[3|4|5|7|8][0-9]{9}$/; //验证规则
		if (reg.test(number) == false) {
			alert("手机号格式不正确");
			return;
		}
*/
		 $.ajax({

				data : {
			          "registe":registe,
			          "type":type,
			           "bllod":bllodcount
					
					

				},

				type : "POST",
				async : false,

				dataType : 'json',

				url : "ajax/buyblood.mvc",

				success : function(data) {
				  
				if(data.havathis=="yes"){}else{
					alert("该病人尚未在我医院登记");}
				
				},

				error : function(data) {
				
					
					

				}});

				}
			
			
			

		}
	</script>
	A血量库存<label id="A">${sessionScope.bood[0]} </label> B血量库存<label id="B">${sessionScope.bood[1]}</label>    AB血量库存<label id="AB">${sessionScope.bood[2]}</label>    O血量库存<label id="O">${sessionScope.bood[3]}</label>
	<form>   
		</br>手机号或注册号<input type="text"
			name="idcard" id="name"/> </br>血型：A<input type="radio" value="A"
			name="type" checked /> B<input type="radio" value="B" name="type" />
		AB<input type="radio" value="AB" name="type" /> O<input type="radio"
			value=" O" name="type" /></br> 用血量:<input type="number" id="count" ></br>
		<button  onclick="dd();">提交</button>
	</form>
	</div>

</body>
</html>