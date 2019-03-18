<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery.js"></script>
<script>
	


	function updateillness() {
		var illness = document.getElementById("Message").value;
		
		var hid = document.getElementById("hid1").innerText;

		$.ajax({

			data : {
				"hid" : hid,
				"illness":illness

			},

			type : "POST",
			async : false,

			dataType : 'json',

			url : "ajax/updateillness.mvc",

			success : function(data) {
			
				var r=confirm("是否需要选择检查？")
				  if (r==true)
				    {
					 	window.parent.location.href="choosecheckormedicineorother.jsp?hid="+hid;
				    }
				  else
				    {
					  window.parent.location.href="appointinfo.jsp?hid="+hid;
				    }
                  
				
                       
                   
                   
			},

			error : function(data) {
			
          
				alert("获取信息失败");
				
				 //window.location.href="login.jsp?hid="+hid;

			}});
		 return false;

	
	}
</script>
<!-- Meta tag Keywords -->
<!-- Style-CSS -->
<link rel="stylesheet" href="css/discomfortableinfo.css" type="text/css"
	media="all" />
<style>
body, html {
	margin: 0;
	width: 100%;
	height: 100%;
	padding: 0
}
</style>
</head>

<body>
	<%
		String hid = request.getParameter("hid");
		out.print(hid);
		pageContext.setAttribute("hid", hid);
	%>
	<!--header-->
	<h1>
		<span>F</span>or <span>H</span>ealth
	</h1>
	<!--//header-->
	<!-- content -->
	<div class="main-content-agile">
		<div class="sub-main-w3">
			<form  >
				<h2>
					记录
					<h id="hid1">${hid}</h>
					号病情信息记录表
				</h2>

				<div class="form-style-agile">
					<textarea name="Message" id="Message" placeholder="病人口述病情信息"
						required=""></textarea>
				</div>
				<input type="button" value="提交" onclick="updateillness();" />
			</form>
		</div>
	</div>

	<!-- date-->
	<link rel="stylesheet" href="css/jquery-ui.css" />
	<script src="js/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker,#datepicker1").datepicker();
		});
	</script>
	<!-- //date -->

	<!-- time -->
	<script src="js/wickedpicker.js"></script>
	<script>
		$('.timepicker').wickedpicker({
			twentyFour : false
		});
	</script>
	<link href="css/wickedpicker.css" rel="stylesheet" type='text/css'
		media="all" />
	<!-- //time -->


</body>
</html>