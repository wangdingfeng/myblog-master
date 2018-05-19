<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
	name="viewport">
<title>用户管理</title>
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
						<div>用户列表</div>
					</h1>
					<div class="row mt-5">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<div class="table-responsive">
										<div id="toolbar" class="btn-group">
											<button onclick="addUser()" class="btn btn-outline-info" title="添加" data-width="850" data-height="550px" data-title="增加新用户">
												<i class="ion-plus-round"></i> 添加
											</button>
											<button onclick="updateUser()" class="btn btn-outline-primary" title="编辑">
												<i class="ion-compose"></i> 编辑
											</button>
											<button onclick="delectUser()"class="btn btn-outline-danger" title="删除">
												<i class="ion-ios-trash-outline"></i> 删除
											</button>
										</div>
										<table class="table table-hover" id="cusTable">
											<thead>
												<tr>
												<th data-checkbox="true"></th> 
													<th data-field="userName">用户名</th>
													<th data-field="userDesc">描述</th>
													<th data-field="createTime" data-formatter="dateFormatter">创建时间</th>
													<th data-field=deptName>部门</th>
													<th data-field="userState"
														data-formatter="userStateFormatter">状态</th>
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
function initTable() {
    //先销毁表格
    $('#cusTable').bootstrapTable('destroy');
    //初始化表格,动态从服务器加载数据
    $("#cusTable").bootstrapTable({
        method: "post",  //使用get请求到服务器获取数据
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        url: "${app}/system/user/listJson", //获取数据的地址
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
            	pageNumber: params.pageNumber,
            	pageSize: params.pageSize,
            	search:params
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

function userStateFormatter(value,row,index){
	if(value=='-1'){
		return '<i class="fa fa-lock" style="color:red"></i>'
	}else if(value=='1'){
		return '<i class="fa fa-unlock" style="color:green"></i>'
	}else{
		return '数据错误'
	}
}
/**
 * 添加新用户
 */
function addUser() {
	openDialogShow('增加新用户','${app}/system/user/add',800,600);
}
/**
 *更新用户
 */
function updateUser() {
	var getSelectRows = $("#cusTable").bootstrapTable('getSelections', function (row) {
        return row;
	});
	if(getSelectRows.length == 0){
		layer.msg("请选择一行数据");
		return;
	}else if(getSelectRows.length >= 2){
		layer.msg("不允许选择多行数据");
		return;
	}
	var id = getSelectRows[0].id;
	openDialogShow('编辑用户','${app}/system/user/edit/'+id,800,600);
}
/**
 * 删除用户
 */
function delectUser() {
	var getSelectRows = $("#cusTable").bootstrapTable('getSelections', function (row) {
        return row;
	});
	if(getSelectRows.length == 0){
		layer.msg("请选择一行数据");
		return;
	}else if(getSelectRows.length >= 2){
		layer.msg("不允许选择多行数据");
		return;
	}
	var id = getSelectRows[0].id;
	layer.confirm('是否删除当前用户？', {
	  btn: ['是','否'] //按钮
	}, function(){
		 $.ajax({
             url: "${app}/system/user/delete",
				method : 'post',
				data : {
					id : id
				},
				success : function(result) {
					layer.msg('删除成功');
					$("#cusTable").bootstrapTable('refresh')
				}
			});
		}, function() {

		})
	}
</script>
<script src="${app}/static/js/demo.js"></script>
</html>
