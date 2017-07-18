<!-- 
 * @Class Name : home.jsp
 * @Description : 
 * @
 * @	修正日			修正者		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.16		Kim		最初作成
 * 
 * @author Kim
 * @since 2017.07.16
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage="" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<c:url value="/js/jquery-1.10.2.js"/>"></script>
<script src="<c:url value="/js/jquery-ui-1.10.4.custom.js"/>"></script>
<html>
<style>
.bt{
float:left;
}
</style>
<head>
<script type="text/javascript">
$(document).ready(function() {
	$("#reservationHistory").on("click", function() {
		location.assign("/reservation/history");
	});
	$("#reservation").on("click", function() {
		location.assign("/reservation/course");
	});
});
$(function(){
	console.log();
});
</script>
	<title>Home</title>
</head>
<body>
<input type="hidden" id="check" value="${check }">
<input type="hidden" id="loginId" value="${loginId }">
<%@include file="./inc/top.jsp"%>
<div id="body" style="margin-left:500px;">
<div>
<div class="bt">
<input type="button" id="reservationHistory" value="予約履歴"></input>
</div>
<div>
<input type="button" id="reservation" value="予約"></input>
</div>
</div>
<%@include file="../board/board.jsp"%>
</div>
</body>

</html>