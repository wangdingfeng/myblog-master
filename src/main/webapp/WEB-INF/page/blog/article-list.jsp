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
    <script src="${app }/static/plugins/layui/layui.js"></script>
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
                    <div>文章列表</div>
                </h1>
                <div class="row mt-5">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div id="toolbar" class="btn-group">
                                        <a href="${app}/article/add" class="btn btn-outline-info btn-sm" title="添加" data-width="850" data-height="550px" data-title="增加新用户">
                                            <i class="ion-plus-round"></i> 添加文章
                                        </a>
                                    </div>
                                    <table class="table table-hover" id="articleTable">
                                        <thead>
                                        <tr>
                                            <th data-field="articleTitle">文章标题</th>
                                            <th data-field="articleType" data-formatter="articleTypeFormatter">文章类型</th>
                                            <th data-field="articleIsOriginal" data-formatter="isNotFormatter">是否原创</th>
                                            <th data-field="articleOnclick">点击数</th>
                                            <th data-field="state" data-formatter="baseStateFormatter">状态</th>
                                            <th data-field="creator">作者</th>
                                            <th data-field="createTime" data-formatter="dateFormatter">时间</th>
                                            <th data-field="-" data-formatter="actionFormatter">操作</th>
                                        </tr>
                                        </thead>
                                    </table>
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
<script type="text/javascript">
    function initTable() {
        //先销毁表格
        $('#articleTable').bootstrapTable('destroy');
        //初始化表格,动态从服务器加载数据
        $("#articleTable").bootstrapTable({
            method: "post",  //使用get请求到服务器获取数据
            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
            url: "${app}/article/listJson", //获取数据的地址
            striped: true,  //表格显示条纹
            pagination: true, //启动分页
            pageSize: 10,  //每页显示的记录数
            pageNumber:1, //当前第几页
            toolbar : "#toolbar",
            pageList: [5, 10, 15, 20, 25],  //记录数可选列表
            search: true,  //是否启用查询
            sidePagination: "server", //表示服务端请求
            //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder
            //设置为limit可以获取limit, offset, search, sort, order
            queryParamsType : "undefined",
            queryParams: function queryParams(params) {   //设置查询参数
                var param = {
                    'pageNumber': params.pageNumber,
                    'pageSize': params.pageSize,
                    'search':params.searchText,
                };
                return param;
            }
        });
    }
    $(document).ready(function () {
        //调用函数，初始化表格
        initTable();
        //初始化layer
        layui.use('layer', function(){
            layer = layui.layer;
        });
    });
    /**
     * 格式化操作
     */
    function actionFormatter(value,row,index){
        var actionHtml = "<a href='${app}/article/view/"+row.id+"'>查看</a>";
        actionHtml += "&nbsp;<a href='${app}/article/edit/"+row.id+"'>编辑</a>";
        actionHtml +="&nbsp;<a href='javascript:void(0)' onclick='delectArticle("+row.id+")'>删除</a>";
        if(row.state == '0'){
            actionHtml +="&nbsp;<a href='javascript:void(0)' onclick='pushArticle("+row.id+")'>发布</a>";
        }
        return actionHtml;
    }
    function delectArticle(id) {
        layer.confirm('是否删除当前文章？', {
            btn: ['是','否'] //按钮
        }, function(){
            $.ajax({
                url: "${app}/article/delete",
                method : 'post',
                data : {
                    id : id
                },
                success : function(result) {
                    if(result.code == 200){
                        layer.msg('删除成功');
                        $("#articleTable").bootstrapTable('refresh')
                    }else{
                        layer.msg(result.msg);
                    }

                }
            });
        }, function() {

        })
    }
    function pushArticle(id) {
        layer.confirm('是否发布当前文章？', {
            btn: ['是','否'] //按钮
        }, function(){
            $.ajax({
                url: "${app}/article/push",
                method : 'post',
                data : {
                    id : id
                },
                success : function(result) {
                    if(result.code == 200){
                        layer.msg('发布成功');
                        $("#articleTable").bootstrapTable('refresh')
                    }else{
                        layer.msg(result.msg);
                    }

                }
            });
        }, function() {

        })
    }
</script>
<script src="${app}/static/js/demo.js"></script>
</html>
