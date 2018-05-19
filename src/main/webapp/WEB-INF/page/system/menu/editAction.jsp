<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<body style="margin: 0 10px">
 <form role="form" class="layui-form layui-form-pane" method="post" action="${app }/system/menu/doEdit">
  <input type="hidden" name="id" value="${sysMenu.id}" />
  <div class="box-body">
      <div class="form-group">
         <label>选择目录/菜单</label>
         <select id="dir" class="form-control select2" style="width: 100%;" lay-verify="required" lay-ignore>
           <option value="" selected="selected">--请选择--</option>
           <c:forEach items="${list }" var="m">
           <option value="${m.id}" ${m.id==pSysMenu.pid ? 'selected="selected"':''}>${m.code}-${m.menuName}</option>
           </c:forEach>
         </select>
         <select id="pid" name="pid" class="form-control select2" style="width: 100%;" lay-verify="required" lay-ignore>
         		<option value="${pSysMenu.id}" selected="selected">${pSysMenu.code}-${pSysMenu.menuName}</option>
       		</select>
	</div>
	<div class="form-group">
       <label for="uname">编码</label>
      	<input type="text" name="code" class="form-control" value="${sysMenu.code}"
      	placeholder="请输入编码,如050101" lay-verify="required">
     </div>
     <div class="form-group">
       <label for="uname">功能名称</label>
      	<input type="text" name="menuName" value="${sysMenu.menuName}" class="form-control" placeholder="请输入目录名称"  lay-verify="required">
     </div>
     <div class="form-group">
       <label for="resource">权限资源</label>
      	<input type="text" id="resource" name="resource" value="${sysMenu.resource}" class="form-control" placeholder="请输入权限资源名称" lay-verify="required">
     </div> 
     <div class="form-group">
       <label for="uname">排序</label>
      	<input type="text" name="sort" value="${sysMenu.sort}" class="form-control" placeholder="请输入排序"  lay-verify="required|number">
     </div>
      <div class="form-group">
	    <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>  提 交</button>
	    <a  class="btn btn-default" href="javascript:parent.layer.closeAll('iframe');"><i class="fa fa-close"></i>  取消</a>
	  </div>
   </div><!-- /.box-body -->
</form>
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