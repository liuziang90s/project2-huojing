<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限设置</title>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"
	type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="link/css/CheckBox.css" />
</head>
<body>
	<h1 style="text-align: center; font-size: 24px; margin-top: 3rem;">权限设置</h1>
	<form action="qx.do" method="post" class="qx-div">
            <input type="hidden" name="method" value="update">
            <input type="hidden" name="userid2" value="${requestScope.userid}">
		<div class="">
			<div style="border: 1px dashed #0044CC; padding: 6px;">
				<ul id="list">
				<c:if test="${not empty requestScope.qx}">
						<c:forEach items="${requestScope.qx}" var="qx1">
								<c:forEach items="${qx1}" var="qx2"  varStatus="id"  begin="1" end="2">
								 <li><c:choose>
		                             <c:when test="${id.index==1 }"><label><input type="checkbox" name="checkqx" value="${qx2}"></label></c:when>
		                             <c:otherwise>${qx2}</c:otherwise>
	                              </c:choose></li>
								</c:forEach>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			<div style="border: 1px solid #002B36; padding: 8px;">
				    <input type="button"
					value="全选" class="btn" id="selectAll"> <input type="button"
					value="全不选" class="btn" id="unSelect"> <input type="button"
					value="反选" class="btn" id="reverse">
			</div>
		</div>
		<input type="submit" value="确认提交" class="qx-submit" />
	</form>
</body>
<script type="text/javascript" charset="utf-8">
		$(function () {
			//全选或全不选
			$("#all").click(function(){   
		    	if(this.checked){   
		        	$("#list :checkbox").prop("checked", true);  
		    	}else{   
				$("#list :checkbox").prop("checked", false);
		    	}   
		 	}); 
			//全选  
		    $("#selectAll").click(function () {
		         $("#list :checkbox,#all").prop("checked", true);  
		    });  
			//全不选
		    $("#unSelect").click(function () {  
		         $("#list :checkbox,#all").prop("checked", false);  
		    });  
		    //反选 
		    $("#reverse").click(function () { 
		         $("#list :checkbox").each(function () {  
		              $(this).prop("checked", !$(this).prop("checked"));  
		         });
				 allchk();
		    });
			
			//设置全选复选框
			$("#list :checkbox").click(function(){
				allchk();
			});
		}); 
		function allchk(){
			var chknum = $("#list :checkbox").size();//选项总个数
			var chk = 0;
			$("#list :checkbox").each(function () {  
		        if($(this).prop("checked")==true){
					chk++;
				}
		    });
			if(chknum==chk){//全选
				$("#all").prop("checked",true);
			}else{//不全选
				$("#all").prop("checked",false);
			}
		}
	</script>
</html>