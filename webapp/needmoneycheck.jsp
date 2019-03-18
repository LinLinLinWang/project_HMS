<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="niit.hospitalsys.entity.User"%>
<%@page import="niit.hospitalsys.service.PatienthistoryService"%>
<%@page import="niit.hospitalsys.entity.Patienthistory"%>
<%@page import="java.util.List"%>
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
	<%!static int a = 1;%>

	<%
	   
		List<Patienthistory> list = (List<Patienthistory>) request.getSession().getAttribute("zhifu");
		if (list.size() == 0) {
			out.print("当前没有待缴费项目");
		} else {
		}
		int hid[] = new int[list.size()];
		for (int i = 0; i < list.size(); i++) {
			int phid = list.get(i).getPhid();
			hid[i] = phid;

		} ;
		if (a == 1) {
			session.setAttribute("hid232", hid);

		} else {

		}

		String hid2 = request.getParameter("hid");
		if (null != hid2) {
			a = 2;
			for (int i = 0; i < hid.length; i++) {
				if (hid[i] == Integer.valueOf(hid2)) {
					hid[i] = -2;
					
				} else {
				}

			}
			session.setAttribute("hid232", hid);
			//pageContext.setAttribute("hid2", hid2);
			int dd[] = (int[]) session.getAttribute("hid232");
			for (int k = 0; k < ((int[]) session.getAttribute("hid232")).length; k++) {
				out.print(dd[k]);
			}
		} else {

		}
	%>

	<script>
		function fun(dd, ff) {
			obj = document.getElementsByName(dd + "count");
            alert(ff);
			str = 0;
			for (i = 0; i < obj.length; i++) {
				str += parseInt(obj[i].innerText);
			}

			var cc = "统计费用为" + str + "元";
			firm(dd,cc,ff);

		}
		function firm(dd,cc,ff) {
			//利用对话框返回的值 （true 或者 false）
			if (confirm(cc + "  你确定交费吗？")) {

				$.ajax({

					data : {
						"hid" : ff,
						"type" : 1
					//表示 付了检查

					},

					type : "POST",
					async : false,

					dataType : 'json',

					url : "ajax/moneytype.mvc",
					success : function(data) {
						document.getElementById(dd+"totalMoney").innerText="付费成功";
					},
					error : function(data) {
						alert("qqqqqqqqshibai");
					}
				});

			} else {
				alert("支付失败");
			}

		}
	</script>



	<c:forEach items="${sessionScope.needmoneyList}" var="list1"
		varStatus="d">
		<table>
			<tr>第${d.index+1}个未交费项目
			</tr>
			<tr>

				<th>检查编号</th>
				<th>检查名称</th>
				<th>单项检查费用</th>


			</tr>
			<c:forEach items="${list1}" var="list">
				<tr>

					<td>${list.mid}</td>
					<td>${list.mname}</td>
					<td name="${d.index+1}count">${list.mmoney}</td>




				</tr>
			</c:forEach>

		


				<tr style="color: red" id="s">
					<td id="${d.index+1}totalMoney" name="${hid232[d.index]}"
						onclick="fun('${d.index+1}','${hid232[d.index]}');">点击进入付费界面</td>
				</tr>
			


		</table>
	</c:forEach>



</body>
</html>