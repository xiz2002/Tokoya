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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="<c:url value="/js/jquery-1.10.2.js"/>"></script>
<script src="<c:url value="/js/jquery-ui-1.10.4.custom.js"/>"></script>
<script src="<c:url value="/js/jquery.datetimepicker.full.min.js" />"></script>
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
	$('#datetimepicker').datetimepicker({
		inline : true,
		value : t,
		onChangeDateTime : logic,
		onShow : logic,
		timepickerScrollbar : false,
		timepicker : false,
		minDate : '-1970/01/01', // Today is minimum date
		maxDate : '+1970/02/01' // and NextMonth is maximum date calendar
	});
});
$(function(){
	$("#search").on("click", function(){
		var date = $("#datetimepicker").val();
		$.ajax({
			type:"POST",
			dataType:"JSON",
			data:{"model":date},
			url:"/test",
			success:function(test){
				console.log("fd");
				alert(test);
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
</style>
</head>
<body>
	<!-- top navigation -->
	<%@include file="./inc/top.jsp"%>
	<!-- /top navigation -->
	<!-- side navigation -->
	<%@include file="./inc/navi.jsp"%>
	<!-- /side navigation -->
	<c:forEach var="reList" items="${reservation }">
		<c:set var="scTime"><fmt:formatDate value="${reList.RESERVATIONDATE}" type="time" pattern="HH:mm"/></c:set>
	</c:forEach>
	<div id="admin_body" style="float: left; border: 1px solid;">
		<div>
			<h3>予約状況</h3>
		</div>
		<div>
			<input type="text" id="datetimepicker" />
			<input type="button" id="search" value="Search">
		</div>
		<table>
			<tr>
				<th><span>時間</span></th>
				<c:forEach var="item" items="${stylist}">
					<th><span>${item.stylistName}</span></th>
				</c:forEach>
			</tr>
			<c:forEach var="item" items="${time}">
				<tr>
					<td>
						${item}
					</td>
					<c:forEach var="stList" items="${stylist}">
					<c:forEach var="reList" items="${reservation }">
					<c:if test="${stList.stylistName==reList.STYLISTNAME}">
						<c:if test="${item==scTime}">
						<td>
							<c:choose>
							 <c:when test="${reList.RESERVATIONSTATUS==1}">
							 予約中
							 </c:when>
							 <c:when test="${reList.RESERVATIONSTATUS==2}">
							 予約キャンセル
							 </c:when>
							 <c:when test="${reList.RESERVATIONSTATUS==3}">
							 予約終了
							 </c:when>
							</c:choose>
						</td>
						</c:if>
						<c:if test="${item!=scTime}">
						<td></td>
						</c:if>
					</c:if>
					<c:if test="${stList.stylistName!=reList.STYLISTNAME}">
						<td></td>
					</c:if>
					</c:forEach>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>