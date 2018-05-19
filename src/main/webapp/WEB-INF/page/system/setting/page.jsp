<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
	name="viewport">
<title>系统配置</title>
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
						<div>系统配置</div>
					</h1>
					<div class="row mt-5">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<form role="form"
										data-validator-option="{theme:'bootstrap', timely:2, stopOnError:true}"
										method="post" action="${app }/system/setting/doSetting">
										<div class="box-body">
											<c:forEach items="${list }" var="st">
												<div class="form-group">
													<label for="${st.sysKey}">${st.sysName}</label> <input
														type="hidden" name="id" value="${st.id}" /> <input
														type="text" id="${st.sysKey}" name="sysValue"
														value="${st.sysValue}" class="form-control"
														data-rule="${st.sysName}:required;">
													<p class="help-block" style="color: #dd4b39;">${st.sysDesc}</p>
												</div>
											</c:forEach>
											
										</div>
										<!-- /.box-body -->
										<div class="box-footer">
											<button type="submit" class="btn btn-success">
												<i class="fa fa-save"></i> 提 交
											</button>
											<a class="btn btn-default" href="/system/menu/list/1"><i
												class="fa fa-close"></i> 取消</a>
										</div>
									</form>
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

<script src="${app}/static/js/demo.js"></script>
</html>