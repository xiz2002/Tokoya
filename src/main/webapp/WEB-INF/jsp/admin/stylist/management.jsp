<!-- 
 * @Class Name : stylistmanagement.jsp
 * @Description : 
 * @
 * @	修正日			修正者		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.12		山木雄矢		最初作成
 * 
 * @author 山木雄矢
 * @since 2017.07.12
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<c:url value="/js/jquery-1.10.2.js" />"></script>
<script src="<c:url value="/js/jquery-ui-1.10.4.custom.js" />"></script>
<script src="<c:url value="/js/jquery.datetimepicker.full.js" />"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#stylistinsert").on("click", function() {
			$("#admin_body").load("/admin/stylist/add");
		});
		$("#edit").on("click", function() {
			$("#admin_body").attr("action", "<c:url value='/admin/stylist/detail?id=${item.stylistId }'/>");
			$("#admin_body").submit();
		});
	});
</script>
<body>
<div class="container">
	<div class="stylistmanagementform">
		<form action="stylistmanagement" method="GET">
			<h2>スタイリスト一覧</h2>
			<table>
				<!-- 表示項目 -->
				<tr>
					<th>No</th>
					<th>スタイリストID</th>
					<th>スタイリスト名</th>
					<th>備考</th>
				</tr>
				<!-- 該当する値 -->
				<c:set var="no" value="${1}" />
				<tr>
					<c:forEach var="item" items="${result}">
						<tr>
							<td>${no}</td>
							<td>${item.stylistId}</td>
							<td>${item.stylistName}</td>
							<td>
							<a href="<c:url value='/admin/stylist/edit?id=${item.stylistId}'/>">編集</a>
							</td>
						</tr>
						<c:set var="no" value="${no+1}" />
					</c:forEach>
				</tr>
			</table>
			<!-- 各種ボタン -->
			<button type="button" id="stylistinsert">追加</button>
		</form>
	</div>
</div>
</body>