<!-- 
* @Class Name : admin.jsp
* @Description : 管理者のホーム画面
*　@
*　@	修正日			修正者?		修正内容
* @ 	---------		---------		-------------------------------
* @ 	2017.07.20		Kim		最初作成
* 
* @author Kim
* @since 2017.07.20
* @version 0.1
*
*  Copyright (C) by NuriNubi All right reserved.
*
-->
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>
<%@ include file="../inc/admin_header.jsp"%>
<script type="text/javascript">
$(function() {
	var f_date = new Date();
	var f_year = f_date.getFullYear();
	var f_month = f_date.getMonth()+1;
	$("#year").val(f_year);
	if(f_month<10){
	$("#month").val("0"+f_month);
	}else{
	$("#month").val(f_month);
	}
	
	$("#search").on("click", function() {
		$.datetimepicker.setLocale('ja');
		var year = document.getElementById("year").value;
		var month = document.getElementById("month").value;
		var lastDay = setLastDay(year, month);
		var firstDay = setFirstDay(year, month);
		var t = new Date(year+"-"+month);
		var paramDate = year+month;
		var paramStylist=document.getElementById("stylist").value;
		$.ajax({
			type:"POST",
			dateType:"JSON",
			data:{date:paramDate, stylist:paramStylist},
			url:"/admin/stylist/schedule.do",
			error : function(data) {
				alert("error");
			},
			success : function(data) {
				var data = JSON.stringify(data);
				var obj = JSON.parse(data);
				var date = "";
				console.log(obj.data);
				for(i in obj.data.offDate){
						date += "'"+obj.data.offDate[i].offDate+"',";
				}
				for(j in obj.data.reservation){
						date += "'"+obj.data.reservation[j].reservationDate+"',";
				}
				$('#DatePicker').datetimepicker({
					value: t,
					minDate: firstDay, 
					maxDate: lastDay,
					format:'Y/m/d',
					todayButton: false,
					timepicker:false,
					inline: true,
					yearStart: t.getFullYear(),
					yearEnd: t.getFullYear()-1,
					monthStart:t.getMonth() + 1,
					monthEnd:t.getMonth(),
					disabledDates: date, formatDate:'d.m.Y'
				});
			}
		});
	});
	document.getElementById("search").click();
});

$(function(){
	$("#add").on("click", function() {
	var date = $("#DatePicker").val();
	var stylistId = $("#stylist").val();
	var stylistName = $("#stylist option:selected").text();
	console.log(stylistName);
	if(confirm(stylistName+"の休みを追加しますか？")){
	$.ajax({
		type : "POST",
		dataType : "JSON",
		data : {
			off : date,
			StylistId : stylistId
		},
		url : "/admin/addSchedule.do",
		error : function(data) {
			console.log(data);
			console.log("Error : ");
		},
		success : function(data) {
			var data = JSON.stringify(data);
			var obj = JSON.parse(data);
			console.log(obj.result);
			if(obj.result == 1){
			document.getElementById("search").click();
			}else{
				alert("Error!!");
			}
		}
		});
	}
});
});

function setLastDay(year, month){
	var lastday = new Date((new Date(year, month, 1))-1);
	return lastday;
}

function setFirstDay(year, month){
	var firstday = new Date((new Date(year, month-1, 1)));
	return firstday;
}
</script>
<body>
<div class="right_col" role="main">
	<div class="">
		<!-- DateSelector -->
		<div class="col-md-5 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>スケジュール状況</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
		<div class="x_panel">
			<select id="stylist">
			<c:forEach var="items" items="${stylist }">
				<option value="${items.stylistId }">${items.stylistName }</option>
				</c:forEach>
			</select>
			<select id="year">
			<c:forEach var="items" items="${year }">
				<option value="${items }">${items }</option>
				</c:forEach>
			</select>
			<span>年</span>
			<select id="month">
			<c:forEach var="items" items="${month }">
				<option value="${items }">${items }</option>
				</c:forEach>
			</select>
			<span>月</span>
			 <input type="button" class="btn btn-success btn-xs" id="search" value="検索">
		</div>
		<div id="DatePicker">
		</div>
		<div id="button">
			<input type="button" class="btn btn-info btn-sm" id="add" value="追加">
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
<%@ include file="../inc/admin_foot.jsp"%>