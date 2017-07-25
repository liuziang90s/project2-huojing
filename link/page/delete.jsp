<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" style="color: red">数据删除后无法恢复，请谨慎操作！</h3>
            </div>
            <div class="modal-body">
                <p>您将删除以下机构的相关信息：</p>
                <p class="delete-p"></p>
            </div>
            <form style="" id="del-form" method="post">
                <input type="text" name="" class="delete-id" value="">
                <div class="">
		            <input class="register_input" type="hidden" name="forpage" value="web">
		            <input class="register_input" type="hidden" id="" name="method" value="delete">
		        </div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="submit-del" type="button" class="btn btn-primary">确认</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
$(function(){
	$("#submit-del").click(function(){
	    $("#del-form").submit();
	});
})	
</script>