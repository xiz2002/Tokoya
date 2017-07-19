<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
function clickMenu(num){
	if(num==1){
		console.log(num);
		$("#admin_body").load("/admin/board");
		history.pushState(null,null,"/admin/board");
	}
	if(num==2){
		console.log(num);
		$("#admin_body").load("/admin/stylist/management");
		history.pushState(null,null,"/admin/stylist/management");
	}
} 
</script>
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
	<h3>Menu</h3>
	<div>
		<ul>
			<li><a href="javascript:void(0);" onclick="clickMenu(${1})"><span>お知らせ </span></a>
			<li><a href="javascript:void(0);"><i class="fa fa-edit"></i> スタイリスト <span
					class="fa fa-chevron-down"></span></a>
				<ul class="nav child_menu">
					<li><a href="javascript:void(0);" onclick="clickMenu(${2})">社員管理</a></li>
					<li><a href="javascript:void(0);" onclick="clickMenu(${3})">スケジュール管理</a></li>
				</ul>
		</ul>
	</div>
</div>