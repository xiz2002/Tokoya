<!-- 
* @Class Name : admin.jsp
* @Description : 管理者のホーム画面
*　@
*　@	修正日			修正者		修正内容
* @ 	---------		---------		-------------------------------
* @ 	2017.07.12		Kim		最初作成
* 
* @author Kim
* @since 2017.07.12
* @version 0.1
*
*  Copyright (C) by NuriNubi All right reserved.
*
-->
<html>
<head>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<c:url value="/js/jquery-1.10.2.js" />"></script>
<script src="<c:url value="/js/jquery-ui-1.10.4.custom.js" />"></script>
<script src="<c:url value="/js/jquery.datetimepicker.full.js" />"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="<c:url value="/css/jquery.datetimepicker.css"/>" />
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
$(function(){
	$("#search").on("click", function(){
		var date = $("#datetimepicker").val();
		$.ajax({
			type:"POST",
			dataType:"JSON",
			data:{param:date},
			url:"<c:url value='/searchReservation.do'/>",
			error: function(data) {
				console.log(data);
				console.log("Error : " + Fail);
			},
			success : function(data) {
				console.log(data);
				console.log(data.reservation);
				cleanTd(data);
				var data = JSON.stringify(data);
				var obj = JSON.parse(data);
				var time = ["09", "10", "11", "12", "13", "14", "15", "16", "17", "18"];
				var status="";
				for(var i in time){
				for(var j in obj.stylist){
				for(var k in obj.reservation){
					if(obj.stylist[j].stylistName==obj.reservation[k].STYLISTNAME){
						var id=time[i]+":00"+obj.stylist[j].stylistName;
						if(time[i]==obj.reservation[k].RESERVATIONDATE.hours){
							if(obj.reservation[k].RESERVATIONSTATUS==1){
								document.getElementById(id).setAttribute("data-status", 1);
								}
							if(obj.reservation[k].RESERVATIONSTATUS==2){
								document.getElementById(id).setAttribute("data-status", 2);	
							}
							if(obj.reservation[k].RESERVATIONSTATUS==3){
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
});
function cleanTd(data){
	var time = ["09", "10", "11", "12", "13", "14", "15", "16", "17", "18"];
	var data = JSON.stringify(data);
	var obj = JSON.parse(data);
	for(var i in time){
		for(var j in obj.stylist){
			var id=time[i]+":00"+obj.stylist[j].stylistName;
			document.getElementById(id).setAttribute("data-status", 0);
		}
	}
}
</script>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
[data-status="1"] {
background-color:red;
}
[data-status="2"] {
background-color:skyblue;
}
[data-status="3"] {
background-color:yellow;
}
</style>
</head>
<body>
	<!-- top navigation -->
	<%@include file="./inc/top.jsp"%>
	<!-- /top navigation -->
	<!-- side navigation -->
	<%@include file="./inc/navi.jsp"%>
	<!-- /side navigation -->
	<div id="scTime">
		<c:forEach var="reList" items="${reservation }">
			<c:set var="scTime">
				<fmt:formatDate value="${reList.RESERVATIONDATE}" type="time"
					pattern="HH:mm" />
			</c:set>
		</c:forEach>
	</div>
	<div id="admin_body" style="float: left; border: 1px solid;">
		<div>
			<h3>予約状況</h3>
		</div>
		<div>
			<input type="text" id="datetimepicker" /> <input type="button"
				id="search" value="Search">
		</div>
		<div>
		<div style="margin-left:2px; float:left; background-color:red; width:10%;">&nbsp</div>
		<div style="margin-left:2px; float:left; width:auto;"><span> : 予約</span></div>
		<div style="margin-left:2px; float:left; background-color:skyblue; width:10%;">&nbsp</div>
		<div style="margin-left:2px; float:left; width:auto;"><span> : 予約キャンセル</span></div>
		<div style="margin-left:2px; float:left; background-color:yellow; width:10%;">&nbsp</div>
		<div style="margin-left:2px; float:left; width:auto;"><span> : 予約終了</span></div>
		</div>
		<div id="div_rev">
			<table id="tb_rev">
				<tr>
					<th><span>時間</span></th>
					<c:forEach var="item" items="${stylist}">
						<th><span>${item.stylistName}</span></th>
					</c:forEach>
				</tr>
				<c:forEach var="item" items="${time}">
					<tr>
						<td>${item}</td>
						<c:forEach var="stList" items="${stylist}">
							<c:forEach var="reList" items="${reservation}">
								<c:if test="${stList.stylistName==reList.STYLISTNAME}">
									<c:if test="${item==scTime}">
										<td id="${item}${stList.stylistName}" data-status="${reList.RESERVATIONSTATUS}">
									</c:if>
									<c:if test="${item!=scTime}">
										<td id="${item}${stList.stylistName}" data-status="0"></td>
									</c:if>
								</c:if>
								<c:if test="${stList.stylistName!=reList.STYLISTNAME}">
									<td id="${item}${stList.stylistName}" data-status="0"></td>
								</c:if>
							</c:forEach>
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>