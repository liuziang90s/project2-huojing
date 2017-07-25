<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
	<table class="table table-bordered table-hover">
		    <thead id="thead">
		    </thead>
		    <tbody id="contents">
		    <!-- 报警信息 详细展示区 -->
		    </tbody>
	</table>
	<!-- 报警确认 处理表单 --> 
    <form id="form-warning" style="display:none;" action="" method="">
    	<input type="text" name="" value="" />
    </form>
    <script type="text/javascript">
    $(function(){
    	fn();
    	setInterval(function(){ fn() },2000);
    	 function fn(){
    			var url=window.location.href;
    	        $.ajax({
    	            type: 'post',
    	            async: 'false',
    				dataType:"json",
    				data:{"num":"2"},
    				url : url.substring(0,url.indexOf("HYTC")+5)+"Vtcbj.do",
    	            beforeSend: function (xhr) {
    	                xhr.setRequestHeader("X-Custom-Header1", "Bar");
    	            },
    	            success: function(lnglats){
    	             
    	       		 $("#contents").children().remove();
    	                for(var i = 0; i < lnglats.length; i++){
    	                	$("#thead").children().remove();
    	                	// 判断是 2报警 还是 1预警
    	                	//console.log(lnglats[i][2]);
    	                	if (lnglats[i][2].state!=""){
    	                		$("#thead").append("<tr></tr>");
    	                		$("#thead tr").append("<th>警次</th><th>经度</th><th>纬度</th><th>公司名称</th><th>公司地址</th><th>公司电话</th><th>厂区名称</th><th>厂区地址</th><th>厂区电话</th><th>火眼名称</th><th>火眼地址</th><th>摄像头名称</th><th>摄像头地址</th><th>报警时间</th><th>报警上传时间</th><th>操作</th>");
    	                        if (lnglats[i][2].state==1){
    	                        	$("#contents").prepend("<tr><tr>");
    	                        	$("#contents tr").eq(i).append(
    	                        						"<td>"+i+
    	                        						"</td><td>"+lnglats[i][2].lat+
    	                        						"</td><td>"+lnglats[i][2].lon+
    	                        						"</td><td>"+lnglats[i][2].customername+
    	                        						"</td><td>"+lnglats[i][2].customeradd+
    	                        						"</td><td>"+lnglats[i][2].customertel+
    	                        						"</td><td>"+lnglats[i][2].cqname+
    	                        						"</td><td>"+lnglats[i][2].cqadd+
    	                        						"</td><td>"+lnglats[i][2].cqtel+
    	                        						"</td><td>"+lnglats[i][2].hyname+
    	                        						"</td><td>"+lnglats[i][2].hyadd+
    	                        						"</td><td>"+lnglats[i][2].sxtname+
    	                        						"</td><td>"+lnglats[i][2].sxtadd+
    	                        						"</td><td>"+lnglats[i][2].uptime+
    	                        						"</td><td>"+lnglats[i][2].dotime+
    	                        						"</td><td><a class='warning' href='javascript:void(0)'> 确认 </a><a href='img.jsp?sxtid="+lnglats[i][2].sxtid+"'>图片</a><td>"
    	                        						
    	                        						);
    	                        	
    	                        }
    	                        if (lnglats[i][2].state ==2){
    	                        	$("#contents").prepend("<tr><tr>");
    	                        	$("#contents tr").eq(i).append(
    	                        						"<td>"+i+
    	                        						"</td><td>"+lnglats[i][2].lat+
    	                        						"</td><td>"+lnglats[i][2].lon+
    	                        						"</td><td>"+lnglats[i][2].customername+
    	                        						"</td><td>"+lnglats[i][2].customeradd+
    	                        						"</td><td>"+lnglats[i][2].customertel+
    	                        						"</td><td>"+lnglats[i][2].cqname+
    	                        						"</td><td>"+lnglats[i][2].cqadd+
    	                        						"</td><td>"+lnglats[i][2].cqtel+
    	                        						"</td><td>"+lnglats[i][2].hyname+
    	                        						"</td><td>"+lnglats[i][2].hyadd+
    	                        						"</td><td>"+lnglats[i][2].sxtname+
    	                        						"</td><td>"+lnglats[i][2].sxtadd+
    	                        						"</td><td>"+lnglats[i][2].uptime+
    	                        						"</td><td>"+lnglats[i][2].dotime+
    	                        						"</td><td><a class='warning' href='javascript:void(0)'> 确认 </a><a href='img.jsp?sxtid="+lnglats[i][2].sxtid+"'>图片</a><td>"
    	                        						
    	                        						);
    	                        	
    	                        }
    	                	}
    	                }
    	            }
    	        });
    	    }
   
    // 报警确认 处理
    $(".warning").click(function(){
    	
    	alert(6666);
    });
    })
    </script>
</body>
</html>