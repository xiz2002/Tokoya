<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
<!--
.hyperspan
{
    position:absolute;
    width:100%;
    height:100%;
    left:0;
    top:0;
    z-index:1;
}
-->
</style>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<nav>
						<div class="navbar nav_title" style="border: 0;">
							<a href="<c:url value="/"/>" class="site_title"><i class="fa fa-paw"></i> <span>ToKoYa</span></a>
						</div>
						<c:choose>
							<c:when test="${not empty sessionScope.userInfo.userId}">
								<ul class="nav navbar-nav navbar-right">
									<li class="">
										<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> 
											${sessionScope.userInfo.userId} 
											<span class=" fa fa-angle-down"></span>
										</a>
										<ul class="dropdown-menu dropdown-usermenu pull-right">
											<li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
										</ul>
									</li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul class="nav navbar-nav navbar-right">
									<li class=""><a class="user-profile">Guest</a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</nav>
					<div class="clearfix"></div>
				</div>
			</div>
			<!-- /top navigation -->
			<!-- top Button -->
			<div class="right_col" role="main">
				<div class="">
				<div class="row top_tiles">
					<div class="toptitlehyper">
						<div class="fa-hover animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
						<c:if test="${not empty sessionScope.userInfo.userId}">
							<div class="hyper-tile-stats">
							<div class="icon"><i class="fa fa-caret-square-o-right"></i></div>
								<div class="count">
									<a href="<c:url value="/reservation/userHistory"/>"><span class="text-muted">予約履歴</span></a>
								</div>
							</div>
						</c:if>
						</div>
					</div>
					<div class="toptitlehyper">
						<div class="fa-hover animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="hyper-tile-stats">
							<div class="icon"><i class="fa fa-pencil-square-o"></i></div>
								<div class="count">
									<a href="<c:url value="/reservation/course"/>"><span class="text-muted">予約</span></a>
								</div>
							</div>
						</div>
					</div>
					<div class="toptitlehyper">
						<div class="fa-hover animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
						<c:if test="${not empty sessionScope.userInfo.userId}">
						<c:if test="${sessionScope.userInfo.userIsAdmin eq '1' }">
							<div class="hyper-tile-stats">
							<div class="icon"><i class="fa fa-gears"></i></div>
								<div class="count">
									<a href="<c:url value="/admin"/>"><span class="text-muted">管理者</span></a>
								</div>
							</div>
						</c:if>
						</c:if>
						</div>
					</div>
					<div class="toptitlehyper">
						<div class="fa-hover animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
						<c:if test="${empty sessionScope.userInfo.userId }">
							<div class="hyper-tile-stats">
							<div class="icon"><i class="fa fa-check-circle"></i></div>
								<div class="count">
									<a href="<c:url value="/login"/>"><span class="text-muted">ログイン</span></a>
								</div>
							</div>
						</c:if>
						</div>
					</div>
				</div>
			</div>
			<!-- /top Button -->