<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户-维护</title>
    <link href="link/css/add-user.css" rel="stylesheet" type="text/css"/>
    <script type='text/javascript' src="link/js/jquery-1.4.4.min.js"></script>
    <script language='javascript' src="link/js/reg.js"></script>
        <style>
        /** 清除内外边距 **/
        body, div,i,input
        {
            margin: 0;
            padding: 0;
        }
       .div_inline{
           display: inline;
       }
       li{
           list-style-type: none;
       }
        /* 设置子节点属性 */
        .tree_node_child{ margin-left: 1.4em;}
        .layui-icon{background: url("arrow.ico") no-repeat;}
        .layui-icon1{background: url("folder.ico") no-repeat;margin: 0 4px;}
        .layui-icon2{background: url("html.ico") no-repeat;margin: 0 4px;}
        .layui-icon1,.layui-icon2,.layui-icon{
            width: 1em;
            height: 1em;
            display: inline-block;
            background-size:100%;
        }
        .transform1{
            transform: rotate(180deg);
            transition: transform 0.6s ease 0s;
        }
        .transform2{
            transform: rotate(0deg);
            transition: transform 0.6s ease 0s;
        }
    </style>
</head>
<body>
<div class='body_main'>

    <div class='index_box' style='margin-top:20px;'>
        <div style="position:fixed;color:red;margin:70px 0 0 450px;font-size:16px;Z-index:100;display:block;" id="hint"></div>
        <div class='box_title'>
            <div class='text_content'>
                <h1>用户-维护</h1>
            </div>
        </div>     
        <div class='box_main'>
            <div id="register" class="register">
                <form id="form" action="/HYTC/user.do" method="post" onSubmit="return check();">
                    <div id="form_submit" class="form_submit">
                        <div class="fieldset">
                            <div class="field-group">
                                <label class="required title">用户名</label>
                                <span class="control-group" id="yh_input">
                                    <div class="input_add_long_background">
                                    
                                        <input class="register_input" type="text" id="yh" name="username" maxLength="20" value="${requestScope.username}" onblur="checkCompany(this.value);">
                                    </div>
                                </span>
                                <label class="tips">要求填入工商局注册全称,字数（6-20）</label>
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
                                <label class="required title">手机号码</label>
                                <span class="control-group" id="yhm_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="yhm" name="tel" maxLength="11" value="${requestScope.tel}" onblur="checkMobilePhone(this.value);">
                                    </div>
                                </span>
                                <label class="tips">仅用于发送服务开通与到期提醒以及紧急故障方便联系到您，绝对保密</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">邮箱</label>
                                <span class="control-group" id="yhe_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="yhe" name="email" maxLength="50" value="${requestScope.email}" onblur="checkEmail(this.value);">
                                    </div>
                                </span>
                                <label class="tips">请输入用户常用的邮箱</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">姓名</label>
                                <span class="control-group" id="zh_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="zh" name="name" maxLength="36" value="${requestScope.name}" onblur="checkZh(this.value);">
                                    </div>
                                </span>
                                <label class="tips">格式要求：3-12位字符，由数字和字母组成。</label>
                            </div>
							<div class="field-group">
								<label class="required title">
									设置密码
								</label>
								<span class="control-group" id="yhpw_input">
									<div class="input_add_long_background">
										<input class="register_input" type="password" id="yhpw" name="password" maxLength="12" value="" onblur="checkPwd1(this.value);" />
									</div>
								</span>
								<label class="tips">
									请使用6~12个英文字母（区分大小写）或数字
								</label>
							</div>
                            <div class="field-group">
                                <label class="required title">权限设置</label>
                                <div class="tree_node">
						            <div class="div_inline"><i class="layui-icon tree_node_toggle_button"></i></div>
						            <div class="div_inline tree_node_parent">
					                	<input type="checkbox" class="tree_node_parent_checkbox"><i class="layui-icon1"></i>全选
					                	<div class="tree_node_child">
						                    <input type="checkbox" class="tree_node_child_checkbox"><i class="layui-icon2"></i><br>
						                </div>
						            </div>
						        </div>
                                <label class="tips">选择用户权限</label>
                            </div>
                        </div>
                    </div>

						<input class="register_input" type="hidden" id="" name="forpage"
							value="web"> <input class="register_input" type="hidden" id=""
							name="method" value="update"> <input class="register_input"
							type="hidden" id="" name="userid2" value="${requestScope.userid}">
						<div id="div_submit" class="div_submit">
							<div class='div_submit_button'>
								<input id="submit" type="submit" value="确认提交"
									class='button_button disabled'>
							</div>
						</div>
					</form>
            </div>
            <script type="text/javascript">
                function checkCompany(com) {
                    if (com.search(/^.{6,20}$/) == -1) {
                        showTooltips('yh_input','用户名为空或位数错误');
                    }else {
                        hideTooltips('yh_input');
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
                    if ($('#email').val() != '' && email.search(/^.+@.+$/) == -1) {
                        showTooltips('yhe_input','邮箱格式不正确');
                    }else {
                        hideTooltips('yhe_input');
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
								showTooltips('yhpw_input', '密码为空或位数太少');
							} else {
								hideTooltips('yhpw_input');
							}
				}
                function checkMobilePhone(telphone) {
                    if(telphone=='' || !isMobilePhone(telphone)) {
                        showTooltips('yhm_input','请输入正确的手机号码');
                    }else{
                        hideTooltips('yhm_input');
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

                    if ($('#yh').val().search(/^.{6,20}$/) == -1) {
                        showTooltips('yh_input','用户名为空或位数错误');
                        ckh_result = false;
                    }
                    if ($('#user').val().search(/^.{2,20}$/) == -1) {
                        showTooltips('user_input','姓名不得少于两个字');
                        ckh_result = false;
                    }
                    if ($('#yhe').val() != '' && $('#yhe').val().search(/^.+@.+$/) == -1) {
                        showTooltips('yhe_input','邮箱不能为空');
                        ckh_result = false;
                    }
                    if($('#yhm').val()=='' || !isMobilePhone($('#yhm').val())) {
                        showTooltips('yhm_input','手机号码不正确');
                        ckh_result = false;
                    }
                    if ($('#yhpw').val().search(/^(\w){6,20}$/) == -1) {
                        showTooltips('yhpw_input','密码位数或格式错误！');
                        ckh_result = false;
                    }
                    return ckh_result;
                    
                }
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
<script>
        // 页面加载完成后调用树形菜单
        $(function(){
            // 为所有的父节点添加点击事件
            $(".tree_node_parent_checkbox").click(function(){
                // 获取父节点是否选中
                var isChange = $(this).prop("checked");
                if(isChange){ // 如果选中,则父节点下的所有的子节点都选中
                    // 获取当前checkbox节点的兄弟节点下的所有的checkbox子节点选中
                    $(this).siblings(".tree_node_child").find(".tree_node_child_checkbox").prop("checked", true);
                }else{ // 未选中，取消全选
                    // 获取当前checkbox节点的兄弟节点下的所有的checkbox子节点选中
                    $(this).siblings(".tree_node_child").find(".tree_node_child_checkbox").removeAttr("checked");
                }
            });
            // 为所有的子节点添加点击事件
            $(".tree_node_child_checkbox").click(function () {
                // 获取选中的节点的父节点下的所有子节点选中的数量
                var length = $(this).parent().find(".tree_node_child_checkbox:checked").length;
                // 判断当前结点是否选中
                if($(this).prop("checked")){ // 选中
                    // 如果当前节点选中后,所有的选中节点数量1，选中父节点
                    if(length == 1){
                        // 选中父节点
                        $(this).parent().siblings(".tree_node_parent_checkbox").prop("checked", true);
                    }
                }else{ // 节点未选中
                    if(length == 0){
                        // 取消父节点的选中状态
                        $(this).parent().siblings(".tree_node_parent_checkbox").removeAttr("checked");
                    }
                }
            });

            // 为所有的切换按钮添加点击事件
            $(".tree_node_toggle_button").click(function () {
                // 获取需要隐藏或显示的节点
//                $(this).animate({transform:'rotate(180deg)',transition:'transform 2s ease 0s'});

                var $toggle_node = $(this).parent().next().find(".tree_node_child");
                $toggle_node.toggle(); // 切换隐藏或显示
                // 切换按钮的显示
                if($toggle_node.is(":visible")){
                    $(this).removeClass("transform2");
                    $(this).addClass("transform1");

                }else{
                    $(this).removeClass("transform1");
                    $(this).addClass("transform2");
                }
            });
        });
    </script>
<script>
        // 页面加载完成后调用
        $(function(){
            // 为所有的父节点添加点击事件
            $(".tree_node_parent_checkbox").click(function(){
                // 获取父节点是否选中
                var isChange = $(this).prop("checked");
                if(isChange){ // 如果选中,则父节点下的所有的子节点都选中
                    // 获取当前checkbox节点的兄弟节点下的所有的checkbox子节点选中
                    $(this).siblings(".tree_node_child").find(".tree_node_child_checkbox").prop("checked", true);
                }else{ // 未选中，取消全选
                    // 获取当前checkbox节点的兄弟节点下的所有的checkbox子节点选中
                    $(this).siblings(".tree_node_child").find(".tree_node_child_checkbox").removeAttr("checked");
                }
            });
            // 为所有的子节点添加点击事件
            $(".tree_node_child_checkbox").click(function () {
                // 获取选中的节点的父节点下的所有子节点选中的数量
                var length = $(this).parent().find(".tree_node_child_checkbox:checked").length;
                // 判断当前结点是否选中
                if($(this).prop("checked")){ // 选中
                    // 如果当前节点选中后,所有的选中节点数量1，选中父节点
                    if(length == 1){
                        // 选中父节点
                        $(this).parent().siblings(".tree_node_parent_checkbox").prop("checked", true);
                    }
                }else{ // 节点未选中
                    if(length == 0){
                        // 取消父节点的选中状态
                        $(this).parent().siblings(".tree_node_parent_checkbox").removeAttr("checked");
                    }
                }
            });

            // 为所有的切换按钮添加点击事件
            $(".tree_node_toggle_button").click(function () {
                // 获取需要隐藏或显示的节点
//                $(this).animate({transform:'rotate(180deg)',transition:'transform 2s ease 0s'});

                var $toggle_node = $(this).parent().next().find(".tree_node_child");
                $toggle_node.toggle(); // 切换隐藏或显示
                // 切换按钮的显示
                if($toggle_node.is(":visible")){
                    $(this).removeClass("transform2");
                    $(this).addClass("transform1");

                }else{
                    $(this).removeClass("transform1");
                    $(this).addClass("transform2");
                }
            });
        });
    </script>
<script>
//权限下拉框默认关闭
    $(document).ready(function(){
        $(".layui-icon").click();
    });
</script>
</html>
