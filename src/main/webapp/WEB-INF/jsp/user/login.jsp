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
				var id = $("#id").val();
				var pass = $("#pass").val();
				$.ajax({
					type : "POST",
					dataType : "JSON",
					data : {
						id : id, pass : pass
					},
					url : "<c:url value='/login.do'/>",
					error : function(data) {
						console.log(data);
						console.log("Error : " + Fail);
					},
					success : function(data) {
						var data = JSON.stringify(data);
						var obj = JSON.parse(data);
						if(obj.data == "user"){
							alert(obj.id+"さんようこそ！")
							location.assign("/home");
						}else if(obj.data=="admin"){
							alert("管理者でログインができました。");
							location.assign("/admin");
						}else{
							alert("IDとPASSWORDを正しく入力してください。新規登録の場合は「新規登録」ボタンをクリックしてください。");
						}
					}
				});
		});
	});
</script>
</head>
<body>
<%@include file="./inc/top.jsp"%>
<div id="body" style="margin-left:500px;">
	<h2>ログイン</h2>
	<div class="container">
		<div class="loginform">
			<form id="logfrm" method="POST">
				<h2>ログイン</h2>
				<!-- 入力内容 -->
				<p>
				  <span>ユーザーID</span>
				  <input type="text" id="id" name="USERID" placeholder="Userid">
  			</p>
				<p>
					<span>パスワード</span> <input type="password" id="pass" name="USERPASS"
						placeholder="Password">
				</p>
				<p>
					<label for="remember"> <input type="checkbox" id="remember"
						value="remember" /> <span>ログイン情報保持</span>
					</label>
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