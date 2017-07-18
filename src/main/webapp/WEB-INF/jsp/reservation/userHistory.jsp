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
<!DOCTYPE>
<html>
<body>
	<div class="container">
		<div class="contents">
			<h2>予約リスト</h2>
			<!-- 予約リスト -->
			<table>
				<!-- 表示項目 -->
				<tr>
					<th>#</th>
					<th>予約時刻</th>
      				<th>総額</th>
      				<th>コース</th>
      				<th>スタイリスト</th>
      				<th>予約ステータス</th>
      				<th>##</th>
	    			</tr>
	    			<!-- 該当する値 -->
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
						<button type="button" name="cancel" onClick="cancel()">予約キャンセル</button>
						</c:when>
					</c:choose>
					</td>
				</tr>
	    			</c:forEach>
			</table>
			<!-- 各種ボタン -->
			<button type="button" name="back" onClick="back()">戻る</button>
			<!-- /page content -->
			<!-- footer -->
			<script>
				function back() {
					window.location.href="<c:url value='/home'/>";
				}
				function cancel() {}
			</script>
			<!-- /footer -->
		</div>
	</div>
</body>
</html>