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
<%@ include file="../inc/admin_header.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#stylistinsert").on("click", function(){
		location.assign("/admin/stylist/add");
	});
	$("#edit").on("click", function() {
		$("#styman").attr("action", "<c:url value='/admin/stylist/detail?id=${item.stylistId }'/>");
		$("#styman").submit();
		});
	});
</script>
<body>
	<div class="right_col" role="main">
	<div class="">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>スタイリスト一覧</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<table class="table">
						<!-- 表示項目 -->
						<thead>
							<tr>
								<th>No</th>
								<th>スタイリストID</th>
								<th>スタイリスト名</th>
								<th>備考</th>
							</tr>
						</thead>
						<!-- 該当する値 -->
						<tbody>
							<c:set var="no" value="${1}" />
							<tr>
								<c:forEach var="item" items="${result}">
									<tr>
										<td>${no}</td>
										<td>${item.stylistId}</td>
										<td>${item.stylistName}</td>
										<td><a
											href="<c:url value='/admin/stylist/edit?id=${item.stylistId}'/>"><span style="color:green;">編集</span></a>
										</td>
									</tr>
									<c:set var="no" value="${no+1}" />
								</c:forEach>
							</tr>
						</tbody>
					</table>
					<!-- 各種ボタン -->
					<button type="button" id="stylistinsert">追加</button>
				</div>
			</div>
		</div>
		</div>
	</div>
</body>

<%@ include file="../inc/admin_foot.jsp"%>