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
			<option value="Stylist01">Stylist01</option>
			<option value="Stylist01">Stylist01</option>
			<option value="Stylist01">Stylist01</option>
		</select>
	</div>
	<div>
		<table style="border:1px solid;">
			<tr>
				<th>時間</th>
				<th>予約状況</th>
				<th>予約者</th>
				<th>登録日</th>
			</tr>
			<tr>
				<td>09:00</td>
				<td>○</td>
				<td>2017/07/12</td>
				<td>user1</td>
			</tr>
			<%for(int i=10;i<25;i++){
			%>
			<tr>
				<td><%=i%>:00</td>
				<td>○</td>
				<td>2017/07/12</td>
				<td>user1</td>
			</tr>
			<%} %>
		</table>
	</div>
</div>
</body>
</html>