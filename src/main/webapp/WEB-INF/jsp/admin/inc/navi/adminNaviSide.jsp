<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- menu profile quick info -->
<div class="profile clearfix">
	<div class="profile_info" align="center">
		<h2>ようこそ、管理者様</h2>
	</div>
</div>
<!-- /menu profile quick info -->

<br />

<!-- sidebar menu -->
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
	<div class="menu_section">
		<h3>General</h3>
		<ul class="nav side-menu">
			<li><a><i class="fa fa-edit"></i> お知らせ <span class="fa fa-chevron-down"></span></a>
				<ul class="nav child_menu">
					<li><a href="<c:url value="/admin/board"/>">リスト</a></li>
					<li><a href="index2.html">お知らせ作成</a></li>
				</ul></li>
			<li><a><i class="fa fa-group"></i> スタイリスト <span class="fa fa-chevron-down"></span></a>
				<ul class="nav child_menu">
					<li><a href="<c:url value="/admin/stylist/management"/>">スタイリスト　管理</a></li>
				</ul></li>
			<li><a href="<c:url value="/admin/stylist/schedule"/>"><i class="fa fa-table"></i> スケジュール 管理</a></li>
		</ul>
	</div>
</div>
<!-- /sidebar menu -->

<!-- /menu footer buttons -->
<div class="sidebar-footer hidden-small">
	<a href="<c:url value="/"/>" data-toggle="tooltip" data-placement="top" title="ユーザー画面">
		<!-- <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> -->
		<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
	</a>
	<a data-toggle="tooltip" data-placement="top" title="">
		<!-- <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span> -->
	</a>
	<a data-toggle="tooltip" data-placement="top" title="">
		<!-- <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span> -->
	</a>
	<a <c:url value="/logout.do"/>　data-toggle="tooltip" data-placement="top" title="Logout">
		<span class="glyphicon glyphicon-off" aria-hidden="true"></span>
	</a>
</div>
<!-- /menu footer buttons -->
</div>
</div>