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
$(function() {
	$.datetimepicker.setLocale('ja');
	$('#datetimepicker').datetimepicker({
		inline : true,
		value : t,
		timepickerScrollbar : false,
		timepicker : false,
	});
});
$(function() {
$("#search").on("click", function() {
		var date = $("#datetimepicker").val();
		$.ajax({
		type : "POST",
		dataType : "JSON",
		data : {
			param : date
		},
		url : "<c:url value='/admin/searchSchedule.do'/>",
		error : function(data) {
			console.log(data);
			console.log("Error : " + Fail);
		},
		success : function(data) {
			var data = JSON.stringify(data);
			var obj = JSON.parse(data);
		}
	});
});
});
</script>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

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
</head>
<body>
	<div id="sc_body" style="float: left; border: 1px solid;">
		<div>
			<h3>スケジュール状況</h3>
		</div>
		<div>
			<select id="stylist">
			<c:forEach var="items" items="${stylist }">
				<option value="${items.stylistName }">${items.stylistName }</option>
				</c:forEach>
			</select>
			<select id="year">
			<c:forEach var="items" items="${year }">
				<option value="${items }">${items }</option>
				</c:forEach>
			</select>
			<select id="month">
			<c:forEach var="items" items="${month }">
				<option value="${items }">${items }</option>
				</c:forEach>
			</select>
			 <input type="button" id="search" value="検索">
		</div>
		<div>
			<div
				style="margin-left: 2px; float: left; background-color: red; width: 10%;">&nbsp</div>
			<div style="margin-left: 2px; float: left; width: auto;">
				<span> : 休み</span>
			</div>
			<div
				style="margin-left: 2px; float: left; background-color: skyblue; width: 10%;">&nbsp</div>
			<div style="margin-left: 2px; float: left; width: auto;">
				<span> : 勤務</span>
			</div>
			<div
				style="margin-left: 2px; float: left; background-color: yellow; width: 10%;">&nbsp</div>
			<div style="margin-left: 2px; float: left; width: auto;">
				<span> : 未定</span>
			</div>
		</div>
		<div>
			<input type="text" id="datetimepicker" />
		</div>
		<div id="button">
			<input type="button" id="add" value="追加">
			<input type="button" id="add" value="修正">
		</div>
	</div>
</body>
</html>