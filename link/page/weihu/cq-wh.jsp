<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>厂区-维护</title>
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
                <h1>厂区-维护</h1>
            </div>
        </div>
        
         
        <div class='box_main'>
            <div id="register" class="register">
                <form id="form" action="cq.do" method="post" onSubmit="return check();">
                    <div id="form_submit" class="form_submit">
                        <div class="fieldset">
                            <div class="field-group">
                                <label class="required title">厂区名称</label>
                                <span class="control-group" id="cq_input">
                                    <div class="input_add_long_background">
                                     <input type="hidden" name="cqid" value="${requestScope.cqid}">
                                        <input class="register_input" type="text" id="cq" name="cqname" maxLength="20" value="${requestScope.cqname}" onblur="checkCompany(this.value);">
                                    </div>
                                </span>
                                <label class="tips">要求填入工商局注册全称,字数（6-20）</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">厂区简称</label>
                                <span class="control-group" id="cqj_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="cqj" name="name" maxLength="8" value="${requestScope.name}" onblur="checkJian(this.value);">
                                    </div>
                                </span>
                                <label class="tips">要求名称简洁,不得低于4个或超过8个字</label>
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
                            <div class="field-group">
                                <label class="required title">责任人</label>
                                <span class="control-group" id="people_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="people" name="people" value="${requestScope.people}" onblur="checkMobilePeople(this.value);">
                                    </div>
                                </span>
                                <label class="tips">厂区责任人</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">移动电话</label>
                                <span class="control-group" id="cqm_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="cqm" name="phone" maxLength="11" value="${requestScope.phone}" onblur="checkMobilePhone(this.value);">
                                    </div>
                                </span>
                                <label class="tips">仅用于发送服务开通与到期提醒以及紧急故障方便联系到您，绝对保密</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">办公电话</label>
                                <span class="control-group" id="tel_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="tel" name="tel" value="${requestScope.tel}" onblur="checkMobileTel(this.value);">
                                    </div>
                                </span>
                                <label class="tips">仅用于发送服务开通与到期提醒以及紧急故障方便联系到您，绝对保密</label>
                            </div>
                            <div class="field-group" style='padding-bottom: 30px;'>
                                <label class="required title">厂区注册地址</label>
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
                        showTooltips('cq_input','厂区名称为空或位数错误');
                    }else {
                        hideTooltips('cq_input');
                    }
                }
                // 责任人
                function checkMobilePeople(jian) {
                    if (jian.search(/^.{2,8}$/) == -1) {
                        showTooltips('people_input','厂区责任人不能为空！');
                    }else {
                        hideTooltips('people_input');
                    }
                }
                function checkJian(jian) {
                    if (jian.search(/^.{2,8}$/) == -1) {
                        showTooltips('cqj_input','厂区简称为空或位数错误');
                    }else {
                        hideTooltips('cqj_input');
                    }
                }
				// 移动电话
                function checkMobilePhone(telphone) {
                    if(telphone=='' || !isMobilePhone(telphone)) {
                        showTooltips('cqm_input','请输入正确的移动电话');
                    }else{
                        hideTooltips('cqm_input');
                    }
                }
                // 办公电话
                function checkMobileTel(telphone) {
                    if(telphone=='') {
                        showTooltips('tel_input','请输入正确的办公电话');
                    }else{
                        hideTooltips('tel_input');
                    }
                }
                function isMobilePhone(value) {
                    if(value.search(/^(\+\d{2,3})?\d{11}$/) == -1)
                        return false;
                    else
                        return true;
                }
               function check() {
                    hideAllTooltips();
                    var ckh_result = true;
                    if ($('#people').val().search(/^.{6,20}$/) == -1) {
                        showTooltips('people_input','厂区责任人不能为空');
                        ckh_result = false;
                    }
                    if ($('#cq').val().search(/^.{6,20}$/) == -1) {
                        showTooltips('cq_input','厂区名称为空或位数错误');
                        ckh_result = false;
                    }
                    if ($('#cqj').val() == '' || $('#jian').val().search(/^.{2,8}$/) == -1) {
                        showTooltips('cqj_input','厂区简称为空或位数错误（2-8位）');
                        ckh_result = false;
                    }
                    if($('#tel').val()=='' || !isMobilePhone($('#tel').val())) {
                        showTooltips('tel_input','手机号码不正确');
                        ckh_result = false;
                    }
                    if($('#cqm').val()=='' || !isMobilePhone($('#mobile').val())) {
                        showTooltips('cqm_input','手机号码不正确');
                        ckh_result = false;
                    }
                    return ckh_result;
                    
                }
               // 下拉列表
               fn();
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
	               		$("#select option").each(function(i){
	               		            if($(this).text()==txt_vd){
	               		                $(this).attr("selected","selected");
	               		            }
	               		        });
	                   }
	               })
               };
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
