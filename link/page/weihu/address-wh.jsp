<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>地址-维护</title>
    <link href="link/css/add-user.css" rel="stylesheet" type="text/css"/>
    <script type='text/javascript' src="link/js/jquery-1.4.4.min.js"></script>
    <script language='javascript' src="link/js/reg.js"></script>
</head>
<body>
<div class='body_main'>

    <div class='index_box' style='margin-top:20px;'>
        <div style="position:fixed;color:red;margin:70px 0 0 450px;font-size:16px;Z-index:100;display:block;" id="hint"></div>
        <div class='box_title'>
            <div class='text_content'>
                <h1>地址-维护</h1>
            </div>
        </div>
        
         
        <div class='box_main'>
            <div id="register" class="register">
                <form id="form" action="address.do" method="post" onSubmit="return check();">
                    <div id="form_submit" class="form_submit">
                        <div class="fieldset">
                            <div class="field-group" style="display:none;">
                                <label class="required title">地址id</label>
                                <span class="control-group" id="address_input">
                                    <div class="input_add_long_background">     
                                 
                                        <input class="register_input" type="text" id="address" name="addid" value="${requestScope.addid}" onblur="checkCompany(this.value);">
                                    </div>
                                </span>
                                <label class="tips">要求填入地址id（6-20）</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">地址名称</label>
                                <span class="control-group" id="addressj_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="addressj" name="name" value="${requestScope.name}" onblur="checkJian(this.value);">
                                    </div>
                                </span>
                                <label class="tips">要求地址名称！</label>
                            </div>
                           <div class="field-group" style='padding-bottom: 30px;'>
                                <label class="required title">上级地址</label>
                                <span class="control-group" id="people_input">
                                	<span class="address" style="display:none;">${requestScope.name_a}</span>
                                    <select id="select" name="id_a" style='display:block; width:50%; height:30px; margin-bottom: 5px; border-color:#ccc ;'>
                                    </select>
                                    <div class="">
                                        <input class="register_input" type="hidden" id="" name="method" value="update">
                                    </div>
                                </span>
                                <label class="tips"></label>
                            </div>
                            <div class="field-group" style='padding-bottom: 30px;'>
                                <label class="required title">有效性：</label>
                                <span class="control-group" id="address_input">
                            	<select name="isvalid" style='display:block; width:50%; height:30px; margin-bottom: 5px; border-color:#ccc ;'>
                                	<option value="${requestScope.isvalid}" class="option-isvalid"></option>
    								<option value="" class="option-isvalid"></option>	
                                </select>
                            	</span>
                                <label class="tips">请选择有效性</label>
                            </div>
                           
                        </div>
                    </div>
                    <div id="div_submit" class="div_submit">
                        <div class='div_submit_button'>
                            <input id="submit" type="submit" value="确认提交" class='button_button disabled'>
                        </div>
                    </div>
                </form>
            </div>
            <script type="text/javascript">
                function checkCompany(com) {
                    if (com.search(/^.{6,20}$/) == -1) {
                        showTooltips('address_input','地址id为空或位数错误');
                    }else {
                        hideTooltips('address_input');
                    }
                }
                function checkMobilePeople(jian) {
                    if (jian.search(/^.{2,50}$/) == -1) {
                        showTooltips('people_input','上级地址不能为空！');
                    }else {
                        hideTooltips('people_input');
                    }
                }
                function checkJian(jian) {
                    if (jian.search(/^.{2,50}$/) == -1) {
                        showTooltips('addressj_input','地址名称为空或位数错误');
                    }else {
                        hideTooltips('addressj_input');
                    }
                }
            </script>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function(){
    	
//有效性下拉框判断选择默认值
        var option1=$(".option-isvalid").eq(0).val();

        if(option1 == "1"){
            $(".option-isvalid").eq(0).text("有效");
            $(".option-isvalid").eq(1).val("1").text("无效");

        }else{
            $(".option-isvalid").eq(0).text("无效");
            $(".option-isvalid").eq(1).val("0").text("有效");
        }
    })
    // 上级地址开始
fn();
function fn(){
		var url=window.location.href;
    $.ajax({
        type: "get",
        async: true,
	   dataType:"json",
	   url : ,
	   data:{forpage:"phone"},
        beforeSend: function (xhr) {
            xhr.setRequestHeader("X-Custom-Header1", "Bar");
        },
        success: function(data){
        	//console.log(data)
     	   for(var i=0;i<data.length;i++){
     		  $('#select').append("<option value="+data[i].addid+">"+data[i].name+"</option>");
     	   }
     	 //地址下拉框判断选择默认值
        	var txt_vd=$(".address").text();
    		$("#select option").each(function(i){
	            if($(this).text()==txt_vd){
	                $(this).attr("selected","selected");
	            }
    		});
        }
    })
};
</script>
</html>
