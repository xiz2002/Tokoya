<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="inc/admin_header.jsp"%>
<!-- page content -->
<div class="right_col" role="main">
	<div class="">
		<!-- <div class="row top_tiles">
			<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<div class="tile-stats">
					<div class="icon">
						<i class="fa fa-caret-square-o-right"></i>
					</div>
					<div class="count">179</div>
				</div>
			</div>
			<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<div class="tile-stats">
					<div class="icon">
						<i class="fa fa-comments-o"></i>
					</div>
					<div class="count">179</div>
				</div>
			</div>
			<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<div class="tile-stats">
					<div class="icon">
						<i class="fa fa-sort-amount-desc"></i>
					</div>
					<div class="count">179</div>
					<h3>New Sign ups</h3>
					<p>Lorem ipsum psdea itgum rixt.</p>
				</div>
			</div>
			<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<div class="tile-stats">
					<div class="icon">
						<i class="fa fa-check-square-o"></i>
					</div>
					<div class="count">179</div>
					<h3>New Sign ups</h3>
					<p>Lorem ipsum psdea itgum rixt.</p>
				</div>
			</div>
		</div>
 -->
		<!-- DateSelector -->
		<div class="col-md-4 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>予約状況</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<input type="text" id="datetimepicker" />
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-9 col-md-offset-4">
							<!-- <button type="button" class="btn btn-primary">Cancel</button> -->
							<button type="button" class="btn btn-success" id="search" value="Search">Search</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /DateSelector -->
		<!-- StaffTable -->
		<div class="col-md-8 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<div>
						<div style="margin-left: 2px; float: left; background-color: red; width: 10%;">&nbsp</div>
						<div style="margin-left: 2px; float: left; width: auto;">
							<span> : 予約</span>
						</div>
						<div style="margin-left: 2px; float: left; background-color: skyblue; width: 10%;">&nbsp</div>
						<div style="margin-left: 2px; float: left; width: auto;">
							<span> : 予約キャンセル</span>
						</div>
						<div style="margin-left: 2px; float: left; background-color: yellow; width: 10%;">&nbsp</div>
						<div style="margin-left: 2px; float: left; width: auto;">
							<span> : 予約終了</span>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<table id="tb_rev" class="table table-bordered">
						<thead>
							<tr>
								<th>時間</th>
								<c:forEach var="item" items="${stylist}">
								<th><span>${item.stylistName}</span></th>
								</c:forEach>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${time}">
							<tr>
								<th scope="row">${item}</th>
								<c:forEach var="stList" items="${stylist}">
								<td id="${item}${stList.stylistId}" data-status="${0}"></td>
								</c:forEach>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- /StaffTable -->
		<!-- <div class="row">
			<div class="col-md-12">
				<div class="x_panel">
					<div class="x_content">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div></div>

							<br>
							<div class="demo-container" style="height: 280px">
								<div id="chart_plot_02" class="demo-placeholder"></div>
							</div>
							<div class="tiles">
								<div class="col-md-4 tile">
								</div>
								<div class="col-md-4 tile">
								</div>
								<div class="col-md-4 tile">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> -->
	</div>
</div>
<!-- /page content -->
<style>

[data-status="1"] {
	background-color: red;
}

[data-status="2"] {
	background-color: skyblue;
}

[data-status="3"] {
	background-color: yellow;
}
</style>
<%@ include file="inc/admin_foot.jsp"%>