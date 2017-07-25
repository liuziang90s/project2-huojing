<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>部门操作员</title>
	<script type="text/javascript" src="link/js/jquery-easyui/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
   <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<script type="text/javascript">
    	$(function(){
    		var ajaxNew = function(){
    			var url = "/HYTC/menu.do";
					$.ajax({
						type : "post",
						async : false, //同步请求
						url : url,
						dataType:"json",
						timeout:1000,
						success:function(dates){
							var len=dates.length;
							for(var i=0;i<len;i++){
								var title=dates[i].title;
								var len1=dates[i].children.length;
								var children=dates[i].children;
								$("#frame_accordion").append('<div title='+title+' style="overflow:auto;padding:10px;"><ul class="easyui-tree"></ul></div>');
								for(var n=0;n<len1;n++){
									var url_1=children[n].url,
										text=children[n].text;
									$(".easyui-tree").eq(i).append('<li><a href="javascript:void(0)" data-link='+url_1+'>'+text+'</a></li>');
								}
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
    <link rel="stylesheet" type="text/css" href="link/js/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="link/js/jquery-easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="link/css/index.css">
    <script type="text/javascript" src="link/js/jquery-easyui/jquery.easyui.min.js"></script>
   <style>
		th,td{
			white-space:nowrap;
		}
	</style>
</head>
<body class="easyui-layout">
<!-- 上 -->
    <div data-options="region:'north',border:false" class="index-head" >
        <div class="accordion">
            <div class="logo" style="height:100%;">
                <img src="link/img/logo.png" alt="" style="height:100%;">
            </div>
            <div class="quit1">
                <span class="text">您好，${sessionScope.username} &nbsp;|</span>
                <a href="index.jsp">退出<strong>&nbsp;</strong></a>
            </div>
            <div class="quit2">
                <span class="text"><b>工号</b>：${sessionScope.userid}<strong>&nbsp;</strong><strong>&nbsp;</strong><strong>&nbsp;</strong></span>
                <span class="text"><b>姓名</b>：${sessionScope.name} <strong>&nbsp;</strong><strong>&nbsp;</strong><strong>&nbsp;</strong></span>
                <span class="text"><b>所属部门</b><strong>&nbsp;</strong></span>
            </div>
        </div>
    </div>
    <!-- 左（菜单栏） -->
    <div data-options="region:'west',split:true,title:'菜单列表'"style="width: 155px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'center'">
                <div id="frame_accordion" class="easyui-accordion" data-options="fit:true">
                </div>
            </div>
        </div>
    </div>


    <!-- 右 -->
    <div data-options="region:'center'">
        <div class="easyui-tabs" id="frame_tabs" style="overflow: hidden;background-color: #f3f3f3;"
             data-options="fit:true,border:false,plain:true">
            <div title="首页" style="overflow: hidden;">
            	<iframe scrolling="auto" frameborder="0"  src="link/page/ditu-jing.html" style="width:100%;height:99%;"></iframe>
            </div>
        </div>
    </div>
<!-- 下 -->
<!--<div data-options="region:'west',split:true,title:'菜单列表'" style="width: 155px;">-->
    <div data-options="region:'south',split:true,title:'菜单列表'" style="height: 100px; background-color: #f3f3f3;">
		<table class="table table-bordered table-hover">
		    <thead id="thead">
		    </thead>
		    <tbody id="contents">
		    <!-- 报警信息 详细展示区 -->
		    </tbody>
		</table>
    </div>
    <!-- 报警确认 处理表单 --> 
    <form id="form-warning" style="display:none;" action="" method="">
    	<input type="text" name="" value="" />
    </form>
    </body>
    <script type="text/javascript">
    // 预警 报警 详细页
    $(function(){
    	fn();
    	setInterval(function(){ fn() },200000);
    	 function fn(){
    			var url=window.location.href;
    	        $.ajax({
    	            type: 'post',
    	            async: 'false',
    				dataType:"json",
					data: {"num":"2"},
    				url : ,
    	            beforeSend: function (xhr) {
    	                xhr.setRequestHeader("X-Custom-Header1", "Bar");
    	            },
    	            success: function(lnglats){
    	       		 $("#contents").children().remove();
    	                for(var i = 0; i < lnglats.length; i++){
    	                	// 判断是 2报警 还是 1预警
    	                	if (lnglats[i][2].state!=""){
    	                		$("#thead").html("");
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
    	                        						"</td><td><a class='warning' href='javascript:void(0)'> 确认 </a><a class='warn-img' href='link/page/img.jsp?sxtid="+lnglats[i][2].sxtid+"' target='_blank'>图片</a><td>"
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
    	                        						"</td><td><a class=\''warning' href=\''javascript:void(0)'> 确认 </a><a class='warn-img' href='link/page/img.jsp?sxtid="+lnglats[i][2].sxtid+"' target='_blank'>图片</a><td>"
    	                        						);
    	                        	
    	                        	
    	                        }
    	                       
    	                	}
    	                }
    	                $(".warning").click(function(){
    	              	  alert(22);
    	              	});
    	            }
    	        })
    	    };
    });
    
    // 主页树形菜单
        $(function () {
            $('#frame_accordion ul li a').bind("click", function () {
                var title = $(this).text();
                var url = $(this).attr('data-link');
                openMenuTow(title, url);
            });
        })

        function openMenuTow(node, url) {
            //树型菜单的名字
            var exist_tab = $('#frame_tabs').tabs('getTab', node);
            //判断是否已经打开该选项卡
            if (exist_tab) {
                $('#frame_tabs').tabs('select', node);
                return;
            } else {
                var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:99%;"></iframe>';
                $('#frame_tabs').tabs('add', {
                    'id': 'tab',
                    title: node,
                    fit: true,
                    content: content,
                    closable: true,
                });
            }
        }

    </script>
</html>