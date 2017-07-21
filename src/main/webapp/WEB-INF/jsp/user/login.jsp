<!-- 
 * @Class Name : login.jsp
 * @Description : 
 * @
 * @		修正日			修正者		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.12		山木雄矢		最初作成
 * @ 	2017.07.17		Kim			修正
 * 		2017.07.20		Lee			修正
 *
 * @author 山木雄矢
 * @since 2017.07.12
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page session="false"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>TokoYa | Login</title>

<!-- Bootstrap -->
<link href="<c:url value="/css/bootstrap/bootstrap.css"/>" rel="stylesheet">
<!-- Custom Theme Style -->
<link href="<c:url value="/css/login/custom.css"/>" rel="stylesheet">
<!-- NProgress -->
<link href="<c:url value="/css/nprogress/nprogress.css"/>" rel="stylesheet">
<!-- Animate.css -->
<link href="<c:url value="/css/animate/animate.css"/>" rel="stylesheet">

<script src="<c:url value="/js/jquery-1.10.2.js"/>"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#id_error").hide();
						$("#pass_error").hide();

						$("#login")
								.on(
										"click",
										function() {
											var id = $("#userId").val();
											var pass = $("#userPass").val();
											var chkId = checkId(id);
											var chkPass = checkPass(pass);
											console.log(chkId);
											console.log(chkPass)
											if (chkId && chkPass) {
												$
														.ajax({
															type : "POST",
															dataType : "JSON",
															data : {
																id : id,
																pass : pass
															},
															url : "<c:url value='/login.do'/>",
															error : function(
																	data) {
																console
																		.log(data);
																console
																		.log("Error : "
																				+ Fail);
															},
															success : function(
																	data) {
																var data = JSON
																		.stringify(data);
																var obj = JSON
																		.parse(data);
																console
																		.log(obj);
																console
																		.log(obj.loginTF);
																switch (obj.loginTF) {
																case true:
																	location
																			.assign("/");
																	break;
																default:
																	console
																			.log("Fail");
																	alert("IDとPASSWORDが一致しないんです。<br>IDがない場合は 「新規登録」ボタンをクリックしてください。");
																	break;
																}
															}
														})
											} else {
												alert("IDとPASSWORDを正しく入力してください。");
											}
										});
						function checkId(a) {
							var flag = true;
							var blank_pattern = /[\s]/g;
							var id_pattern = /^[a-z0-9]{4,10}$/;
							if (a == null || !id_pattern.test(a)) {
								$("#id_error").show();
								flag = false;
							} else {
								$("#id_error").hide();
							}
							return flag;
						}
						function checkPass(a) {
							var flag = true;
							var blank_pattern = /[\s]/g;
							var pass_pattern = /^[a-z0-9]{4,20}$/;
							//pass check
							if (a == null || !pass_pattern.test(a)) {
								$("#pass_error").show();
								flag = false;
							} else {
								$("#pass_error").hide();
							}
							return flag;
						}
					});
</script>
</head>

<body class="login">
	<div>
		<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor" id="signin"></a>
		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form id="logfrm" method="POST">
						<h1>TokoYa Login</h1>
						<div>
							<input type="text" class="form-control" id="userId" placeholder="Username" required="" />
						</div>
						<div>
							<input type="password" class="form-control" id="userPass" placeholder="Password" required="" />
						</div>
						<div>
							<a class="btn btn-default submit" id="login">Log in</a>
						</div>

						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">
								初めての方ですか? <a href="<c:url value="/register" />" class="to_register"> 会員登録 </a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<h1>
									<i class="fa fa-paw"></i>Tokoya!
								</h1>
								<p>©NuriNubi Team Project - Tokoya</p>
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
</body>
</html>
