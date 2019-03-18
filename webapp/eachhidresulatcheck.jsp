<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script src="js/jquery.js"></script>
<script>
function getRadioButtonCheckedValue(tagNameAttr) {
	var radio_tag = document.getElementsByName(tagNameAttr);
	for (var i = 0; i < radio_tag.length; i++) {
		if (radio_tag[i].checked) {
			var checkvalue = radio_tag[i].value;
			return checkvalue;
		}
	}
}
	function complete(dd) {

		/**
		 * 获取input = radio 单选框中选中的值
		 * @param tagNameAttr string  radio组中input的name属性值
		 * return 返回被选中radio的值
		 */
		 
		var needh = getRadioButtonCheckedValue("isNeedHomeHos");

		var finalresult = document.getElementById("finalresult").value;

		var foodSuggestion = document.getElementById("foodSuggestion").value;

		var prentSuggestion = document.getElementById("prentSuggestion").value;
	
		$.ajax({

			data : {
				"hid" : dd,
				"finalresult" : finalresult,
				"foodSuggestion" : foodSuggestion,
				"prentSuggestion" : prentSuggestion,
				"needh" : needh
			},

			type : "POST",
			async : false,

			dataType : 'json',

			url : "ajax/complete.mvc",

			success : function(data) {
				var r=confirm("是否需要开药跟重新安排检查")
				  if (r==true)
				    {
						 window.location.href="choosecheckormedicineorother2.jsp?hid="+dd;
				    }
				  else
				    {
					    
					  window.location.href="appointinfo.jsp";
				    }

              
				
				
			},

			error : function(data) {

				alert("稍后重试！");

				//window.location.href="login.jsp?hid="+hid;

			}
		});

	}
	
</script>
<body>
	<%
		String hid = request.getParameter("hid");
		pageContext.setAttribute("hid", hid);
		String finish=request.getParameter("fininsh");
		pageContext.setAttribute("fininsh",finish);
		
	%>
	<table>
		<tr>
			<th>检查名称</th>
			<th>检查结果</th>
			<th>出结果时间</th>

		</tr>
		<c:forEach items="${sessionScope.showhidcheckbyhid}" var="check">
			<tr>

				<td>${check.checkname}</td>

				<td>${check.result}</td>

				<td>${check.time}</td>
			</tr>
		</c:forEach>

	</table>
	<c:if test="${fininsh eq '0'}">
	<h>完善病人饮食或者预防信息 并给出最终诊断结果</h></br>

	病人会诊结果：
	<textarea id="finalresult"></textarea></br>
	是否需要住院
	<input type="radio" value="0" checked name="isNeedHomeHos">不需要
	</input>
	<input type="radio" value="1" name="isNeedHomeHos">需要
	</input>
	</br> 病人饮食建议：
	<textarea id="foodSuggestion"></textarea>
	</br> 病人预防建议：
	<textarea id="prentSuggestion"></textarea>
	</br>


	<button onclick="complete('${hid}');">提交</button>
  </c:if>
</body>
</html>