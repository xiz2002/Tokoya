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

<head>ログイン</head>

<body>

	<div class="container">
		
		<div class="loginform">
			<form action="login" method="GET">
				<h2>ログイン</h2>
				<!-- 入力内容 -->
				<p>
				  <span>ユーザーID</span>
				  <input type="text" name="username" placeholder="Username">
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
				<button type="submit" name="login">ログイン</button>
				<button type="submit" name="newmenber">新規登録</button>
				<button type="submit" name="cancel">キャンセル</button>
			</form>
			<!-- /page content -->
<<<<<<< HEAD:src/main/webapp/WEB-INF/jsp/login/login.jsp
			<!-- footer 
			< %@include file="../sample/inc/foot.jsp"%>
			 /footer -->
		</div>
	</div>
	<!-- 	< %@include file="../sample/inc/scripts.jsp"%> -->
=======
		</div>
	</div>
>>>>>>> upstream/master:src/main/webapp/WEB-INF/jsp/user/login.jsp
</body>
</html>