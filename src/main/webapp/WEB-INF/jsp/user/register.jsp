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
	errorPage="" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<c:url value="/js/jquery-1.10.2.js"/>"></script>
<script src="<c:url value="/js/jquery-ui-1.10.4.custom.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#register").on("click", function() {
			if (setParam()) {
				$("#frm").attr("action", "<c:url value='/register.do'/>");
				$("#frm").submit();
			}
		});
		$("#cancle").on("click", function() {
			location.assign("/home");
		});
		$("#id_check").on("click", function() {
			checkId();
		});
	});
	function setParam() {
		var name;
		var huri;
		var email;
		var phone;

		name = $("#last_name").val() + " " + $("#first_name").val();
		$("#name").val(name);
		huri = $("#huri_last_name").val() + " " + $("#huri_first_name").val();
		$("#huri").val(huri);
		email = $("#email1").val() + "@" + $("#email2").val();
		$("#email").val(email);
		phone = $("#phone1").val() + "-" + $("#phone2").val() + "-"
				+ $("#phone3").val();
		$("#phone").val(phone);

		return true;
	}
	function checkId(){
		var id=$("#id_check").val();
		$.ajax({
			type:"POST",
			dataType:"JSON",
			data:{id:id},
			url:"<c:url value='/checkId.do'/>",
			error: function(data) {
				console.log(data);
				console.log("Error : " + Fail);
			},
			success : function(data) {
				if(data=="true"){
					alert("このIDが使えます。");
				}else{
					alert("このIDはもう存在しています。他のIDを入力してください。");
					$("#userId").val("");
				}
			}
			});
		}
</script>
<body>
	<div>
		<form id="frm" method="POST">
			<table class="ta_register" style="border: 1px solid;">
				<tr>
					<td><span>氏名</span></td>
					<td><input type="text" placeholder="姓" class="userName"
						id="last_name"><input type="text" placeholder="名" class="userName"
						id="first_name"></td>
					<td></td>
				</tr>
				<tr>
					<td><span>氏名(フリガナ)</span></td>
					<td><input type="text" placeholder="姓" class="userName"
						id="huri_last_name"><input type="text" placeholder="名" class="userName"
						id="huri_first_name"></td>
					<td></td>
				</tr>
				<tr>
					<td><span>ユーザID</span></td>
					<td><input type="text" name="USERID" id="userId"><input type="button" value="check" id="id_check" /></td>
					<td></td>
				</tr>
				<tr>
					<td><span>パスワード</span></td>
					<td><input type="password" id="pass" name="USERPASS"></td>
					<td><span style="color: red;">＊6文字以上半角英数字</span></td>
				</tr>
				<tr>
					<td><span>パスワードチェック</span></td>
					<td><input type="password" id="pass_check"></td>
					<td></td>
				</tr>
				<tr>
					<td><span>Email</span></td>
					<td><input type="text" id="email1" /> <span>@</span> <input
						type="text" id="email2" /></td>
					<td></td>
				</tr>
				<tr>
					<td><span>Phone</span></td>
					<td colspan="2"><input type="text" id="phone1" max="3" /><span>-</span>
						<input type="text" id="phone2" max="4" /><span>-</span> <input
						type="text" id="phone3" max="4" /></td>
				</tr>
			</table>
			<input type="hidden" id="name" name="USERNAME" /> 
			<input type="hidden" id="huri" name="USERHURI" /> 
			<input type="hidden" id="email" name="USEREMAIL" /> 
			<input type="hidden" id="phone"	name="USERPHONE" />
		</form>
		<div class="div_button">
			<input type="button" value="登録" id="register"> <input
				type="button" value="取り消し" id="cancle">
		</div>
	</div>

</body>
</html>