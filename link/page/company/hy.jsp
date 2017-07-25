<%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri=""%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>火眼系统</title>
    <script src="link/js/jquery-easyui/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="link/css/fenye.css" >
</head>
<body style="padding: 10px;">
<div>
        <div style="margin-bottom:10px;">
	        <div class="sum" style="display:none;">
	            ${requestScope.endpage}
	        </div>
	        <!--从后台得到总页码数-->
	        <div class="current" style="display:none;">
	            ${requestScope.currpage}
	        </div>
			<form id="hyxt-do" class="form-inline" method="post" action="/HYTC/hyxt.do">
				<div class="form-group">
					<label for="exampleInputName2">
						名称：
					</label>
					<input type="hidden" name="forpage" value="web">
                    <input type="hidden" name="method" value="query">
                    <input type="hidden" name="cqid" value="${requestScope.cqid}">
                    <input type="hidden" name="isvalid" value="0">
					<input type="text" name="name" class="form-control" id="exampleInputName2">
					<input type="hidden" name="currpage" id="currpage" value="" />
				</div>
				<div class="form-group" style="margin-left:10px;">
					<label for="exampleInputEmail2">
						地址：
					</label>
					<input type="text" name="address" class="form-control" id="exampleInputEmail2">
				</div>
				<button type="submit" class="btn btn-primary">
					查询
				</button>
			</form>
		</div>
        <div>
			<table class="table table-bordered table-hover">
			    <thead>
			    <tr>
			        <th style="display:none">火眼ID</th>
			        <th>火眼名称</th>
			        <th>火眼简称</th>
			        <th style="display:none">厂区id</th>
			        <th style="display:none">有效性</th>
			        <th>有效性</th>
			        <th>创建时间</th>
			        <th>时间</th>
			        <th>操作</th>
			    </tr>
			    </thead>
			    <tbody>
			    <c:if test="${not empty requestScope.hyxt}" >
				    <c:forEach items="${requestScope.hyxt}" var="hyxt1" >
				    <tr>
				            <c:forEach items="${hyxt1}" var="hyxt2" varStatus="id"  begin ="2" end="12">
				             <c:choose>
		                             <c:when test="${id.index==2 or id.index==5}"><td style="display:none">${hyxt2}</td></c:when>
		                             <c:when test="${id.index==6}"><td style="display:none">${hyxt2}</td><td>${hyxt2=="0"?"无效":"有效"}</td></c:when>
		                             <c:otherwise><td>${hyxt2}</td></c:otherwise>
	                              </c:choose>
				                    
				            </c:forEach>
				            <td>
					            <a class="delete" href="javascript:void(0)" data-toggle="modal" data-target="#myModal">删除</a> 
					            <a class="weihu" href="javascript:void(0)">维护</a>
					            <a class="bind-sxt" href="javascript:void(0)">绑定</a>
				            </td>
				    </tr>
				    </c:forEach>
			    </c:if>
			    </tbody>
			</table>
			<nav aria-label="Page navigation">
				  <ul class="pagination pagination-lg">
				    <li>
				      <a href="javascript:void(0)" aria-label="Previous" class="prev-page">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="fy"></li>
				    <li>
				      <a href="javascript:void(0)" aria-label="Next" class="next-page">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
			</nav>
		</div>
	</div>
<!--莫态框之删除-->
	<div id="delete-div">
	</div>
    <!--用户维护表单提交参数开始   -->
    <form id="user-update" action="/HYTC/param.do" method="post" style="display: none;">
        <div id="c4-set"></div>
        <div class="">
            <input class="register_input" type="hidden" name="forpage" value="hyxt-wh">
            <input class="register_input" type="hidden" name="cqid" value="${requestScope.cqid}">
        </div>
    </form>
    <!--用户维护表单提交参数结束   --> 
    
    	<!--摄像头绑定表单提交参数开始   -->
    <form id="form-bind" action="/HYTC/Vcustomer.do" method="get" style="display: none;">
        <input  type="hidden" name="num" value="2">
        <input class="input-bind" type="hidden" name="cqid">
        <input class="input-hyid" type="hidden" name="hyid">
        <div id="c-set"></div>
    </form>
   
	<script type="text/javascript">
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
	 <!--摄像头绑定表单提交参数结束   --> 
	<script type="text/javascript">
		//加载删除莫态框页面
		$(document).ready(function(){ 
			$("#delete-div").load('link/page/delete.jsp');
			$(".page").load('link/page/fenye.jsp');
			}); 
	</script>
	<script type="text/javascript">
	
	    $(function(){
	    	//点击删除确认提交表单
	        $(".delete").click(function(){
	            var id=$(this).parent().siblings().eq(0).text(),
	                txt=$(this).parent().siblings().eq(1).text();
	            $("#del-form").attr("action", "/HYTC/hyxt.do");
	            $(".delete-p").text(txt);
	            $(".delete-id").attr("value", id);
	            $(".delete-id").attr("name", "hyid");
	        });
	     // 点击摄像头跳转
		    $(".bind-sxt").click(function(){
		        var id=$(this).parent().siblings().eq(3).text();
		        var ID=$(this).parent().siblings().eq(0).text();
		        $(".input-bind").attr("value", id);
		        $(".input-hyid").attr("value", ID);
		        $("#form-bind").submit();
		    }); 
	    })
	</script>
	<script type="text/javascript">
	    $(function(){
	    // 维护跳转
	    	$(".weihu").click(function(){
                $("#c4-set").html("");
                var len = $(this).parent().siblings().length;
                var txt_arr=["hyid","hyname","name","namepy","","dz","","isvalid"];//设置name名
                for(var i=0;i<len;i++){
                    if(i !=4 && i !=6){
                    var txt=$(this).parent().siblings().eq(i).text();
                    $("#c4-set").append("<input type='text' name="+txt_arr[i]+" value="+txt+">");
                    }
                }
                $("#user-update").submit();
            });	    	
		})
	
	</script>
</body>
</html>             