<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<aside id="sidebar-wrapper">
    <div class="sidebar-brand">
        <a href="index.html">System manager</a>
    </div>
    <div class="sidebar-user">
        <div class="sidebar-user-picture">
            <img alt="image" src="${app}/static/images/me.JPG">
        </div>
        <div class="sidebar-user-details">
            <div class="user-name">${me.userName }</div>
            <div class="user-role">
                Administrator
            </div>
        </div>
    </div>
    <ul class="sidebar-menu">
        <li class="menu-header">主页</li>
        <li>
            <a href="index.html"><i class="ion ion-speedometer"></i><span>主页</span></a>
        </li>
        <c:forEach items="${treeMenus }" var="menu">
        <c:choose>
        <c:when test="${menu.sysMenu.menuName == pactive }">
        <li class="active">
            </c:when>
            <c:otherwise>
        <li>
            </c:otherwise>
            </c:choose>

            <a href="#" class="has-dropdown">
                <i class="${menu.sysMenu.icon }"></i>
                <span>${menu.sysMenu.menuName }</span>
            </a>
            <ul class="menu-dropdown">
                <c:forEach items="${menu.children }" var="chil">
                    <c:choose>
                        <c:when test="${chil.sysMenu.menuName == chactive }">
                            <li class="active">
                        </c:when>
                        <c:otherwise>
                            <li>
                        </c:otherwise>
                    </c:choose>
                    <a href="${app.concat(chil.sysMenu.url) }"><i class="${chil.sysMenu.icon }"></i>${chil.sysMenu.menuName }</a>
                    </li>
                </c:forEach>

            </ul>

        </li>
        </c:forEach>
</aside>