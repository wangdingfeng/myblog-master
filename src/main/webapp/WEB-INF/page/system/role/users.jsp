<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set value="${pageContext.request.contextPath }" var="app"></c:set>
<link rel="stylesheet" href="${app}/static/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${app}/static/css/style.css">
<link rel="stylesheet" href="${app}/static/plugins/layui/css/layui.css">
<link rel="stylesheet" href="${app}/static/plugins/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css">

<script src="${app}/static/plugins/jquery.min.js"></script>
<script src="${app}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
 <table class="table table-hover">
  <tr>
    <th>用户名</th>
    <th>描述</th>
    <th>创建时间</th>
    <th>状态</th>
  </tr>
  <c:if test="${empty users }">
    <tr>
     <td colspan="4" align="center">该角色下暂时无用户 </td>
    </tr>
  </c:if>
  <c:forEach items="${users }" var="user">
    <tr>
     <td>${user.userName}</td>
     <td>${user.userDesc}</td>
     <td><fmt:formatDate value="${user.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
     <td>
     <c:choose>
     <c:when test="${user.userState == -1 }">
    	 <i class="fa fa-lock" style="color:red"></i>
     </c:when>
     <c:otherwise>
    	 <i class="fa fa-unlock" style="color:green"></i>
     </c:otherwise>
     </c:choose>
     </td>
   </tr>
  </c:forEach>
</table>
</body>
</html>