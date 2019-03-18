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

<script>
 function  print(dd){

	 $.ajax({

			data : {
				"hid" : dd,
				
				

			},

			type : "POST",
			async : false,

			dataType : 'json',

			url : "ajax/outPutCountlist.mvc",

			success : function(data) {
			    setTimeout(function() {
			    	window.location.href="../dede/"+dd+"countlist.docx";
			    }, 1000)
			
			
			},

			error : function(data) {
			
				
				
				 //window.location.href="login.jsp?hid="+hid;

			}});





	 }
  
</script>
	<table>

		<tr>
			<th>就诊记录号</th>
			<th>就诊时间</th>
			<th>个人情况</th>
			<th>缴费情况</th>
			<th>费用统计</th>
			<th>详情打印</th>
	
		</tr>
		<c:forEach items="${sessionScope.list_count}" var="single">
			<tr>

				<td>${single[0]}</td>

				<td>${single[1]}</td>
				<td>${single[3]}</td>
				<td>${single[2]}</td>
				<td>${single[4]}</td>
				<td onclick="print('${single[0]}');">生成账单</td>
				

			</tr>
		</c:forEach>

	</table>

</body>
</html>