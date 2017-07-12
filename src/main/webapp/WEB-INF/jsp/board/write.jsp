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
<div id="div_write" style="float: left;">
	<table id="tb_write" style="border:1px solid;">
		<tr>
			<td><label>タイトル</label></td>
			<td><input type="text" id="notice_title"></td>
		</tr>
		<tr>
			<td><label>内容</label></td>
			<td><textarea rows="10" cols="50" id="notice_body"></textarea></td>
		</tr>
		<tr>
			<td><label>登録日</label></td>
			<td><label>${serverTime}</label></td>
		</tr>
	</table>
	<div class="button" style="margin-top: 5px">
		<input type="button" value="登録"> <input type="button" value="取り消し">
	</div>
</div>
</body>
</html>