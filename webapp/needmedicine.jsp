<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="js/jquery.js"></script>
	<script>
		function inputAttention() {
			var hid = document.getElementById("hid_fr").innerText;
			alert("hid" + hid);
			var list = document.getElementsByName("mid");
			var nei = "";
			for (var i = 0; i < list.length; i++) {

				var nei = "  " + nei + $("#dd" + list[i].innerText).text()
						+ $("#d" + list[i].innerText).val()+"     ";

			}
			$.ajax({

				data : {

					"medicine" : nei,
					"hid" : hid

				},

				type : "POST",
				async : false,

				dataType : 'json',

				url : "ajax/medicineUse.mvc",
				success : function(data) {
				window.location.href="appointinfo.jsp"

				},
				error : function(data) {
					alert("请稍后重试");

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
	<%
		String hid = request.getParameter("hid");
		pageContext.setAttribute("hid", hid);
	%>
	<h style="color:red;display:none" id="hid_fr">${hid}</h>
	<table>
		<tr>
			<th>药品编号</th>
			<th>药品名称</th>
			<th>服用事项</th>

		</tr>
		<c:forEach items="${sessionScope.NeedMedicine}" var="medicine">
			<tr>

				<td name="mid">${medicine.mid}</td>

				<td id="dd${medicine.mid}">${medicine.mname}</td>
				<td><textarea id="d${medicine.mid}"
						style="width: 200px; height: 200px"></textarea></td>



			</tr>
		</c:forEach>

	</table>
	<button onclick="inputAttention();">提交信息</button>
</body>
</html>