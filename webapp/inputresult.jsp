<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery.js"></script>
</head>
<body>

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
	<script>
		function inputCheckResult2(dd) {
			var list = document.getElementsByName("mid");
			var nei = "";
			for (var i = 0; i < list.length; i++) {
              // alert(list[i].innerText);
			var nei =nei+list[i].innerText +":"+ $("#d" + list[i].innerText).val() + ",";
		
			}
		

			$.ajax({  

				data : {

					"hid" : dd,
					 "type":"inputcheckre",
					 "data":nei

				},

				type : "POST",
				async : false,

				dataType : 'json',

				url : "ajax/inputCheckResoult.mvc",
				success : function(data) {

					window.location.href = "showgivenmoneybutnotcheck.jsp";

				},
				error : function(data) {

				}
			});

		}
	</script>
	<h style="color:red;display:none" id="hid_fr">${hid}</h>
	<table>
		<tr>
			<th>检查编号</th>
			<th>检查名称</th>
			<th>检查结果</th>

		</tr>
		<c:forEach items="${sessionScope.needcheckandgivenmonry}" var="check">
			<tr>

				<td name="mid">${check.mid}</td>

				<td id="dd${check.mid}">${check.mname}</td>
				<td><textarea id="d${check.mid}"
						style="width: 200px; height: 200px"></textarea></td>



			</tr>
		</c:forEach>

	</table>
	<button onclick="inputCheckResult2('${hid}');">提交信息</button>
</body>
</html>