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
<script type="text/javascript">

function turn_consummate_question_jsp() {
	var regesiteCode=document.getElementById("regesiteCode").innerText;
	 setTimeout(function(){
 		window.location.href="consummate_question.jsp?regesiteCode="+regesiteCode; 
 	},1);

	
}

</script>
<!--注册号显示-->
<% 
       
        String regesiteCode = request.getParameter("regesiteCode");//用request得到 
       
%>   您的注册号是：
    <div style="color:red" id="regesiteCode"><%=regesiteCode%></div>
     请您记牢
  
  
  -----------接下来请完善验证问题 方面之后账号查找以及修改密码-------
<%--   <a href="consummate_question.jsp?regesiteCode="+<%=regesiteCode%>>完善密保问题</a> --%>

<button onclick="turn_consummate_question_jsp()">继续完善信息</button>
</body>
</html>