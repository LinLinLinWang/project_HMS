<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="js/jquery.js"></script>
<script src="js/jquery-labelauty.js"></script>
<script>
$(function() {
		$(':input').labelauty();
		
	}); 
 <!--获取当前所选医生-->
	function turn_map_docotorlist(officeId){
	 
     
		 $.ajax({ 

			    data:{"officeId":officeId
			    
			     },
			  

			    type:"POST", 
			    async: false,

			    dataType: 'json',

			    url:"ajax/getDoctorList.mvc", 

			    success:function(data){ 
			    	 window.location.href="doctorlist.jsp?officeId="+officeId;   
			    },

			     error:function(data){ 

			        alert("该科室暂未有人员编制"); 

			    }

			    }); 
		 
    
      
    	

	}
</script>
<link rel="stylesheet" href="css/jquery-labelauty.css">
<title>Insert title here</title>
<style>
ul {
	list-style-type: none;
}

li {
	display: inline-block;
}

li {
	margin: 10px 0;
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
}

#doctor_show li div {
	margin: 0 auto;
}
</style>

</head>
<body>
	<center>
		<form action="#" method="post">


			<table>
				<!--当前选择您的科室-->
				<h3>选择预约科室</h3>
				<ul class="dowebok">
					<c:forEach items="${sessionScope.officeList}" var="office">
						<li ><input onclick="turn_map_docotorlist(${office.dofficeld})"
							type="radio" name="office" value="${office.dofficeld}"
							data-labelauty="${office.dofficeName} "></li>
					</c:forEach>


				</ul>

			</table>

		</form>
	</center>


</body>

</html>