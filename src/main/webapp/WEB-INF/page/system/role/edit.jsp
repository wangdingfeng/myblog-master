<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath }" var="app"></c:set>
<link rel="stylesheet" href="${app}/static/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${app}/static/css/style.css">
<link rel="stylesheet" href="${app}/static/plugins/layui/css/layui.css">

<script src="${app}/static/plugins/jquery.min.js"></script>
<script src="${app}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${app}/static/plugins/layui/layui.js" charset="utf-8"></script>
<script src="${app}/static/js/x-layui.js"></script>
</head>
<body>
<form class="form-horizontal layui-form layui-form-pane"  method="post" action="${app }/system/role/doEdit">
  <div class="box-body">
    <div class="form-group">
      <label for="uname"  class="col-sm-2 control-label">角色名</label>
      <input type="hidden" value="${sysRole.id}" name="id">
      <div class="col-sm-12">
     		<input type="text" id="uname" name="roleName" value="${sysRole.roleName}" class="form-control" placeholder="请输入角色名"  lay-verify="required">
      </div>
    </div>
    <div class="form-group">
       <label  class="col-sm-2 control-label">描述</label>
       <div class="col-sm-12">
       <textarea class="form-control" name="roleDesc" rows="3" placeholder="请输入描述，最多300个字符 ..." >${sysRole.roleDesc}</textarea>
    	 </div>
     </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">状态</label>
        <div class="col-sm-12">
         <label>
           <input name="roleState" type="radio" class="minimal" ${sysRole.roleState == 1?'checked':''} value="1" lay-ignore> 启用
         </label>
         <label>
           <input name="roleState" type="radio" class="minimal" ${sysRole.roleState == -1?'checked':''}  value="-1" lay-ignore> 禁用
         </label>
        </div>
      </div>
     <div class="form-group">
     	<label  class="col-sm-2 control-label"></label>
     	  <div class="col-sm-12">
      <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>  提 交</button>
      <a  class="btn btn-default" href="javascript:parent.layer.closeAll('iframe');"><i class="fa fa-close"></i>  取消</a>
    </div>
     </div>
  </div><!-- /.box-body -->
</form>
</body>
<script type="text/javascript">
layui.config({
	version:true,
     debug:true,
     base: '${app}/static/js/modules/'
 }).use('xform'); //加载入口

</script>
</html>