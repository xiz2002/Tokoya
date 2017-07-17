<!-- 
 * @Class Name : login.jsp
 * @Description : 
 * @
 * @	修正日			修正者		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.12		山木雄矢		最初作成
 * 
 * @author 山木雄矢
 * @since 2017.07.12
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#login").on("click", function(){
		$("#logfrm").attr("action", "<c:url value='/login.do'/>");
		$("#logfrm").submit();
	});
});
</script>
<body>
	<div class="container">
		<div class="loginform">
			<form id="logfrm" action="${url}" method="POST">
				<h2>ログイン</h2>
				<!-- 入力内容 -->
				<p>
				  <span>ユーザーID</span>
				  <input type="text" name="userid" placeholder="Userid">
				</p>
				<p>
				  <span>パスワード</span>
				  <input type="password" name="userpass" placeholder="Password">
				</p>
				<p>
				<label for="remember">
				  <input type="checkbox" id="remember" value="remember" />
				  <span>ログイン情報保持</span>
				</label>
				</p>
				<!-- 各種ボタン -->
				<input type="button" id="login" value="ログイン">
				<button type="submit" name="newmenber">新規登録</button>
				<button type="submit" name="cancel">キャンセル</button>
			</form>
		</div>
	</div>
</body>
</html>