<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>录像机维护</title>
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
                <h1>录像机维护</h1>
            </div>
        </div>
        
         
        <div class='box_main'>
            <div id="register" class="register">
                <form id="form" action="lxj.do" method="post" onSubmit="return check();">
                    <div id="form_submit" class="form_submit">
                        <div class="fieldset">
                            <div class="field-group">
                                <label class="required title">录像机名称</label>
                                <span class="control-group" id="company_input">
                                    <div class="input_add_long_background">
                                        <input type="hidden" name="lxjid" value="${requestScope.lxjid}">
                                        <input class="register_input" type="text" id="company" name="lxjname" maxLength="20" value="${requestScope.lxjname}" onblur="checkCompany(this.value);">
                                    </div>
                                </span>
                                <label class="tips">请填入录像机正确的名称（6-20）</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">品牌</label>
                                <span class="control-group" id="brand_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="brand" name="brand" maxLength="12" value="${requestScope.brand}" onblur="checkbrand(this.value);">
                                    </div>
                                </span>
                                <label class="tips">不得为空、不得超过12个字符</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">型号</label>
                                <span class="control-group" id="model_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="model" name="model" maxLength="20" value="${requestScope.model}" onblur="checkmodel(this.value);">
                                    </div>
                                </span>
                                <label class="tips">不得为空、不得超过20个字符</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">路数</label>
                                <span class="control-group" id="way_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="way" name="way" maxLength="20" value="${requestScope.way}" onblur="checkway(this.value);">
                                    </div>
                                </span>
                                <label class="tips">不得为空、不得超过20个字符</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">ip地址</label>
                                <span class="control-group" id="ip_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="ip" name="ip" maxLength="20" value="${requestScope.ip}" onblur="checkip     (this.value);">
                                    </div>
                                </span>
                                <label class="tips">不得为空、不得超过20个字符</label>
                            </div>
                          <div class="field-group" style='padding-bottom: 30px;'>
                                <label class="required title">有效性：</label>
                                <span class="control-group" id="address_input">
                            	<select name="isvalid" style='display:block; width:50%; height:30px; margin-bottom: 5px; border-color:#ccc ;'>
                                	<option value="${requestScope.isvalid}" class="option-isvalid"></option>
    								<option value="" class="option-isvalid"></option>	
                                </select>
                                 <div class="">
                                        <input class="register_input" type="hidden" id="" name="forpage" value="web">
                                        <input class="register_input" type="hidden" id="" name="method" value="update">
                                    </div>
                            	</span>
                                <label class="tips">请选择有效性</label>
                            </div>
                              <div class="">
                                        <input class="register_input" type="hidden" id="" name="forpage" value="web">
                                        <input class="register_input" type="hidden" id="" name="method" value="update">
                                    </div>
                           <%--  <div class="field-group" style='padding-bottom: 30px;'>
                                <label class="required title">录像机地址</label>
                                <span class="control-group" id="address_input">
                                	<span class="address" style="display:none;">${requestScope.dz}</span>	
                                    <select id="select" name="addid" style='display:block; width:50%; height:30px; margin-bottom: 5px; border-color:#ccc ;'>
                                    </select>
                                    <div class="">
                                        <input class="register_input" type="hidden" id="" name="forpage" value="web">
                                        <input class="register_input" type="hidden" id="" name="method" value="update">
                                    </div>
                                </span>
                                <label class="tips"></label>
                            </div> --%>
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
                        showTooltips('company_input','录像机名称为空或位数错误');
                    }else {
                        hideTooltips('company_input');
                    }
                }
                function checkbrand(brand) {
                    if (brand.search(/^.{2,8}$/) == -1) {
                        showTooltips('brand_input','品牌为空或位数错误');
                    }else {
                        hideTooltips('brand_input');
                    }
                }
                function checkip(ip) {
                    if (ip.search(/^.{1,20}$/) == -1) {
                        showTooltips('ip_input','ip名称为空或位数错误');
                    }else {
                        hideTooltips('ip_input');
                    }
                }
                function checkmodel(model) {
                    if (model.search(/^.{1,20}$/) == -1) {
                        showTooltips('model_input','型号名称为空或位数错误');
                    }else {
                        hideTooltips('model_input');
                    }
                }
                function checkway(way) {
                    if (way.search(/^.{1,20}$/) == -1) {
                        showTooltips('way_input','路数名称为空或位数错误');
                    }else {
                        hideTooltips('way_input');
                    }
                }
               function check() {
                    hideAllTooltips();
                    var ckh_result = true;

                    if ($('#company').val().search(/^.{6,20}$/) == -1) {
                        showTooltips('company_input','录像机名称为空或位数错误');
                        ckh_result = false;
                    }
                    if ($('#brand').val().search(/^.{1,20}$/) == -1) {
                        showTooltips('brand_input','品牌名称为空或位数错误');
                        ckh_result = false;
                    }
                    if ($('#model').val().search(/^.{1,20}$/) == -1) {
                        showTooltips('model_input','型号名称为空或位数错误');
                        ckh_result = false;
                    }
                    if ($('#way').val().search(/^.{1,20}$/) == -1) {
                        showTooltips('way_input','路数名称为空或位数错误');
                        ckh_result = false;
                    }
                    if ($('#ip').val().search(/^.{1,20}$/) == -1) {
                        showTooltips('ip_input','IP名称为空或位数错误');
                        ckh_result = false;
                    }
                    if ($('#brand').val() == '' || $('#brand').val().search(/^.{2,8}$/) == -1) {
                        showTooltips('brand_input','录像机简称为空或位数错误（2-8位）');
                        ckh_result = false;
                    }
                    return ckh_result;
                    
                }
               // 下拉列表
             /*   fn();
               function fn(){
					var url=window.location.href;
	               $.ajax({
	                   type: "get",
	                   async: true,
					   dataType:"json",
					   url : url.substring(0,url.indexOf("HYTC")+5)+"address.do",
	                   beforeSend: function (xhr) {
	                       xhr.setRequestHeader("X-Custom-Header1", "Bar");
	                   },
	                   success: function(data){
	                	   for(var i=0;i<data.length;i++){
	                		  $('#select').append("<option value="+data[i].addid+">"+data[i].name+"</option>");
	                	   }
	                	 //地址下拉框判断选择默认值
	                   	var txt_vd=$(".address").text();
	               		$("#select").each(function(i){
	               		            if($(this).text()==txt_vd){
	               		                $(this).attr("selected","selected");
	               		            }
	               		        });
	                   }
	               })
               }; */
            </script>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function(){
    	//地址下拉框判断选择默认值
    	var txt_vd=$(".address").text();
		$("#select").each(function(i){
		            if($(this).text()==txt_vd){
		                $(this).attr("selected","selected");
		            }
		        });
    	//有效性下拉框判断选择默认值
        var option1=$(".option-isvalid").eq(0).val();

        if(option1 == "0"){
            $(".option-isvalid").eq(0).text("无效");
            $(".option-isvalid").eq(1).val("1").text("有效");

        }else{
            $(".option-isvalid").eq(0).text("有效");
            $(".option-isvalid").eq(1).val("0").text("无效");
        }
    })
</script>
</html>
