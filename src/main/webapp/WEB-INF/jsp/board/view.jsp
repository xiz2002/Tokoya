<!-- 
 * @Class Name : home.jsp
 * @Description : 
 * @
 * @	修正日			修正者		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2016.10.04		内山　佳美		最初作成
 * 
 * @author 李　多　浩
 * @since 2017.07.12
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../admin/inc/admin_header.jsp"%>
<body>
<div class="right_col" role="main">
	<div class="">
		<div class="col-md-10 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>お知らせ</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
<div>
<c:forEach var="item" items="${result }">
NoticeId : ${item.noticeId } <br/>
タイトル : ${item.noticeTitle } <br/>
内容 : ${item.noticeBody } <br/>
登録日　：　<fmt:formatDate value="${item.registerDate }" type="time" pattern="yyyy-MM-dd" /> <br/>
<div class="x_title">
			<div class="clearfix"></div>
				</div>	
				<div>
<c:choose>
	<c:when test="${sessionScope.userInfo.userIsAdmin == 0}">
<input type="button" value="ホーム" class="btn btn-success" id="goHome"/>
</c:when>
<c:when test="${sessionScope.userInfo.userIsAdmin == 1}">
<input type="button" value="リスト" class="btn btn-success" id="goList"/>
</c:when>
</c:choose>
<c:choose>
	<c:when test="${sessionScope.userInfo.userIsAdmin == 1}">
	<input type="button" value="削除" class="btn btn-warning" id="deleteBoard" onclick="deleteBoard(${item.noticeId })">
	</c:when>
</c:choose>
</div>
</c:forEach>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
<script type="text/javascript">
function deleteBoard(boardId){
	if(confirm("削除しますか？")){
		location.assign("/admin/deleteBoard.do?boardId="+boardId);	
	}
}
$(function (){
	$("#goList").on("click", function(){
		location.assign("/admin/board");
	});
	$("#goHome").on("click", function(){
		location.assign("/");
	});
});
</script>
<%@ include file="../admin/inc/admin_foot.jsp"%>