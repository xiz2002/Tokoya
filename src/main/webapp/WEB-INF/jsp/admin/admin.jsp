<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="inc/admin_header.jsp"%>
<!-- page content -->
<div class="right_col" role="main">
	<div class="">
		<!-- DateSelector -->
		<div class="col-md-5 col-sm-12 col-xs-12">
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
		<div class="col-md-7 col-sm-12 col-xs-12">
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
								<th style="width:90px; text-align:center;"><span>${item.stylistName}</span></th>
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
<script type="text/javascript">
	//Date&Time Picker
	var d = new Date();
	var t = d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate();
	var logic = function(d) {
		if (d && d.getDay() == 6) {
			this.setOptions({
				minTime : '11:00'
			});
		} else
			this.setOptions({
				minTime : '12:00'
			});
	};
	$(function() {
		$.datetimepicker.setLocale('ja');
		$('#datetimepicker').datetimepicker({
			inline : true,
			value : t,
			onChangeDateTime : logic,
			onShow : logic,
			timepickerScrollbar : false,
			timepicker : false,
		});
	});
	$(function() {
	$("#search").on("click",function() {
		var date = $("#datetimepicker").val();
		$.ajax({
			type : "POST",
			dataType : "JSON",
			data : {
				param : date
			},
			url : "<c:url value='/searchReservation.do'/>",
			error : function(data) {
				console.log(data);
				console.log("Error : ");
			},
			success : function(data) {
				console.log(data);
				console.log(data.reservation);
				cleanTd(data);
				var data = JSON.stringify(data);
				var obj = JSON.parse(data);
				var time = [ "09", "10", "11", "12", "13", "14", "15", "16", "17", "18" ];
				var x=8;
				var status = "";
				for ( var i in time) {
					x++;
					console.log(x);
					for ( var j in obj.stylist) {
						for ( var k in obj.reservation) {
							if (obj.stylist[j].stylistName == obj.reservation[k].STYLISTNAME) {
								var id = time[i] + ":00" + obj.stylist[j].stylistId;
								if (time[i] == obj.reservation[k].RESERVATIONDATE.hours||(x > obj.reservation[k].RESERVATIONDATE.hours&&x<obj.reservation[k].RESERVATIONENDDATE.hours)) {
									if (obj.reservation[k].RESERVATIONSTATUS == 1) {
										document.getElementById(id).setAttribute("data-status", 1);
									}
									if (obj.reservation[k].RESERVATIONSTATUS == 2) {
										document.getElementById(id).setAttribute("data-status", 2);
									}
									if (obj.reservation[k].RESERVATIONSTATUS == 3) {
										document.getElementById(id).setAttribute("data-status", 3);
										}
									}
								}
							}
						}
					}
				}
			});
		});
		document.getElementById("search").click();
	});
	function cleanTd(data) {
		var time = [ "09", "10", "11", "12", "13", "14", "15", "16", "17", "18" ];
		var data = JSON.stringify(data);
		var obj = JSON.parse(data);
		for ( var i in time) {
			for ( var j in obj.stylist) {
				var id = time[i] + ":00" + obj.stylist[j].stylistId;
				document.getElementById(id).setAttribute("data-status", 0);
			}
		}
	}
	</script>
<%@ include file="inc/admin_foot.jsp"%>