<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>绑定摄像头</title>
    <script src="link/js/jquery-easyui/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="link/css/fenye.css" >
</head>
<body style="padding: 10px;">
        <div style="margin-bottom:10px;">
        	<div class="sum" style="display:none;">
	            ${requestScope.endpage}
	        </div>
	        <!--从后台得到总页码数-->
	        <div class="current" style="display:none;">
	            ${requestScope.currpage}
	        </div>
            <form  id="hyxt-do" class="form-inline" method="" action="">
                <div class="form-group">
                    <label for="exampleInputName2">摄像头名称：</label>
                    <input type="hidden" name="hyid"  value="${requestScope.hyid}">
                    <input type="hidden" name="cqid"  value="${requestScope.cqid}">
                    <input type="text" name="" class="form-control" id="exampleInputName2">
                </div>
                <div class="form-group" style="margin-left:10px;">
                    <label for="exampleInputEmail2">录像机名称：</label>
                    <input type="text" name="" class="form-control" id="exampleInputEmail2">
                </div>
                <button type="submit" class="btn btn-primary">查询</button>
                <button type="button" class="btn btn-primary" style="float:right" id="many">多选提交</button>
            </form>
        </div>
	<table class="table table-bordered table-hover">
	    <thead>
	    <tr>
	    	<th></th>
	        <th style="display:none">录像机ID</th>
	        <th>录像机名称</th>
	        <th style="display:none">摄像头ID</th>
	        <th>摄像头名称</th>
	        <th>绑定火眼名称</th>
	        <th>通道</th>
	        <th>经度</th>
	        <th>纬度</th>
	        <th>操作</th>
	    </tr>
	    </thead>
	    <tbody>
		<c:if test="${not empty requestScope.Vcq}">
	    <c:forEach items="${requestScope.Vcq}" var="Vcq1" >
	    <tr>
	    		<td><input type="checkbox" class="checkbox" /></td>
	            <c:forEach items="${Vcq1}" var="Vcq2" varStatus="id" begin ="1" end="8">
	                    <c:choose>
		                    <c:when test="${id.index==1 or id.index==3}"><td style="display:none">${Vcq2}</td></c:when>
		                    <c:otherwise><td>${Vcq2}</td></c:otherwise>
	                    </c:choose>
	                    
	            </c:forEach>
		            <td>
		            <a href="javascript:void(0)" class="confirm">绑定</a>
		            </td>
		    </tr>
	    </c:forEach>
	    </c:if>	    
	    </tbody>
	</table>
	
	<!-- 操作表单 多个 提交 -->
		<form id="f-set" action="bangd.do" method="post" style="display: none;" >
			<input name="hyid" value="${requestScope.hyid}">
            <input type="hidden" name="cqid"  value="${requestScope.cqid}">
		</form>
	<!-- 操作表单 单个 提交 --> 
    <form id="form-confirm" action="bangd.do" method="post" style="display: none;">
        <input class="input-bind" type="hidden" name="sxtid">
        <input class="input-hyid" type="hidden" name="hyid" value="${requestScope.hyid}">
        <input type="hidden" name="cqid"  value="${requestScope.cqid}">
        <div id="c-set"></div>
    </form>
	<script type="text/javascript">

	// 操作表单 单个 提交
	$(function(){
		$(".confirm").click(function(){
		        var check=$(this).parent().siblings().eq(0).find("input").prop("checked");
		        var id=$(this).parent().siblings().eq(3).text();
		        if(check == true){
			        $(".input-bind").attr("value", id);
			        $("#form-confirm").submit();
		        }
		});
	})
	//  操作表单 多个 提交
	$(function(){
		$("#many").click(function(){
			$(".checkbox").each(function(i){
				if($(".checkbox").eq(i).prop("checked")==true){
					var sxtid = $(".checkbox").eq(i).parent().siblings().eq(2).text();
					var sxtname = $(".checkbox").eq(i).parent().siblings().eq(3).text();
					console.log(sxtid+","+sxtname)
					$("#f-set").append("<input name='sxtname' value="+sxtname+"> <input name='sxtid' value="+sxtid+">");
					$(".checkbox").eq(i).prop("checked",false);
			        $("#f-set").submit();
				}

		        
			});
		});
	})
	$(function(){
		page();//运行分页
		function page(){
			var sum=parseInt($(".sum").text()),//总页数
				num =parseInt($(".current").text());//当前页码
			var num_my=9,//每页限制显示的页码数量
				num_prev=4,//当前页前面显示的的页码数量
				num_next=4;//当前页后面显示的的页码数量
			var n = sum - num;//总页数与当前页的差值
			var n1=parseInt(num - num_prev);//页码显示行显示的第一个页码
			var	n2=parseInt(num) + parseInt(num_next);//页码显示行显示的最后一个页码
			var n3=parseInt(num+((sum-num)));
			var n4=parseInt(sum-num);
			//如果总页码小于每页限制显示的数量
			if(sum<=num_my){
				for (var i=1;i<=sum;i++) {
					$(".fy").append("<li><a href='javascript:void(0)'>"+i+"</a></li>");
					
				}
			}else{//否则则执行以下代码
				//如果总页数与当前页的差值大于或等于每页限制数
				if(num<=num_my){
						for (var i=1;i<=num_my;i++) {
							$('.fy').append('<li><a href="javascript:void(0)">'+i+'</a></li>');
						}
					
				}else{
						if(n4>=num_next){
							for(var i=n1;i <= n2;i++){
								$(".fy").append("<li><a href='javascript:void(0)'>"+i+"</a></li>");
							}
						}else{
							for (var i=n1;i<=n3;i++) {
								$(".fy").append("<li><a href='javascript:void(0)'>"+i+"</a></li>");
						}
					}
			}}
			if(num==sum){//当当前页为组后一页，禁用“上一页”按钮
					$(".next-page").addClass("disabled");
				}
			if(num==1){//当当前页为组后一页，禁用“上一页”按钮
					$(".prev-page").addClass("disabled");
				}
			//当前页码样式设置
			$(".fy a").each(function(){
				var txt =parseInt($(this).text());//页码存储文本 
				if(txt==num){
				$(this).addClass("active");
				}
			});
			$(".fy li").addClass("fenye-li");
			$(".fy a").addClass("fenye-a");
			if(num !=1 || num != sum){
			$(".prev-page").click(function(){
			//点击上一页分页提交表单跳转
			
				var txt_page_prev=num - 1;
				$("#currpage").val(txt_page_prev);
				$("#hyxt-do").submit();//提交表单
				});	
				$(".next-page").click(function(){
				//点击下一页分页提交表单跳转
				var txt_page_next=num + 1;
				$("#currpage").val(txt_page_next);
				$("#hyxt-do").submit();//提交表单
				});	
			}
			
		}
		
		$(".fy a").click(function(){
			//点击分页提交表单跳转
			var txt_page=$(this).text();//获取点击第几页
			$("#currpage").val(txt_page);
			$("#hyxt-do").submit();//提交表单
		});
		
	})
	</script>
</body>
</html>