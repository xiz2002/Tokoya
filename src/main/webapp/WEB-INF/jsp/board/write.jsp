<!-- 
* @Class Name : write.jsp
* @Description : お知らせ登録画面
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
-->
<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
<%@ include file="../admin/inc/admin_header.jsp"%>

<div class="right_col" role="main">
	<div class="">
		<div class="col-md-4 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>作成</h2>
					<div class="clearfix"></div>
				</div>
<div class="x_content">
				<form id="frm" method="POST">
					<table id="tb_write" style="border: 1px solid;">
						<tr>
							<td><label>タイトル</label></td>
							<td><input type="text" id="title" name="NOTICETITLE"></td>
						</tr>
						<tr>
							<td><label>内容</label></td>
							<td><textarea rows="10" cols="50" id="body"
									name="NOTICEBODY"></textarea></td>
						</tr>
					</table>
					<div class="button" style="margin-top: 5px">
						<input type="button" id="write" value="登録"> <input
							type="button" id="cancle" value="取り消し">
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$("#write").on("click", function() {
			// 簡単なバリデーションチェック
			var title = $("#title").val();
			var body = $("#body").val();

			if (!title.trim() || !body.trim()) {
				alert("タイトルと内容は必須入力です。");
				return;
			} else if (title.length > 100) {
				alert("タイトルは１００桁い以下にしてください。");
				return;
			}
			$("#frm").attr("action", "<c:url value='/board/insertWrite.do'/>");
			$("#frm").submit();
		});
		$("#cancle").on("click", function() {
			location.assign("/admin");
		});
	});
</script>
<%@ include file="../admin/inc/admin_foot.jsp"%>