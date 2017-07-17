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
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value="/js/jquery-1.10.2.js"/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#write").on("click", function(){
		$("#frm").attr("action", "<c:url value='/board/insertWrite.do'/>");
		$("#frm").submit();
	});
	$("#cancle").on("click", function(){
		location.href("/admin");
	});
});
</script>
<div id="div_write" style="float: left;">
<form id="frm" method="GET">
	<table id="tb_write" style="border:1px solid;">
		<tr>
			<td><label>タイトル</label></td>
			<td><input type="text" id="title" name="NOTICETITLE"></td>
		</tr>
		<tr>
			<td><label>内容</label></td>
			<td><textarea rows="10" cols="50" id="body" name="NOTICEBODY"></textarea></td>
		</tr>
	</table>
	<div class="button" style="margin-top: 5px">
		<input type="button" id="write" value="登録"> <input type="button" id="cancle" value="取り消し">
	</div>
	</form>
</div>
