<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增菜单</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath }" var="app"></c:set>
<link rel="stylesheet"
	href="${app}/static/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${app}/static/css/style.css">
<link rel="stylesheet" href="${app}/static/plugins/layui/css/layui.css">
<!-- Select2 -->
<link rel="stylesheet" href="${app}/static/plugins/select2/select2.min.css">

<script src="${app}/static/plugins/jquery.min.js"></script>
<script src="${app}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${app}/static/plugins/layui/layui.js" charset="utf-8"></script>
<script src="${app}/static/js/x-layui.js"></script>
<script src="${app}/static/plugins/select2/select2.full.min.js"></script>
</head>
<body>
	<div style="margin: 0 10px">
					<div class="nav-tabs-custom">
			<nav>
				<div class="nav nav-pills" role="tablist">
					<a class="nav-item nav-link active" href="#tab_1" data-toggle="tab">添加目录</a>
					<a class="nav-item nav-link" href="#tab_2" data-toggle="tab">添加菜单</a>
					<a class="nav-item nav-link" href="#tab_3" data-toggle="tab">添加功能</a>
				</div>
				</nav>
				<div class="tab-content">
					<div class="tab-pane active" id="tab_1">
								<form role="form" class="layui-form layui-form-pane"
									method="post" action="${app }/system/menu/doAddDir">
									<div class="box-body">
										<div class="form-group">
											<label for="uname">编码</label> <input type="text" name="code"
												class="form-control" placeholder="请输入编码,如05"
												lay-verify="required">
										</div>
										<div class="form-group">
											<label for="uname">目录名称</label> <input type="text"
												name="menuName" class="form-control" placeholder="请输入目录名称"
												lay-verify="required">
										</div>
										<div class="form-group">
											<label for="uname">排序</label> <input type="text" name="sort"
												class="form-control" placeholder="请输入排序"
												lay-verify="required|number">
										</div>
										<div class="form-group">
											<label for="uname">图标</label> <input type="text" name="icon"
												value="fa-folder" class="form-control"
												placeholder="请输入图标,如:fa-user">
										</div>
										<div class="form-group">
											<button type="submit" class="btn btn-success" lay-submit
												lay-filter="submit">
												<i class="fa fa-save"></i> 提 交
											</button>
											<a class="btn btn-default"
												href="javascript:parent.layer.closeAll('iframe');"><i
												class="fa fa-close"></i> 取消</a>
										</div>
									</div>
									<!-- /.box-body -->
								</form>
					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane fade" id="tab_2">
												<form role="form" class="layui-form layui-form-pane"
									method="post" action="${app }/system/menu/doAddMenu">
									<div class="box-body">
										<div class="form-group">
											<label>父级菜单</label> <select name="pid"
												class="form-control select2" style="width: 100%;"
												lay-verify="required" lay-ignore>
												<c:forEach items="${list}" var="m">
													<option value="${m.id}">${m.code}-${m.menuName}</option>
												</c:forEach>
											</select>
										</div>
										<!-- /.form-group -->
										<div class="form-group">
											<label for="uname">编码</label> <input type="text" name="code"
												class="form-control" placeholder="请输入编码,如0501"
												data-rule="required;number" lay-verify="required">
										</div>
										<div class="form-group">
											<label for="uname">菜单名称</label> <input type="text"
												name="menuName" class="form-control" placeholder="请输入菜单名称"
												lay-verify="required">
										</div>
										<div class="form-group">
											<label for="uname">菜单URL</label> <input type="text"
												name="url" class="form-control" placeholder="请输入菜单URL"
												lay-verify="required">
										</div>
										<div class="form-group">
											<label for="uname">排序</label> <input type="text" name="sort"
												class="form-control" placeholder="请输入排序"
												lay-verify="required|number">
										</div>
										<div class="form-group">
											<label for="uname">图标</label> <input type="text" name="icon"
												value="fa-file" class="form-control"
												placeholder="请输入图标,如:fa-user">
										</div>
										<div class="form-group">
											<button type="submit" class="btn btn-success" lay-submit
												lay-filter="submit">
												<i class="fa fa-save"></i> 提 交
											</button>
											<a class="btn btn-default"
												href="javascript:parent.layer.closeAll('iframe');"><i
												class="fa fa-close"></i> 取消</a>
										</div>
									</div>
									<!-- /.box-body -->
								</form>
					</div>
					<!-- /.tab-pane -->

					<div class="tab-pane fade" id="tab_3">
													<form role="form" class="layui-form layui-form-pane"
									method="post" action="${app }/system/menu/doAddAction">
									<div class="box-body">
										<div class="form-group">
											<label>选择目录/菜单</label> <select id="dir"
												class="form-control select2" style="width: 100%;"
												lay-verify="required" lay-ignore>
												<option value="" selected="selected">--请选择--</option>
												<c:forEach items="${list}" var="m">
													<option value="${m.id}">${m.code}-${m.menuName}</option>
												</c:forEach>
											</select> <select id="pid" name="pid" class="form-control select2"
												style="width: 100%;" lay-verify="required" lay-ignore>
												<option value="" selected="selected">--请选择--</option>
											</select>
										</div>
										<div class="form-group">
											<label for="uname">编码</label> <input type="text" name="code"
												class="form-control" placeholder="请输入编码,如050101"
												lay-verify="required">
										</div>
										<div class="form-group">
											<label for="uname">功能名称</label> <input type="text"
												name="menuName" class="form-control" placeholder="请输入目录名称"
												lay-verify="required">
										</div>
										<div class="form-group">
											<label for="resource">权限资源</label> <input type="text"
												id="resource" name="resource" class="form-control"
												placeholder="请输入权限资源名称" lay-verify="required|check"
												check-url="/system/menu/checkMenuResource">
										</div>
										<div class="form-group">
											<label for="uname">排序</label> <input type="text" name="sort"
												class="form-control" placeholder="请输入排序"
												lay-verify="required|number">
										</div>
										<div class="form-group">
											<button type="submit" class="btn btn-success" lay-submit
												lay-filter="submit">
												<i class="fa fa-save"></i> 提 交
											</button>
											<a class="btn btn-default"
												href="javascript:parent.layer.closeAll('iframe');"><i
												class="fa fa-close"></i> 取消</a>
										</div>
									</div>
									<!-- /.box-body -->
								</form>
					</div>
					<!-- /.tab-pane -->

				</div>
				<!-- /.tab-pane -->
			</div>
	</div>
</body>
<script>
$(function(){
	$(".select2").select2();
});
$("#dir").on('change',function(){
	var pid = $(this).val();
	 $.post('${app }/system/menu/json?_dc='+new Date().getTime(),{pid:pid},function(response){
		if(response.code==200){
			$("#pid").empty();
			$("#pid").select2({
				data:response.data
			});
		}
	}); 
});
layui.config({
	version:true,
     debug:true,
     base: '${app }/static/js/modules/'
 }).use('xform'); //加载入口
</script>
</html>