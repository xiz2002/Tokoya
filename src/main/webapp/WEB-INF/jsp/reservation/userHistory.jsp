<!-- 
 * @Class Name : reservationUserHistory.jsp
 * @Description : 
 * @
 * @			修正日			修正者		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.12			山木雄矢		最初作成
 * 				17			Lee			使わないimport削除
 *
 * @author 山木雄矢
 * @since 2017.07.12
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/jquery.dynatable.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/jquery-ui-1.10.4.custom.css"/>" />
<style>
.container {
	width: 70%;
	height: 70%;
	margin: 40px auto;
	background: #FFFFFF;
}
.centered {
	position: relative;
	display: inline-block; 
	width: 50%;
	padding: 1em;
}
</style>
<script src="<c:url value="/js/jquery-1.10.2.js" />"></script>
<script src="<c:url value="/js/jquery-ui-1.10.4.custom.js" />"></script>
<script src="<c:url value="/js/jquery.datetimepicker.full.js" />"></script>
<script src="<c:url value="/js/jquery.dynatable.js" />"></script>
</head>
<body>
	<div class="container">
		<div class="contents">
			<h2>予約リスト</h2>
			<!-- 予約リスト -->
			<form id="frm" method="post">
			<table id="rev-His-Table">
				<!-- 表示項目 -->
				<thead>
					<tr>
						<th>#</th>
						<th>予約時刻</th>
						<th>総額</th>
						<th>コース</th>
	      				<th>スタイリスト</th>
	      				<th>予約ステータス</th>
	      				<th>##</th>
	      			</tr>
				</thead>
	    			<!-- 該当する値 -->
				<tbody>
		    			<c:forEach var="item" items="${rtn}">
		    			<tr>
						<td>	</td>
						<td>${item.reservationDate}</td>
						<td>${item.coursePrice}円</td>
						<td>${item.courseName}</td>
						<td>${item.stylistName}さん</td>
						<td>
						<c:choose>
							<c:when test="${item.reservationStatus eq 1}">
							予約中
							</c:when>
							<c:when test="${item.reservationStatus eq 2}">
							キャンセル
							</c:when>
							<c:otherwise>
							終了
							</c:otherwise>
							</c:choose>
						</td>
						<td>
						<c:choose>
							<c:when test="${item.reservationStatus eq 1}">
							<button type="button" name="cancel" value="${item.reservationId}">予約キャンセル</button>
							</c:when>
						</c:choose>
						</td>
					</tr>
		    			</c:forEach>
				</tbody>
			</table>
			</form>
			<!-- 各種ボタン -->
			<button type="button" name="back" onClick="back()">戻る</button>
			<!-- /page content -->
			<!-- footer -->
			<script>
				$(document).ready(function(){
					$("button").click(function(event) {
						var regx = /(^0+)/;
						var reservationId = $(this).attr('value');
						reservationId = reservationId.replace(regx,"");
						var $frm = $('#frm');
						var objRevId = $('<input type="hidden" id="reservationId" name="reservationId" value="' + reservationId + '" />');
						objRevId.appendTo($frm);
						$frm.attr("action", "<c:url value='/reservation/userCancel'/>");
						$frm.attr("target","_self");
						$frm.submit();
					});	
				});	
			
				function back() {
					window.location.href="<c:url value='/'/>";
				};
			</script>
			<!-- /footer -->
		</div>
	</div>
</body>
</html>