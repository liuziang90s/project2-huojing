<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>添加新客户</title>
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
                <h1>添加新客户</h1>
            </div>
        </div>
        <div class='box_main'>
            <div id="register" class="register">
                <form id="form" action="" method="post" onSubmit="return check();">
                    <div id="form_submit" class="form_submit">
                        <div class="fieldset">
                            <div class="field-group">
                                <label class="required title">公司名称</label>
                                <span class="control-group" id="company_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="company" name="" maxLength="20" value="" onblur="checkCompany(this.value);">
                                    </div>
                                </span>
                                <label class="tips">要求填入工商局注册全称,字数（6-20）</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">公司简称</label>
                                <span class="control-group" id="jian_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="jian" name="" maxLength="8" value="" onblur="checkJian(this.value);">
                                    </div>
                                </span>
                                <label class="tips">要求名称简洁,不得低于4个或超过8个字</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">公司法人</label>
                                <span class="control-group" id="user_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="user" name="" maxLength="10" value="" onblur="checkUser(this.value);">
                                    </div>
                                </span>
                                <label class="tips">填写该公司法人代表</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">手机号码</label>
                                <span class="control-group" id="mobile_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="mobile" name="" maxLength="11" value="" onblur="checkMobilePhone(this.value);">
                                    </div>
                                </span>
                                <label class="tips">仅用于发送服务开通与到期提醒以及紧急故障方便联系到您，绝对保密</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">邮箱</label>
                                <span class="control-group" id="email_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="email" name="" maxLength="50" value="" onblur="checkEmail(this.value);">
                                    </div>
                                </span>
                                <label class="tips">请输入公司常用的邮箱</label>
                            </div>
                            <div class="field-group" style='height:80px;'>
                                <label class="required title">公司注册地址</label>
                                <span class="control-group" id="address_input">
                                    	<select id='select' name="addid" style='display:block; width:50%; height:30px; margin-bottom: 5px; border-color:#ccc ;'>
                                   
                                    	</select>
                                </span>
                                <label class="tips"></label>
                            </div>
                            <div class="field-group">
                                <label class="required title">用户名</label>
                                <span class="control-group" id="zh_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="zh" name="" maxLength="36" value="" onblur="checkZh(this.value);">
                                    </div>
                                </span>
                                <label class="tips">格式要求：3-12位字符，由数字和字母组成。</label>
                            </div>
							<div class="field-group">
								<label class="required title">
									设置密码
								</label>
								<span class="control-group" id="password1_input">
									<div class="input_add_long_background">
										<input class="register_input" type="password" id="password1" name="password1" maxLength="12" value="" onblur="checkPwd1(this.value);" />
									</div>
								</span>
								<label class="tips">
									请使用6~12个英文字母（区分大小写）或数字
								</label>
							</div>
                            <div class="field-group">
                                <label class="required title">重复密码</label>
                                <span class="control-group" id="password2_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="password" id="password2" name="" maxLength="12" value="" onblur="checkPwd2(this.value);">
                                    </div>
                                </span>
                                <label class="tips">格式要求：两次密码保持一致</label>
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
     	   console.log("grrfhedgh");
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
                function checkEmail(email) {
                    if (email.search(/^.+@.+$/) == -1) {
                        showTooltips('email_input','邮箱格式不正确');
                    }else {
                        hideTooltips('email_input');
                    }
                }

                
                //用户名判断
                function checkZh(zh) {
							if (zh.search(/(^[A-Za-z0-9]{3,12}$)|(^[\u4E00-\u9FA5]{2,8}$)/) == -1) {
								showTooltips('zh_input', '用户名字数或格式错误！');
							} else {
								hideTooltips('zh_input');
							}
				}
                 // 密码判断
                 function checkPwd1(pwd1) {
							if (pwd1.search(/^(\w){6,12}$/) == -1) {
								showTooltips('password1_input', '密码为空或位数太少');
							} else {
								hideTooltips('password1_input');
							}
				}
				function checkPwd2(pwd2) {
					if( $('#password2').val() != $('#password1').val() ){
						showTooltips('password2_input', '密码两次输入不一致!');
					}else {
						hideTooltips('password2_input');
					}
				}
                function checkMobilePhone(telphone) {
                    if(telphone=='' || !isMobilePhone(telphone)) {
                        showTooltips('mobile_input','请输入正确的手机号码');
                    }else{
                        hideTooltips('mobile_input');
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
                    if($('#mobile').val()=='' || !isMobilePhone($('#mobile').val())) {
                        showTooltips('mobile_input','手机号码不正确');
                        ckh_result = false;
                    }
                    if ($('#password1').val().search(/^(\w){6,20}$/) == -1) {
                        showTooltips('password1_input','密码位数或格式错误！');
                        ckh_result = false;
                    }
                    if ($('#password2').val() != $('#password1').val()) {
                        showTooltips('password2_input','两次输入的密码不一致！');
                        ckh_result = false;
                    }
                    return ckh_result;
                }
               // 下拉列表
               fn();
               function fn(){
					var url=window.location.href;
	               $.ajax({
	                   type: "post",
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
