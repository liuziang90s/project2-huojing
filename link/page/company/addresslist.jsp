<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>添加地址</title>
    <script src="link/js/jquery-easyui/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<style>
		th,td{
			white-space:nowrap;
		}
	</style>
</head>
<body style="padding: 10px;">
        <div style="margin-bottom:10px;">
            <form class="form-inline" method="post" action="address.do">
                <div class="form-group">
                    <label for="exampleInputName2">名称：</label>
                    <input type="text" name="name" class="form-control" id="exampleInputName2">
                    <input type="hidden" name="forpage" value="web">
                    <input type="hidden" name="method" value="query">
                    <input type="hidden" name="isvalid" value="2">
                </div>
                <div class="form-group" style="margin-left:10px;">
                    <label for="exampleInputEmail2">地址：</label>
                    <input type="text" name="address" class="form-control" id="exampleInputEmail2">
                </div>
                <button type="submit" class="btn btn-primary">查询</button>
                <button type="button" class="btn btn-primary" style="float:right"><a href="link/page/company/address.jsp" style="color:#fff;">添加</a></button>
            </form>
        </div>
	<table class="table table-bordered table-hover">
	    <thead>
	    <tr>
	        <th style="display:none">地址ID</th>
	        <th>地址名称</th>
	         <th style="display:none">上级地址id</th>
	        <th>上级地址</th>
	        <th style="display:none">有效性</th>
	        <th>有效性</th>
	        <th>创建时间</th>
	        <th>时间</th>
	        <th>操作</th>
	    </tr>
	    </thead>
	    <tbody>
	    <c:forEach items="${requestScope.address}" var="address1" >
	    	<tr>
            <c:forEach items="${address1}" var="address2" varStatus="id" begin ="2" end="9">
                            <c:choose>
		                             <c:when test="${id.index==2 or id.index==4}"><td style="display:none">${address2}</td></c:when>
		                             <c:when test="${id.index==6}"><td style="display:none">${address2}</td><td>${address2=="0"?"无效":"有效"}</td></c:when>
		                             <c:otherwise><td>${address2}</td></c:otherwise>
	                            </c:choose>
									
            </c:forEach>
         		<td>
            <a class="delete" href="javascript:void(0)" data-toggle="modal" data-target="#myModal">
           		 删除
            </a> 
            <a href="javascript:void(0)" class="weihu">维护</a>
            </td>
		   </tr>
	    </c:forEach>
	    </tbody>
	</table>
	
	<!--莫态框之删除-->
	<div id="delete-div">
	</div>
	<!--地址表单提交参数开始   -->
    <form id="form-cqym" action="address.do" method="post" style="display: none;">
        <div id="c-set"></div>
    </form>
    <!--地址维护表单提交参数开始   -->
    <form id="user-update" action="/HYTC/param.do" method="post" style="display: none;">
        <div id="user-set"></div>
        <div class="">
            <input class="register_input" type="hidden" name="forpage" value="address-wh">
        </div>
    </form>
    <!--用户维护表单提交参数结束  -->  
	<script type="text/javascript">
	//加载删除莫态框页面
	$(document).ready(function(){ 
		$("#delete-div").load('link/page/delete.jsp');
		}); 
	</script>
	<script type="text/javascript">
	//点击删除确认提交表单
	    $(function(){
	        $(".delete").click(function(){
	            var id=$(this).parent().siblings().eq(0).text(),
	                txt=$(this).parent().siblings().eq(1).text();
	            $("#del-form").attr("action", "address.do");
	            $(".delete-p").text(txt);
	            $(".delete-id").attr("value", id);
	            $(".delete-id").attr("name", "customerid");
	        });
	        
	    })
	</script>
	<script type="text/javascript">
	    $(function(){
	    // 点击维护跳转
	    	$(".weihu").click(function(){
                $("#user-set").html("");
                var len = $(this).parent().siblings().length;
               var txt_arr=["addid","name","","name_a","isvalid"]
                for(var i=0;i<len;i++){
                	if(i!=2){
                    var txt=$(this).parent().siblings().eq(i).text();
                    $("#user-set").append("<input type='text' name="+txt_arr[i]+" value="+txt+">");
                	}
                }
                $("#user-update").submit();
            });
		})
	
	</script>
</body>
</html>