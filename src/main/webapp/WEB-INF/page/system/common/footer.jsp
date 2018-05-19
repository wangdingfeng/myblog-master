<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="footer-left">
    <c:forEach items="${setting }" var="s">
	<span class="bullet">${s.sysValue }</span>
	</c:forEach>
</div>
<div class="footer-right"></div>