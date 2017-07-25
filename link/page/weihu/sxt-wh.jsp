 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>摄像头-维护</title>
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
                <h1>摄像头-维护</h1>
            </div>
        </div>
        
         
        <div class='box_main'>
            <div id="register" class="register">
                <form id="form" action="sxt.do" method="post" onSubmit="return check();">
                    <div id="form_submit" class="form_submit">
                        <div class="fieldset">
                            <div class="field-group">
                                <label class="required title">摄像头名称</label>
                                <span class="control-group" id="sxt_input">
                                    <div class="input_add_long_background">
                                       <input type="hidden" name="lxjid" value="${requestScope.lxjid}">         
                                        <input type="hidden" name="sxtid" value="${requestScope.sxtid}">
                                        <input class="register_input" type="text" id="sxt" name="sxtname" maxLength="20" value="${requestScope.sxtname}" onblur="checksxt(this.value);">
                                    </div>
                                </span>
                                <label class="tips">请输入该摄像头详细参数信息（6-20）</label>
                            </div>
                            
                            <div class="field-group">
                                <label class="required title">摄像头IP</label>
                                <span class="control-group" id="ip_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="ip" name="ip" maxLength="8" value="${requestScope.ip}" onblur="checkip(this.value);">
                                    </div>
                                </span>
                                <label class="tips">IP不得为空、不得超过20个字符</label>
                            </div>
                            <div class="field-group" style='padding-bottom: 30px;'>
                                <label class="required title">有效性</label>
                                <span class="control-group" id="address_input">
                            	<select name="isvalid" style='display:block; width:50%; height:30px; margin-bottom: 5px; border-color:#ccc ;'>
                                	<option value="${requestScope.isvalid}" class="option-isvalid"></option>
    								<option value="" class="option-isvalid"></option>	
                                </select>
                            	</span>
                                <label class="tips">请选择有效性</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">经度</label>
                                <span class="control-group" id="lat_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="lat" name="lat" maxLength="11" value="${requestScope.lat}" onblur="checklatPhone(this.value);">
                                    </div>
                                </span>
                                <label class="tips">填写摄像头所在位置的经度</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">纬度</label>
                                <span class="control-group" id="lon_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="lon" name="lon" maxLength="50" value="${requestScope.lon}" onblur="checklon(this.value);">
                                    </div>
                                </span>
                                <label class="tips">填写摄像头所在位置的纬度</label>
                            </div>
                            <div class="field-group">
                                <label class="required title">通道</label>
                                <span class="control-group" id="td_input">
                                    <div class="input_add_long_background">
                                        <input class="register_input" type="text" id="td" name="td" maxLength="50" value="${requestScope.td}" onblur="checkTd(this.value);">
                                    </div>
                                </span>
                                <label class="tips">填写摄像头所在位置的通道</label>
                            </div>
                            <div class="field-group" style="margin-bottom:1rem;">
                                <label class="required title">摄像头图片</label>
                                <span class="control-group" id="picname_input">
                                    <div class="">
									<img src="hytcpt${requestScope.path}/${requestScope.picname}" name="img" id="img" width="60px;" height="60px;" align="center" style="margin-top: 5px; margin-bottom: 5px;"/>  
									<!-- <input type="file" class="file" id="picname" name="picname" accept="image/gif,image/png,image/bmp,image/jpeg" onchange="previewImage(this,'img')" />                                     </div>
                                	 --></div>
                                </span>
                                <label class="tips">图片格式限定为：</label>
                            </div>
                        </div>
                           <div class="">
                                        <input class="register_input" type="hidden" id="" name="forpage" value="web">
                                        <input class="register_input" type="hidden" id="" name="method" value="update">
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
                function checksxt(com) {
                    if (com.search(/^.{6,20}$/) == -1) {
                        showTooltips('sxt_input','摄像头名称为空或位数错误');
                    }else {
                        hideTooltips('sxt_input');
                    }
                }
                function checkip(ip) {
                    if (ip.search(/^.{1,20}$/) == -1) {
                        showTooltips('ip_input','摄像头ip为空或位数错误');
                    }else {
                        hideTooltips('ip_input');
                    }
                }
                function checklon(lon) {
                    if ($('#lon').val() == '') {
                        showTooltips('lon_input','纬度不能为空');
                    }else {
                        hideTooltips('lon_input');
                    }
                }

                function checklat(lat) {
                    if ($('#lat').val() == '') {
                        showTooltips('lat_input','经度不能为空');
                    }else {
                        hideTooltips('lat_input');
                    }
                }
                function checkTd(lat) {
                    if ($('#td').val() == '') {
                        showTooltips('td_input','通道不能为空');
                    }else {
                        hideTooltips('td_input');
                    }
                }
                
               function check() {
                    hideAllTooltips();
                    var ckh_result = true;

                    if ($('#sxt').val().search(/^.{6,20}$/) == -1) {
                        showTooltips('sxt_input','摄像头名称为空或位数错误');
                        ckh_result = false;
                    }
                    if ($('#ip').val() == '' || $('#ip').val().search(/^.{1,20}$/) == -1) {
                        showTooltips('ip_input','ip为空或位数错误');
                        ckh_result = false;
                    }
                    if ($('#lon').val() == '') {
                        showTooltips('lon_input','纬度不能为空');
                        ckh_result = false;
                    }
                    if($('#lat').val()=='') {
                        showTooltips('lat_input','经度不能为空');
                        ckh_result = false;
                    }
                    if($('#td').val()=='') {
                        showTooltips('td_input','通道不能为空');
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
<!-- 图片格式验证 -->
<script type="text/javascript">  
var flag = 0;  
/** 
 * 校验表单 
 */  
function checkForm(){  
    var idcard =document.getElementById("servertypename").value;  
    var fileName = $('#picname').val();  
    var check_flag = false;  
    if(idcard==""){  
        alert("类型名称不能为空！");  
    }else if(fileName==""){  
        alert("请上传图标！");  
    }else {  
        if(flag==1)  
            alert("您只能输入BMP,PNG,JPG,JPEG格式的文件");  
        else if(flag==2)  
            alert("请上传尺寸为400*400的图片！");  
        else  
            check_flag = true;  
    }  
    return check_flag;  
};  
/** 
 * 预览图片 
 */  
function previewImage(file, url) {  
    var MAXWIDTH = 1200;  
    var MAXHEIGHT = 1200;  
    if (file.files && file.files[0]) {  
        var img = document.getElementById(url);  
        img.onload = function() {  
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);  
            img.width = rect.width;  
            img.height = rect.height;  
            img.style.marginTop = rect.top + 'px';  
        };  
        var reader = new FileReader();  
        reader.onload = function(evt) {  
            img.src = evt.target.result;  
        };  
        reader.readAsDataURL(file.files[0]);  
    } else {  
        file.select();  
    }  
    getImageSize(document.getElementById("picname"));  
};  
/** 
 * 压缩图片 
 */  
function clacImgZoomParam(maxWidth, maxHeight, width, height) {  
    var param = {  
        width: width,  
        height: height  
    };  
    if (width > maxWidth || height > maxHeight) {  
        rateWidth = width / maxWidth;  
        rateHeight = height / maxHeight;  
        if (rateWidth > rateHeight) {  
            param.width = maxWidth;  
            param.height = Math.round(height / rateWidth);  
        } else {  
            param.width = Math.round(width / rateHeight);  
            param.height = maxHeight;  
        }  
    }  
    return param;  
};  
/** 
 * 校验图片尺寸 
 */  
function getImageSize(obj) {  
    var _file = document.getElementById("picname");  
    var i = _file.value.lastIndexOf('.');  
    var len = _file.value.length;  
    var extEndName = _file.value.substring(i + 1, len);  
    var extName = "BMP,PNG,JPG,JPEG";  
    if (extName.indexOf(extEndName.toUpperCase()) == -1) {  
        alert("您只能输入" + extName + "格式的文件");  
        flag = 1;  
    } else {  
        var url, image;  
        if (obj.files) {  
            if (window.navigator.userAgent.indexOf("MSIE") >= 1) {  
                obj.select();  
                url = document.selection.createRange().text;  
            }  
            url = window.URL.createObjectURL(obj.files[0]);  
        } else {  
            url = obj.value;  
            url = "file:///" + url;  
        }  
        image = new Image();  
        image.src = url;  
        image.onload = function() {  
            if (image.width > 1920 || image.height > 1080) {  
                alert("请上传尺寸为1920*1080的图片！");  
                flag = 2;  
            }else{  
                flag = 0;  
            }  
        };  
    }  
};  
</script>  
</html>
