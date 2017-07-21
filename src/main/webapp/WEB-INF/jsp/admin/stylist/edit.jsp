<!-- 
 * @Class Name : edit.jsp
 * @Description : 
 * @
 * @	修正日			修正者?		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.12		山木雄矢		最初作成
 * 
 * @author 山木雄矢
 * @since 2017.07.12
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
	$("#upsty").on("click", function(){
		$("#editfrm").attr("action", "<c:url value='/admin/stylist/update.do'/>");
		$("#editfrm").submit();
	});
	$("#delsty").on("click", function(){
		if(!confirm('本当に削除しますか？')){
			return false;
		}else{
			$("#editfrm").attr("action", "<c:url value='/admin/stylist/delete.do'/>");
			$("#editfrm").submit();
		}
	});
});
</script>

<head>
</head>

<body>
	<div class="container">
		<div class="editstylistform">
			<form id="editfrm" method="POST">
				<h2>スタイリスト編集</h2>
				<c:forEach var="item" items="${result}">
				<p>
					<span>スタイリストID</span>
					<input type="hidden" id="stylistId" name="stylistId" value="${item.stylistId}">
					<label id="stylistId">${item.stylistId}</label>
				</p>
				<p>
					<span>スタイリスト名</span>
					<input type="text" id="stylistName" name="stylistName" value="${item.stylistName}">
				</p>
				<!-- 各種ボタン -->
			<button type="button" id="upsty" name="upsty">更新</button>
			<!-- <button type="button" id="delsty" name="delsty">削除</button> -->
			<button type="button" id="delsty" name="delsty" ${deljuge eq 1 ? '' : 'disabled'}>削除</button>
			<button type="button" id="return" OnClick="history.back()">戻る</button>
			</c:forEach>
			</form>
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