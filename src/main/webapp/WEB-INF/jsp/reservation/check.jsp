<!-- 
 * @Class Name : ReservationCheck.jsp
 * @Description : 
 * @
 * @		修正日			修正者			修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.12		Kim				最初作成
 * @		2017.07.17		Lee				予約確認内容追加
 * @author Kim
 * @since 2017.07.12
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>予約情報の再確認</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/jquery-ui-1.10.4.custom.css"/>" />
<script src="<c:url value="/js/jquery-1.10.2.js" />"></script>
<script src="<c:url value="/js/jquery-ui-1.10.4.custom.js" />"></script>
<script>
	$(document).ready(function(){ 
		$('#dialog-message-success').dialog({
			autoOpen: false,
			resizable: false,
			modal: true,
			buttons: {
				Ok: function() {
					$( this ).dialog( "close" );
					location.replace('/home'); 
				}
			}
		});
		$('#dialog-message-fail').dialog({
			autoOpen: false,
			resizable: false,
			modal: true,
			buttons: {
				Ok: function() {
					$( this ).dialog( "close" );
					location.replace('/home');
				}
			}
		});
		$('#btnChkOut').click(function(e) {
			var formData = $("#frm").serialize();
			$.ajax({
				type:"POST",
				url:"<c:url value='/reservation/checkout'/>",
				data : formData,
				dataType : "json",
				error: function() {
					$('#dialog-message-fail').dialog('open');
				},
				success : function() {
					$( "#dialog-message-success" ).dialog('open');
				}
			});
		}); 
	});
</script>
</head>
<body>
	<h1>予約確認</h1>
	<form id=frm name=frm method=post>
		<div>
			<table>
				<tr>
					<td>コース</td>
					<td>${result.courseName}</td>
				</tr>
				<tr>
					<td>コース時間</td>
					<td>${result.courseTime}</td>
				</tr>
				<tr>
					<td>予約日</td>
					<td>${result.reservationDate}</td>
				</tr>
				<tr>
					<td>予約時間</td>
					<td>${result.reservationTime}</td>
				</tr>
				<tr>
					<td>スタイリスト</td>
					<td>${result.stylistName}</td>
				</tr>
				<tr>
					<td>金額</td>
					<td>${result.coursePrice}</td>
				</tr>
			</table>
		</div>
		<input type="hidden" id="userId" name="userId" value="${result.userId}"/>
		<input type="hidden" id="userName" name="userName" value="${result.userName}"/>
		<input type="hidden" id="courseId" name="courseId" value="${result.courseId}"/>
		<input type="hidden" id="courseName" name="courseName" value="${result.courseName}"/>
		<input type="hidden" id="coursePrice" name="coursePrice" value="${result.coursePrice}"/>
		<input type="hidden" id="courseTime" name="courseTime" value="${result.courseTime}"/>
		<input type="hidden" id="reservationDate" name="reservationDate" value="${result.reservationDate}"/>
		<input type="hidden" id="reservationTime" name="reservationTime" value="${result.reservationTime}"/>
		<input type="hidden" id="stylistId" name="stylistId" value="${result.stylistId}"/>
		<input type="hidden" id="stylistName" name="stylistName" value="${result.stylistName}"/>
	</form>
	<div>
		<span style="text-color:red">＊予約キャンセルは前日まで</span>
	</div>
	<div class="button">
		<input type="button" name="bntChkOut" id="btnChkOut" value="予約確定" /><br>
		<input type="button" value="取り消し">
	</div>
	<div id="dialog-message-success" title="予約完了">
		<p><span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
		予約を完了しました。<br>
		ホーム画面に戻ります。
		</p>
	</div>
	<div id="dialog-message-fail" title="予約失敗">
		<p><span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
		予約を失敗しました。<br>
		ホーム画面に戻ります。<br>
		<b>管理者に話してください。</b>
		</p>
	</div>
</body>
</html>