<!-- 
 * @Class Name : stylistVacance.jsp
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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#write").on("click", function(){
		$("#styfrm").attr("action", "<c:url value='/admin/stylist/insertWrite.do'/>");
		$("#styfrm").submit();
	});
	$("#cancle").on("click", function(){
		$("#styfrm").attr("action", "<c:url value='/admin/stylist/management'/>");
		$("#styfrm").submit();
	});
});
</script>

<head>
</head>

<body>
	<div class="container">
		<div class="addstylistform">
			<form id="styfrm">
				<h2>スタイリスト追加</h2>
				<p>
					<span>スタイリストID</span>
					<input type="text" id="title" name="STYLISTID" placeholder="STYLISTID">
				</p>
				<p>
					<span>スタイリスト名</span>
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
	<!-- 
	< %@include file="../sample/inc/scripts.jsp"%>
	 -->
</body>
</html>