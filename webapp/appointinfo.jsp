<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<script src="js/jquery.js"></script>

<link rel="stylesheet" href="assets/materialize/css/materialize.min.css"
	media="screen,projection" />
<!-- Bootstrap Styles-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="assets/css/custom-styles.css" rel="stylesheet" />

<script>
	function msgbox(n, v) {

		$("#iframe_content").attr("src", "discomfortableInfo.jsp?hid=" + v);

		document.getElementById("hid").innerHTML = v;

		document.getElementById('inputbox').style.display = n ? 'block'
				: 'none'; /* 点击按钮打开/关闭 对话框 */
		if (n == 1) {
			$("#page-inner").hide();
		} else {
			$("#page-inner").show();
		}

	}
</script>
<!-- Google Fonts-->
<style>
body,html{margin: 0;width: 100%;height: 100%;padding: 0}
.box {
	width: 100%;
	height: 100%;
	
	margin: auto 0;
	padding: 28px;
	border: 1px #111 solid;
	display: none; /* 默认对话框隐藏 */
}
#iframe_content{width: 100%;height: 90%}

</style>

</head>
<body>
	<div id='inputbox' class="box" style="width: 100%;height: 100%">
		<h id="hid"></h>
		<iframe name="iframe_content" id="iframe_content"
			onload="this.height=iframe_content.document.body.scrollHeight"
			width="100%" height="100%" scrolling="no" frameborder="0"></iframe>

		<a onclick="msgbox(0); return false;">关闭</a> <a
			onclick="appointdoctor();">确认</a>
	</div>
	<div id="page-inner" style="width: 100%;height: 100%">

		<div class="row" style="width: 100%;height: 100%">
			<div class="col-md-12" style="width: 100%;height: 100%">
				<!-- Advanced Tables -->
				<div class="card" style="width: 100%;height: 100%"">
					<div class="card-action" >今天预约患者详情</div>
					<div class="card-content" style="width: 100%;height: 100%">
						<div class="table-responsive" style="width: 100%;height: 100%">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example" style="width: 100%;height: 100%" >
								<thead >
									<tr >
										<th>预约就诊号</th>
										<th>病人注册号</th>
										<th>病人身份证</th>
										<th>病人名字</th>
										<th>病人性别</th>
										<th>病人年龄</th>
										<th>病人手机号</th>
										<th>病人邮箱号</th>
										<th>病人预约时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${sessionScope.appointinfolist}" var="doctor">

										<tr class="odd gradeX">
											<td>${doctor[0]}</td>
											<td>${doctor[1]}</td>
											<td>${doctor[6]}</td>
											<td>${doctor[2]}</td>
											<td>${doctor[3]}</td>
											<td>${doctor[4]}</td>
											<td>${doctor[7]}</td>
											<td>${doctor[8]}</td>
											<td>${doctor[5]}</td>
											<td><a onclick="msgbox(1,'${doctor[0]}')">编辑</a></td>


										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>
				</div>
				<!--End Advanced Tables -->
			</div>
		</div>
		<!-- /. ROW  -->

		<!-- /. ROW  -->

		<!-- /. ROW  -->



	</div>
	<!-- /. PAGE INNER  -->

	<!-- /. PAGE WRAPPER  -->
	<!-- /. WRAPPER  -->
	<!-- JS Scripts-->


	<!-- jQuery Js -->
	<script src="assets/js/jquery-1.10.2.js"></script>

	<!-- Bootstrap Js -->
	<script src="assets/js/bootstrap.min.js"></script>

	<script src="assets/materialize/js/materialize.min.js"></script>

	<!-- Metis Menu Js -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- Morris Chart Js -->
	<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
	<!--<script src="assets/js/morris/morris.js"></script>  -->


	<script src="assets/js/easypiechart.js"></script>
	<script src="assets/js/easypiechart-data.js"></script>

	<script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>
	<!-- DATA TABLE SCRIPTS -->
	<script src="assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
	</script>



	<!-- Custom Js -->
	<!--<script src="assets/js/custom-scripts.js"></script> -->
	<!-- 点击弹出输入框 -->

</body>
</html>
