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
<%@ include file="../inc/header.jsp"%>
<style>
th, td{
text-align:center;
}
</style>
<body>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					予約リスト
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
			<form id="frm" method="post">
			<table id="rev-His-Table" class="table">
				<!-- 表示項目 -->
				<thead>
					<tr>
						<th>予約時刻</th>
						<th>総額</th>
						<th>コース</th>
	      				<th>スタイリスト</th>
	      				<th>予約ステータス</th>
	      				<th>備考</th>
	      			</tr>
				</thead>
	    			<!-- 該当する値 -->
				<tbody>
		    			<c:forEach var="item" items="${rtn}">
		    			<tr>
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
							<button type="button" name="cancel" class="btn btn-danger" value="${item.reservationId}">予約キャンセル</button>
							</c:when>
						</c:choose>
						</td>
					</tr>
		    			</c:forEach>
				</tbody>
			</table>
			</form>
			<!-- 各種ボタン -->
			<button type="button" name="back" class="btn btn-primary" onClick="back()">戻る</button>
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
	</div>
	</div>
</body>
<%@ include file="../inc/footer.jsp"%>