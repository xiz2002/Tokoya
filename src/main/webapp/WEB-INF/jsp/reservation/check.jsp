<!-- 
 * @Class Name : checkReservation.jsp
 * @Description : 
 * @
 * @	修正日			修正者		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.12		Kim		最初作成
 * 
 * @author Kim
 * @since 2017.07.12
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page session="false"%>
<html>
<head>
<title>予約情報の再確認</title>
</head>
<body>
	<h1>予約確認</h1>
	<div>
		<table>
			<tr>
				<td>選択</td>
				<td></td>
			</tr>
			<tr>
				<td>日付</td>
				<td></td>
			</tr>
			<tr>
				<td>時間</td>
				<td></td>
			</tr>
			<tr>
				<td>スタイリスト</td>
				<td></td>
			</tr>
			<tr>
				<td>金額</td>
				<td></td>
			</tr>
		</table>
	</div>
	<div>
	<span style="text-color:red">＊予約キャンセルは前日まで</span>
	</div>
	<div class="button">
		<input type="button" value="予約">
		<input type="button" value="取り消し">
	</div>

</body>
</html>