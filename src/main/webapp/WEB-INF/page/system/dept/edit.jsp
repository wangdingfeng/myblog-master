<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body style="margin: 0 10px">
<form role="form" class="layui-form layui-form-pane pd10" method="post" action="${app }/system/dept/doEdit">
  <div class="box-body">
  	<input type="hidden" value="${dept.id}" name="id" />
    <div class="form-group">
      <label for="deptName">部门名称</label>
     	<input type="text" id="deptName" name="deptName" class="form-control" value="${dept.deptName}" lay-verify="required"  placeholder="请输入部门名称">
    </div>
    <div class="form-group">
           <label>部门描述</label>
           <textarea class="form-control" name="deptDesc" rows="3" placeholder="请输入描述，最多300个字符 ..." >${dept.deptDesc}</textarea>
    </div>
    <div class="form-group">
    <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>  提 交</button>
    </div>
  </div>
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