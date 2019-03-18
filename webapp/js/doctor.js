/**
 * 
 */

$(document)
		.ready(
				function() {
					document
							.getElementById("showInfoAppoint")
							.addEventListener(
									"click",
									function() {
										$
												.ajax({

													type : "POST",
													async : false,

													dataType : 'json',

													url : "ajax/showInfoAppoint.mvc",

													success : function(data) {
														if (data.IsGetAppointInfoSuccess == "true") {
															document
																	.getElementById("iframe_content").src = "appointinfo.jsp";
														} else {
															alert("获取信息列表失败");

														}
														// document.getElementById("iframe_content").src
														// =
														// "uploadphoto.jsp";

													},

													error : function(data) {
														alert(data);
														alert("请稍后再试");

													}

												});

									
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
														alert("qqqqqqqqshibai");
													}
												});

									}, false);

					// ========加载上传照片页面
					document
							.getElementById("uploadImage")
							.addEventListener(
									"click",
									function() {

										document
												.getElementById("iframe_content").src = "uploadphoto.jsp";

									}, false);
					// ===================录入病人检查结果=====
					document
							.getElementById("inputCheckResoult")
							.addEventListener(
									"click",
									function() {
									
										$
												.ajax({
													data : {
														"type" : "showgivenmoneybutnotcheck"
													},
													type : "POST",
													async : false,

													dataType : 'json',

													url : "ajax/inputCheckResoult.mvc",

													success : function(data) {
														if (data.IsBoss == "yes") {
															document
																	.getElementById("iframe_content").src = "showgivenmoneybutnotcheck.jsp";
														} else {
															alert("没权限");
														}

													},

													error : function(data) {
														alert(data);
														alert("请稍后再试");

													}

												});

									}, false);
					// =====显示所有挂过号交过钱的病人========

					document
							.getElementById("showallpationgivemoney")
							.addEventListener(
									"click",
									function() {
									
										$
												.ajax({

													type : "POST",
													async : false,

													dataType : 'json',

													url : "ajax/showallpationgivemoney.mvc",

													success : function(data) {

														document
																.getElementById("iframe_content").src = "moneytype1.jsp";

													},

													error : function(data) {
														alert(data);
														alert("请稍后再试");

													}

												});
										$
												.ajax({

													data : {

													},

													type : "POST",
													async : true,

													dataType : 'json',

													url : "ajax/getEachThing.mvc",
													success : function(data) {

														if (data.GetEveryThingListIsSuccess == "true") {

														} else {
															alert("获取列表失败");
														}

													},
													error : function(data) {
														alert("qqqqqqqqshibai");
													}
												});

									}, false);

					// 办理出院

					document
							.getElementById("showallhomposital")
							.addEventListener(
									"click",
									function() {
										
										$
												.ajax({

													type : "POST",
													async : false,

													dataType : 'json',

													url : "ajax/showallhomposital.mvc",

													success : function(data) {

														document
																.getElementById("iframe_content").src = "showonlyhomhospital.jsp";

													},

													error : function(data) {
														alert(data);
														alert("请稍后再试");

													}

												});

									}, false);
					// 登记无偿献血记录
					document
							.getElementById("inputBlood")
							.addEventListener(  
									"click",
									function() {
										$
										.ajax({

											type : "POST",
											async : false,

											dataType : 'json',

											url : "ajax/showbloodhistory.mvc",

											success : function(data) {
												if(data.isBoss=="yes"){
													setTimeout(
											   				function() {
																document
																		.getElementById("iframe_content").src = "inputbloold.jsp";

															}, 1000);
												}else{
													alert("沒有权限");
													
													
												}
										         
												

											},

											error : function(data) {
												alert(data);
												alert("请稍后再试");

											}

										});

							}, false);

						

					// 展示个人信息
					document
							.getElementById("showinfoselef")
							.addEventListener(
									"click",
									function() {
										document
												.getElementById("iframe_content").src = "showinfoself.jsp";

									}, false);

					// 修改密码

					document
							.getElementById("updatepassword")
							.addEventListener(
									"click",
									function() {
										document
												.getElementById("iframe_content").src = "updatepassword.jsp";

									}, false);
					// 修改权限
					document
							.getElementById("changeGrand")
							.addEventListener(
									"click",
									function() {

										$
												.ajax({

													type : "POST",
													async : false,

													dataType : 'json',

													url : "ajax/changeGrand.mvc",

													success : function(data) {
														if (data.isBoos == "yes") {
															setTimeout(
																	function() {
																		document
																				.getElementById("iframe_content").src = "doctorlistneedjudge.jsp";

																	}, 1000);
														} else {
															alert("您没有该权限");
														}

													},

													error : function(data) {
														alert(data);
														alert("请稍后再试");

													}

												});

									}, false);
					//搜索以及发送邮件
					
					document
					.getElementById("serarchandemail")
					.addEventListener(
							"click",
							function() {

								$
										.ajax({

											type : "POST",
											async : false,

											dataType : 'json',

											url : "ajax/serarchandemail.mvc",

											success : function(data) {
												if (data.isBoos == "yes") {
													setTimeout(
															function() {
																document
																		.getElementById("iframe_content").src = "alluserlistandemail.jsp";

															}, 1000);
												} else {
													alert("您没有该权限");
												}

											},

											error : function(data) {
												alert(data);
												alert("请稍后再试");

											}

										});

							}, false);
					
					
					document
					.getElementById("showMedicineandinput")
					.addEventListener(
							"click",
							function() {

								$
										.ajax({

											type : "POST",
											async : false,

											dataType : 'json',

											url : "ajax/getMedicineInfo.mvc",

											success : function(data) {
												if (data.isBoos == "yes") {
										         	setTimeout(
											   				function() {
																document
																		.getElementById("iframe_content").src = "medicineinputandShow.jsp";

															}, 1000);
												} else {
													alert("您没有该权限");
												}

											},

											error : function(data) {
												alert(data);
												alert("请稍后再试");

											}

										});

							}, false);
				document
					.getElementById("showbloodhistory")
					.addEventListener(
							"click",
							function() {

								$
										.ajax({

											type : "POST",
											async : false,

											dataType : 'json',

											url : "ajax/showbloodhistorylist.mvc",

											success : function(data) {
												
										         	setTimeout(
											   				function() {
																document
																		.getElementById("iframe_content").src = "showbloodlist.jsp";

															}, 1000);
			
											},

											error : function(data) {
												alert(data);
												alert("请稍后再试");

											}


										});

							}, false);
										document
										.getElementById("useBlood")
										.addEventListener(
												"click",
												function() {

													$
															.ajax({

																type : "POST",
																async : false,

																dataType : 'json',

																url : "ajax/showbloodhistory.mvc",

																success : function(data) {
																	if(data.isBoss=="yes"){
																		setTimeout(
																   				function() {
																					document
																							.getElementById("iframe_content").src = "useblood.jsp";

																				}, 1000);
																	}else{
																		alert("沒有权限");
																		
																		
																	}
															         
																	

																},

																error : function(data) {
																	alert(data);
																	alert("请稍后再试");

																}

															});

												}, false);

				});
