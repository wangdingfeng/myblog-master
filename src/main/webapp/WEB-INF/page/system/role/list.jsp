<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
	name="viewport">
<title>角色管理</title>
<%@include file="../common/common.jsp"%>
<script src="${app}/static/plugins/layui/layui.js"></script>
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
						<div>角色列表</div>
					</h1>
					<div class="row mt-5">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<div class="table-responsive">
										<div id="toolbar" class="btn-group">
											<button onclick="addRole()" class="btn btn-outline-info" title="添加" data-width="850" data-height="550px" data-title="增加新用户">
												<i class="ion-plus-round"></i> 创建
											</button>
											<button onclick="updateRole()" class="btn btn-outline-primary" title="编辑">
												<i class="ion-compose"></i> 编辑
											</button>
											<button onclick="delectRole()"class="btn btn-outline-danger" title="删除">
												<i class="ion-ios-trash-outline"></i> 删除
											</button>
											<button onclick="authRole()" class="btn btn-outline-success" title="授权">
												<i class="ion-compose"></i> 授权
											</button>
										</div>
										<table class="table table-hover" id="roleTable">
											<thead>
												
												<tr>
													<th data-checkbox="true"></th>
													<th data-field="roleName">角色名称</th>
													<th data-field="roleDesc">描述</th>
													<th data-field="createTime" data-formatter="dateFormatter">创建时间</th>
													<th data-field="roleState" data-formatter="roleStateFormatter">状态</th>
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
    $('#roleTable').bootstrapTable('destroy');
    //初始化表格,动态从服务器加载数据
    $("#roleTable").bootstrapTable({
        method: "post",  //使用get请求到服务器获取数据
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        url: "${app}/system/role/listJson", //获取数据的地址
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

function roleStateFormatter(value,row,index){
	if(value=='-1'){
		return '<i class="fa fa-lock" style="color:red"></i>'
	}else if(value=='1'){
		return '<i class="fa fa-unlock" style="color:green"></i>'
	}else{
		return '数据错误'
	}
}
//获取当前角色所有用户信息
function getUserList(e){
	openDialogShow('查询角色下所有用户','${app}/system/role/getUsers?roleId='+$(e).attr("data-id"),600,420);
}

/**
 * 添加角色
 */
function addRole() {
	openDialogShow('增加角色','${app}/system/role/add',600,420);
}
/**
 *更新角色
 */
function updateRole() {
	var getSelectRows = $("#roleTable").bootstrapTable('getSelections', function (row) {
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
	openDialogShow('编辑角色','${app}/system/role/edit/'+id,600,420);
}
/**
 * 删除角色
 */
function delectRole() {
	var getSelectRows = $("#roleTable").bootstrapTable('getSelections', function (row) {
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
	layer.confirm('是否删除此角色？', {
	  btn: ['是','否'] //按钮
	}, function(){
		 $.ajax({
             url: "${app}/system/role/delete",
				method : 'post',
				data : {
					id : id
				},
				success : function(result) {
					layer.msg('删除成功');
					$("#roleTable").bootstrapTable('refresh')
				}
			});
		}, function() {

		})
}
function authRole(){
	var getSelectRows = $("#roleTable").bootstrapTable('getSelections', function (row) {
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
	openDialogShow('编辑角色','${app}/system/role/auth/'+id,700,450);
}
</script>
<script src="${app}/static/js/demo.js"></script>
</html>