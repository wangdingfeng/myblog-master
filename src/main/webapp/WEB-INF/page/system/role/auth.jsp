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
<link rel="stylesheet" href="${app}/static/plugins/iCheck/all.css">

<script src="${app}/static/plugins/jquery.min.js"></script>
<script src="${app}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${app}/static/plugins/iCheck/icheck.min.js"></script>
<script src="${app}/static/plugins/layui/layui.js" charset="utf-8"></script>
<script src="${app}/static/js/x-layui.js"></script>
</head>
<body>
  <div class="row" style="margin: 0 10px">
      <div class="col-md-12">
        <!-- general form elements -->
        <form action="${app }/system/role/doAuth" method="post" class="layui-form layui-form-pane">
        <input type="hidden" value="${sysRole.id}" name="roleId" />
        <div class="box">
          <!-- form start -->
          <div class="box-body">
	        <table class="table table-hover">
	           <c:forEach items="${treeMenuAllowAccesses }" var="vo">
	           <tr>
	             <td width="150px">
	             	<label><input name="mid" type="checkbox" ${vo.allowAccess?'checked':''}  value="${vo.sysMenu.id}" class="minimal checkbox-tr" lay-ignore> <i class="fa ${vo.sysMenu.icon}"></i> ${vo.sysMenu.menuName} ></label></td>
	             <td>
	             	<c:forEach items="${vo.children }" var="ch">
	                <label><input name="mid" type="checkbox" ${ch.allowAccess?'checked':''} value="${ch.sysMenu.id}" class="minimal checkbox-td" lay-ignore> <i class="fa ${ch.sysMenu.icon}"></i> ${ch.sysMenu.menuName}</label>&nbsp; > &nbsp;
		             	<c:forEach items="${ch.children }" var="it">
		                	<label style="font-weight: normal;"><input name="mid" type="checkbox" ${it.allowAccess?'checked':''}  value="${it.sysMenu.id}" class="minimal checkbox-td" lay-ignore> ${it.sysMenu.menuName}</label>&nbsp;
		             	</c:forEach>
	             	<br>
	             	</c:forEach>
	             </td>
	           </tr>
	           </c:forEach>
	        </table>
	      </div>
         <div class="box-footer">
              <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>  确认授权</button>
              <a  class="btn btn-default" href="javascript:parent.layer.closeAll('iframe');"><i class="fa fa-angle-left"></i>  返回</a>
         </div>
        </div><!-- /.box -->
        </form>
      </div><!--/.col (left) -->
     </div>
</body>
<script type="text/javascript">
$(".checkbox-tr").on('ifClicked',function(){
	$(this).parents('tr').find('.checkbox-td').iCheck('check');
}).on('ifUnchecked',function(){
	$(this).parents('tr').find('.checkbox-td').iCheck('uncheck');
});
layui.config({
	version:true,
     debug:true,
     base: '${app}/static/js/modules/'
 }).use('xform'); //加载入口

</script>
</html>