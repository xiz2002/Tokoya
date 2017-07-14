<!-- 
* @Class Name : home.jsp
* @Description : お知らせ一覧画面
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
*
-->
<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</body>
<!-- top navigation -->
<%@include file="../admin/inc/top.jsp"%>
<!-- /top navigation -->
<!-- side navigation -->
<%@include file="../admin/inc/navi.jsp"%>
<!-- /side navigation -->
<div style="float: left;">
	<div>
		<table style="border:1px solid;">
			<tr>
				<th>No</th>
				<th>Title</th>
				<th>登録日</th>
			</tr>
			<c:forEach var="item" items="${result}">
			<tr>
			<td>${item.noticeId }</td>
			<td>${item.noticeTitle }</td>
			<td>${item.registerDate }</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<a href="/board/write">投稿</a>
	</div>
</div>
</body>
</html>