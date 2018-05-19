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
                <h1 class="section-header">
                    <div><a href="">文章列表</a>/添加文章</div>
                </h1>
                <div class="row mt-5">
                    <div class="col-12">
                        <div class="card">
                            <form method="post" class="needs-validation" novalidate="" id="from-article" action="${app}/article/saveOrUpdate">
                            <div class="card-body">
                                <div style="color: red">${error}</div>
                                <div class="form-group">
                                    <label>所属类型</label>
                                    <select name="articleType"
                                            class="form-control select2" required>
                                        <c:forEach items="${articleType}" var="type">
                                            <option value="${type.dictkey}">${type.displayName}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="invalid-feedback">
                                        请选择所属类型
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>标题</label>
                                    <input type="text" name="articleTitle" class="form-control" value="${myArticle.articleTitle}" required>
                                    <div class="invalid-feedback">
                                        请输入文章标题
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>是否原创</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="articleIsOriginal" id="inlineRadio1"  ${myArticle.articleIsOriginal == '0'? 'checked':'' } value="0" required>
                                        <label class="form-check-label" for="inlineRadio1">是</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="articleIsOriginal" id="inlineRadio2" ${myArticle.articleIsOriginal == '1'? 'checked':'' }  value="1">
                                        <label class="form-check-label" for="inlineRadio2">否</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>文章内容</label>
                                    <textarea class="form-control" name="articleContent" id="articleContent" rows="10" cols="80">${myArticle.articleContent}</textarea>
                                </div>
                            </div>
                            <div class="card-footer" style="text-align: center">
                                <button class="btn btn-primary">保存</button>
                            </div>
                            </form>
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
    $(function(){

        CKEDITOR.replace('articleContent',{
            extraPlugins: 'codesnippet,image2,uploadimage',codeSnippet_theme: 'zenburn',
        });

        $(".select2").select2();
    });
</script>
<script src="${app}/static/js/demo.js"></script>
</html>
