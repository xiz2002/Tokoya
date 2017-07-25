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
<%@ include file="../inc/header.jsp"%>
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
		location.assign("/");
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
			console.log("Error : ");
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
	var id_pattern = /^[a-z0-9]{4,10}$/;
	var blank_pattern = /[\s]/g;
	var email_pattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	var phone_pattern = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
	var pass_pattern = /^[a-z0-9]{4,20}$/
	
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
	
	if(id==null||!id_pattern.test(id)){
		flag = false;
		$("#id_error").show();
	}else{
		$("#id_error").hide();
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
.regi_alert{
float: left;
    margin: 0 0 0 20px;
    padding: 3px 10px;
    color: #FFF;
    border-radius: 3px 4px 4px 3px;
    background-color: #CE5454;
    }
</style>

<body>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					会員登録
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
			 <form id="frm" class="form-horizontal form-label-left" method="POST">
						<div class="item form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="name">氏名<span class="required">*</span>
							</label>
							<div class="col-md-3 col-sm-3 col-xs-12">
								<input id="last_name" class="form-control col-md-3 col-xs-3"
									placeholder="姓" type="text">
									</div>
									<div class="col-md-3 col-sm-3 col-xs-5">
								<input id="first_name" class="form-control col-md-4 col-xs-3"
									placeholder="名" type="text">
							</div>
							<div id="name_error" class="regi_alert">*氏名を再確認してください。</div>
						</div>
						
						<div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="huriName">氏名(フリガナ)<span class="required">*</span>
                        </label>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                          <input id="huri_last_name" class="form-control col-md-3 col-xs-5" placeholder="姓" type="text">
                          </div>
                          <div class="col-md-3 col-sm-3 col-xs-12">
                          <input id="huri_first_name" class="form-control col-md-4 col-xs-7" placeholder="名" type="text">
					</div>
					<div id="huri_name_error" class="regi_alert">
					*氏名を再確認してください。
					</div>
					</div>
					
					<div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="userId">ユーザID<span class="required">*</span>
                        </label>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                          <input id="userId" class="form-control col-md-3 col-xs-5" name="USERID" type="text">
                          </div>
                          <div class="col-md-3 col-sm-3 col-xs-12">
                          <input type="button" value="check" id="id_check" />
					</div>
					<div class="col-md-3 col-sm-3 col-xs-12">
					<div id="id_error" class="regi_alert">
					*IDは半角英数字で4字以上10字以下で入力してください。
					</div>
					</div>
					</div>
					<div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pass">パスワード<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="pass" class="form-control col-md-3 col-xs-5" name="USERPASS" type="password">
					</div>
					<div class="col-md-3 col-sm-3 col-xs-12">
					<div id="pass_error" class="regi_alert">
					*パスワードは4文字以上半角英数字を入力してください。
					</div>
					</div>
					</div>
					<div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pass2">パスワードチェック<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="pass_check" class="form-control col-md-3 col-xs-5" type="password">
					</div>
					<div class="col-md-3 col-sm-3 col-xs-12">
					<div id="pass2_error" class="regi_alert">
					*パスワードが一致しません。
					</div>
					</div>
					</div>
					<div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                         <input id="email2" class="form-control col-md-3 col-xs-5" type="text">
					</div>
					<div id="email_error" class="regi_alert">
					*Emailを再確認してください。
					</div>
					</div>
					<div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone">Phone<span class="required">*</span>
                        </label>
                          <div class="col-md-1 col-sm-1 col-xs-12">
                          <input id="phone1" class="form-control col-md-3 col-xs-5" type="text">
                          </div>
                          <div class="col-md-1 col-sm-1 col-xs-12">
                          <input id="phone2" class="form-control col-md-3 col-xs-5" type="text">
                          </div>
                          <div class="col-md-1 col-sm-1 col-xs-12">
                          <input id="phone3" class="form-control col-md-3 col-xs-5" type="text">
					</div>
					<div class="col-md-3 col-sm-3 col-xs-12">
					<div id="phone_error" class="regi_alert">
					*電話番号を再確認してください。
					</div>
					</div>
					</div>
					<input type="hidden" id="name" name="USERNAME" /> <input
					type="hidden" id="huri" name="USERHURI" /> <input type="hidden"
					id="email" name="USEREMAIL" /> <input type="hidden" id="phone"
					name="USERPHONE" />
					</form>
					<div class="item form-group">
					<div class="col-md-6 col-md-offset-3">
				<input type="button" class="btn btn-success" value="登録" id="register"> <input
					type="button" class="btn btn-primary" value="取り消し" id="cancle">
					</div>
					</div>
		</div>
	</div>
	</div>
	</div>
</body>
<%@ include file="../inc/footer.jsp"%>