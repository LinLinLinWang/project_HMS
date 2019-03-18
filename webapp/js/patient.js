/**
 * 
 */

$(document)
		.ready(
				function() {
					// 预约d点击事件
					// 查询所有医生信息并跳转页面
					document
							.getElementById("appoint_doctor")
							.addEventListener(
									"click",
									function() {
										// 执行

										document
												.getElementById("iframe_content").src = "appointdoctor.jsp";
									});

					document
							.getElementById("paymoney")
							.addEventListener(
									"click",
									function() {
										// 执行
										$
												.ajax({

													data : {

													},

													type : "POST",
													async : true,

													dataType : 'json',

													url : "ajax/needmoney.mvc",
													success : function(data) {
														document
																.getElementById("iframe_content").src = "needmoneycheck.jsp";
													},
													error : function(data) {
														alert("稍后再试");
													}
												});

									});

					// 打印账单信息

					document
							.getElementById("moneylist")
							.addEventListener(
									"click",
									function() {
								
										$
												.ajax({

													type : "POST",
													async : false,

													dataType : 'json',

													url : "ajax/showcountlist.mvc",

													success : function(data) {

														document
																.getElementById("iframe_content").src = "count_list.jsp";

													},

													error : function(data) {
													
														alert("系统问题或者还未有数据");

													}

												});

									}, false);
					// =====================================================================================
				       //展示个人信息
					document
					.getElementById("showinfoselef")
					.addEventListener(
							"click",
							function() {
								document
								.getElementById("iframe_content").src = "showinfoself.jsp";

							}, false);
					
					//修改密码
					
					document
					.getElementById("updatepassword")
					.addEventListener(
							"click",
							function() {
								document
								.getElementById("iframe_content").src = "updatepassword.jsp";

							}, false);
					//医师建议
					document
					.getElementById("print_chu")
					.addEventListener(
							"click",
							function() {
								document
								.getElementById("iframe_content").src = "registe_list_self.jsp";

							}, false);
					
					//展现个人信息
//					document
//					.getElementById("showselfallinfo")
//					.addEventListener(
//							"click",
//							function() {
//								document
//								.getElementById("iframe_content").src = ".jsp";
//
//							}, false);
					//
//					
					
				
					
				}

		);


