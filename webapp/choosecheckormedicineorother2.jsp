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
<script>
	function openorclose(n, hid) {
		
		if (n == 1) {
			//获取时间
			var date = document.getElementById("datetime1").value;

			var time1 = document.getElementById("time1").value;
			if (date == "" || time1 == "") {
				alert("请仔细选择时间");
				return;
			} else {
				
				$.ajax({

					data : {
						"hid" : hid,
						"date" : date,
						"time" : time1

					},

					type : "POST",
					async : true,

					dataType : 'json',

					url : "ajax/choosehomehospital.mvc",
					success : function(data) {
						if (data.isOk == "yes") {
                                window.location.href="appointinfo.jsp";
						} else {
							alert("床位时间只能选择将来三天内");
						}
					},
					error : function(data) {

					}
				});

			}

		} else {
			document.getElementById('inputbox').style.display = 'none';
			
			document.getElementById('page-inner').style.display = 'block';
		}

	}

	$(document).ready(function first() {
		$.ajax({

			data : {

			},

			type : "POST",
			async : false,

			dataType : 'json',

			url : "ajax/getEachThing.mvc",
			success : function(data) {

				if (data.GetEveryThingListIsSuccess == "true") {

				} else {
					alert("获取列表失败");
				}

			},
			error : function(data) {
				alert("稍后重试");
			}
		});

	})

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
<!-- 增减数目 -->

<script>
	function min_1(dd) {
		var first = document.getElementById("first" + dd).innerText;

		var t = $("#text_box" + dd);
		if (parseInt(t.val()) <= 0) {

		} else {

			t.val(parseInt(t.val()) - 1);
			var tol = document.getElementById("tol_" + dd).innerText;

			if (parseInt(tol) <= 0) {
				alert("数目超过限制");
			} else {

				tol = first - parseInt(t.val());

				document.getElementById("tol_" + dd).innerHTML = tol;

			}

		}

		//var pbinfoid = $("#pbinfoid").val();

	}
	function add(dd) {
		var first = document.getElementById("first" + dd).innerText;
		//中间框
		var tol = document.getElementById("tol_" + dd).innerText;
		var t = $("#text_box" + dd);
		if (parseInt(t.val()) == parseInt(first)) {
			alert("数目受限！");

		} else {
			t.val(parseInt(t.val()) + 1);
			tol = first - parseInt(t.val());
			document.getElementById("tol_" + dd).innerHTML = tol;

		}

	}
	function fill_box(dd) {
		var first = document.getElementById("first" + dd).innerText;
		//中间框
		var tol = document.getElementById("tol_" + dd).innerText;
		var t = $("#text_box" + dd);
		if (parseInt(t.val()) < 0) {
			alert("数目不允许负值");
			return;
		}
		if (parseInt(t.val()) > parseInt(first)) {
			alert("数目受限！");
			return;

		} else {

			tol = first - parseInt(t.val());
			document.getElementById("tol_" + dd).innerHTML = tol;

		}

	}

	function getCount(dd) {
		var tol = document.getElementById("tol_" + dd).innerText;

		$("#d" + dd).attr("value", "other" + dd + "count" + tol);
		var now = document.getElementById("d" + dd).value;

	}

	//确认提交按钮
	function submmit(hid) {
	
		
		$.ajax({

			data : {

				"hid" : hid

			},

			type : "POST",
			async : true,

			dataType : 'json',

			url : "ajax/getMedicine.mvc",
			success : function(data) {
				
				setTimeout(function() {
					window.location.href = "needmedicine.jsp?hid=" + hid;
				}, 1);
			},
			error : function(data) {
  alert("稍後重試");
			}
		});

	}
	//每次选东西插数据
	function ajaxCheckOrMedicine(type, mid, hid) {
		if (type == "0") {

			var state = $('label[for=' + 'd' + mid + ']').attr("class");
			
			var a = 1;
			if ("chkbox focus" == state) {

				$.ajax({

					data : {
						"type" : 0,

						"hid" : hid,
						"IsCnacle" : "false",
						"mid" : mid

					},

					type : "POST",
					async : true,

					dataType : 'json',

					url : "ajax/CheckOrMedicine.mvc",
					success : function(data) {
					

					},
					error : function(data) {

					}
				});
			} else {
				
				$.ajax({

					data : {
						"type" : 0,
						"mid" : mid,
						"hid" : hid,
						"IsCnacle" : "true"

					},

					type : "POST",
					async : true,

					dataType : 'json',

					url : "ajax/CheckOrMedicine.mvc",
					success : function(data) {
						

					},
					error : function(data) {

					}
				});

			}

		} else {
			if (type == "2") {
				
				var state = $('label[for=' + 'd' + mid + ']').attr("class");
				

				if ("chkbox focus" == state) {
					var count = document.getElementById("text_box" + mid).value;
					
					$.ajax({

						data : {
							"type" : 2,
							"mid" : mid,
							"hid" : hid,
							"IsCnacle" : "false",
							"namecount" : mid + "count" + count,
							"count" : count

						},

						type : "POST",
						async : true,

						dataType : 'json',

						url : "ajax/CheckOrMedicine.mvc",
						success : function(data) {
							

						},
						error : function(data) {

						}
					});
				} else {
				
					var count = document.getElementById("text_box" + mid).value;
					$.ajax({

						data : {
							"type" : 2,
							"mid" : mid,
							"hid" : hid,
							"IsCnacle" : "true",
							"count" : count

						},

						type : "POST",
						async : true,

						dataType : 'json',

						url : "ajax/CheckOrMedicine.mvc",
						success : function(data) {
						

						},
						error : function(data) {

						}
					});

				}

			} else {
				//插入type为1的
				if (type == "1") {
					
					var state = $('label[for=' + 'd' + mid + ']').attr("class");
				

					if ("chkbox focus" == state) {
						var count = document.getElementById("text_box" + mid).value;
					
						if (mid == 12) {
							
							document.getElementById('inputbox').style.display = 'block';
							/* 点击按钮打开/关闭 对话框 */
							/* 点击按钮打开/关闭 信息栏*/
							document.getElementById('page-inner').style.display = 'none';

						} else {
						}

						$.ajax({

							data : {
								"type" : 1,
								"mid" : mid,
								"hid" : hid,
								"IsCnacle" : "false",
								"namecount" : mid + "count" + count,
								"count" : count

							},

							type : "POST",
							async : true,

							dataType : 'json',

							url : "ajax/CheckOrMedicine.mvc",
							success : function(data) {
							

							},
							error : function(data) {

							}
						});
					} else {
					
						$.ajax({

							data : {
								"type" : 1,
								"mid" : mid,
								"hid" : hid,
								"IsCnacle" : "true"

							},

							type : "POST",
							async : true,

							dataType : 'json',

							url : "ajax/CheckOrMedicine.mvc",
							success : function(data) {
								

							},
							error : function(data) {

							}
						});

					}

				}

			}

		}

	}
</script>
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
	<%
		String hid = request.getParameter("hid");

		pageContext.setAttribute("hid", hid);
	%>

	<!-- 点击弹出输入框 -->
	<div id='inputbox' class="box">
		<h id="doc_choose_registe"></h>
		<h>请选择住院时间</h>
		<input type="date" id="datetime1" /> <input type="time" id="time1" />
		<a onclick="openorclose(0,'${hid}'); return false;">关闭</a> <a
			onclick="openorclose(1,'${hid}');">确认</a>
	</div>
	<div id="page-inner" style="width: 100%; height: 100%">

		<div class="row" style="width: 100%; height: 100%">
			<div class="col-md-12" style="width: 100%; height: 100%">
				<!-- Advanced Tables -->
				<div class="card" style="width: 100%; height: 100%"">
					<div class="card-action">选择药品或者检查</div>
					<div class="card-content" style="width: 100%; height: 100%">
						<div class="table-responsive" style="width: 100%; height: 100%">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example" style="width: 100%; height: 100%">
								<thead>
									<tr>
										<th>物品序号</th>
										<th>物品类别</th>
										<th>名称</th>
										<th>单价</th>
										<th>剩余数量</th>
										<th>选择数量</th>
										<th>选择</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${sessionScope.everthingzlist}" var="thing">

										<tr class="odd gradeX">

											<td>${thing.mid}</td>
											<c:if test="${thing.mtype==0}">
												<td>检查</td>

											</c:if>
											<c:if test="${thing.mtype==1}">
												<td>其他</td>

											</c:if>

											<c:if test="${thing.mtype==2}">
												<td>药品</td>

											</c:if>

											<td>${thing.mname}</td>
											<td>${thing.mmoney}</td>

											<c:if test="${thing.mtype==0}">
												<td style="color: gray">开放时间8:00--9:00</td>

											</c:if>
											<c:if test="${thing.mtype!=0}">
												<c:if test="${thing.mid==12}">
													<h style="display:none" id="first${thing.mid}">${thing.mcount}</h>
													<td style="color: red">床位剩余<h style="color:red"
															id="tol_${thing.mid}">${thing.mcount}</h>个

													</td>

												</c:if>
												<c:if test="${thing.mid!=12}">
													<h style="display:none" id="first${thing.mid}">${thing.mcount}</h>
													<td id="tol_${thing.mid}">${thing.mcount}</td>

												</c:if>

											</c:if>




											<c:if test="${thing.mtype==0}">
												<td>单项检查</td>

											</c:if>
											<c:if test="${thing.mtype!=0}">
												<td><input id="min${thing.mid}" style="width: 30px;"
													name="" type="button" value="-"
													onclick="min_1('${thing.mid}');" /> <input
													id="text_box${thing.mid}" name="goodnum" type="text"
													value="0" style="width: 25px;"
													onblur="fill_box('${thing.mid}');" /> <input
													id="add${thing.mid}" name="" style="width: 30px;"
													type="button" value="+" onclick="add('${thing.mid}');" />
												</td>
											</c:if>




											<c:if test="${thing.mtype==0}">
												<td><input type="checkbox" id="d${thing.mid}"
													value="${thing.mid}"
													onclick="ajaxCheckOrMedicine('${thing.mtype}','${thing.mid}','${hid}')"
													name="chk" /></td>

											</c:if>
											<c:if test="${thing.mtype!=0}">
												<td><input type="checkbox" id="d${thing.mid}"
													onclick="ajaxCheckOrMedicine('${thing.mtype}','${thing.mid}','${hid}')"
													name="chk" /></td>

											</c:if>

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
		<button onclick="submmit('${hid}');">确认</button>
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
	<script src="assets/js/dataTables/jquery.dataTables2.js"></script>
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






































