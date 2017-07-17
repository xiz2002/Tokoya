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
<script src="<c:url value="/js/jquery-1.10.2.js"/>"></script>
<script type="text/javascript">
function writeForm(){
		$("#admin_body").load("/admin/board/write");
		history.pushState(null,null,"/admin/board/write");
}
</script>
<div>
	<div>
		<table style="border: 1px solid;">
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
		<a href="javascript:void(0);" onclick="writeForm()" id="write">投稿</a>
	</div>
</div>
