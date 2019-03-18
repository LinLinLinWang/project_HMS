<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<script src="js/jquery.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
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


<style>
label.chkbox {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	position: relative;
	z-index: 2;
	vertical-align: top;
	width: 60px;
	height: 25px;
	border-radius: 5px;
	margin: 0 5px 5px 0;
	padding: 7px 10px;
	cursor: pointer;
	overflow: hidden;
	background-color: #cfcfcf;
	color: white;
	box-shadow: 0 1px 15px rgba(0, 0, 0, 0.1) inset, 0 1px 4px
		rgba(0, 0, 0, 0.1) inset, 1px -1px 2px rgba(0, 0, 0, 0.1);
	-webkit-transition: background-color 0.4s ease;
	-moz-transition: background-color 0.4s ease;
	-ms-transition: background-color 0.4s ease;
	-o-transition: background-color 0.4s ease;
	transition: background-color 0.4s ease;
}

label.chkbox .yes, label.chkbox .no {
	position: absolute;
	right: 8px;
	text-indent: -999em;
	height: 20px;
	width: 20px;
	background-repeat: no-repeat;
}

label.chkbox .no {
	margin-top: -2px;
	background-image:
		url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYxIDY0LjE0MDk0OSwgMjAxMC8xMi8wNy0xMDo1NzowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNS4xIFdpbmRvd3MiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MUM1RDY0NDE2RDhGMTFFMjgxM0ZCNTVDNUM0QjlEREIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MUM1RDY0NDI2RDhGMTFFMjgxM0ZCNTVDNUM0QjlEREIiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDoxQzVENjQzRjZEOEYxMUUyODEzRkI1NUM1QzRCOUREQiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDoxQzVENjQ0MDZEOEYxMUUyODEzRkI1NUM1QzRCOUREQiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Ppxje+AAAAF/SURBVHjaYvz//z8DNQETA5XB4DeQBV2AkZERRDEDMRsQgwL4FxD/Q3IASByk6DcQ/0GPAxYsloAUcwOxGJT/Gog/Q9k8QCwKNfgNEH9Esgynl0EGcty7d6/n6NGjZUC2NBDzQQ2T2r59ezZQrjs/P18MqhYVgJyMjEGKLl26ZPcfCoAG9AHF9IBYG8SGid+8eTMApBZDPxYDwWH46dOnhTDNGzdunFxeXp4L43/8+HERLLiINRAEWN+9e7cEZMDPnz+/gDCI/ePHj0t79uwRx+lDfAYmJyfrfPjw4SbMZSB2QkKCLjSmsRqIKx2Ckg3/gwcPRP/9+wdXA2I/fPgQFBmCOFII9kiBxqre/fv3D4Fc9ufPn48gDGIDg+G2m5ubHVBegNhIAblIDGjYephXnzx5Eg+KeZihwGSzAahGAuQTYgxkvHr1qi3MsDdv3uRBLWECsdGSDROxkcL0/fv36q9fv2ahJX4mYJKJAsb43HPnzoliCzLG0fKQYgAQYAAqwK1lMkf1cgAAAABJRU5ErkJggg==');
}

label.chkbox .yes {
	margin-top: -1px;
	left: 8px;
	background-image:
		url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYxIDY0LjE0MDk0OSwgMjAxMC8xMi8wNy0xMDo1NzowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNS4xIFdpbmRvd3MiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MUM1RDY0M0Q2RDhGMTFFMjgxM0ZCNTVDNUM0QjlEREIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MUM1RDY0M0U2RDhGMTFFMjgxM0ZCNTVDNUM0QjlEREIiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDoxQzVENjQzQjZEOEYxMUUyODEzRkI1NUM1QzRCOUREQiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDoxQzVENjQzQzZEOEYxMUUyODEzRkI1NUM1QzRCOUREQiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PrTLJacAAAGWSURBVHjaYvz//z8DCDAyMjKQAECKmYAYpPkfzAwQYGEgHTADMTcQcwHxTyD+AsS/YZJMJBrGCDVMds6cOeH+/v5qQDY7igqQc5GdTABwALHyuXPnVgD1/H/16tVOIJ8HZgbYHBIMBPlGDOiy/P9Q8PHjxy1AMVZyDAR5lQeIdb58+fIcZNifP38+Hj16VAckh89AkCvYoBg5fEF8OaABs2Cue/nyZRNMDS4D4QEOxApAzA/VAMLCOTk5ATDDvn//fhk5MnAZCA6jDRs2VG/fvr0PyNYCYl6oVzWeP39+Dmbg7du3/aEOwGsg46pVq4xhmo4cOTIbKAZKFkq7du3qgYkDY3YKevrFGYZr166V/Pv37weY5pqamkwLCwu/X79+fYZFxPLly6XQYwxfpDDeu3fPD2bg58+fXwC9dwzGv3//fiK2zEAo2TC9fv268T8a+Pr162FobDOQaiAIsALT2yaYYchpjlwDGfbs2SMONOgBNEfU4cv3ROeUJ0+eCP/48cMNl8uwGchIQsHAQGyGH2EGAgQYANGzvfuxqx8aAAAAAElFTkSuQmCC');
}

label.chkbox .toggle {
	content: " ";
	width: 30px;
	height: 24px;
	border-radius: 3px;
	display: block;
	position: absolute;
	overflow: hidden;
	z-index: 3;
	left: 3px;
	top: 3px;
	background: transparent;
	box-shadow: 0 2px 5px 1px rgba(0, 0, 0, 0.2), 0 0 1px #ffffff inset;
	transform: translateX(1px);
	-webkit-transition: -webkit-transform 0.3s ease;
	-moz-transition: -moz-transform 0.3s ease;
	-ms-transition: -ms-transform 0.3s ease;
	-o-transition: -o-transform 0.3s ease;
	transition: transform 0.3s ease;
	background-image: linear-gradient(#ffffff 0%, #e7e7e7 100%);
}

label.chkbox .toggle:after {
	content: " ";
	width: 16px;
	height: 16px;
	position: absolute;
	left: 7px;
	top: 4px;
	border-radius: 100%;
	background-image: linear-gradient(#dddddd 0%, #ffffff 100%);
	box-shadow: 0 0 4px rgba(255, 255, 255, 0.8);
}

label.chkbox.on {
	background-color: #05abe0;
}

label.chkbox.on .toggle {
	transform: translateX(31px);
}

label.chkbox.focus {
	outline: 0;
	box-shadow: 0 1px 15px rgba(0, 0, 0, 0.1) inset, 0 1px 4px
		rgba(0, 0, 0, 0.1) inset, 1px -1px 2px rgba(0, 0, 0, 0.1), 0 0 8px
		#52a8ec, 0 0 1px 1px rgba(0, 0, 0, 0.75) inset;
}

input[type=checkbox].replaced {
	position: absolute;
	left: -9999em;
}

label {
	height: 30px;
	line-height: 30px;
	margin-right: 20px;
}
</style>

<!-- 增减数目 -->



<!-- Google Fonts-->
<style>
body, html {
	margin: 0;
	width: 100%;
	height: 100%;
	padding: 0;
	background: yellow;
}

.box {
	width: 50%;
	margin-top: 30%;
	margin: auto;
	padding: 28px;
	height: 350px;
	border: 1px #111 solid;
	display: none; /* 默认对话框隐藏 */
}

.box.show {
	display: block;
}

.box input {
	width: 80%;
	font-size: 18px;
	margin-top: 18px;
}

#iframe_content {
	width: 100%;
	height: 90%
}
</style>

</head>
<body>
	<script>
		function update(n, id, mname, mcount, mmoney) {

			if (id == 0) {
				document.getElementById('inputbox').style.display = 'none';
			} else {
			}
			document.getElementById('mid_m').innerText = id;
			document.getElementById('mname_m').value = mname;
			document.getElementById('mmoney_m').value = mmoney;
			document.getElementById('mcount_m').value = mcount;

			document.getElementById('inputbox').style.display = n ? 'block'
					: 'none'; /* 点击按钮打开/关闭 对话框 */

			if (n == 1) {
				$("#page-inner").hide();
			} else {
				$("#page-inner").show();
			}

		}
		function uupdatemedicine() {

			var mid_m = document.getElementById('mid_m').innerText;
			var mname_m = document.getElementById('mname_m').value;
			var mmoney_m = document.getElementById('mmoney_m').value;
			var mcount_m = document.getElementById('mcount_m').value;
			$.ajax({

				data : {
					"mid_m" : mid_m,
					"mname_m" : mname_m,
					"mmoney_m" : mmoney_m,
					"mcount_m" : mcount_m
					
				},

				type : "POST",
				async : false,

				dataType : 'json',

				url : "ajax/uodatemedicine1.mvc",

				success : function(data) {
				
					    setTimeout(function() {
					    	window.location.href="medicineinputandShow.jsp";
					    }, 1000)
					

				},

				error : function(data) {

					alert(data);

				}

			});

		}
		function add(){
			
	
			
			document.getElementById('inputbox2').style.display = 'block';
			
		}
		function addmedicine(){
			
			var name=document.getElementById('mname_m1').value;
			var mmoney=document.getElementById('mmoney_m1').value;
			var count=document.getElementById('mcount_m1').value;
			var mid =document.getElementById('mid_m1').value;
			$.ajax({

				data : {
					
					"mid":mid,
					"name" : name,
					"mmoney" : mmoney,
					"count" : count
					
					
				},

				type : "POST",
				async : false,

				dataType : 'json',

				url : "ajax/addmicine.mvc",

				success : function(data) {
					
					if(data.ISExcist=="yes"){
						alert("该药品已经存在，无权再次添加");
						return ;
					}else{
					    setTimeout(function() {
					    	window.location.href="medicineinputandShow.jsp";
					    }, 1000)
						
					}
				
				
					

				},

				error : function(data) {

					alert("药片编号输入格式不正确");

				}

			});
			
		}
		function close1(){
			document.getElementById('inputbox2').style.display = 'none';
			
			
		}
	</script>




	<div id='inputbox' class="box" style="width: 100%; height: 100%">
		<h id="hid"></h>

		<label>药品编号：</label> <label id="mid_m"></label></br> <label>药品名称：</label> <input
			id="mname_m" /></br> <label>药品单价：</label> <input id="mmoney_m" type="number" /></br> <label>药品数量：</label>
		<input id="mcount_m" type="number" /></br>
		<button id="uupdatemedicine" onclick="uupdatemedicine();">提交修改</button>
		<a onclick="update(0,0);">关闭</a>
	</div>
	
	<div id='inputbox2' class="box" style="width: 100%; height: 100%">
		<h id="hid"></h>
            <label>药品编号：</label> <input id="mid_m1" type="text"/></br>
	       <label>药品名称：</label> <input
			id="mname_m1" /></br> <label>药品单价：</label> <input id="mmoney_m1" type="number" /></br> <label>药品数量：</label>
		<input id="mcount_m1" type="number" /></br>
		<button id="uupdatemedicine" onclick="addmedicine();">新药品录入信息</button>
		<a onclick="close1();">关闭</a>
	</div>


	<div id="page-inner" style="width: 100%; height: 100%">

		<div class="row" style="width: 100%; height: 100%">
			<div class="col-md-12" style="width: 100%; height: 100%">
				<!-- Advanced Tables -->
				<div class="card" style="width: 100%; height: 100%"">
					<div class="card-action">选择药品进行编辑</div>
					<div class="card-content" style="width: 100%; height: 100%">
						<div class="table-responsive" style="width: 100%; height: 100%">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example" style="width: 100%; height: 100%">
								<thead>
									<tr>
										<th>药品编号</th>
										<th>药品名称</th>
										<th>现有数量</th>

										<th>单价</th>
										<th>修改</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${sessionScope.medicineList}" var="medicien">

										<tr class="odd gradeX">

											<td id="mid" +${medicien.mid}>${medicien.mid}</td>
											<td id="mname" +${medicien.mid}>${medicien.mname}</td>
											<td id="mcount" +${medicien.mid}>${medicien.mcount}</td>
											<td id="mmoney" +${medicien.mid}>${medicien.mmoney}</td>

											<td
												onclick="update(1,'${medicien.mid}','${medicien.mname}','${medicien.mcount}','${medicien.mmoney}');">编辑药品</td>



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
		<button onclick="add();">添加新药品</button>
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
	<script src="assets/js/dataTables/jquery.dataTables5.js"></script>
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






































