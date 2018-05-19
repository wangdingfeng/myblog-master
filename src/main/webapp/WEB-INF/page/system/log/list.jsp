<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
	name="viewport">
<title>日志管理</title>
<%@include file="../common/common.jsp"%>
<script src="${app }/static/plugins/layui/layui.js"></script>
<script src="${app}/static/js/x-layui.js"></script>
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
						<div>日志列表</div>
					</h1>
					<div class="row mt-5">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-hover" id="logTable">
											<thead>
												
												<tr>
													<th data-field="title">日志操作</th>
													<th data-field="userName">用户</th>
													<th data-field="url">地址</th>
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
var layer;
var actionMap=new Map();
function initTable() {
    //先销毁表格
    $('#logTable').bootstrapTable('destroy');
    //初始化表格,动态从服务器加载数据
    $("#logTable").bootstrapTable({
        method: "post",  //使用get请求到服务器获取数据
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        url: "${app}/system/log/listJson", //获取数据的地址
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
	actionMap.set(index,row.id);
	return "<a href='javascript:void(0)' onclick='checkDetail("+index+")'>查看详情</a>"
}
function checkDetail(index){
	var id = actionMap.get(index);
	$.ajax({
		url:'${app}/system/log/params/'+id,
		type:'get',
		success:function(obj){
			layer.open({
				  type: 1,
				  title:'参数详情',
				  skin: 'layui-layer-rim',
				  area: ['420px', '240px'],
				  content: obj
				});
		}
	});

}
</script>
<script src="${app}/static/js/demo.js"></script>
</html>