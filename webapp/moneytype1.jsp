<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
body, html {
	margin: 0;
	width: 100%;
	height: 100%;
	padding: 0
}


#iframe_content {
	width: 100%;
	height: 90%
}
</style>
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

 function showcheck(dd){
	   

			$.ajax({

				data : {
					"hid" : dd,
					

				},

				type : "POST",
				async : false,

				dataType : 'json',

				url : "ajax/showhidcheck.mvc",

				success : function(data) {
					
					if(data.isFiinsh=="yes"){
						  window.location.href="eachhidresulatcheck.jsp?hid="+dd+"&fininsh="+1;
						}else{
							  window.location.href="eachhidresulatcheck.jsp?hid="+dd+"&fininsh="+0;}
                   
					
	                                                           	 
	                      
				},

				error : function(data) {
				
					alert("稍后重试！");
					
					 //window.location.href="login.jsp?hid="+hid;

				}});
		     


	 }

</script>
</head>
<body style="height:100%">


	<div id="page-inner" style="width:100%; height:100%">

		<div class="row" style="width:100%; height:100%">
			<div class="col-md-12" style="width:100%; height:100%">
				<!-- Advanced Tables -->
				<div class="card" style="width:100%; height:100%"">
					<div class="card-action">选择病人检查记录</div>
					<div class="card-content" style="width:100%; height:100%">
						<div class="table-responsive" style="width:100%; height:100%">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example" style="width:100%; height:100%">
								<thead>
									<tr>
										<th>就诊记录号</th>
										<th>病人身份证号</th>
										<th>病人名字</th>
										<th>病人性别</th>
										<th>付费状态</th>
										<th>检查报告生成时间</th>
										<th>选择查看</th>
									

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${sessionScope.showallpationgivemoney}" var="thing">

										<tr class="odd gradeX">

											<td>${thing.hid}</td>
											<td>${thing.uid}</td>
											<td>${thing.name}</td>
											<td>${thing.gender}</td>
											<td style="color: red">已付费并已经出来各项检查结果</td>
											<th>${thing.outresult}</th>
											<th onclick="showcheck('${thing.hid}');">点击查看</th>
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

	<div
		style="position: absolute; width: 100px; height: 100px; right: 100px; bottom: -30px; z-index: 999989">
		<button onclick="submmit();">确认</button>
	</div>
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
	<script src="assets/js/dataTables/jquery.dataTables3.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		})
	</script>



	<!-- Custom Js -->
	<!--<script src="assets/js/custom-scripts.js"></script> -->
	<!-- 点击弹出输入框 -->







	<script src="js/choosecheckbox.js"></script>


</body>
</html>






































