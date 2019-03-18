<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="margin:0;text-align:center">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/ycbootstrap.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">

<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/iscroll-zoom.js" type="text/javascript" charset="utf-8"></script>
<script src="js/hammer.js" type="text/javascript" charset="utf-8"></script>
<script src="js/lrz.all.bundle.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.photoClip.min.js" type="text/javascript" charset="utf-8"></script>

</head>
<body >
<div class="yc-upload-wrap" style="margin: 0 auto; width:100%;">
	<div class="yc-upload-box" style="margin: 0 auto;width:100%;">
		<div class="container" style="margin: 0 auto;width:100%;">
			<div class="row" style="margin: 0 auto;width:100%;">
				<div class="col-md-12 col-sm-12 col-xs-12" style="margin:0 auto;width:100%;">
					
					<div class="ycupload-mainbox" style="margin: 0 auto;width:100%;">
						<div class="ycupload-main1" style="overflow:hidden;margin:0 auto;width:100%;">
							<span style="color:#ff5a5a;font-size:14px;line-height:60px;font-weight:900;">
								&middot;
							</span>
							<span style="color:#333;font-size:16px;line-height:60px;">
								上传封面
							</span>
						</div>
						<div class="ycupload-line" style="margin:0 auto;width:100%;"></div>
						<div style="height:30px;margin:0 auto;width:100%;"></div>
						<div  style="min-height:1px; margin:0 auto;width:100%;">
							<div class="container" style="margin:0 auto;width:100%;" >
								<div class="row" style="margin:0 auto;width:100%;">
										<!--<a href="javascript:void(0);" class="cover-uploadBtn">
											<img src="img/yc_uploadimg_06.png">
											<div id="clipArea"></div>
											<input type="file" id="file">
											<button id="clipBtn">截取</button>
										</a>
										<div id="view"></div>-->
										<div style="min-height:1px;line-height:160px;position:relative;margin:0 auto;">
											<div class="cover-wrap" style="display:none;position:fixed;left:0;top:0;width:100%;height:100%;background: rgba(0, 0, 0, 0.4);z-index: 10000000;text-align:center;">	
												<div class="" style="width:100%;height:600px;margin:0 auto;background-color:#FFFFFF;overflow: hidden;border-radius:4px;">
													<div id="clipArea" style="margin:10px;height:420px;"></div>
													<div class="" style="height:56px;line-height:36px;text-align: center;padding-top:8px;">
														<button id="clipBtn" style="width:120px;height: 36px;border-radius: 4px;background-color:#ff8a00;color: #FFFFFF;font-size: 14px;text-align: center;line-height: 36px;outline: none;">保存封面</button>
													</div>
												</div>
											</div>
											<div id="view"  style="width:214px;height:160.5px;margin:0 auto;" title="请上传 428*321 的封面图片"></div>
											<div style="height:10px;"></div>
											<div class="" style="width:140px;height:32px;border-radius: 4px;background-color:#ff8a00;color: #FFFFFF;font-size: 14px;line-height:32px;outline:none;margin:0 auto;position:relative;">
												点击上传封面图
												<input type="file" id="file" style="cursor:pointer;opacity:0;filter:alpha(opacity=0);width:100%;height:100%;position:absolute;top:0;left:0;">
											 
											</div>
									
										</div>
											   <button onclick="ddd();">提交</button>	
										
									</div>
								</div>
							</div>
							
						</div>
						<div style="height:25px;"></div>
					</div>
					
				</div>
			</div>
		</div>
		
	</div>
</div>
<script type="text/javascript">

//上传封面
//document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
var clipArea = new bjj.PhotoClip("#clipArea", {
	size: [428, 321], // 截取框的宽和高组成的数组。默认值为[260,260]
	outputSize: [428, 321], // 输出图像的宽和高组成的数组。默认值为[0,0]，表示输出图像原始大小
	//outputType: "jpg", // 指定输出图片的类型，可选 "jpg" 和 "png" 两种种类型，默认为 "jpg"
	file: "#file", // 上传图片的<input type="file">控件的选择器或者DOM对象
	view: "#view", // 显示截取后图像的容器的选择器或者DOM对象
	ok: "#clipBtn",   // 确认截图按钮的选择器或者DOM对象
	loadStart: function() {
		// 开始加载的回调函数。this指向 fileReader 对象，并将正在加载的 file 对象作为参数传入
		$('.cover-wrap').fadeIn();
		console.log("照片读取中");
	},
	loadComplete: function() {
		 // 加载完成的回调函数。this指向图片对象，并将图片地址作为参数传入
		console.log("照片读取完成");
	},
	//loadError: function(event) {}, // 加载失败的回调函数。this指向 fileReader 对象，并将错误事件的 event 对象作为参数传入
	clipFinish: function(dataURL) {
		 // 裁剪完成的回调函数。this指向图片对象，会将裁剪出的图像数据DataURL作为参数传入
		$('.cover-wrap').fadeOut();
		$('#view').css('background-size','100% 100%');
		 
	
	}
});
      function ddd(){
    	  var avatar = $("#view").css("backgroundImage");
    	  if(null==avatar){
    		  alert("请选择照片");
    		  return;
    	  }
    	  $.ajax({ 

  		    data:{"image":avatar
  		    
  		    
  		    },
  		  

  		    type:"POST", 
  		    async: false,

  		    dataType: 'json',

  		    url:"ajax/uploadimage.mvc", 

  		    success:function(data){ 
  	  		   window.location.href="test.jsp";
                   
  		    },

  		     error:function(data){ 
  		    	  window.location.href="test.jsp";

  		    }

  		    }); 
  	 
         }
  
</script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>请先选择图片再进行上传</p>

</div>
</body>
</html>