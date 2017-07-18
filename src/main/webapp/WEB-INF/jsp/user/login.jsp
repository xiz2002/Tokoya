<!-- 
 * @Class Name : login.jsp
 * @Description : 
 * @
 * @	修正日			修正者		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.12		山木雄矢		最初作成
 * @ 	2017.07.17		Kim			修正
 * 
 * @author 山木雄矢
 * @since 2017.07.12
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<script src="<c:url value="/js/jquery-1.10.2.js"/>"></script>
<script src="<c:url value="/js/jquery-ui-1.10.4.custom.js"/>"></script>
<!-- 
< %@include file="../sample/head.jsp"  %>
 -->
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#register").on("click", function() {
			location.assign("/register");
		});
		$("#cancle").on("click", function() {
			location.assign("/home");
		});
		$("#login").on("click", function() {
				$("#logfrm").attr("action", "<c:url value='/login.do'/>");
				$("#logfrm").submit();
		});
	});
</script>
</head>
<body>
	<h2>ログイン</h2>
	<div class="container">
		<div class="loginform">
			<form id="logfrm" method="POST">
				<h2>ログイン</h2>
				<!-- 入力内容 -->
				<p>
				  <span>ユーザーID</span>
				  <input type="text" name="USERID" placeholder="Userid">
  			</p>
				<p>
					<span>パスワード</span> <input type="password" name="USERPASS"
						placeholder="Password">
				</p>
				<p>
					<label for="remember"> <input type="checkbox" id="remember"
						value="remember" /> <span>ログイン情報保持</span>
					</label>
				</p>
				<!-- 各種ボタン -->
				<input type="submit" id="login" value="ログイン">
				<button type="button" id="register">新規登録</button>
				<button type="button" id="cancle">キャンセル</button>
			</form>
		</div>
	</div>
</body>
</html>