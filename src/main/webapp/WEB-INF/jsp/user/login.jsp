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
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<script src="<c:url value="/js/jquery-1.10.2.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#register").on("click", function() {
			location.assign("/register");
		});
		$("#cancle").on("click", function() {
			location.assign("/home");
		});
		$("#login").on("click", function() {
			var id = $("#userId").val();
			var pass = $("#userPass").val();
			$.ajax({
				type : "POST",
				dataType : "JSON",
				data : {	id : id, pass : pass	},
				url : "<c:url value='/login.do'/>",
				error : function(data) {
					console.log(data);
					console.log("Error : " + Fail);
				},
				success : function(data) {
					var data = JSON.stringify(data);
					var obj = JSON.parse(data);
					console.log(obj);
					console.log(obj.loginTF);
					switch(obj.loginTF) {
					case true:
						location.assign("/");
						break;
					default:
						console.log("Fail");
						$("#alert").val("IDとPASSWORDを正しく入力してください。新規登録の場合は「新規登録」ボタンをクリックしてください。");
						break;
					}
				}
			})
		});
	});
</script>
</head>
<body>
	<div id="body" style="margin-left: 500px;">
		<h2>ログイン</h2>
		<div class="container">
			<div class="loginform">
				<form id="logfrm" method="POST">
					<!-- 入力内容 -->
					<p>
						<span>ユーザーID</span> <input type="text" id="userId" name="userId" placeholder="Userid">
					</p>
					<p>
						<span>パスワード</span> <input type="password" id="userPass" name="userPass" placeholder="Password">
					</p>
					<!-- 各種ボタン -->
					<input type="button" id="login" value="ログイン">
					<button type="button" id="register">新規登録</button>
					<button type="button" id="cancle">キャンセル</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>