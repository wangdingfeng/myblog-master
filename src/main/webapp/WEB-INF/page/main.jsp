<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set value="${pageContext.request.contextPath }" var="app"></c:set>

<title>Blog</title>

<!-- Bootstrap core CSS -->
<link href="${app }/static/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link href="${app }/static/css/animate.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${app }/static/css/jumbotron.css" rel="stylesheet">
	<!-- Google Font: Source Sans Pro -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	<style>
        .post {
            border-bottom: 1px solid #adb5bd;
            margin-bottom: 15px;
            padding-bottom: 15px;
            color: #666;
        }
		.media{
			border-bottom: 1px solid #adb5bd;
			padding: 10px 0;
		}
		.hot-list li:last-child{
			border-bottom: 0px;
		}
	</style>
</head>

<body>

	<nav class="navbar navbar-expand-md navbar-default bg-default">
		<a class="navbar-brand" href="#"><img alt=""
			src="${app }/static/images/logo.png"
			style="width: 140px; height: 30px"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExampleDefault"
			aria-controls="navbarsExampleDefault" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="ion-navicon-round"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsExampleDefault">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">主页
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">博客列表</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">视频解析</a>
				</li>
				<li class="nav-item"><a class="nav-link disabled" href="#">Json格式化</a>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>

	<main role="main"> <!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<h4 class="display-3"></h4>
			<p>This is a template for a simple marketing or informational
				website. It includes a large callout called a jumbotron and three
				supporting pieces of content. Use it as a starting point to create
				something more unique.</p>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-8">
<%-- 				<c:forEach items="${page.records }" var="blog">
					<div class="card box-shadow animated bounceInLeft">
						<div class="card-header">
							<a href="#" class="badge badge-info">佛系文章</a>&nbsp;${blog.articleTitle }
						</div>
						<div class="card-body">
							${fn:substring(blog.articleContent, 0, 200) }
						</div>
						<div class="card-footer"><fmt:formatDate value="${blog.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					</div>
				</c:forEach> --%>

				 <div class="card-body post">
                      <div class="user-block">
                        <img class="rounded-circle"style="width: 45px; height: 45px;" src="${app}/static/images/me.JPG" alt="user image">
                        <span class="username">
                          <a href="#">Jonathan Burke Jr.</a>
                        </span>
						  <span class="description">3分钟学习spring-boot</span>

                      </div>
                      <!-- /.user-block -->
                      <p>
                        Lorem ipsum represents a long-held tradition for designers,
                        typographers and the like. Some people hate it and argue for
                        its demise, but others ignore the hate as they create awesome
                        tools to help create filler text for everyone from bacon lovers
                        to Charlie Sheen fans.
                      </p>

                      <p>
						 <span>7:30 PM today</span>
						  <span>&nbsp;<i class="fa fa-eye"></i>浏览量(100)</span>
                        <span class="float-right">
                          <a href="#" class="link-black text-sm">
							  <a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up mr-1"></i> 喜欢</a>
                            <i class="fa fa-comments-o mr-1"></i> 评论 (5)
                          </a>
                        </span>
                      </p>
                    </div>
	<div class="card-body post">
		<div class="user-block">
			<img class="rounded-circle" style="width: 45px; height: 45px;" src="${app}/static/images/me.JPG"
				 alt="user image">
			<span class="username">
                          <a href="#">Jonathan Burke Jr.</a>
                        </span>
			<span class="description">Shared publicly - 7:30 PM today</span>
		</div>
		<!-- /.user-block -->
		<p>
			Lorem ipsum represents a long-held tradition for designers,
			typographers and the like. Some people hate it and argue for
			its demise, but others ignore the hate as they create awesome
			tools to help create filler text for everyone from bacon lovers
			to Charlie Sheen fans.
		</p>

		<p>
			<a href="#" class="link-black text-sm mr-2"><i class="fa fa-share mr-1"></i> Share</a>
			<a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up mr-1"></i> Like</a>
			<span class="float-right">
                          <a href="#" class="link-black text-sm">
                            <i class="fa fa-comments-o mr-1"></i> Comments (5)
                          </a>
                        </span>
		</p>
	</div>
				<nav aria-label="Page navigation example">
              <ul class="pagination pagination-template d-flex justify-content-center">
				  <c:if test="${page.pages != 1}">
					  <li class="page-item"><a href="${app}/main/${page.current - 1}" class="page-link"><i class="fa fa-angle-left"></i></a></li>
				  </c:if>
				  <c:forEach begin="1" end="${page.pages}" var="each">
					  <c:choose>
						  <c:when test="${each == page.current}">
							  <li class="page-item"><a style="color:black;" class="page-link">${each}</a></li>
						  </c:when>
						  <c:when test="${each >= (page.current - 2) && each <= (page.current + 2)}">
							  <li class="page-item"><a href="${app}/main/${each}" class="page-link">${each}</a></li>
						  </c:when>
					  </c:choose>
				  </c:forEach>
				  <c:if test="${page.pages != page.current}">
					  <li class="page-item"><a href="${app}/main/${page.current + 1}" class="page-link"><i class="fa fa-angle-right"></i></a></li>
				  </c:if>
              </ul>
            </nav>
			</div>
			<aside class="col-md-4 blog-sidebar animated fadeInUpBig">
				<div class="card">
					<div class="card-header">
						<h6>最新博客</h6>
					</div>
					<div class="card-body">
						<ul class="list-unstyled list-unstyled-border hot-list">
							<li class="media">
								<img class="mr-3 rounded-circle" width="50" src="${app}/static/images/me.JPG" alt="avatar">
								<div class="media-body">
									<div class="float-right"><small>2018-04-18 12:00</small></div>
									<div class="media-title">wangdingfeng</div>
									<small><a href="#">如何用3个小时熟练的掌握spring-boot。</a></small>
								</div>
							</li>
							<li class="media">
								<img class="mr-3 rounded-circle" width="50" src="${app}/static/images/me.JPG" alt="avatar">
								<div class="media-body">
									<div class="float-right"><small>2018-04-18 12:00</small></div>
									<div class="media-title">wangdingfeng</div>
									<small>如何用3个小时熟练的掌握spring-boot。</small>
								</div>
							</li>
							<li class="media">
								<img class="mr-3 rounded-circle" width="50" src="${app}/static/images/me.JPG" alt="avatar">
								<div class="media-body">
									<div class="float-right"><small>10m</small></div>
									<div class="media-title">Rizal Fakhri</div>
									<small>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</small>
								</div>
							</li>
							<li class="media">
								<img class="mr-3 rounded-circle" width="50" src="${app}/static/images/me.JPG" alt="avatar">
								<div class="media-body">
									<div class="float-right"><small>10m</small></div>
									<div class="media-title">Alfa Zulkarnain</div>
									<small>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</small>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="p-3">
					<h5 font-italic>关于作者</h5>
					<div class="card box-shadow">
						<img class="card-img-top"
							src="http://img1.3lian.com/2015/w22/87/d/105.jpg"
							alt="Card image cap">
						<div class="card-body">
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<button type="button" class="btn btn-sm btn-outline-secondary">了解</button>
									<button type="button" class="btn btn-sm btn-outline-secondary">关注</button>
								</div>
								<small class="text-muted">9 mins</small>
							</div>
						</div>
					</div>
				</div>
				<div class="p-3">
					<h5 font-italic>公告信息</h5>
					<div class="card box-shadow">
						<div class="card-body">
							<p>本站将持久更新最新可用解析接口，保证可用性！请持续关注... 若播放异常，刷新，更换接口尝试即可！</p>
						</div>
					</div>

			</aside>
		</div>

	</div>
	</main>
	<footer class="blog-footer">
		<p>
			Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a>
			by <a href="https://twitter.com/mdo">@mdo</a>.
		</p>
		<p>
			<a href="#">Back to top</a>
		</p>
	</footer>
</body>

<script src="${app}/static/plugins/jquery.min.js"></script>
<script src="${app}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
  
				
  </script>
</html>
