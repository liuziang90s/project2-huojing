<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>添加新地址</title>
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
                <h1>添加新地址</h1>
            </div>
        </div>
        <div class='box_main'>
            <div id="register" class="register">
                <form id="form" action="/HYTC/address.do" method="post" onSubmit="return check();">
                    <div id="form_submit" class="form_submit">
                        <div class="fieldset">
                            <div class="field-group">
                                <label class="required title">地址名称</label>
                                <span class="control-group" id="name_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="name" name="name" value="" onblur="checkName(this.value);">
                                    </div>
                                </span>
                                <label class="tips">要求名称简洁,不得低于2个或超过50个字</label>
                            </div>
                           <div class="field-group" style='padding-bottom: 30px;'>
                                <label class="required title">上级地址</label>
                                <span class="control-group" id="people_input">
                                	<span class="address" style="display:none;">${requestScope.name_a}</span>
                                    <select id="select" name="id_a" style='display:block; width:50%; height:30px; margin-bottom: 5px; border-color:#ccc ;'>
                                    </select>
                                    <div class="">
                                        <input class="register_input" type="hidden" id="" name="method" value="add">
                                    </div>
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
            // 上级地址开始
            fn();
            function fn(){
            		var url=window.location.href;
                $.ajax({
                    type: "get",
                    async: true,
            	   dataType:"json",
            	   url : url.substring(0,url.indexOf("HYTC")+5)+"address.do",
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
                function checkAddid(com) {
                    if (com.search(/^.{3,20}$/) == -1) {
                        showTooltips('addid_input','地址id为空或位数错误');
                    }else {
                        hideTooltips('addid_input');
                    }
                }
                function checkName(jian) {
                    if (jian.search(/^.{2,8}$/) == -1) {
                        showTooltips('name_input','地址名称为空或位数错误');
                    }else {
                        hideTooltips('name_input');
                    }
                }
                function checkIda(user) {
                    if (user.search(/^.{2,20}$/) == -1) {
                        showTooltips('idA_input','上级地址不得少于两个字');
                    }else {
                        hideTooltips('idA_input');
                    }
                }

                function check() {
                    hideAllTooltips();
                    var ckh_result = true;

                    if ($('#addid').val().search(/^.{3,20}$/) == -1) {
                        showTooltips('addid_input','地址id为空或位数错误');
                        ckh_result = false;
                    }
                    if ($('#name').val() == '' || $('#name').val().search(/^.{2,50}$/) == -1) {
                        showTooltips('name_input','地址名称为空或位数错误（2-50位）');
                        ckh_result = false;
                    }
                    if ($('#idA').val().search(/^.{2,20}$/) == -1) {
                        showTooltips('idA_input','上级地址不得少于两个字');
                        ckh_result = false;
                    }
                    return ckh_result;
                }

            </script>
        </div>
    </div>
</div>
</body>
</html>
