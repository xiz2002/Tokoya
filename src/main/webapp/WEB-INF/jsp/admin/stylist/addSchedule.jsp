<!-- 
 * @Class Name : stylistVacanceAdd.jsp
 * @Description : 
 * @
 * @	修正日				修正者			修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.17		Lee				最初作成
 * 
 * @author Lee
 * @since 2017
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/jquery-ui-1.10.4.custom.css"/>" />
<style>
	fieldset {
		border: 0;
	}
	label {
		display: block;
		margin: 30px 0 0 0;
	}
	.overflow {
		height: 200px;
	}
</style>
<style>
.left-box {
	background: #FFFFFF;
	float: left;
	width: 50%;
}
.right-box {
	background: #FFFFFF;
	float: right;
	width: 50%;
}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$( function() {
			$( "#styList" ).selectmenu({
				change: function(event, data) {
					var styid = $("#styList").val();
					console.log(styid);
					$.ajax({
						type:"POST",
						url:"<c:url value='/admin/stylist/getStyBusyDate'/>",
						data : { stylistId : styid },
						dataType : "json",
						error: function(data) {
							
						},
						success : function(data) {
						
						}
					});
				}
			})
		})
		
		$( function() {
			$( "#datepicker" ).datepicker();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="addstylistform">
			<form id="frm">
				<div class='left-box'>
					<h2>スタイリスト休暇追加</h2>
					<fieldset>
						<label for="styList">スタイリスト選択</label>
		    				<select name="styList" id="styList">
								<option disabled selected>選択してください</option>
							<c:forEach var="item" items="${result}">
								<option value="'${item.stylistId }'">${item.stylistName }</option>
							</c:forEach>
		    				</select>
  					</fieldset>
				</div>
				<div class='right-box'></div>
				<h2>カレンダー</h2>
				<p>
					<input type="text" id="body" name="STYLISTNAME" placeholder="STYLISTNAME">
				</p>
				<!-- 各種ボタン -->
			</form>
			<button type="submit" name="stylistadd">追加</button>
			<button type="submit" name="cansel">キャンセル</button>
			<!-- /page content -->
			<!-- footer -->
			<!-- /footer -->
		</div>
	</div>
	<!-- script -->
</body>
</html>