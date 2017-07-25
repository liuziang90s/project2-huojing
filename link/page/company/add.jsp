<%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>公司添加子公司账号</title>
    <link href="../../css/add-user.css" rel="stylesheet" type="text/css"/>
    <script type='text/javascript' src="../../js/jquery-1.4.4.min.js"></script>
    <script language='javascript' src="../../js/reg.js"></script>
</head>
<body>
<div class='body_main'>

    <div class='index_box' style='margin-top:20px;'>
        <div style="position:fixed;color:red;margin:70px 0 0 450px;font-size:16px;Z-index:100;display:block;" id="hint"></div>
        <div class='box_title'>
            <div class='text_content'>
                <h1>添加子公司账号</h1>
            </div>
        </div>
        <div class='box_main'>
            <div id="register" class="register">
                <form id="form" action="/HYTC/cq.do" method="post" onSubmit="return check();">
                    <div id="form_submit" class="form_submit" style='padding-bottom: 20px;'>
                        <div class="fieldset">
                            <div class="field-group">
                                <label class="required title">子公司名称</label>
                                <span class="control-group" id="company_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="company" name="cqname" maxLength="20" value="" onblur="checkCompany(this.value);">
                                    </div>
                                </span>
                                <label class="tips">要求填入工商局注册全称,字数（6-20）</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">子公司简称</label>
                                <span class="control-group" id="jian_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="jian" name="name" maxLength="8" value="" onblur="checkJian(this.value);">
                                    </div>
                                </span>
                                <label class="tips">要求名称简洁,不得低于4个或超过8个字</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">子公司负责人</label>
                                <span class="control-group" id="user_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="user" name="user" maxLength="10" value="" onblur="checkUser(this.value);">
                                    </div>
                                </span>
                                <label class="tips">填写该子公司负责人姓名</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">责任人</label>
                                <span class="control-group" id="people_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="people" name="people" maxLength="10" value="" onblur="checkPeople(this.value);">
                                    </div>
                                </span>
                                <label class="tips">填写该子公司责任人姓名</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">移动电话</label>
                                <span class="control-group" id="phone_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="phone" name="phone" maxLength="11" value="" onblur="checkMobilePhone(this.value);">
                                    </div>
                                </span>
                                <label class="tips">仅用于发送服务开通与到期提醒以及紧急故障方便联系到您，绝对保密</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">办公电话</label>
                                <span class="control-group" id="tel_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="tel" name="tel" maxLength="11" value="" onblur="checkMobileTel(this.value);">
                                    </div>
                                </span>
                                <label class="tips">仅用于发送服务开通与到期提醒以及紧急故障方便联系到您，绝对保密</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">邮箱</label>
                                <span class="control-group" id="email_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="email" name="email" maxLength="50" value="" onblur="checkEmail(this.value);">
                                    </div>
                                </span>
                                <label class="tips">请输入子公司常用的邮箱</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">子公司注册地址</label>
                                <span class="control-group" id="address_input">
                                    	<select id="select" name="addid" style='display:block; width:50%; height:30px; margin-bottom: 5px; border-color:#ccc ;'>
                                    	
                                    	</select>
                                </span>
                                <label class="tips"></label>
                            </div>
                        </div>
                    </div>
                    <div id="div_submit" class="div_submit">
                        <div class='div_submit_button'>
                            <input id="submit" type="submit" value="注册" class='button_button disabled'>
                        </div>
                    </div>
                </form>
            </div>
            <script type="text/javascript">
                function checkCompany(com) {
                    if (com.search(/^.{6,20}$/) == -1) {
                        showTooltips('company_input','公司名称为空或位数错误');
                    }else {
                        hideTooltips('company_input');
                    }
                }
                function checkJian(jian) {
                    if (jian.search(/^.{2,8}$/) == -1) {
                        showTooltips('jian_input','公司简称为空或位数错误');
                    }else {
                        hideTooltips('jian_input');
                    }
                }
                function checkUser(user) {
                    if (user.search(/^.{2,20}$/) == -1) {
                        showTooltips('user_input','姓名不得少于两个字');
                    }else {
                        hideTooltips('user_input');
                    }
                }
                function checkPeople(user) {
                    if (user.search(/^.{2,20}$/) == -1) {
                        showTooltips('people_input','责任人姓名不得少于两个字');
                    }else {
                        hideTooltips('people_input');
                    }
                }
                function checkEmail(email) {
                    if (email.search(/^.+@.+$/) == -1) {
                        showTooltips('email_input','邮箱格式不正确');
                    }else {
                        hideTooltips('email_input');
                    }
                }

                function check() {
                    hideAllTooltips();
                    var ckh_result = true;

                    if ($('#company').val().search(/^.{6,20}$/) == -1) {
                        showTooltips('company_input','公司名称为空或位数错误');
                        ckh_result = false;
                    }
                    if ($('#jian').val() == '' || $('#jian').val().search(/^.{2,8}$/) == -1) {
                        showTooltips('jian_input','公司简称为空或位数错误（2-8位）');
                        ckh_result = false;
                    }
                    if ($('#user').val().search(/^.{2,20}$/) == -1) {
                        showTooltips('user_input','姓名不得少于两个字');
                        ckh_result = false;
                    }
                    if ($('#email').val() != '' && $('#email').val().search(/^.+@.+$/) == -1) {
                        showTooltips('email_input','邮箱不能为空');
                        ckh_result = false;
                    }
                    if($('#phone').val()=='' || !isMobilePhone($('#phone').val())) {
                        showTooltips('phone_input','手机号码不正确');
                        ckh_result = false;
                    }
                    if($('#tel').val()=='') {
                        showTooltips('tel_input','办公电话号码不正确');
                        ckh_result = false;
                    }
                    return ckh_result;
                }
                function checkMobileTel(telphone) {
                    if(telphone=='' ) {
                        showTooltips('tel_input','请输入正确的办公电话号码');
                    }else{
                        hideTooltips('tel_input');
                    }
                }
                function checkMobilePhone(telphone) {
                    if(telphone=='' || !isMobilePhone(telphone)) {
                        showTooltips('phone_input','请输入正确的手机号码');
                    }else{
                        hideTooltips('phone_input');
                    }
                }
                function isMobilePhone(value) {
                    if(value.search(/^(\+\d{2,3})?\d{11}$/) == -1)
                        return false;
                    else
                        return true;
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
 	                   }
 	               })
                };
            </script>
        </div>
    </div>
</div>
</body>
</html>
             