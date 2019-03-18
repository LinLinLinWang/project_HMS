<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

	function msgbox(n,v) {
	
		document.getElementById("doc_choose_registe").innerHTML=v;
		
		document.getElementById('inputbox').style.display = n ? 'block'
				: 'none'; /* 点击按钮打开/关闭 对话框 */
		/* 点击按钮打开/关闭 信息栏*/
		if (n == 1) {
			$(".showinfo").hide();
		} else {
			$(".showinfo").show();
		}

	}
	function appointdoctor() {
	     
		 var date=document.getElementById("datetime1").value;
		 
		 var doctorId=document.getElementById("doc_choose_registe").innerHTML;
		
		 var time1=document.getElementById("time1").value;
		 if(date==""||time1==""){
			 alert("请仔细选择时间");
			 return;}
		 $.ajax({ 

			    data:{"date":date,"doctorId":doctorId,"time1":time1
			    },
			  

			    type:"POST", 
			    async: false,

			    dataType: 'json',

			    url:"ajax/appointment.mvc", 

			    success:function(data){ 
				  if(data.IsInThree=="true"){

                         if(data.ISWork=="true"){
                               if(data.IsSuccess=="true"){
                                  window.location.href="search.html"}else{
                                	   alert("预约失败");  }
                             }else{
                            	 alert("人家没上班");
                                 }

					  }else{
alert("只能预约今天到未来两天");
					  }
	                  
			    },

			     error:function(data){ 

			    	    alert("后台故障");

			    }

			    }); 
	}
</script>
<style>
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

input.labelauty+label {
	font: 12px "Microsoft Yahei";
}

#doctor_main {
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

#doctor_info_div {
	margin: 0 auto;
}

#doctor_show li {
	margin-left: 20px;
	float: left;
	list-style-type:none; 
}

#doctor_show li div {
	margin: 0 auto;
}
</style>

</head>
<body>
	<%
		//获取选定科室
		String d = request.getParameter("officeId");
		int officeId = Integer.parseInt(d);
		
		pageContext.setAttribute("officeId", officeId);
		//用request得到
	%>
	<div id="doctor_main">

		<div id="doctor_info_div">
			<ul id="doctor_show">
				<c:forEach items="${sessionScope.doctorlist_officeid}" var="doctor">

					<c:if test="${doctor.office.dofficeld==officeId}">
						<li>
							<div class="showinfo" style="text-align: center; margin: 0 auto;">
								<div style="margin: 0 auto;">
									<img style="width: auto; height: 400px;"
										src="../dede/images/doctorimg/${doctor.user.uregisteId}.png" onerror="this.src='./images/doctorimg/nothing.gif'"/>
								</div>
								<div id="imag_down" style="float: left;">
									<ul>
										<li><h>医生名字：${doctor.user.uname}</h></li>
										<li><h>医生年龄：${doctor.user.uage}</h></li>


									</ul>
									<ul>
										<li><h>医生职称：：${doctor.entitler.dentitleName} 医生注册号：${doctor.user.uregisteId}</h></li>
										<li onclick="msgbox(1,'${doctor.user.uregisteId}')"><h>预约</h></li>


									</ul>


								</div>
							</div>
						</li>
					</c:if>



				</c:forEach>







			</ul>


		</div>
	</div>

	<!-- 点击弹出输入框 -->
	<div id='inputbox' class="box">
		<h id="doc_choose_registe"></h>
		<h>请选择预约时间</h>
		<input type="date" id="datetime1" /> <input type="time" id="time1" />
		<a onclick="msgbox(0); return false;">关闭</a> <a
			onclick="appointdoctor();">确认</a>
	</div>
</body>
</html>
