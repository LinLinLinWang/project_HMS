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
<body style="text-align:center" >


	<%
		String regesiteCode = request.getParameter("registeCode");//用request得到 
		
		pageContext.setAttribute("regesiteCode", regesiteCode);
	%>
	您的注册号是：





	<c:if test="${not empty pageScope.regesiteCode}">

		<div style="color: red" id="registe_code">${pageScope.regesiteCode}</div>
	</c:if>
	<c:if test="${not empty doictorregesite}">

		<div style="color: red" id="registe_code">${doictorregesite}</div>
	</c:if>
	<%--  <c:if test="${regesiteCode}">
	
					<div style="color: red" id="registe_code"><%=regesiteCode%></div>
			</c:if> --%>





	<script type="text/javascript">
		function consummate_ques_ans_submit() {
			var question = document.getElementById("questonId").value;
			var answer = document.getElementById("answerId").value;
			var regesiteCode = document.getElementById("registe_code").innerText;

			//请求json响应json
           if(question==""){
               alert("验证问题不能为空");
               return;}
    if(answer==""){
        alert("答案不能为空");return;}
           
			$.ajax({

				url : "ajax/consummate_question_answer.mvc",
				type : "post",
				async : false,
				dataType : 'json',

				data : {
					"regesiteCode" : regesiteCode,
					"question" : question,
					"answer" : answer
				},
				success : function(data) {

					if (data.question_answer == "true") {

						setTimeout(function() {
							window.location.href = "login.jsp";
						}, 1);
					} else {
						alert("完善问题答案失败，请稍后再试");

					}

				},
				error : function(data) {

					alert("数据没被后台接受");

				}

			});
		}
	</script>




	<table>
		<tr>


			<th>您的问题选择：</th>
			<th>您的问题答案</th>
			<th>操作</th>

		</tr>
		<tr>
			<td><input type="text" id="questonId" name="question"
				placeholder="您要设置的问题：" /></td>
			<td><input type="text" id="answerId" name="answer"
				placeholder="您要设置的答案" /></td>
				<td>	<button onclick="consummate_ques_ans_submit()">提交信息</button></td>

		</tr>

	</table>






</body>
</html>