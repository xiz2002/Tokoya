<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- jQuery -->
	<script src="<c:url value="/js/jquery-1.10.2.js"/>"></script>
	<script src="<c:url value="/js/jquery-ui-1.10.4.custom.js"/>"></script>
	<script src="<c:url value="/js/jquery.datetimepicker.full.js" />"></script>
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