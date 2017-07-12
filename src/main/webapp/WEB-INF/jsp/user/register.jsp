<!-- 
* @Class Name : register.jsp
* @Description : 新規ユーザー登録画面
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</body>
<div>
	<table class="ta_register" style="border:1px solid;">
		<tr>
			<td><span>氏名</span></td>
			<td><input type="text" placeholder="姓" class="userName" id="last_name" data-name="on"></td>
			<td><input type="text" placeholder="名" class="userName" id="first_name" data-name="on"></td>
		</tr>
		<tr>
			<td><span>氏名(フリガナ)</span></td>
			<td><input type="text" placeholder="姓" class="userName" id="huri_last_name" data-name="on"></td>
			<td><input type="text" placeholder="名" class="userName" id="huri_first_name" data-name="on"></td>
		</tr>
		<tr>
			<td><span>ユーザID</span></td>
			<td><input type="text"></td>
			<td><input type="button" value="check" id="id_check"/></td>
		</tr>
		<tr>
			<td><span>パスワード</span></td>
			<td><input type="password" id="pass"></td>
			<td><span style="color: red;">＊6文字以上半角英数字</span></td>
		</tr>
		<tr>
			<td><span>パスワードチェック</span></td>
			<td><input type="password" id="pass_check"></td>
			<td>
			</td>
		</tr>
	</table>
	<div class="div_button">
		<input type="button" value="登録" id="bt_submit">
		<input type="button" value="取り消し" id="bt_cancle">
	</div>
</div>
</body>
</html>