<%@page import="niit.hospitalsys.entity.Office"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery.js"></script>
<script src="js/jquery-labelauty.js"></script>
<script>
	$(function() {
		$(':input').labelauty();
	});
</script>
<link rel="stylesheet" href="css/jquery-labelauty.css">
<title>Insert title here</title>
<style>
ul {
	list-style-type: none;
}

li {
	display: inline-block;
}

li {
	margin: 10px 0;
}

input.labelauty+label {
	font: 12px "Microsoft Yahei";
}
</style>

</head>
<body>
	<center>
		<%
			String registeCode = request.getParameter("registeCode");
		%>

		您的注册号是：
		<div style="color: red" id="registe_code"><%=registeCode%></div>









		<form action="RegisteDocotor.mvc" method="post">


			<table>
				<!--当前选择您的科室-->
				<h3>您的职业（单选框）</h3>
				<ul class="dowebok">
					<c:forEach items="${sessionScope.officeList}" var="office">
						<li><input type="radio" name="office"
							value="${office.dofficeld}"
							data-labelauty="${office.dofficeName} "></li>
					</c:forEach>


				</ul>
				<!--当前选择您的职称-->
				<ul class="dowebok">
					<c:forEach items="${sessionScope.entitlerList}" var="entitler">
						<li><input type="radio" name="entitler"
							value="${entitler.dentitle}"
							data-labelauty="${entitler.dentitleName} "></li>
					</c:forEach>


				</ul>


			</table>
			<button id="submmitDoctorInfo" type="submit">提交信息</button>
		</form>
	</center>



</body>
</html>