<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body class="">
	<div class="container body">
		<div class="main_container">
			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<nav>
						<ul class="nav navbar-nav navbar-right">
							<li class="">
								<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"aria-expanded="false">
								<c:choose>
								<c:when test="${not empty sessionScope.userInfo.userId}">
									${sessionScope.userInfo.userId}
									<span class=" fa fa-angle-down"></span>
								</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="/logout.do"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
								</ul>
								</c:when>
								<c:otherwise>
								Guest
								</a>
								</c:otherwise>
								</c:choose>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->
<script src="<c:url value="/js/jquery-1.10.2.js"/>"></script>
<script src="<c:url value="/js/jquery-ui-1.10.4.custom.js"/>"></script>
<script type="text/javascript">

$(function(){
	$("#login").on("click", function(){
		location.assign("/login");
	});
});

</script>
<div>
	<div style="text-align: center;"><a href="/">ユーザーホーム</a></div>
	<div style="text-align: right;">
		<div>ようこそ
		<span>${sessionScope.userInfo.userName}</span> 
		 さん
		</div>
		<c:choose>
		<c:when test="${empty sessionScope.userInfo.userId}">
		<div>
			<input type="button" value="Log In" id="login"/>
		</div>
		</c:when>
		</c:choose>
	</div>
	<hr />
</div>
