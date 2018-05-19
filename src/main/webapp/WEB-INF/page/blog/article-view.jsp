<%--
  Created by IntelliJ IDEA.
  User: wangdingfeng
  Date: 2018/5/15
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta
            content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
            name="viewport">
    <title>文章管理</title>
    <%@include file="../common/common.jsp"%>

</head>
<body>
<div id="app">
    <div class="main-wrapper">
        <div class="navbar-bg"></div>
        <nav class="navbar navbar-expand-lg main-navbar">
            <%@include file="../common/header.jsp"%>
        </nav>
        <div class="main-sidebar">
            <%@include file="../common/left.jsp"%>
        </div>
        <div class="main-content">
            <section class="section">
                <h4 class="section-header">
                    <div><a href="">文章列表</a>/查看文章</div>
                </h4>
                <div class="row mt-5">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="pb-3 mb-4 font-italic border-bottom">${myArticle.articleTitle}</h3>
                                <p class="blog-post-meta"><fmt:formatDate value="${myArticle.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss"/> <a href="#">${myArticle.operator}</a></p>
                                <div>
                                    ${myArticle.articleContent}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <footer class="main-footer">
            <%@include file="../common/footer.jsp"%>
        </footer>
    </div>
</div>
</body>
<script>
    $(function () {
        hljs.initHighlighting.called = false;
        hljs.initHighlighting();
    });
</script>
<script src="${app}/static/js/demo.js"></script>
</html>
