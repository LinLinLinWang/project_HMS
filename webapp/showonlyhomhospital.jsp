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
<script>
	function outhospital(d) {
		$.ajax({

			data : {
				"hid" : d
			},

			type : "POST",
			async : true,

			dataType : 'json',

			url : "ajax/outhospital.mvc",
			success : function(data) {
                     alert("办理出院成功");
                     window.location.href="showonlyhomhospital.jsp";
			},
			error : function(data) {
				alert("办理出院失败");
			}
		});

	}
</script>
<style type="text/css">
table {
	width: 100%;
	text-align: center;
	margin-top: 1%
}

table tr {
	font-size: 18px;
	font-family: "微软雅黑";
	height: 40px;
}

table tr:nth-child(2n-1) {
	background-color: gray;
}

table tr:nth-child(2n) {
	background-color: #11111111;
}
</style>



<body>
    
	<table>
		<tr>
			<th>就诊记录号</th>
			<th>病人注册号</th>
			<th>病人身份证</th>
			<th>病人名字</th>
			<th>入院时间</th>
			<th>办理出院</th>

		</tr>
		<c:forEach items="${sessionScope.ddd}" var="check">
			<tr>

				<td>${check[0]}</td>

				<td>${check[2]}</td>

				<td>${check[1]}</td>
				<td>${check[3]}</td>
				<td>${check[4]}</td>
				<td onclick="outhospital('${check[0]}');">办理出院</td>
			</tr>
		</c:forEach>

	</table>


</body>
</html>