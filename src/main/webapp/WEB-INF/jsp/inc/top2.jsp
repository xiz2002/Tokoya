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
								<a href= "javascript:void(0);" class="user-profile dropdown-toggle" data-toggle="dropdown"aria-expanded="false"></a>
								<c:choose>
								<c:when test="${not empty sessionScope.userInfo.userId}">
									${sessionScope.userInfo.userId}
									<span class=" fa fa-angle-down"></span>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="/logout.do"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
								</ul>
								</c:when>
								<c:otherwise>
								Guest
								</c:otherwise>
								</c:choose>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->
			</div>
			</div>