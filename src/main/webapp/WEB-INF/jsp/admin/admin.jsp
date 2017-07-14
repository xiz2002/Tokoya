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
<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</body>
<!-- top navigation -->
<%@include file="./inc/top.jsp"%>
<!-- /top navigation -->
<!-- side navigation -->
<%@include file="./inc/navi.jsp"%>
<!-- /side navigation -->
<div style="float: left;">
	<div>
		<h3>予約状況</h3>
	</div>
	<div>
		<select>
			<c:forEach var="item" items="${stylist}">
				<option value="${item.sytlistname}">${item.sytlistname}</option>
			</c:forEach>
		</select>
	</div>
	<div>
		<table style="border: 1px solid;">
			<tr>
				<th>時間</th>
				<c:forEach var="item" items="${result}">
				<th>${item.stylistname}</th>
				</c:forEach>
			</tr>
			<c:forEach var="item" items="${result}">
				<tr>
					<td>${item.time}</td>
					<td>${item.reservationstatus}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>