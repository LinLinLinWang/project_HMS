<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="js/jquery.js"></script>






<script>
		function inputCheckresult(dd) {
			
			$.ajax({

				data : {

					"hid" : dd,
					"type":"complete"

				},

				type : "POST",
				async : false,

				dataType : 'json',

				url : "ajax/inputCheckResoult.mvc",
				success : function(data) {
					
					window.location.href="inputresult.jsp?hid="+dd;

				},
				error : function(data) {

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

			<th>记录号</th>
		
			<th>病人注册号</th>
			<th>付费状态</th>
			<th>录入检查结果</th>
			
		</tr>
	
         	<c:forEach items="${sessionScope.GivenMoneyButNotCheck}" var="list">
				<tr>

					<td>${list.phid}</td>
					<td>${list.pregisteId}</td>
					<td style="color:red">已交费！尚未进行检查</td>
                    <td onclick="inputCheckresult('${list.phid}');">点击录入结果</td>



				</tr>
			</c:forEach>
       
	</table>



</body>
</html>