<!-- 
 * @Class Name : reservationdate.jsp
 * @Description : 
 * @
 * @		修正日			修正者			修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.13		李多浩			最初作成
 * 
 * @author 李多浩
 * @since 2017.07.13
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>"/>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
	<script src="<c:url value="/js/jquery.datetimepicker.full.min.js" />"></script>

	<script>
		//Date&Time Picker
		var d = new Date();
		var t = d.getFullYear()+"/"+(d.getMonth()+1)+"/"+d.getDate();
		var logic = function( d ){
			if (d && d.getDay() == 6){
				this.setOptions({
					minTime:'11:00'
				});
			}else
				this.setOptions({
					minTime:'12:00'
				});
		};
		$(document).ready(function() {
			$('#datetimepicker').datetimepicker({
				inline: true,
				value: t,
				onChangeDateTime:logic,
				onShow:logic,
				allowTimes: ['09:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00'],
				timepickerScrollbar:false,
				minDate:'-1970/01/01', // Today is minimum date
				maxDate:'+1970/02/01' // and NextMonth is maximum date calendar
			});			
		});
	</script>
</head>
<body>
	<div class="container">
		<div class="reservationhistoryform">
			<h2>日付を呼びスタッフ選択</h2>
			<!-- 選択テーブル -->
			<table>
				<!-- 表示項目 -->
				<tr>
					<th></th>
					<th>DateTime</th>
					<th></th>
					<th>Staff</th>
					<th></th>
				</tr>
				<!-- 該当する値 -->
				<tr>
					<td></td>
					<td>
					<!-- Date & Time -->
						<input type="text" id="datetimepicker"/></td>
					<td></td>
					<!-- 各種ボタン -->
					<td><input type="button" id="checkout" value="checkout" /></td>
					<td></td>
				</tr>
			</table>
			<!-- /page content -->
		</div>
	</div>
</body>
</html>