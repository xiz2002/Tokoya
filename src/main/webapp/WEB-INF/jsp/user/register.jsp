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
	$("#id_error").hide();
	$("#name_error").hide();
	$("#huri_name_error").hide();
	$("#email_error").hide();
	$("#phone_error").hide();
	$("#pass_error").hide();
	$("#pass2_error").hide();
	
	//会員登録
	$("#register").on("click", function() {
		var ck = false;
		
		
		//validation check
		ck = checkValidation();
		console.log(ck);
		setParam();
		if (ck) {
			$("#frm").attr("action", "<c:url value='/register.do'/>");
			$("#frm").submit();
		}
	});
	
	//取り消し
	$("#cancle").on("click", function() {
		location.assign("/home");
	});
	
	//
	$("#id_check").on("click", function() {
		checkId();
	});
});

function setParam() {
	var name;
	var huri;
	var phone;
	var email;

	name = $("#last_name").val() + " " + $("#first_name").val();
	$("#name").val(name);
	huri = $("#huri_last_name").val() + " " + $("#huri_first_name").val();
	$("#huri").val(huri);
	email = $("#email2").val();
	$("#email").val(email);
	phone = $("#phone1").val() + "-" + $("#phone2").val() + "-"
			+ $("#phone3").val();
	$("#phone").val(phone);

	return true;
}
function checkId() {
	var id = $("#userId").val();
	var blank_pattern = /[\s]/g;
	var id_pattern = /^[a-z0-9]{4,10}$/;
	var validation = true; 
	if(id==null||!id_pattern.test(id)){
		validation = false;
	}
	if(validation){
	$.ajax({
		type : "POST",
		dataType : "JSON",
		data : {
			id : id
		},
		url : "<c:url value='/checkId.do'/>",
		error : function(data) {
			console.log(data);
			console.log("Error : " + Fail);
		},
		success : function(data) {
			var data = JSON.stringify(data);
			var obj = JSON.parse(data);
			if (obj.result == "true") {
				alert("このIDが使えます。");
				$("#id_error").hide();
				
			}
			else if (obj.result == "false") {
				alert("このIDはもう存在しています。他のIDを入力してください。");
			}
		}
	});
	}else{
		$("#id_error").show();
	}
}
function checkValidation(){
	var flag = true;
	var name = $("#last_name").val()+$("#first_name").val();
	var name_h = $("#huri_last_name").val()+$("#huri_first_name").val();
	var id = $("#userId").val();
	var pass = $("#pass").val();
	var email = $("#email2").val();
	var phone = $("#phone1").val() + $("#phone2").val() + $("#phone3").val();
	var pass = $("#pass").val();
	var pass2 = $("#pass_check").val();
	

	var name_pattern = /[\s^-_.a-z0-9]/g;
	var blank_pattern = /[\s]/g;
	var email_pattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	var phone_pattern = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
	var pass_pattern = /^[a-z0-9]{6,20}$/
	
	//name check
	if((name.length==0||name.length>20)||name==null||!checkCode(name)||name_pattern.test(name)){
		$("#name_error").show();
		flag = false;
	}else{
		$("#name_error").hide();
	}
	
	//Hurigana check
	if((name_h.length==0||name_h.length>20)||name_h==null||!checkCode(name_h)||name_pattern.test(name_h)){
		$("#huri_name_error").show();
		flag = false;
	}else{
		$("#huri_name_error").hide();
	}
	
	//email check
	if((email.length==0||email.length>49)||email==null||checkCode(email)||!email_pattern.test(email)||blank_pattern.test(email)){
		$("#email_error").show();
		flag = false;
	}else{
		$("#email_error").hide();
	}
	
	//phone check
	if((phone.length==0||phone.length>11)||phone==null||phone_pattern.test(phone)||blank_pattern.test(phone)){
		$("#phone_error").show();
		flag = false;
	}else{
		$("#phone_error").hide();
	}
	
	//pass check
	if(pass==null||!pass_pattern.test(pass)){
		$("#pass_error").show();
		flag = false;
	}else{
		$("#pass_error").hide();
	}
	
	if(pass!=pass2){
		$("#pass2_error").show();
	}else{
		$("#pass2_error").hide();
	}
	return flag;
}
	
function checkCode(param){
	for(var i = 0; i <param.length; i++){
		var st = param.charCodeAt(i);
		if(st < 256 || (st >= 0xff61 && st <= 0xff9f)) {
			return false;
		} 
   }
   return true;
}	
</script>
<style>
.phone {
	width: 50px;
}

.userName, .email, #userId, .pass {
	width: 100px;
}
</style>

<body>
	<div id="body" style="margin-left: 450px;">
		<div>
			<form id="frm" method="POST">
				<table class="ta_register" style="border: 1px solid;">
					<tr>
						<td><span>氏名</span></td>
						<td><input type="text" placeholder="姓" class="userName"
							id="last_name"><input type="text" placeholder="名"
							class="userName" id="first_name"></td>
						<td></td>
					</tr>
					<tr id="name_error">
						<td colspan="3"><span style="color:red">*氏名を再確認してください。</span></td>
					</tr>
					<tr>
						<td><span>氏名(フリガナ)</span></td>
						<td><input type="text" placeholder="姓" class="userName"
							id="huri_last_name"><input type="text" placeholder="名"
							class="userName" id="huri_first_name"></td>
						<td></td>
					</tr>
					<tr id="huri_name_error">
						<td colspan="3"><span style="color:red">*氏名を再確認してください。</span></td>
					</tr>
					<tr>
						<td><span>ユーザID</span></td>
						<td><input type="text" name="USERID" id="userId"><input
							type="button" value="check" id="id_check" /></td>
						<td></td>
					</tr>
					<tr id="id_error">
					<td colspan="3"><span style="color:red">*IDは半角英数字で4字以上10字以下で入力してください。</span></td>
					</tr>
					<tr>
						<td><span>パスワード</span></td>
						<td><input type="password" id="pass" class="pass"
							name="USERPASS"></td>
						<td><span style="color: red;">＊6文字以上半角英数字</span></td>
					</tr>
					<tr id="pass_error">
					<td colspan="3"><span style="color:red">*パスワードは6文字以上半角英数字を入力してください。</span></td>
					</tr>
					<tr>
						<td><span>パスワードチェック</span></td>
						<td><input type="password" class="pass" id="pass_check"></td>
						<td></td>
					</tr>
					<tr id="pass2_error">
					<td colspan="3"><span style="color:red">*パスワードが一致しません。</span></td>
					</tr>
					<tr>
						<td><span>Email</span></td>
						<td colspan="2"><input type="text" id="email2" /></td>
					</tr>
					<tr id="email_error">
					<td colspan="3"><span style="color:red">*Emailを再確認してください。</span></td>
					</tr>
					<tr>
						<td><span>Phone</span></td>
						<td colspan="2"><input class="phone" type="text" id="phone1"
							max="3" /><span>-</span> <input class="phone" type="text"
							id="phone2" max="4" /><span>-</span> <input class="phone"
							type="text" id="phone3" max="4" /></td>
					</tr>
					<tr id="phone_error">
					<td colspan="3"><span style="color:red">*電話番号を再確認してください。</span></td>
					</tr>
				</table>
				<input type="hidden" id="name" name="USERNAME" /> <input
					type="hidden" id="huri" name="USERHURI" /> <input type="hidden"
					id="email" name="USEREMAIL" /> <input type="hidden" id="phone"
					name="USERPHONE" />
			</form>
			<div class="div_button">
				<input type="button" value="登録" id="register"> <input
					type="button" value="取り消し" id="cancle">
			</div>
		</div>
	</div>
</body>
</html>