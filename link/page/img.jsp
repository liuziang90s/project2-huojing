<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>warning图片</title>
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<style type="text/css">
		img{
			height: 360px;
			width:  360px;
		}
		#warning-sxt-id{
			display:none;
		}
	</style>
	</head>
	<body>
	<span id="warning-sxt-id">
		<% String sxtid= request.getParameter("sxtid");%>
		<%=sxtid %>
	</span>
	<div id="warning-img">
	</div>
		<script type="text/javascript">
    	$(function(){
    		var ajaxNew = function(){
    			var id=$("#warning-sxt-id").text();
    			var url = window.location.href;
					$.ajax({
						type : "post",
						async : false, //同步请求
						url : url.substring(0,url.indexOf("HYTC")+5)+"Vtcbj.do",
						data: {"num":"4","sxtid":id},
						dataType:"json",
						timeout:1000,
						success:function(dates){
							var len=dates.length;
							for(var i=0;i<len;i++){
								var url=dates[i][1];
								console.log(dates);
								$("#warning-img").append('<img src='+url+' class="img-thumbnail">');
							}
						},
						error: function() {
						// alert("失败，请稍后再试！");
						}
					});
    		}
    		ajaxNew();
    	})
    </script>
	</body>
</html>