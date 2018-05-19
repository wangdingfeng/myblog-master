<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" name="viewport">
	<title>登录系统管理平台</title>
	<%@include file="common/common.jsp" %>

</head>

<body>
<div id="app">
	<section class="section">
		<div class="container mt-5">
			<div class="row">
				<div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
					<div class="login-brand">
						系统管理平台
					</div>

					<div class="card card-primary">
						<div class="card-header"><h4>Login</h4></div>

						<div class="card-body">
							<form method="POST" action="${app }/login/doLogin" class="needs-validation" novalidate="">
								<div class="form-group">
									<label for="userName">用户名</label>
									<input type="text" class="form-control" name="userName" id="userName" tabindex="1" required autofocus>
									<div class="invalid-feedback">
										请输入您的用户名
									</div>
								</div>

								<div class="form-group">
									<label for="password" class="d-block">密码
										<div class="float-right">
											<a href="forgot.html">
												忘记密码?
											</a>
										</div>
									</label>
									<input id="password" type="password" class="form-control" name="password" id="password" tabindex="2" required>
									<div class="invalid-feedback">
										请输入您的密码
									</div>
								</div>

								<div class="form-group">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" name="remember" class="custom-control-input" tabindex="3" id="remember-me">
										<label class="custom-control-label" for="remember-me">Remember Me</label>
									</div>
								</div>

								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-block" tabindex="4" onclick="login()">
										登录
									</button>
								</div>
								<div class="text-center" style="color: red;">
									${error}
								</div>
							</form>
						</div>
					</div>
					<div class="simple-footer">
						Copyright &copy;  2018
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
</body>
</html>